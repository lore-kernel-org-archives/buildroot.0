Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95290F43684
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D2360D9B;
	Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77WywBRtJ1sk; Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5348E60D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416391;
	bh=bcwaPi6lxnPMwV2Gi6rIzxpAM/tZrb/zSxSJdRSTBfM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TDLxhlJu9IZDs2P6hiA54JRuKVFtsvaRG3Vg9dT/QrzNBztRBOShTfMC/4sbcpTOx
	 Ie4Rmv/8piHPPwzCzkAUfiSph653o6K8IQSXjzTy50uU0BpdTWPGdsushmzeWmsvEO
	 2ZfMBm/akcfKFZZ8N5N0aPxUk6a0QPcrIndak3eTrFqhRLtz/a6VVAqiuNGcHMpAhS
	 4UblXESg8wGrhF/FxaTpFK2sjIEszEBfXRqewnd2JCCMXw1vFOoYB2Dx6KbiwtJAKs
	 cf/Tqpd9QgTTrFuqOPv72QvtBnfVE/fiNSGmIJUYbnxqADNQffACKQRAB0g8UbpPy6
	 Z1GGYqATrhaQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5348E60D94;
	Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5B8259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B88160D77
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu6a-vwfImme for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A91860D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A91860D5E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A91860D5E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso3033805e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416384; x=1777021184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LA5ok66R3Qw6nBypw+Oe5nzR9CsfEMjluhYS83oIRQ4=;
 b=tReFAsMSj3npoa2P92k8JQ0dY0nRjXSiWhf5H6n0tPvg7Ji/kGNMhK6u3dbA4XAI+B
 wa64RCZ9jFqo7JHyjd3QmakEaKsg+431ej7JxrqblYk3xCgm61tfzJh0o0rErdSxkwh/
 L3dLF/ZN5D1VgX9ks9S9bl0ZFPv+a92ACjLwQporHjGIVG55pQHPa9OG7sZtm0d4gGkH
 KkH6ab7bwSADP1ivdcC/R7/jw1T1Sz7YjSwVQz5iH/YnDLLFYA9Ji/yy7WcN6tW593pw
 6HrC5tqWlqVXMmx9F6qebxt1eKguupPvwFulQFBGabiQiuUAmoXJzJAhE6C5BAa+397Z
 bj2g==
X-Gm-Message-State: AOJu0YzGzMQ51tsPtj2udQnkjvosCnfF3wxk5ziBcQH8ALeaV6YLHDS7
 2Z5cu4VH14orlCUn0LhTsgjVIqpNYKu9bQoWe/LUQ+axDgZY/c9olnNBMk7a1YwT+84szgR/6Hb
 AYtiduHw=
X-Gm-Gg: AeBDieuNMXJoizPbI0kdLyg7Ea/6oBQpqK8saUlimSk0GKzy3Nmn7rS7Q0LWsUhIhIf
 AfPGFQoSFcjZtSuN6RnG4N5XCVWKvFxZpekkp8IW7oMhkSYT871z0rhAkJDDNi71+PODKRMpDyB
 hl6coj0d7x6vNzEdFwrr05nikzFoe/YuQGHJY5WNLXodVTu2AnzU2jS4Y4gTki5fbacbWmBcZBZ
 5sT7MfHXtRKc5VV1klH38NE8fucEx9NZmQT6XEmCgDU7Lk36r8B5YXCOoiWedHD8sxHd16y3i0v
 e3uTexCQ7agExF9hO//HUdBYrYUtPPX81dMubK7dwoX5QsMgxTKMRVIRvXfZQxWTUi7xJHhH8n3
 E0zZtiPPs+B9jvy4TAKmFaAt8UVqVVNU4Yzb+8NQCGqbyOSXyX53GjgX3CCfaG4YDlFsZktwz39
 ANOjsbdalFHtZyhWAYnGV2HmZCi/8JFULmFrPmpEXmYUceAyhvi8m/60VGEDTvf/DwxTGsKaTho
 54IwXjlUdnXWeJKhTJaE8w2Nmb0pM8=
X-Received: by 2002:a05:600c:64c8:b0:485:2fe9:336f with SMTP id
 5b1f17b1804b1-488fb7a0d24mr29392275e9.30.1776416383853; 
 Fri, 17 Apr 2026 01:59:43 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:43 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:20 +0200
Message-ID: <20260417085936.200528-6-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416384; x=1777021184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA5ok66R3Qw6nBypw+Oe5nzR9CsfEMjluhYS83oIRQ4=;
 b=MEuCUocuJbsPbKdwSBOzVIPrqF1/sqcXWj8VaiqxaiyoCzRZu6YiliI5vcflJZr4D1
 fEaYBRpVLEYY1o30LFRnR7Z4zoduYI0ULMg4bQR1p7zPG27+9ivpRgPRa/aO2k6vrDoA
 6LDhm67PqhQ44trZqCjj5VBgrf7LrHI7UgBiY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=MEuCUocu
Subject: [Buildroot] [PATCH v1 05/21] support/testing : test_iso9660 : Bump
 kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel configuration to support modern storage stacks
required for ISO booting on x86_64.

The transition from 4.19 to 6.18 requires explicit activation of:
- CONFIG_PCI: To discover the emulated IDE/SATA controllers.
- CONFIG_ATA & CONFIG_ATA_PIIX: Modern libATA drivers for QEMU's
  chipset (replacing the legacy IDE subsystem).
- CONFIG_SCSI & CONFIG_BLK_DEV_SR: Necessary to handle the CD-ROM
  as a SCSI device (/dev/sr0), which is mandatory for ISO9660.

Without these options, the kernel cannot locate or mount the
rootfs from the ISO image.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/conf/minimal-x86-qemu-kernel.config | 4 ++++
 support/testing/tests/fs/test_iso9660.py            | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index 45994f804d..ca36d95b11 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -12,9 +12,13 @@ CONFIG_INET=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
+CONFIG_BLK_DEV_SR_VENDOR=y
+CONFIG_SCSI=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
+CONFIG_PATA_AMD=y
+CONFIG_PCI=y
 CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
 CONFIG_NE2K_PCI=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 947aca5f54..b2edcac460 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -11,7 +11,7 @@ BASIC_CONFIG = \
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
     # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
