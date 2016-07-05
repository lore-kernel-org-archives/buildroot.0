From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:06:47 +0200
Subject: [Buildroot] [git commit] boot/uboot: fix build of old U-Boot
	versions
Message-ID: <20160705101146.3A9B08212E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2eb2684f54cc182783419f1a0f489f5d5ca808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0dca644e443c8f28bfe5aa1c98201dc3b49e1165 ("boot/uboot: fix
missing host-openssl for i.MX28 target"), we pass HOSTCFLAGS/HOSTLDFLAGS
in the environment of U-Boot when building. This is needed to allow
U-Boot to find the OpenSSL headers/libraries when they are
needed. Unfortunately, this breaks the build with old U-Boot versions as
the U-Boot Makefiles were not designed to have HOSTCFLAGS passed in,
which causes some important CFLAGS from the U-Boot build system to be
ignored.

As suggested by Arnout, we pass the HOST_CFLAGS inside HOSTCC directly,
which allows to pass the CFLAGS without overriding the internal U-Boot
CFLAGS.

Tested with an old U-Boot (2012.10), and a modern U-Boot in a
configuration that needs OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a2274ee..4e6863d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -93,7 +93,7 @@ endif
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH) \
-	HOSTCFLAGS="$(HOST_CFLAGS)" \
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
