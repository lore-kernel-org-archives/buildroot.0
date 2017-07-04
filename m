From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:51 +0200
Subject: [Buildroot] [PATCH 011/100] package/Makefile.in: fix musl handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-12-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, we had no support for full NLS with the musl C library:
BR2_NEEDS_GETTEXT was only true for uClibc. But the musl C library
provides a stub gettext implementation, which some packages were
failing to recognize as being usable, and therefore we are passing
autoconf cache variables to hint those packages that yes, the C
library has a usable gettext implementation.

However, we are going to enable full NLS support for musl, by giving
the possibility to build gettext libintl with musl. In such a case, we
do not want packages to use the gettext implementation of the C
library, but really the one provided by gettext libintl.

Therefore, we should only pre-seed the
gt_cv_func_gnugettext1_libc*=yes variables if we're on musl but
without gettext libintl. Otherwise packages will fail building because:

 - libintl.h is the one from the full-blown gettext implementation, so
   it assumes the package will link against -lintl

 - the package thinks gettext is provided by the C library, so it
   doesn't link with -lintl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index d30da3f..b98333f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -338,7 +338,12 @@ endif
 # AM_GNU_GETTEXT misdetects musl gettext support.
 # musl currently implements api level 1 and 2 (basic + ngettext)
 # http://www.openwall.com/lists/musl/2015/04/16/3
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+#
+# These autoconf variables should only be pre-seeded when the minimal
+# gettext implementation of musl is used. When the full blown
+# implementation provided by gettext libintl is used, auto-detection
+# works fine, and pre-seeding those values is actually wrong.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y:)
 BR2_GT_CV_FUNC_GNUGETTEXT_LIBC = \
 	gt_cv_func_gnugettext1_libc=yes \
 	gt_cv_func_gnugettext2_libc=yes
-- 
2.9.4
