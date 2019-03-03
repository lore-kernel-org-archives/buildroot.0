From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Mar 2019 11:16:34 +0100
Subject: [Buildroot] [PATCH 6/8 v2] infra/pkg-generic: use pure
 Makefile-based recursive dependencies
In-Reply-To: <cover.1551608168.git.yann.morin.1998@free.fr>
References: <cover.1551608168.git.yann.morin.1998@free.fr>
Message-ID: <7db07f60e79a87fbfd832aa5c6287641aeb78cf3.1551608168.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Calling to the graph-depends script is very costly, as it calls back to
'make' a lot of time.

It turns out that we already have the list of recursive dependencies, so
we can just print that.

As for the recursive reverse dependencies, we use the same memoisation
technique to cut-down on the expansion cost, which would otherwise be on
the order of ?(??) (with ? enabled packages).

From a defconfig, modified to use glibc, C++, wchar, locales, ssp, and
allyespackageconfig (tweaked to avoid multi providers, etc...), the
timings for X-show-recursive-rdepends are:

                    before      after       speedup     #rdeps
    libnss          0m22.932s   0m5.775s     3.97x      3
    qt5base         0m41.176s   0m5.781s     7.12x      67
    libjpeg         0m56.185s   0m5.749s     9.71x      228
    libxml2         0m54.964s   0m5.795s     9.48x      271
    freetype        0m46.754s   0m5.819s     8.07x      287
    libpng          0m53.577s   0m5.760s     9.30x      303
    sqlite          1m15.222s   0m5.807s    12.95x      801
    libopenssl      1m25.471s   0m5.844s    14.63x      931
    readline        1m13.805s   0m5.775s    12.78x      958
    libzlib         1m11.807s   0m5.820s    12.34x      1039
    toolchain       1m23.712s   0m6.080s    13.77x      2107
    skeleton        1m27.839s   0m6.293s    13.96x      2111 (+1)
    host-skeleton   1m27.405s   0m6.350s    13.76x      2172 (+2)

  - speedup: ratio before/after
  - #rdeps: number of recursive reverse dependencies, with the extra
            dependencies returned with this patch, see below for the
            reason.

So, for a low-level package with a lot of reverse dependencies, like
libzlibz, libopenssl or readline are, the timings are already very much
in favour of the change. This is less impressive with packages that
have few dependencies (libnss), but still much faster.

Also, remember that the config tested has as much packages enabled as
possible, so is in itself a degenerate case. With simpler and more
realistic configurations, the gains would probably be a bit lower than
reported above, but various tests still report good improvements
overall (note: coming up with a 'realistic' configuration is pretty
hard, as everyone and their dog have their notion of what is realistic
in their context, so nothing displayed here; timings are left as an
exercise for the interested parties to report aggravation in their
cases should they notice some regression).

Note that, more recursive reverse dependencies may be displayed now,
since we do not apply the exceptions applied in graph-depends. For
example, host-skeleton gains two new recursive reverse dependencies:
skeleton and toolchain, which are both exceptions in graph-depends.

As for direct (not reverse) dependencies: the gain is not as fantastic
as for reverse ones, but it is still noticeable, especially thanks to
a21212fb7cf (package/pkg-generic: speed up RECURSIVE_FINAL_DEPENDENCIES);
just a few examples for %-show-recursive-depends:

                    before      after       speedup     #deps
    libzlib         0m46.864s   0m5.902s     7.94x      17
    qt5base         0m57.590s   0m5.848s     9.85x      190
    sqlite          0m46.601s   0m5.816s     8.01x      24

Basically, displaying recursive dependencies, direct or reverse, is
almost a constant now: it only slightly varies by about 10% depending
on the complexity of the dependency chain, with the parsing of the
Makefiles still accounting for the large majority of the time.

(PS. Thanks to Joseph for suggesting a list of interesting packages
to test, and thanks to Trent for his example of memoisation!)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>

---
Changes v1 -> v2:
  - use memoisation  (Thanks Trent!)
  - redo the timings
  - drop the comments about skeleton and host-skeleton, that are no
    longer degenerate cases
---
 package/pkg-generic.mk | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4353bd3868..0d17e62a70 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -649,6 +649,18 @@ $(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
 	) \
 	$$($(2)_FINAL_RECURSIVE_DEPENDENCIES__X))
 
+$(2)_FINAL_RECURSIVE_RDEPENDENCIES = $$(sort \
+	$$(if $$(filter undefined,$$(origin $(2)_FINAL_RECURSIVE_RDEPENDENCIES__X)), \
+		$$(eval $(2)_FINAL_RECURSIVE_RDEPENDENCIES__X := \
+			$$(foreach p, \
+				$$($(2)_RDEPENDENCIES), \
+				$$(p) \
+				$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_RDEPENDENCIES) \
+			) \
+		) \
+	) \
+	$$($(2)_FINAL_RECURSIVE_RDEPENDENCIES__X))
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -826,15 +838,13 @@ $(1)-show-depends:
 			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
 
 $(1)-show-recursive-depends:
-			@cd "$$(CONFIG_DIR)" && \
-			$$(TOPDIR)/support/scripts/graph-depends -p $(1) -f -q
+			@echo $$($(2)_FINAL_RECURSIVE_DEPENDENCIES)
 
 $(1)-show-rdepends:
 			@echo $$($(2)_RDEPENDENCIES)
 
 $(1)-show-recursive-rdepends:
-			@cd "$$(CONFIG_DIR)" && \
-			$$(TOPDIR)/support/scripts/graph-depends -p $(1) --reverse -f -q
+			@echo $$($(2)_FINAL_RECURSIVE_RDEPENDENCIES)
 
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	@:
-- 
2.14.1
