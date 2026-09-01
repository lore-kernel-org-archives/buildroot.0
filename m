Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD5C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747B640A1F;
	Tue,  1 Sep 2026 21:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCb8pWl0vXe3; Tue,  1 Sep 2026 21:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297086;
	bh=Ua4oPNPtaGik5SYprhJ2bc9Qk8VxzypNtpSB77/bYlk=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nov+11VtLduYZFjtOaZBHuqIC7wVZGyojtF7aML/D86gKrh+V6UrKRAytn49t+q81
	 veUrg7vUT3k9WmWTdJ9j25EUqu++19Ht/7s5+2xJeGjethAy+DD0fTIPv3rnmx+feJ
	 xFeEwTW6aDhJyOjbF17gaf581PuY2YiOC0rnZVyfizRuEjRZx2gBfczvSK3+HvBsXJ
	 pzWkKhiuabGazeLl+7gAW3uXs8GhhHydQzWr5GfuA8e/yMXeMP0cOuSsEbUMhRVXrF
	 /q5DsEemS/Sk91MLPspobjxLZKqdpsrVY4ZZpoj4SWOnPCwN8N35eN4Hw3rSZsubKj
	 fDl5RhfX8gALQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FB140822;
	Tue,  1 Sep 2026 21:11:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74704127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE0D60805
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJoJCjOSK0zz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.102;
 helo=mail-244102.protonmail.ch; envelope-from=benjamin8532@protonmail.com;
 receiver=<UNKNOWN> 
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41160607A9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:11:23 +0000 (UTC)
Date: Tue, 01 Sep 2026 21:11:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <FfB4hHudSTlCrinyaiQWX0uqh2zlb_Fvqiegzc40Se7JoDDmmXXNpHJlJZvW89FZNi2ymPJRnsaHWAv6IJhOnHqfEfRNfPPvso_7mMTOi9Y=@protonmail.com>
Feedback-ID: 216224038:user:proton
X-Pm-Message-ID: 13ce805e748c8b3a00f00f16c34b8447b84a732a
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbip: use kernel source when
 available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Benjamin DeCamp via buildroot <buildroot@buildroot.org>
Reply-To: Benjamin DeCamp <benjamin8532@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

adding a conditional that detects if a kernel is being built, and if so, use that kernels usbip sources

when a kernel is not being built, use a pinned kernel version

Signed-off-by: Benjamin DeCamp <benjamin8532@protonmail.com>
---
 package/usbip/usbip.mk | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
index b4475c8d89..4dfd160605 100644
--- a/package/usbip/usbip.mk
+++ b/package/usbip/usbip.mk
@@ -14,18 +14,27 @@
 #
 # usbip is not very tied to the kernel, in fact. It is pretty stable, API-wise,
 # so we can just use a recent kernel version.
+#
+# but when a kernel is being built, use the local kernel source
+ifeq ($(BR2_LINUX_KERNEL),y)
+USBIP_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+USBIP_SITE = $(LINUX_DIR)/tools/usb/usbip
+USBIP_SITE_METHOD = local
+USBIP_LICENSE_FILES = COPYING
+USBIP_DEPENDENCIES = linux udev
+else
 USBIP_VERSION = 6.12.6
 USBIP_SOURCE = linux-$(USBIP_VERSION).tar.xz
 USBIP_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v6.x
 USBIP_DL_SUBDIR = linux
+USBIP_SUBDIR = tools/usb/usbip
+USBIP_LICENSE_FILES = tools/usb/usbip/COPYING
+USBIP_DEPENDENCIES = udev
+endif
 
 # usbip's licensing diverges from that of the rest of the kernel
 USBIP_LICENSE = GPL-2.0-or-later
-USBIP_LICENSE_FILES = tools/usb/usbip/COPYING
 
-USBIP_DEPENDENCIES = udev
-
-USBIP_SUBDIR = tools/usb/usbip
 USBIP_INSTALL_STAGING = YES
 
 USBIP_AUTORECONF = YES
@@ -39,3 +48,4 @@ define USBIP_LINUX_CONFIG_FIXUPS
 endef
 
 $(eval $(autotools-package))
+
-- 
2.47.3


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
