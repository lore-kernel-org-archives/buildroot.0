From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 29 Aug 2012 02:37:00 +0200
Subject: [Buildroot] [PATCH] pkg-infra: warn about use of deprecated
	GENTARGETS
In-Reply-To: <503D63DF.8060803@mind.be>
Message-ID: <1346200620-11644-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the replacement of GENTARGETS by package-generic, there is a risk
that local packages don't work anymore without any indication of what
is wrong.  Therefore, generate an error message if the GENTARGETS,
AUTOTARGETS or CMAKETARGETS macro is still used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/Makefile.in |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 6fad224..2502602 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -304,6 +304,12 @@ else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
+# Warn if a package uses the deprecated GENTARGETS macros.  This can be
+# removed again for BR-2012.11.
+GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval $$$$(host-generic-package)))
+AUTOTARGETS = $$(error The AUTOTARGETS macro no longer exists; use $$$$(eval $$$$(autotools-package)) or $$$$(eval $$$$(host-autotools-package)))
+CMAKETARGETS = $$(error The CMAKETARGETS macro no longer exists; use $$$$(eval $$$$(cmake-package)) or $$$$(eval $$$$(host-cmake-package)))
+
 include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
-- 
tg: (bc753d3..) t/gentargets-deprecated (depends on: master)
