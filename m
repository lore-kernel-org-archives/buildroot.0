From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 17:02:06 +0100
Subject: [Buildroot] [git commit] package/Makefile.in: correct gettext
	handling for musl
Message-ID: <20160201224701.516787FA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc95d50fe3ee4dc72f19f838f9c05fec75973140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on a patch by Bernd Kuhls.

The AM_GNU_GETTEXT autotools macro misdetects musl gettext support as it
checks for internal glibc symbols.  Work around it by forcing libc gettext
support when musl is used for the supported gettext api levels.

As this is a generic issue for any package using AM_GNU_GETTEXT, add it to
the global TARGET_CONFIGURE_ARGS instead of for each affected package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5652af..96d93b0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -340,6 +340,15 @@ else
 BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=no
 endif
 
+# AM_GNU_GETTEXT misdetects musl gettext support.
+# musl currently implements api level 1 and 2 (basic + ngettext)
+# http://www.openwall.com/lists/musl/2015/04/16/3
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+BR2_GT_CV_FUNC_GNUGETTEXT_LIBC = \
+	gt_cv_func_gnugettext1_libc=yes
+	gt_cv_func_gnugettext2_libc=yes
+endif
+
 TARGET_CONFIGURE_ARGS = \
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
@@ -350,7 +359,8 @@ TARGET_CONFIGURE_ARGS = \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
 	lt_cv_sys_lib_search_path_spec="" \
-	$(BR2_AC_CV_C_BIGENDIAN)
+	$(BR2_AC_CV_C_BIGENDIAN) \
+	$(BR2_GT_CV_FUNC_GNUGETTEXT_LIBC)
 
 ################################################################################
 
