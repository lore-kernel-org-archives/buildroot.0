From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:12 +0200
Subject: [Buildroot] [PATCH 2/8] package/apr: Fix detection of rlimit and
	large file support
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snippets from configure log:

before:
checking whether to enable -D_LARGEFILE64_SOURCE... no
...
checking struct rlimit... no

after
checking whether to enable -D_LARGEFILE64_SOURCE... (cached) yes
...
checking struct rlimit... (cached) yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/apr.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index bdf4c78..82b1ad2 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -19,6 +19,7 @@ APR_CONF_ENV = \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
+	ac_cv_struct_rlimit=yes \
 	apr_cv_mutex_recursive=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
@@ -27,6 +28,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
 endif
 
+# Fix lfs detection when cross compiling
+ifeq ($(BR2_LARGEFILE),y)
+APR_CONF_ENV += apr_cv_use_lfs64=yes
+endif
+
 define APR_CLEANUP_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/build-1/
 endef
-- 
1.7.10.4
