Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FAE7FDE2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A3160DD1;
	Mon,  2 Feb 2026 21:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weKRK9NpbheV; Mon,  2 Feb 2026 21:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D874060C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067719;
	bh=X+KYJeFwCEQ8JH8kiFg2WkVNtu2FgYQXM0MMd2gSobg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LNDQD/+g72WxuJzIifQY9NMCgW2l3LajQEc4XvcKCBhR1Epc15Fu3H3vrpCEcE8L3
	 Wix1FrT9h9QEVEWnz1DcMeL33WunsOkzSXO2NWPtRwYReRtBfnge7WrYKSc4Y5OsWb
	 IHPwzUsplimROq5WDOa5cdix406dlTZNkpsSFLXd09fdvi7/bh9EbhyOY3tG1ltOxj
	 vBtaXDXEdr/YLO4Q1/qzpvM89ysxMvwthzFFGCtZb8SDSuBYSrcryYB8QTBgiXp90m
	 tyrbngBkLQ9RsL/fuTB1pfJGzlgXqaA1k5DJUm5r6rSd3+2hPpo2PtKM96ivk4Pe6X
	 dWiQ9Mg31alTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D874060C26;
	Mon,  2 Feb 2026 21:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 170ECF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42FA60744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zybmCm5dz2va for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD81560760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD81560760
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD81560760
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CD9391A2B8F
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A5D5360767;
 Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F086A119A8888; Mon,  2 Feb 2026 22:28:26 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:11 +0100
Message-ID: <20260202212814.2607588-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067707; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=TC4qAWByXY+pdO496vJN6y3dMSyImLDaylnzbFM7Wo4=;
 b=jpqzkS1tlmmVrTaMtHC4MrDuha0trqpqT7Ax0mthLgapVNGLI8b0ViWKN530FDzKyPvasK
 9SKVi2CKZXDkcP9o49mU6qnqkKHhL+pKTO1MESvySrstMtsVAg8oJC9TNl2s3Lgd41mlHD
 gkpjFnF4w03DJprkjqt9UhYY+NkyapAJXCvi3GvYvqMeueP/LLTDpEmZUFzavSjJR7Dgdh
 HsbRj81raCw2Mk+HegzZIQFvIwxRhAQaaceZexk9Cp3iaD7UHKeshPtEoHDxc6yN+PNgFx
 0dn2Bz0erSoxBzX+fwRQvWR9e9PaJu8RwdKgKrLe14fZIRNtqddYKYnbKuPJKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jpqzkS1t
Subject: [Buildroot] [PATCH 5/5] support/config-fragments/autobuild: add a
 really old toolchain
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Testing with a really old toolchain is helpful to catch issues related
to kernel headers version issues, gcc version issues, etc. We chose a
glibc toolchain though as old musl or uClibc-ng versions tend to lack
a number of features that are needed by modern software.

This toolchain is placed near the top of toolchain-configs.csv, so
that it is used as part of the "base" set of toolchain that test-pkg
uses, even without the -a option.

test-pkg takes the 6 first toolchains of this CSV file for its base
test, and actually the comment in toolchain-configs.csv was wrong
since commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511, which removed a
toolchain from the base set, but not realizing that test-pkg would
anyway continue to test the first 6 toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-aarch64-glibc-old.config           | 9 +++++++++
 support/config-fragments/autobuild/toolchain-configs.csv | 3 +++
 2 files changed, 12 insertions(+)
 create mode 100644 support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
new file mode 100644
index 0000000000..1b811f267a
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -0,0 +1,9 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 3ea05775f8..7103d903c9 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -18,6 +18,9 @@ support/config-fragments/autobuild/bootlin-x86-64-musl.config,x86_64
 # Test a MMU toolchain without dynamic library support
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 
+# Test a really old toolchain (gcc 6.x, headers 4.9)
+support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config,x86_64
+
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
