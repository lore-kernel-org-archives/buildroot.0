From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jun 2018 21:24:47 +0300
Subject: [Buildroot] [PATCH 1/2] triggerhappy: use target pkg-config
Message-ID: <d94eeb035e53af51d450c8e49b03e01cce0dfa1a.1528741488.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

triggerhappy uses pkg-config to detect the systemd library. Make sure it
uses the target pkg-config, not the host one.

Fixes build failure when the host has systemd pkg-config files:

.../host/bin/arm-linux-gcc -static  th-cmd.o cmdsocket.o  -lsystemd -o th-cmd
.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lsystemd

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/triggerhappy/triggerhappy.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 9f74c486f10e..4c39ab5e5d4e 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -8,9 +8,11 @@ TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
 TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
 TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
+TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
 
 define TRIGGERHAPPY_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) thd th-cmd
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		-C $(@D) thd th-cmd
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.17.1
