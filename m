From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 19 Dec 2018 07:41:28 +0800
Subject: [Buildroot] [PATCH 1/2] package/systemd: add systemd-boot build
 option
Message-ID: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 21 +++++++++++++++++++++
 package/systemd/systemd.mk |  8 ++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 25f322e..ff71323 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -77,6 +77,27 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
+config BR2_PACKAGE_SYSTEMD_BOOT
+	bool "systemd-boot"
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  systemd-boot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  systemd-boot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using systemd-boot: the instructions are
+	  exactly the same, except that the systemd-boot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e53f0b6..0fa3b83 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -24,8 +24,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dima=false \
 	-Dlibcryptsetup=false \
-	-Defi=false \
-	-Dgnu-efi=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
@@ -332,6 +330,12 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
+SYSTEMD_CONF_OPTS += -Defi=true -Dgnu-efi=true
+else
+SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
+endif
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
-- 
2.7.4
