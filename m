Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10428CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A9F807FB;
	Mon, 15 Sep 2025 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iJOL4acmYwN; Mon, 15 Sep 2025 18:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ACB0807FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACB0807FE;
	Mon, 15 Sep 2025 18:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AA11F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB9D1807FA
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12-er_zTK3xi for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 18:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39121807F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39121807F7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39121807F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 167205FFA3;
 Mon, 15 Sep 2025 20:55:13 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 15 Sep 2025 20:54:47 +0200
Message-ID: <20250915185448.11118-2-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915185448.11118-1-ju.o@free.fr>
References: <20250915185448.11118-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757962516;
 bh=ELCT0ScnCzpefCfKMBK7bL7NgUfH+UAArp9T6ZhkNSI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lm0Bp4LIdYubbnzq2HLktlwyu5Ar1o+YPVhTtDotb50EquazGPodYMDrjPvC4NNk7
 E+F3wcJ0g+Bs4OcPYZqBb2Uyhklw43TozwDVzwww0yY1Rs354w3tftzp116oLkGmMQ
 PnNBCtwd6wh+bcKPCnmFXaIw5L9zA6ZtsTmjfVesDqgL3Zo+et9MTQE1DB3HnzIw4V
 4vS935sKfHJa6bCPIT8b4SD5b8Kj8p2+T3mWH6d7jutKewN4TC+DYrQY6Jhv37tX7e
 sBPIxIy8Ct/gXhWLGHBkxWpk+Y6656GOENCjgW6KtgtxyFA/dYYxllsG9bzrAQL6g+
 c5IvdjQk1w+6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lm0Bp4LI
Subject: [Buildroot] [PATCH 2/3] boot/boot-wrapper-aarch64: add hash file
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since boot-wrapper-aarch64 introduction in commit [1]
"boot-wrapper-aarch64: new package", the package never received a hash
file. This commit adds it, including the source archive and license
hashes.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7689b72e00fd4d8c017880004e83a1c79144ab7b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
new file mode 100644
index 0000000000..427653d55a
--- /dev/null
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  faa2843eaa3bc219da5ba9f69c02b45081a7634038faef5cba216d5e927ca2be  boot-wrapper-aarch64-ac6742520ded1da30d500f74e8affe86e27cabd5-git4.tar.gz
+
+# Hash for license files:
+sha256  bdaa479b497358151fc1166dc75a613e68321320b945e92ea07a4b6dc9a63271  LICENSE.txt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
