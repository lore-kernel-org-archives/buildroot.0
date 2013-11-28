From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 14:41:18 +0100
Subject: [Buildroot] [git commit] apr: fix threading lib detection
Message-ID: <20131128134439.668E79BE3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7eb4b3619d35abc7f14345046d58d6f48302c09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apr's configure doesn't try to guess which library is needed for
threading when cross-compiling hence this is never reflected in
apr-1-config, leading to a build failure such as:
http://autobuild.buildroot.net/results/035/035a00de0a56be00559767ba822a396ddc18a9fb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
