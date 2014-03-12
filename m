From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 22:24:26 +0100
Subject: [Buildroot] [git commit] systemd: bump to v208.
Message-ID: <20140312212628.24D9F9BE75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1f71aa72226593ac60e001e369f2a624a7f25f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump comes with a patch, backported from v209, to fix
a linker error when EFI support is disabled.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...efined-reference-efi_loader_get_boot_usec.patch |   29 ++++++++++++++++++++
 package/systemd/systemd.mk                         |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)

diff --git a/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch b/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch
new file mode 100644
index 0000000..84b0a1a
--- /dev/null
+++ b/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch
@@ -0,0 +1,29 @@
+From 70d9b9fc0a4fa1698ff00e364c61bb875244efa1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
+Date: Tue, 11 Feb 2014 09:54:49 -0300
+Subject: [PATCH] efi: fix Undefined reference efi_loader_get_boot_usec when
+ EFI support is disabled
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/shared/boot-timestamps.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/shared/boot-timestamps.c b/src/shared/boot-timestamps.c
+index 9449965..d656685 100644
+--- a/src/shared/boot-timestamps.c
++++ b/src/shared/boot-timestamps.c
+@@ -40,8 +40,10 @@ int boot_timestamps(const dual_timestamp *n, dual_timestamp *firmware, dual_time
+
+         r = acpi_get_boot_usec(&x, &y);
+         if (r < 0) {
++#ifdef ENABLE_EFI
+                 r = efi_loader_get_boot_usec(&x, &y);
+                 if (r < 0)
++#endif
+                         return r;
+         }
+
+--
+1.7.9.5
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0fc00e1..0ac4651 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 207
+SYSTEMD_VERSION = 208
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = GPLv2+
