From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:25:08 +0100
Subject: [Buildroot] [git commit] linux: fix passing of host CFLAGS and
 LDFLAGS
Message-ID: <20180306143235.13C6A80FBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde090c299b0357fdb1a4ec44ad8d332ac57f65e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were passing HOSTCFLAGS="$(HOSTCFLAGS)" to Linux. However:

 - HOSTCFLAGS in Buildroot doesn't exist, and is empty, so this
   assignment never did anything. The name of the variable in
   Buildroot in HOST_CFLAGS.

 - HOSTCFLAGS in Linux isn't used everywhere, and passing it overrides
   the default HOSTCFLAGS value defined in the main Linux kernel
   Makefile.

In addition, there is no way to pass additional host LDFLAGS in the
Linux kernel build system.

Therefore, we simply shoehorn our HOST_CFLAGS and HOST_LDFLAGS while
passing HOSTCC to the Linux kernel build system. This has been tested
to work fine with host OpenSSL and host libelf only available in
$(HOST_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ab940e7305..3b69524663 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -95,8 +95,7 @@ LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC)" \
-	HOSTCFLAGS="$(HOSTCFLAGS)" \
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
