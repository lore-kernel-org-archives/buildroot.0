Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D490AFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CC660ACD;
	Sat,  3 Jan 2026 13:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Orl72RpxjVkB; Sat,  3 Jan 2026 13:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22EA60AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446783;
	bh=jx0SAFdWlZbilwypgJw7IsykTAfNNFEnvBGxQVkJ9gU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jY4mha2JTQdzItbMAstHSSYZE5RzWdWAcXVFwy9mG/PN1irU0ifbz5aO4j5gj3gai
	 ak/9ofLSypdca0Jp7yTRuQnQr1x4clfY9lqbnbnR/gj1w2poCSgLjcE2ef0vkp2U7J
	 UqsNT9yewDEJJFoOHRKZjFUOfhD3cuhGLAeLEYq0h7qwueWr2KBR5J6WmDl5kZQ0aH
	 2ljwSMsDrT6WjFh8gww0LJEOTM/9wxJqzjmfMboc/xB1YuMeuKw+CXDDltgJ2dcCNX
	 ZfN7W/QNES01yrwlOVwWg+7b3M2A2rNKZXnAYfRGTr1bPaztM4BdRhOaWg8kvFHS00
	 Z7pGl+t+OujKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22EA60AA8;
	Sat,  3 Jan 2026 13:26:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05837351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1F2810CE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQT_Z3AIcfm2 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:26:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D849C81087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D849C81087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D849C81087
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 390D6A4C3327;
 Sat,  3 Jan 2026 14:25:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dh-000000000rJ-3UhC;
 Sat, 03 Jan 2026 13:25:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:50 +0100
Message-ID: <20260103132552.3979708-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103132552.3979708-1-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446754;
 bh=HGZ9KIRCDMTJVWJg0G+AIiFdGxpkdBSiJwq7fI+ItJ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dxmq56i4kVjd0MI+g02ZlNkDDyGs2OLZ/SP7Jq40wgaS4GkJW0oabrzPYk31rwcSy
 /foTtNFzUnVEfYE8N23FaQ01vRBm/WTex/yi2DYXVJnO2Biuh4HBJRdg9B+MHe+7FS
 Z6k623nl0myWEXesSremWtWiXQCn8ZelaNmDq2OxSnPDMJEDiMuVAR/NHcMMO9UD3K
 1sVFGW9zeKVApmz3L1e7inbTlcTP9GId0fkBrrsWX1zp2RrV/GX7D9++MQYRCKB88v
 SQzOKjstfM3LJ/Cb1QZD37Rg5fIHGqT2J/al5IP+O/dH817/3jwEVADQflT9XtABmn
 fBus6FU1X+9bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dxmq56i4
Subject: [Buildroot] [PATCH v4 3/5] package/rpcbind: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Package rpcbind requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Bernd: enable BR2_PACKAGE_LIBTIRPC_RPCDB only for non-glibc toolchains]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rpcbind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9cde7bba39..0b2c207580 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The rpcbind utility is a server that converts RPC program
 	  numbers into universal addresses.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
