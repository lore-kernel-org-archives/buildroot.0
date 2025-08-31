Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B65CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E8C61071;
	Sun, 31 Aug 2025 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd_kPv_qHKeA; Sun, 31 Aug 2025 15:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F20E6102E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F20E6102E;
	Sun, 31 Aug 2025 15:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F4510E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D368640854
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qrV0SaYUqQa for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E93140856
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E93140856
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E93140856
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:52:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 335597614; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 Aug 2025 15:52:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uskLh-00HSRx-0b;
 Sun, 31 Aug 2025 17:52:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 17:52:07 +0200
Message-Id: <20250831155208.4160920-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Kahnn5keG8YNTx7nnGus/cdSiI+Jtqs5fjW1G6mdm8BB0Z+JuS8l24uaisVHALvFEOItbubeBYicDSKze3xjGOeG3lJX9QjgFbd4BjMlzCmmknDM5XDH32ukTyEA0q2c3Iaew/aoJuPj4p+JVT2zdeAzFvndwZk7U1y+Nl+TmwYg5vIUfe3cj3SF2AqjgsukX5o08CF3kqkXDiL7zMz/8DiRUwbwS+QmPXguc2bhjxmuHN/kM83aSxj8ai4c5VIRQhMvEvtyEo+5ou1KnSEAl6QDvZdpjFjWcXeFtJqM0IN9PJxUGvchSQELYnrjbenfbA+SSae5PrRPRPxncCQOKA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=8NWG2PpW5ibN/l4U544qKBxubGTxJkoZ5suXwEBPoHM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Kahnn5ke
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] utils/genrandconfig: update bare metal logic
 after change to buildroot vendor name
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

Fixes https://autobuild.buildroot.net/results/c961d9edae0f1f3d17b5a6f078519bc7bad03a26/

Commit 053b0c9f66d8 ("boot/xilinx-embeddedsw: remove support for xilinx
vendor name" dropped support for microblazeel-xilinx-elf, so adjust the
genrandconfig logic to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 67f0ea9f73..0ec478e6ca 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -147,7 +147,7 @@ async def fixup_config(sysinfo, configfile):
 
     if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
         configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
-        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
+        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"\n')
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
