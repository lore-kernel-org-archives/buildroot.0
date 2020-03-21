From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 21 Mar 2020 20:57:03 -0300
Subject: [Buildroot] [PATCH] linux: do not run depmod during the installation
Message-ID: <20200321235703.10622-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The kernel "install" target runs depmod by means of a wrapper script
(scripts/depmod.sh), so passing a dummy depmod (e.g. /dev/null) would
cause warning messages like this:

    DEPMOD  5.4.27
    ./scripts/depmod.sh: 46: /dev/null: Permission denied
    make[2]: *** [Makefile:1326: _modinst_post] Error 126

We can avoid running the script by overriding the cmd_depmod variable,
which contains the command line to run depmod.

As a safety measure, setting DEPMOD to /bin/false makes the installation
fail if overriding cmd_depmod does not work in a future kernel version.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2e3ea52053..383d1908d6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -134,7 +134,8 @@ LINUX_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	DEPMOD=$(HOST_DIR)/sbin/depmod
+	DEPMOD=/bin/false \
+	cmd_depmod=":"
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
-- 
2.18.2
