Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3B8C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF31682512;
	Sun,  3 Mar 2024 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpPKTowgVH7m; Sun,  3 Mar 2024 08:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BECCB827BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECCB827BA;
	Sun,  3 Mar 2024 08:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AECAF1BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A735560631
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCUFhyQl7Caj for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9FC36064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FC36064E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9FC36064E
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:40:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9ADC71BF203;
 Sun,  3 Mar 2024 08:40:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:40:10 +0100
Message-ID: <20240303084014.156991-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709455220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FPZ6Nsqv8U/pV85PazJiGG8AulGQE2LMJfAyNDLn+s=;
 b=n+cZ4SW9XnH2rSBy+ALXkkTs0wUktpTIgPxbskyvuociWA7iLiMD1MDMPlcBwqYlKZa9u5
 NGicIWu0RTHbgybynlI51hnHZ1KSztcrlWXhzP5ejklggr781Oi39P35Bus+3+RXi08eb6
 sED78+Ug5OErUlWtaclmEoZ6mKwvD0bmnSjxChznYSem54pNWBcQAhmkPCn5GDXOK9GguU
 QoOG/pzkmyoI5oisfxbQwB3IE565OjtT+9JegJuCaTJtUdZZ8qxJNUXhxQkxTJAT4q1DzU
 WrZgRUPJUvnsN7nxc4UMrCbrwKJml1yCL5kJPhK2Bm9ba0ILJdxdYWRVcLyuBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n+cZ4SW9
Subject: [Buildroot] [PATCH next 2/4] package/binutils: make 2.41 the
 default version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that 2.42 has been introduced, let's make 2.41 the latest version,
following the traditional Buildroot policy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f1cc175cf9..7c2797e5fd 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_40_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_41_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6846933646..5209da0252 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2023.09-release
 else
-BINUTILS_VERSION = 2.40
+BINUTILS_VERSION = 2.41
 endif
 endif # BINUTILS_VERSION
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
