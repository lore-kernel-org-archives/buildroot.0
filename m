From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:31:09 +0200
Subject: [Buildroot] [git commit] uboot: add option to optionally depend on
	host-openssl
Message-ID: <20161020213127.2266B81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02e11d02f40ad2ec236bdcc6359729dbf2604069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some U-Boot board configurations have CONFIG_FIT_SIGNATURE=y. In this
case, when U-Boot builds its tools, it requires OpenSSL support on the
host system.

Since we clearly don't want to unconditionally depend on host-openssl,
we introduce a new option to explicitly enable the dependency on
host-openssl. This is exactly identical to the existing
BR2_TARGET_UBOOT_NEEDS_DTC, for the dependency on host-dtc. It is
therefore the responsibility of the user to enable this option if his
board configuration uses CONFIG_FIT_SIGNATURE=y.

Necessary to fix bug #9316.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d46a757..fabf27d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,6 +137,14 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_UBOOT_NEEDS_OPENSSL
+	bool "U-Boot needs OpenSSL"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires OpenSSL to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_FIT_SIGNATURE enabled.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 86e5b84..ae7539d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -133,6 +133,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
+UBOOT_DEPENDENCIES += host-openssl
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
