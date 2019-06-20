From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 17:12:48 +0200
Subject: [Buildroot] [git commit] package/haproxy: re-enable package on
 microblaze
Message-ID: <20190620151226.D5B0E8107C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cff148640564a3040a1d5f9e5545734b4791b2ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze ccc version < 8.x and optimization, the build fails
with;

  'internal compiler error: in do_output_reload, at reload1.c:7978'

This is due to gcc bug 90620:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620. To avoid this, the
haproxy package has a !BR2_microblaze dependency. However, this gcc
bug 90620 only triggers when optimization is enabled, so we can work
around the issue by passing -O0, which is what we do in other
Buildroot packages to work around similar Microblaze issues.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_90620, and
re-enables haproxy on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/Config.in  | 2 --
 package/haproxy/haproxy.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

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
index e382f61f8e..36ac704222 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -69,9 +69,15 @@ endif
 
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
+		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
