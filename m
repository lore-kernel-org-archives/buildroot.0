From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Apr 2021 20:52:30 +0200
Subject: [Buildroot] [PATCH] boot/grub2: ignore the last 3 remaining CVEs
Message-ID: <20210405185231.1363881-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An analysis of the last 3 remaining CVEs that are reported to affect
the grub2 package has allowed to ensure that we can safely ignore
them:

 * CVE-2020-14372 is already fixed by a patch we have in our patch
   stack for grub2

 * CVE-2019-14865 and CVE-2020-15705 are both distro-specific and do
   not affect grub2 upstream, nor grub2 with the stack of patches we
   have in Buildroot

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index c5742ede71..af16ee91e1 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -37,6 +37,18 @@ GRUB2_IGNORE_CVES += CVE-2020-15707
 # 2021/03/02 security fixes - patches 0029-0149
 GRUB2_IGNORE_CVES += CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 \
 	CVE-2020-27779 CVE-2021-3418 CVE-2021-20225 CVE-2021-20233
+# 0039-acpi-Don-t-register-the-acpi-command-when-locked-dow.patch
+GRUB2_IGNORE_CVES += CVE-2020-14372
+# CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
+# doesn't exist upstream, but is added by the Redhat/Fedora
+# packaging. Not applicable to Buildroot.
+GRUB2_IGNORE_CVES += CVE-2019-14865
+# CVE-2020-15705 is related to a flaw in the use of the
+# grub_linuxefi_secure_validate(), which was added by Debian/Ubuntu
+# patches. The issue doesn't affect upstream Grub, and
+# grub_linuxefi_secure_validate() is not implemented in the grub2
+# version available in Buildroot.
+GRUB2_IGNORE_CVES += CVE-2020-15705
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
-- 
2.30.2
