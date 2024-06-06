Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D25C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 04:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D8F84829;
	Thu,  6 Jun 2024 04:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ndcT4XaXCyG; Thu,  6 Jun 2024 04:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF3684839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF3684839;
	Thu,  6 Jun 2024 04:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1971BF955
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA2A1610E7
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3xL1r7rlhxq for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 04:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56B0A610D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B0A610D9
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B0A610D9
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 04:51:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11FE8614B2;
 Thu,  6 Jun 2024 04:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C58C4AF15;
 Thu,  6 Jun 2024 04:51:17 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 07:51:03 +0300
Message-ID: <20240606045104.21332-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606045104.21332-1-jarkko@kernel.org>
References: <20240606045104.21332-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717649477;
 bh=rTxKQlNLzuAtKEWcXoR0fmlzQLSD4zj7PEidqs8aWPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mD0/5g9SCDemk4PLHXSNEdqMIByp9ZdIx6UZetw6XaeeV7NrIgmRiOqnVh3FsdkAC
 mPTjYlsfhxuf1yF276sj1tzFavutHCiuiM37dnFRex4ooOp/kKgZNEybUwXjBBz5hp
 UI0IX7R2+9cKMw7+SwFMPvxOatBwpVEWf9Gpz/K4ac1t7GZ9rl2w90b7PdaCzfIA7J
 ghG60YF4e9ydZf25ZbU/1NyVxFAATw28PvgFDHs/fKb33Ujb9ngZbi1lhsbG1P//zZ
 q6gSky6g6jvtych9v7FklZmyYmaTpasV4uofitnyShyKQk5w8Zsc30727Sx29xi+p8
 5//DbUXZY2xSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mD0/5g9S
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tools: bump version to 5.7
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <who+buildroot@cnackers.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tpm2_encodeobject is essential for testing RSAPKCS1 and ECDSA TPM2 signing
keys, as the key blob is loaded to the chip in DER format defined by ASN.1
schema.

Link: https://lore.kernel.org/linux-crypto/20240528210823.28798-1-jarkko@kernel.org/
Cc: Erik Larsson <who+buildroot@cnackers.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index f50a896363..a7b1ef559e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
+sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 12f924eee5..cd9c582aa9 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.2
+TPM2_TOOLS_VERSION = 5.7
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
