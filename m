Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93675CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55DA6402EA;
	Sun, 13 Oct 2024 10:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckzEKIJzkqgq; Sun, 13 Oct 2024 10:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117D440238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117D440238;
	Sun, 13 Oct 2024 10:34:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36A821BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2557D4090E
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CvW2_0N7vQB for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC871402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC871402EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC871402EA
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:34:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b41f.dip0.t-ipconnect.de [84.161.180.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88FF8A4C129C;
 Sun, 13 Oct 2024 12:33:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32836)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1szvuw-000000002DD-0lky;
 Sun, 13 Oct 2024 10:33:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:33:40 +0200
Message-Id: <20241013103341.78501-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241013103341.78501-1-bernd@kuhls.net>
References: <20241013103341.78501-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728815622;
 bh=Gizl/HQyxImmiRW1moVG0znRcB/FQBEF3SyAlS6VPvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XndEHfQdYtLamj96fIQpXbrzEHXvwdr/CKL9P0qc0hzBKzOt4o6by/wDYLIOxM1Ss
 dVvG8OEv1z7SyOw7jFjbS/lTfPTRMPEg2s/OTkqy/rwrT99pJR+y853ljiXAnZD4CM
 3BAyP2j4/VbACSDiQ3ECsQ7xdN3WyqTV+VmeMyf+DprxowPEld+ZgAHDLeDGmmDeAD
 nKIHUB4wms2I66ryhqjXP6D1+5BHjRDeJJdw/NxPXK/ZkOQSH5JVLAsbhR+Q2ff6Yo
 MALCudyJkqputJERg6/8gIjb8Qt4M3WHfBR9aLItknpmV8ubO5l3b2xsh4eLktBaAP
 HA5CtgqTZhvKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=XndEHfQd
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.11
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9ecddd0dd9..497b507945 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.10)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.11)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
