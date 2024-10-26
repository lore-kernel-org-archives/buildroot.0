Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870CBD10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0F3811D6;
	Sat, 26 Oct 2024 11:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ids0O0WvzKRi; Sat, 26 Oct 2024 11:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA544811AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA544811AD;
	Sat, 26 Oct 2024 11:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8395C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DFF760608
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFpF66EaSTVf for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5B55605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B55605EA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5B55605EA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso36334005e9.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729940465; x=1730545265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YaR+ZTCzgHoDdwA7RPIeBA3BzkYCYMoiE9S07Se8Ekg=;
 b=m3jgKOamZlDalhyNuhW89UTn1/d+j1rape8WQTOc/PH44acTU+fIuQtmaR/JF6q6HE
 Cr+VYhmHku6U93txhd78yDdPPLVwrm3lsW0Xt+/Tc0peDS7XaqIesbezjNp4v7eHw5mn
 dHTZagidXjEi5C0ULRltxQEuBYpMfLg4qVl7viPKFVdvPMFgG5ZhbBuWgCtD2+wgQfI+
 ka86tADfu+s24UUIU1AbglYK/wptwPh9ormELow6XoUjlFv7kqcOUGye77yxqWuGjeU0
 bNkMAOuFjmMQz0qR7wtkpRmYBUELYNGYE64PFHmngIvviSzQX8tZCtG6h3uct+sCGQqS
 TPQg==
X-Gm-Message-State: AOJu0YyCG3FMZ/0TWyB52BQi4dyt7gawTh58fRNNdRPbroXG1WGSiUg6
 SQDW+p8VPv/njahfCK073hyO8EsXpwvsg3DRNiusxEv1QqBPswOGb1Zwwrm3pa67HylegiDAPOR
 p
X-Google-Smtp-Source: AGHT+IEmCwK6o1BhyNbnWkQe8BrdQokKanetXjCMXaEHpd4KbVyL8YR7jRIQM9Lb57j6tek+Wicqjg==
X-Received: by 2002:a05:600c:3c8c:b0:42b:ac3d:3abc with SMTP id
 5b1f17b1804b1-4319ad068f6mr21133485e9.24.1729940465355; 
 Sat, 26 Oct 2024 04:01:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cf8sm44846235e9.7.2024.10.26.04.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 04:01:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:00:58 +0200
Message-ID: <20241026110059.3204413-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241026110059.3204413-1-romain.naour@smile.fr>
References: <20241026110059.3204413-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729940465; x=1730545265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YaR+ZTCzgHoDdwA7RPIeBA3BzkYCYMoiE9S07Se8Ekg=;
 b=v4Oy+kVgZQ/6fGO8S7c0mhzkBkSQkQ91CFS2+hH+3dlkHtDP2+1tDcA+bRnxqrcBXY
 K6wE9Hc04q7TNnl815hplxecYzwVSoXrzU3W0X8k8ZdxYmyQoFqD5CgQR37So6GFhYGD
 A+K7gSQ1pQPaFkXJ7eNf+v4+42hyDOomgdsfU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=v4Oy+kVg
Subject: [Buildroot] [PATCH v3 4/5] package/qemu: update to 9.1.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Waldemar Brodkorb <wbx@openadk.org>

See here for changes:
https://wiki.qemu.org/ChangeLog/9.1

The support for the nios2 architecture got removed.

[Romain: Remove BR2_PACKAGE_QEMU_TARGET_NIOS2 from qemu.mk]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy            | 6 ++++++
 package/qemu/Config.in      | 5 -----
 package/qemu/Config.in.host | 1 -
 package/qemu/qemu.hash      | 2 +-
 package/qemu/qemu.mk        | 4 +---
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a47a2dda1..b478de809b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_QEMU_TARGET_NIOS2
+	bool "Qemu NIOS2 support has been removed"
+	select BR2_LEGACY
+	help
+	  Qemu NIOS2 support has been removed.
+
 config BR2_KERNEL_HEADERS_6_10
 	bool "kernel headers version 6.10.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 608e4d429d..2d15ab1ea9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -252,11 +252,6 @@ config BR2_PACKAGE_QEMU_TARGET_MIPSN32EL
 	help
 	  MIPS N32 architecture, little-endian.
 
-config BR2_PACKAGE_QEMU_TARGET_NIOS2
-	bool "nios2"
-	help
-	  Nios II architecture.
-
 config BR2_PACKAGE_QEMU_TARGET_OR1K
 	bool "or1k"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8dd0c7d11b..4db114490a 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,7 +9,6 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 419dd0d1b3..169fe05068 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6  qemu-9.0.2.tar.xz
+sha256  816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834  qemu-9.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a2d164d189..76394b3e77 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 9.0.2
+QEMU_VERSION = 9.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -63,7 +63,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-softmmu
@@ -104,7 +103,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32) += mipsn32-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32EL) += mipsn32el-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-linux-user
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
