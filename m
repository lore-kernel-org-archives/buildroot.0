From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:17:19 +0100
Subject: [Buildroot] [git commit] package/apr: Fix detection of rlimit and
	large file support
Message-ID: <20141026211724.EA62FB0BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aac552e61fb7ff8cbae3d615dcf17e9335996e00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr/apr.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 1a4c0e2..dfaf213 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -16,6 +16,7 @@ APR_CONF_ENV = \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
+	ac_cv_struct_rlimit=yes \
 	apr_cv_mutex_recursive=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
@@ -24,6 +25,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
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
