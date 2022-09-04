Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7ECC54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C061260F15;
	Sun,  4 Sep 2022 19:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C061260F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGduLv3u3SUF; Sun,  4 Sep 2022 19:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876A460F2C;
	Sun,  4 Sep 2022 19:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876A460F2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2E291BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF17813AD
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF17813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wccllQvhnjaf for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C16B81367
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C16B81367
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:09:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso10301797pjk.0
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QP7b6pGNB+j/JDo9WcgARjf2dNa6rBaDUfRqAh8hSAs=;
 b=UCLMRtwTbrxRbDBCoM/pYr/XWYVg23Czc+WdWr+KAYKZPDIAJrq1Cy1sv/NFsAINtx
 UqpJ+D8BX/Mysb/2QSkaFU/ov44fLSZf8v7nu7+VPvJHOZANk0UinDEpc/DYqhg+cz51
 QX5vNlw3Ihype522lJftAo6vu+jn+Jui6o/9zDizjqZVMJPfJTZkBS4E5Y5Zce7/CuIS
 6x9slx45W+g5ZtQ+Z6MZxEAcfxmCBfTvuP264tK04dx3jX/lvsLKgYs9dEEd1lkbWyqK
 klAMibKnd1ae0tF5fgoyrKiuiikJv7ENhrj36lG/MhwVoiZIFE3qrECnD03ZJhcYH6if
 Wbog==
X-Gm-Message-State: ACgBeo0kVjRpfXohC5wc7De4Jh9wKJrT5lEenrb4Tlj+1bX4NJxSesnf
 8GzsR5JFOuX/rFyvSUaOb82xxiVsG2TBkg==
X-Google-Smtp-Source: AA6agR5yF4HfVB9j6JhEBSlORhyn/VjUt3Ou8wT+m0JRTkQtCvaipcstxp3z2Pn+pgaFxE80M4Vb6A==
X-Received: by 2002:a17:902:f712:b0:171:29d0:6f9f with SMTP id
 h18-20020a170902f71200b0017129d06f9fmr45993996plo.84.1662318583447; 
 Sun, 04 Sep 2022 12:09:43 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 pc7-20020a17090b3b8700b001fb1de10a4dsm5303614pjb.33.2022.09.04.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 12:09:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 12:09:40 -0700
Message-Id: <20220904190940.200587-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] boot/refind: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rEFInd is a user-friendly EFI GUI for boot selection.

https://www.rodsbooks.com/refind/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 ...nstall-copy-to-target-directory-only.patch | 88 +++++++++++++++++++
 ...-environment-variables-for-toolchain.patch | 58 ++++++++++++
 boot/refind/Config.in                         | 18 ++++
 boot/refind/readme.txt                        | 42 +++++++++
 boot/refind/refind.hash                       |  5 ++
 boot/refind/refind.mk                         | 66 ++++++++++++++
 8 files changed, 279 insertions(+)
 create mode 100644 boot/refind/0001-refind-install-copy-to-target-directory-only.patch
 create mode 100644 boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch
 create mode 100644 boot/refind/Config.in
 create mode 100644 boot/refind/readme.txt
 create mode 100644 boot/refind/refind.hash
 create mode 100644 boot/refind/refind.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..3aafde80ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -528,6 +528,7 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
+F:	boot/refind/
 F:	package/batman-adv/
 F:	package/containerd/
 F:	package/delve/
diff --git a/boot/Config.in b/boot/Config.in
index 40472ae07d..5db0845479 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -18,6 +18,7 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
+source "boot/refind/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/sun20i-d1-spl/Config.in"
diff --git a/boot/refind/0001-refind-install-copy-to-target-directory-only.patch b/boot/refind/0001-refind-install-copy-to-target-directory-only.patch
new file mode 100644
index 0000000000..87c102ec41
--- /dev/null
+++ b/boot/refind/0001-refind-install-copy-to-target-directory-only.patch
@@ -0,0 +1,88 @@
+From 4476e664a6cb251924f6a61160c72e0fdc0d56fb Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 1 Sep 2022 20:32:30 -0700
+Subject: [PATCH] refind-install: copy to target directory only
+
+Comment all commands which require root or access the host system.
+
+Designed to be run in Buildroot:
+
+	OSTYPE="linux" \
+	Platform="$(REFIND_PLATFORM)" \
+	InstallDir="$(BINARIES_DIR)/refind" \
+	RootDir="$(BINARIES_DIR)/refind" \
+    ./refind-install
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ refind-install | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/refind-install b/refind-install
+index dfb8781..ec01f2e 100755
+--- a/refind-install
++++ b/refind-install
+@@ -1443,11 +1443,11 @@ InstallOnLinux() {
+       exit 1
+    fi
+    echo "Installing rEFInd on Linux...."
+-   modprobe efivars &> /dev/null
++   # modprobe efivars &> /dev/null
+    if [[ $TargetDir == "/EFI/BOOT" ]] ; then
+       MountDefaultTarget
+    else
+-      FindMountedESP
++      # FindMountedESP
+       DetermineTargetDir
+    fi
+ 
+@@ -1455,20 +1455,20 @@ InstallOnLinux() {
+       ReSignBinaries
+    fi
+ 
+-   CheckSecureBoot
++   # CheckSecureBoot
+    CopyRefindFiles
+-   if [[ "$TargetDir" != "/EFI/BOOT" && "$TargetDir" != "/EFI/Microsoft/Boot" ]] ; then
+-      AddBootEntry
+-      GenerateRefindLinuxConf
+-   fi
++   # if [[ "$TargetDir" != "/EFI/BOOT" && "$TargetDir" != "/EFI/Microsoft/Boot" ]] ; then
++      # AddBootEntry
++      # GenerateRefindLinuxConf
++   # fi
+    # Note that InstallSBKey may require the user to enter a password, so
+    # it must NOT be called if --yes is passed to the script, since that
+    # parameter is intended to eliminate user interaction. The user will
+    # just have to enroll any necessary Secure Boot key manually in this
+    # case.
+-   if [[ "$IsSecureBoot" == "1" && "$AlwaysYes" == "0" ]] ; then
+-      InstallSBKey
+-   fi
++   # if [[ "$IsSecureBoot" == "1" && "$AlwaysYes" == "0" ]] ; then
++   #    InstallSBKey
++   # fi
+ } # InstallOnLinux()
+ 
+ #
+@@ -1477,16 +1477,7 @@ InstallOnLinux() {
+ # install under OS X or Linux, depending on the detected platform.
+ #
+ GetParams "$@"
+-if [[ $UID != 0 ]] ; then
+-   echo "Not running as root; attempting to elevate privileges via sudo...."
+-   if ! sudo "${BASH_SOURCE[0]}" "$@" ; then
+-      echo "This script must be run as root (or using sudo). Exiting!"
+-      exit 1
+-   else
+-      exit 0
+-   fi
+-fi
+-DeterminePlatform
++# DeterminePlatform
+ CheckForFiles
+ case "$OSTYPE" in
+    darwin*)
+-- 
+2.37.2
+
diff --git a/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch b/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch
new file mode 100644
index 0000000000..45b462b962
--- /dev/null
+++ b/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch
@@ -0,0 +1,58 @@
+From 1ab4b8b448f87167d512222e0de92c0fb2e73b0e Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Fri, 2 Sep 2022 00:41:13 -0700
+Subject: [PATCH] Make.common: use environment variables for toolchain
+
+Use the environment specified CC, LD, etc.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Make.common | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/Make.common b/Make.common
+index 95a3a97..62c1059 100644
+--- a/Make.common
++++ b/Make.common
+@@ -17,38 +17,8 @@
+ # used to compile rEFInd....
+ #
+ 
+-EFIINC          = /usr/include/efi
+-GNUEFILIB       = /usr/lib
+-EFILIB          = /usr/lib
+-EFICRT0         = /usr/lib
+-
+-# Comment out above and uncomment below if using locally-compiled GNU-EFI....
+-#EFIINC          = /usr/local/include/efi
+-#GNUEFILIB       = /usr/local/lib
+-#EFILIB          = /usr/local/lib
+-#EFICRT0         = /usr/local/lib
+-
+-HOSTARCH        = $(shell uname -m | sed s,i[3456789]86,ia32,)
+-ARCH            ?= $(HOSTARCH)
+-
+ # Note: TIANOBASE is defined in master Makefile and exported
+ GENFW           = $(TIANOBASE)/BaseTools/Source/C/bin/GenFw
+-prefix          = /usr/bin/
+-ifeq ($(ARCH),aarch64)
+-  CC            = $(prefix)aarch64-linux-gnu-gcc
+-  AS            = $(prefix)aarch64-linux-gnu-as
+-  LD            = $(prefix)aarch64-linux-gnu-ld
+-  AR            = $(prefix)aarch64-linux-gnu-ar
+-  RANLIB        = $(prefix)aarch64-linux-gnu-ranlib
+-  OBJCOPY       = $(prefix)aarch64-linux-gnu-objcopy
+-else
+-  CC            = $(prefix)gcc
+-  AS            = $(prefix)as
+-  LD            = $(prefix)ld
+-  AR            = $(prefix)ar
+-  RANLIB        = $(prefix)ranlib
+-  OBJCOPY       = $(prefix)objcopy
+-endif
+ 
+ ifeq ($(MAKEWITH),TIANO)
+ # Below file defines TARGET (RELEASE or DEBUG) and TOOL_CHAIN_TAG (GCC44, GCC45, GCC46, or GCC47)
+-- 
+2.37.2
+
diff --git a/boot/refind/Config.in b/boot/refind/Config.in
new file mode 100644
index 0000000000..683ac4c771
--- /dev/null
+++ b/boot/refind/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_REFIND_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	depends on BR2_USE_MMU
+
+config BR2_TARGET_REFIND
+	bool "refind"
+	depends on BR2_PACKAGE_REFIND_ARCH_SUPPORTS
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  rEFInd presents a user-friendly GUI for boot selection.
+
+	  For additional notes on using rEFInd with Buildroot, see
+	  boot/refind/readme.txt
+
+	  https://www.rodsbooks.com/refind/
diff --git a/boot/refind/readme.txt b/boot/refind/readme.txt
new file mode 100644
index 0000000000..d4bc326e6f
--- /dev/null
+++ b/boot/refind/readme.txt
@@ -0,0 +1,42 @@
+Notes on using rEFInd
+=============================================
+
+1. Create a disk image
+   dd if=/dev/zero of=disk.img bs=1M count=32
+2. Partition it (either legacy or GPT style partitions work)
+    - Create one fat16 partition, labeled BOOT, flags boot, lba.
+    - Create one ext4 partition, type Linux, for the root fs.
+3. Setup loop device and loop partitions
+   sudo losetup -f disk.img
+   sudo partx -a /dev/loop0
+4. Prepare the partition contents
+   sudo mkfs.fat -F 16 -L BOOT /dev/loop0p1
+   sudo mkfs.ext4 -L root /dev/loop0p2
+   sudo mount /dev/loop0p1 /mnt
+   sudo tar -C /mnt -xf output/images/refind.tar
+   sudo umount /mnt
+   sudo mount /dev/loop0p2 /mnt
+   sudo tar -C /mnt -xf output/images/rootfs.tar
+   sudo umount /mnt
+5. Cleanup loop device
+   sudo partx -d /dev/loop0
+   sudo losetup -d /dev/loop0
+6. Your disk.img is ready!
+
+Configuring rEFInd
+=============================================
+
+rEFInd will search for refind_linux.conf files.
+
+Place a refind_linux.conf file in the same location as your initrd:
+
+"Boot Buildroot"  "initrd=/boot/initrd-%v root=/dev/initrd ro earlyprintk"
+
+rEFInd will find all files with prefix initrd- and display options on screen,
+defaulting to the most recent build version.
+
+Example contents of /boot:
+
+bzImage-buildroot-2022.05.1-104-1
+initrd-buildroot-2022.05.1-104-1
+refind_linux.conf
diff --git a/boot/refind/refind.hash b/boot/refind/refind.hash
new file mode 100644
index 0000000000..da644af4c5
--- /dev/null
+++ b/boot/refind/refind.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  7a3e3f0f81bd4ae95f24e120f44e01319231f488fef7cc8bf03a1aea23c6cfd1  refind-src-0.13.3.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.txt
+sha256  cebbc60079d3e79a1d94bf7c63482ca27d8ce58739d28c5e209bbd378337729b  LICENSE.txt
+sha256  4748f03ed2dbcc14cde6ebc30799899c403e356a7465dc30fcf2b80c45fc0059  docs/refind/FDL-1.3.txt
diff --git a/boot/refind/refind.mk b/boot/refind/refind.mk
new file mode 100644
index 0000000000..3daeb1a8c9
--- /dev/null
+++ b/boot/refind/refind.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# refind
+#
+################################################################################
+
+REFIND_VERSION = 0.13.3.1
+REFIND_SITE = http://downloads.sourceforge.net/project/refind/$(REFIND_VERSION)
+REFIND_SOURCE = refind-src-$(REFIND_VERSION).tar.gz
+REFIND_LICENSE = GPL-3.0+, GFDL-1.3+ (docs)
+REFIND_LICENSE_FILES = COPYING.txt LICENSE.txt docs/refind/FDL-1.3.txt
+REFIND_DEPENDENCIES = gnu-efi
+REFIND_INSTALL_IMAGES = YES
+
+REFIND_TARGET = all_gnuefi
+REFIND_EFI_ARGS = \
+	EFICRT0=$(STAGING_DIR)/usr/lib \
+	EFIINC=$(STAGING_DIR)/usr/include/efi \
+	EFILIB=$(STAGING_DIR)/usr/lib \
+	GNUEFILIB=$(STAGING_DIR)/usr/lib \
+	LIBDIR=$(STAGING_DIR)/usr/lib \
+	LIBEFI=$(STAGING_DIR)/usr/lib/libefi.a
+
+ifeq ($(BR2_x86_64),y)
+REFIND_ARCH = x86_64
+REFIND_PLATFORM = x64
+else ifeq ($(BR2_aarch64),y)
+REFIND_ARCH = aarch64
+REFIND_PLATFORM = aa64
+else
+REFIND_ARCH = ia32
+REFIND_PLATFORM = ia32
+endif
+
+REFIND_BINARIES_DIR = $(BINARIES_DIR)/refind
+REFIND_INSTALL_ARGS = \
+		InstallDir="$(REFIND_BINARIES_DIR)" \
+		OSTYPE="linux" \
+		Platform="$(REFIND_PLATFORM)" \
+		RootDir="$(REFIND_BINARIES_DIR)"
+
+define REFIND_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		ARCH="$(REFIND_ARCH)" \
+		AS="$(TARGET_AS)" \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		MAKEWITH="GNUEFI" \
+		OBJCOPY="$(TARGET_OBJCOPY)" \
+		PYTHON=$(HOST_DIR)/bin/python3 \
+		RANLIB="$(TARGET_RANLIB)" \
+		$(REFIND_EFI_ARGS) -C $(@D) $(REFIND_TARGET)
+endef
+
+define REFIND_INSTALL_IMAGES_CMDS
+	if [ -d $(REFIND_BINARIES_DIR) ]; then \
+		rm -rf $(REFIND_BINARIES_DIR); \
+	fi
+	cd $(@D) && $(REFIND_INSTALL_ARGS) ./refind-install --yes --alldrivers
+	mv $(REFIND_BINARIES_DIR)/EFI/refind/ $(REFIND_BINARIES_DIR)/EFI/BOOT/
+	mv $(REFIND_BINARIES_DIR)/EFI/BOOT/refind_$(REFIND_PLATFORM).efi \
+		$(REFIND_BINARIES_DIR)/EFI/BOOT/boot$(REFIND_PLATFORM).efi
+	echo "boot$(REFIND_PLATFORM).efi" > $(REFIND_BINARIES_DIR)/startup.nsh
+endef
+
+$(eval $(generic-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
