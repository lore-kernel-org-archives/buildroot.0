From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 09:53:04 -0300
Subject: [Buildroot] [PATCH] apr: fix threading lib detection
Message-ID: <1385556784-25477-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apr's configure doesn't try to guess which library is needed for
threading when cross-compiling hence this is never reflected in
apr-1-config, leading to a build failure such as:
http://autobuild.buildroot.net/results/035/035a00de0a56be00559767ba822a396ddc18a9fb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/apr/apr.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 4da42c5..1a4c0e2 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -19,6 +19,11 @@ APR_CONF_ENV = \
 	apr_cv_mutex_recursive=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
+# Doesn't even try to guess when cross compiling
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
+endif
+
 define APR_CLEANUP_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/build-1/
 endef
-- 
1.8.3.2
