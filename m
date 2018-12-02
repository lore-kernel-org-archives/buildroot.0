From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:41 +0100
Subject: [Buildroot] [PATCH 09/11] infra/pkg-generic: use pure
 Makefile-based recursive dependencies
In-Reply-To: <cover.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <6c649fa55e0de3e23531f2852d7886657b667801.1543741464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Calling to the graph-depends script is very costly, as it calls back to
'make' a lot of time.

It turns out that we already have the list of recursive dependencies, so
we can just print that.

As for the reverse dependencies, doing like the first-level reverse
dependencies would be extremely costly (with n enabled packages, in
O(n?)), so we instead add a new macro that recursively build that list
only when expanded.

From defconfig, C++, wchar, locales, ssp, and allyespackageconfig,
tweaked for even more packages (qt5 not qt4, luajit to avoid multi
providers, etc...), the timings for X-show-recursive-rdepends are:

                    before      after       speedup     #rdeps
    libnss          0m22.932s   0m5.796s     3.96x      3
    qt5base         0m41.176s   0m5.709s     7.21x      61
    libjpeg         0m56.185s   0m5.943s     9.45x      218
    libxml2         0m54.964s   0m5.772s     9.52x      261
    freetype        0m46.754s   0m6.140s     7.61x      271
    libpng          0m53.577s   0m6.366s     8.41x      292
    sqlite          1m15.222s   0m6.413s    11.73x      700
    readline        1m13.805s   0m7.618s     9.69x      862
    libopenssl      1m25.471s   0m6.585s    12.98x      869
    libzlib         1m11.807s   0m9.829s     7.30x      1000
    toolchain       1m23.712s   1m17.542s    1.08x      2050
    skeleton        1m27.839s   3m32.565s    0.41x      2053 (+1)
    host-skeleton   1m27.405s   14m12.237s   0.10x      2111 (+2)

  - speedup: ratio before/after
  - #rdeps: number of recursive reverse dependencies, with the extra
            dependencies returned with this patch, see below for the
            reason.

So, for a low-level package with a lot of reverse dependencies, like
libzlibz, libopenssl or readline are, the timings are already very much
in favour of the change. This is less impressive with packages that
have few dependencies (libnss), but still much faster.

However, the extreme cases that skeleton and host-skeleton are, are
horribly penalised by this change, with skeleton doubling in time, and
host-skeleton being almost ten times slower. These two can be considered
degenerate cases: even the toolchain virtual package, which is virtually
a dependency of everything, is still (marginally) faster.

These two degenerate skeletons cases are however really not the most
interesting cases, most of the time: the underlying use-case for
*-show-recursive-rdepends is to understand why a specific package comes
into the build, and most of the time, such a package is more like
libzlib or libopenssl or such, and thus with much less dependencies than
the degenerate skeleton cases.

Also, remember that the config tested has as much packages enabled as
possible, so is in itself a degenerate case. With simpler and more
realistic configurations, the gains would probably be a bit lower than
reported above, but various tests still report good improvements
overall. (note: coming up with a 'realistic' configuration is pretty
hard, as everyone have their notion of what is realtistic in their
context, so nothing displayed here; timings are left as an exercise for
the interested parties to report aggravation in their cases).

Note that, more recursive reverse dependencies may be displayed now,
since we do not apply the exceptions applied in graph-depends. For
example, host-skeleton gains two new recursive reverse dependencies:
skeleton and toolchain, which are both exceptions in graph-depends.

As for direct (not reverse) dependencies: the gain is not as fantastic
as for reverse ones, but it is still noticeable, just a few examples for
%-show-recursive-depends:

                    before      after       speedup     #deps
    libzlib         0m45.892s   0m5.845s     7.85x      1
    qt5base         0m54.684s   0m35.877s    1.52x      178
    sqlite          0m46.628s   0m5.799s     8.04x      23

(PS. Thanks to Joseph for suggesting a list of interesting packages
to test!))

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>

---
Note: in the following patches, we change the way graph-depends gets
the dependency tree, and that does also speeds it up. However, that
future speedup gets the recursive reverse dependencies only down to
about 25s which, although faster than the previous timings, is till a
tad slower than the new timings this patch brings. The only advantage
would be that the 25s are about constant, whatever the package, so the
degenerate cases above are normalised top 25s as well. Since they are
not that important, it is better to really speed up the vast majority of
packages.
---
 package/pkg-generic.mk |  6 ++----
 package/pkg-utils.mk   | 13 +++++++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a27aa1f7fd..ae4bac509f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -815,15 +815,13 @@ $(1)-show-depends:
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
+			@echo $$(call pkg-recursive-rdependencies,$(1))
 
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	@:
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index bffd79dfb0..fb96d3e62e 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -53,6 +53,19 @@ suitable-extractor = $(INFLATE$(suffix $(1)))
 extractor-dependency = $(firstword $(INFLATE$(filter-out \
 	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
 
+# Return all the reverse dependencies of a package list
+# $(1): the space-separated list of packages (zero, one or more)
+define pkg-recursive-rdependencies
+	$(sort \
+		$(foreach p,$(sort $(1)), \
+			$(sort \
+				$($(call UPPERCASE,$(p))_RDEPENDENCIES) \
+				$(call pkg-recursive-rdependencies,$($(call UPPERCASE,$(p))_RDEPENDENCIES),$(2) .) \
+			) \
+		) \
+	)
+endef
+
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
-- 
2.14.1
