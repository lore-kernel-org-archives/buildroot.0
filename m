Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A3C0218E
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A154605ED;
	Sun, 26 Jan 2025 11:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNEuTht4vgbb; Sun, 26 Jan 2025 11:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 511D36080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 511D36080A;
	Sun, 26 Jan 2025 11:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E30941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63539605ED
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7vBlFVfD7eC for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62042605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62042605F0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62042605F0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8F1EC60003;
 Sun, 26 Jan 2025 11:32:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jan 2025 12:32:30 +0100
Message-ID: <20250126113234.4164811-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
References: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737891157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3JOdHtXmGWs6gMrJw3AmuZGAwRn3yfoRN4VWx8n2Ro=;
 b=CWQIks0EQ6w8y4n89QHIjYpIRvt7p3tTBU88tXZQ/fedbZ01Zqs6aIQcbQFdBiNCilBbmy
 vIcczZFwDvnoFLLvoteOMPRnz+/Zx8z7LI5VFPrGnSaEq5awmsJ9EZaXt1tZwL/jvw8Xkd
 a94eYT45UwjyC8nHN7nS7uD71nFFh7qK+i3cCFUkz0ih0Hvz2EJJQcCKIwAiJtg+oZ99J3
 HWtsgylQPir2t4BIXby0yijntKPnXfX3Yqsr1NQRc4ec1uK4xKoSgOr0zl//Q4Tb42c0w6
 GUYJNs6NT5izqqJAT66GhBIm4t0B25HiBs3zALcxIrRTP87q6lLvJg2BKPBL9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CWQIks0E
Subject: [Buildroot] [PATCH 3/4] package/gdb: change the default to GDB 15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This requires a bit of trickery on BR2_GDB_VERSION. Indeed, when the
target variant of gdb is enabled, but not the host variant, the
version choice is not available, and a default version is
used. However, version 15.x, which is now the default, requires GCC >=
9, so we have to be careful and use GDB 15.x by default if the
toolchain has GCC >= 9, or stick to GDB 14.x otherwise.

Of course, that will not fly long term, as at some point we'll drop
gdb 14.x, but for the time being, let's default to this older gdb
release if the target compiler is too old.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 1d718257c6..699c6a96c4 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_14
+	default BR2_GDB_VERSION_15
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -73,7 +73,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
 	default "13.2"     if BR2_GDB_VERSION_13
-	default "14.2"     if BR2_GDB_VERSION_14 || !BR2_PACKAGE_HOST_GDB
-	default "15.1"	   if BR2_GDB_VERSION_15
+	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
+	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.1"	   if BR2_GDB_VERSION_16
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
