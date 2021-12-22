Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1A0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE6E402F6;
	Wed, 22 Dec 2021 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTexK-TqRpYB; Wed, 22 Dec 2021 17:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B4F41545;
	Wed, 22 Dec 2021 17:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2DB1BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A5E040273
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7B9NsnZeUUP6 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:49:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A4540227
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:49:26 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id ABC7820B717A;
 Wed, 22 Dec 2021 09:49:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ABC7820B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640195366;
 bh=4csYjf4hIcVFkaodmLChJjECJ/Ob0vSV+2ZmgPwvJyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qD2zkBKaa4dZUklBKHe8m67Atk05/wiBcnIiOtvRFX0U/teIGvZFhCnvQ1UjMRF14
 FsTyF4Bqk8Xr0zfwEra5U0AfiyxHlCzrT2YXx2eQOSbho1BolGU8HQPvEcCCeRoFyy
 zchREnz+puHQxmATeZC1K4/GkMmSbWYjL6jtuG1Y=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:49:05 +0100
Message-Id: <20211222174905.71902-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211222174905.71902-1-flaniel@linux.microsoft.com>
References: <20211222174905.71902-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONFIG_DEBUG_BTF_INFO relies on pahole, so kernel DWARF are converted to BTF.
If CONFIG_DEBUG_BTF_INFO is set and BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE not,
an error message is shown and .config is not written.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 linux/Config.in               | 12 ++++++++++++
 linux/linux.mk                | 12 ++++++++++++
 package/pahole/Config.in.host |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 6c30100921..ef86cbc021 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -470,6 +470,18 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
 	  libelf-devel or elfutils-libelf-devel".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
+	bool "Needs host pahole"
+	help
+	  Some Linux kernel configuration options (such as
+	  CONFIG_DEBUG_INFO_BTF) require building a host
+	  program called pahole. Enabling this option will ensure
+	  host-pahole gets built before the Linux kernel.
+
+	  Enable this option if you get a Linux kernel build failure
+	  such as "BTF: .tmp_vmlinux.btf: pahole (pahole) is not
+	  available".
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..acb2464e8d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -114,6 +114,17 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
 LINUX_DEPENDENCIES += host-elfutils host-pkgconf
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_DEPENDENCIES += host-pahole
+else
+define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
+        if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
+                echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole (BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE)" 1>&2; \
+		exit 1; \
+        fi
+endef
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
@@ -324,6 +335,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_DISABLE_OPT,$(opt))
 	)
 	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
+	$(LINUX_FIXUP_CONFIG_PAHOLE_CHECK)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
 	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
index e427629632..521874961b 100644
--- a/package/pahole/Config.in.host
+++ b/package/pahole/Config.in.host
@@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
 	help
 	  Pahole and other DWARF utils.
 
+	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF set.
+
 	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
