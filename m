From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:33 +0100
Subject: [Buildroot] [PATCH v5 16/19] infra-libtool: inform libtool that
	STAGING_DIR is reachable at runtime
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-17-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installing binaries to $TARGET_DIR, libtool add `$STAGING_DIR{,/usr}/lib'
to RPATH. This is annoying to create reproducible binaries. This patch just
inform libtool that these paths are reachable on runtime and it is necessary to
add then to RPATH.

Notice `$lt_cv_sys_lib_dlsearch_path_spec' was introduced in libtool v2.0.
Packages with libtool v1.5 continue to include `$STAGING_DIR{,/usr}/lib' in
their RPATH. The few packages that use libtool v1.5 have to be patched
individually in order to make them reproducible (adding AUTORECONF=YES should
be sufficient in most cases).

Note, instead of providing $lt_cv_sys_lib_dlsearch_path_spec, Yocto patch
libtool:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Makefile.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 688d5b1..6a341f2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -355,6 +355,7 @@ TARGET_CONFIGURE_ARGS = \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
 	lt_cv_sys_lib_search_path_spec="" \
+	lt_cv_sys_lib_dlsearch_path_spec="/lib /usr/lib $(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
 	$(BR2_AC_CV_C_BIGENDIAN) \
 	$(BR2_GT_CV_FUNC_GNUGETTEXT_LIBC)
 
-- 
1.9.1
