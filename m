Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D238E7FDE2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B3B60787;
	Mon,  2 Feb 2026 21:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4JnVoSVpj-R; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2352060790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067709;
	bh=S7ZhNaZaCmeDwWjIuDNwdJ48xVmZ9YzeoMFbiondkpA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qp5Wi3Ddugy4dXuvaWQb8PS6qoZiaztreRjsgV9zfLEURmg/JW1WEMUoTRcrioG3v
	 IX70/mmR55p0Oes/GZjgv2ehxMPhRjaSFg/E3sZzHmIwcjx9rCRPokNQYJ2GqoPQtx
	 ht4/ynovHOd3NNs9VILGXfT4mVT+8IISDQ7aNWFwYlA6qUJngdHbBkjc2znPZQF8aa
	 B43uPXa68PUTeddzQ6nMgEuSTJbY82Ce/j3cesWjPE8/mdoWbiqB/OabRBRSBzheOY
	 +t77QVbvZFgIig7DYUgvbR/nKk3FS9TPkwENKlbKJ72KD0WfO/wo7g+Z9Il/3lVXmO
	 nZ4hPKIU9Ti6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2352060790;
	Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9AB5149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C923F40112
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7LZy9ZfERtPZ for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A29204007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29204007C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29204007C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1896BC237F9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 274A760767;
 Mon,  2 Feb 2026 21:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BA4B119A8891; Mon,  2 Feb 2026 22:28:21 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:07 +0100
Message-ID: <20260202212814.2607588-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067701; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=K0M7HeCDV9oIUYIQGNZdFMDgJa7kXErNzi3hyk8PQ9U=;
 b=n3HFhSPeWqhshR/RKwFQ5RYdgJeMIjBLe4JljM+sM6cIOJko3sJcB9a/D1YRgvva5HCSFo
 9KDF7AXtuaV5RMIy8qpqot86Bvpnw1Xg67YykzvFned4ExPF7JXLm9FRG0i8dlt/ukLpjA
 HTa5dHdE5kcIF/6h81nmRX7XKneMmHD7jNAR8t0yNS94B+vhfRiL2iP2ZLBr9BS2LGMiG/
 SNldL3MHtJeDl8VdibQlNFe05wBag8e88DfttDt3DZqtSEVfRNAesFKgvC47RO9AtH5pEL
 J6wSyePRPERfFVK3/gVITMnxhCFLzvJGzilkJx/d/6ZjPdIfmTraNidwwL1KEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=n3HFhSPe
Subject: [Buildroot] [PATCH 1/5] support/config-fragments/autobuild: drop
 Buildroot ARC toolchains
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

We're already testing the ARC architecture with one Bootlin toolchain,
it doesn't make sense to also test with two Buildroot internal
toolchains the ARC architecture, which is not a primary architecture
for Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../config-fragments/autobuild/br-arc-full-internal.config    | 3 ---
 .../config-fragments/autobuild/br-arc-internal-glibc.config   | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv      | 2 --
 3 files changed, 9 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-arc-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-arc-internal-glibc.config

diff --git a/support/config-fragments/autobuild/br-arc-full-internal.config b/support/config-fragments/autobuild/br-arc-full-internal.config
deleted file mode 100644
index 4755c9e45b..0000000000
--- a/support/config-fragments/autobuild/br-arc-full-internal.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_arcle=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arc-internal-glibc.config b/support/config-fragments/autobuild/br-arc-internal-glibc.config
deleted file mode 100644
index b9d6857240..0000000000
--- a/support/config-fragments/autobuild/br-arc-internal-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_arcle=y
-BR2_archs38=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index a559221b99..f5c6c6672a 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -42,8 +42,6 @@ support/config-fragments/autobuild/bootlin-x86-i686-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
-support/config-fragments/autobuild/br-arc-full-internal.config,any
-support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-full.config,any
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
