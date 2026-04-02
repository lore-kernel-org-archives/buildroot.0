Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C11D6AAF8
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26C04117F;
	Thu,  2 Apr 2026 19:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jd8ZNlxfPhd; Thu,  2 Apr 2026 19:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0044114C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775157556;
	bh=fQbhrYtwJVl+giyTXpUoOUmYbSTR/qTFWqRzyarx+mA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aujTTGdyxM4yXyWBpyVAIW82w7ZzoXTv1Q63tFxk+Of1J4A1S44uUr0fjmDTBlAP4
	 X+w7cybgN0yNZvgYflr49hxjJgSgoRkwpVXEsKyyf0OQsbT//sEOrGfi89Yoi099cA
	 R/osjNHwPe+95R4hJSXQDVIQhC68FmPl1OwhSM5OZeHNfjFilhwO4Gx92x75QW3BVx
	 TVRCoTq7bRM/F4UqZ/l2TutTueOaaABrmv1a/w1jv2rde7kSRjATc/ff2XHWw7S3D+
	 65OE7F99zHGFg1lM81ItNQC5yEV+Swsk1Emm30EuDlNKoCcqbip6j0SL2BJ3blg6h9
	 cw3K8ef9qJn+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0044114C;
	Thu,  2 Apr 2026 19:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 778EC2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A46981B17
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-eG10O6KBDF for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B5E081B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B5E081B3E
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B5E081B3E
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:19:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8NZNwGUWdwf0D8NZNww5W4; Thu, 02 Apr 2026 21:19:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu,  2 Apr 2026 21:19:08 +0200
Message-ID: <20260402191908.2125697-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBhzHn4+BPabgl9sd4EwfAhMFyO1NCu8x1LK+PI8wAzdrAM7J2QkM8OqMqZVvN+hjkCCHikCBzPyDBUcZjQJ76Mhof2NmwNoMTu/vyQ0xwZGho5kj0PV
 eX1xVzFLXxesjqFSC/6gZ9rDlpOpVFCx/2Y5aVbw3eLqtSTGDn2lowlSA1bosJglVmbWqjRHYZMjiPcJ8RE0Jk8cd/6tgpH+pp+gdLPfEpQ7q28jb86Ftb0r
 VtMA+zc4zSTriO4TUvisoyC5nWiYe/ROBT8TfuCR4VFE9ot5zFX79gNmvR1C3lE4iBenU0iXnAi/sRFd7HCT/Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775157549; bh=8iy2J47VEagAmsCExGS77CXwOcaPSLr8LlWdc5LPa34=;
 h=From:To:Subject:Date:MIME-Version;
 b=Y/RFb05Ve023YK6CXWg6xQS8n0UMCAfCPM+FE2xgTnXQbPKL/H1r9rNvKNdlHa7IK
 Bx1lZUFwITRln89GYCjst7IzlQuI+RkrfaiY0tN+xTbXJgEBFgi5JdN9BlV7jhd6nM
 +/ogBoJky2pgbb39SA3KJTNx1drwL6OwjfRGsLHzVys7Mf0x2OxHCQBc5aAmIr6AiT
 X2RPoqlU5ipBU9/UxaChdsm3HRrXGHDLHVGZPUXeEKvSKIrR0ShgwGno+1rZHmVxJv
 eNp8PEezosBMLqItpZWnujySULN9k4eiU84ijt01tXofESuNneBGQYA0ocHiWbnOlG
 9nBDjJlNkYIYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Y/RFb05V
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.21
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

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.21

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 07c0fc68c1..556a438880 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ede2371ff4e41e95fd7b2de83a7df727388307a64d3706046ead320defe35e7e  mongoose-7.20.tar.gz
-sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
+sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
+sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 44de3fa1e0..432c20a54c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.20
+MONGOOSE_VERSION = 7.21
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
