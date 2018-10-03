From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:47:13 +0200
Subject: [Buildroot] [git commit] haproxy: tweak thread activation
Message-ID: <20181003074639.B73A28B74A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f22fca4bf27f884950dd7804020e5d5193b570b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If threads are enabled, as described in include/common/hathreads.h,
haproxy uses __sync_*_4 intrisics if gcc < 4.7. Otherwise, haproxy
uses __atomic_ intrinsics.

As a result, instead of adding a dependency on BR2_TOOLCHAIN_HAS_SYNC_4
and BR2_TOOLCHAIN_HAS_ATOMIC in Config.in, enable threads only if the
dependencies are fulfilled in haproxy.mk

Fixes:
 - http://autobuild.buildroot.org/results/7f24873ecdd9246c95c03bb8d2fcd4c16c488c6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/Config.in  | 1 -
 package/haproxy/haproxy.mk | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index cbcbc0c388..fbe5941b55 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	help
 	  HAProxy is a free, very fast and reliable solution offering
 	  high availability, load balancing, and proxying for TCP and
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 363fc4447f..061a8cbbaf 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -20,7 +20,13 @@ HAPROXY_LIBS += -latomic
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# threads uses atomics on gcc >= 4.7 and sync otherwise (see
+# include/common/hathreads.h)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7):$(BR2_TOOLCHAIN_HAS_ATOMIC),y:y)
 HAPROXY_MAKE_OPTS += USE_THREAD=1
+else ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7):$(BR2_TOOLCHAIN_HAS_SYNC_4),:y)
+HAPROXY_MAKE_OPTS += USE_THREAD=1
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
