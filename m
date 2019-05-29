From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 17:57:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/haproxy: re-enable package on
 Microblaze
In-Reply-To: <20190529155709.31207-1-giulio.benetti@micronovasrl.com>
References: <20190529155709.31207-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190529155709.31207-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build gives:
'internal compiler error: in do_output_reload, at reload1.c:7978'
This is due to bug 90620:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620. To avoid this, the
haproxy package has a !BR2_microblaze dependency. However, gcc bug
90620 only triggers when optimization is enabled, so we can work
around the issue by passing -O0, which is what we do in other
Buildroot packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_90620, and
re-enables haproxy on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/haproxy/Config.in  | 2 --
 package/haproxy/haproxy.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index 670de5a3ee..db63143a74 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 	bool
 	default y
-	# internal compiler error: in do_output_reload, at reload1.c:7978
-	depends on !BR2_microblaze
 	# src/proto_http.c:6330:1: internal compiler error: Segmentation fault
 	depends on !BR2_nios2
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index e382f61f8e..fde9d5edc6 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -69,9 +69,16 @@ endif
 
 HAPROXY_MAKE_OPTS += ADDLIB="$(HAPROXY_LIBS)"
 
+HAPROXY_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
+HAPROXY_CFLAGS += -O0
+endif
+
 define HAPROXY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) -C $(@D)
+		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" \
+		 -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
-- 
2.17.1
