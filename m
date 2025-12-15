Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B5D5B16E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 13:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9646180EC2;
	Mon, 15 Dec 2025 13:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGfrA3fCSbPV; Mon, 15 Dec 2025 13:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAEFA80EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765806647;
	bh=m2+dEYAnCiM/0HlHSrwqca2Vb4ACml90D5Af8YZFVbI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ObMYlpBG8Ne8FQEm1WDJcUlt3rxqUOE6wcIRUhlt7Lh7Nok0WNkXceT0YCHLB92sb
	 wJGCc/Tl5yYbjPW+loiI83KyAmxy44+1FEeNR3O4Y3KEyZwrScBzi5rs4aBsrVjt8D
	 i7ug+oY0fhhxmPb2DXtGQI/not706qv9W7LMsnxeIi8npWRRL1qwqp6hIEipL1K7uO
	 E1J5VDGR0OKiHu04dAWTcx3FJRKHBSQjATFK5KgRKI0jrR4U3dyV4v+vEhFqfxSGrS
	 7rtMIT+O+fQbo+rwag+6BYfhD712f7TwukwM0YyLaewMKDTzOneplmsPl8bw19NO8g
	 o3Rl/vRUELszA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEFA80EEE;
	Mon, 15 Dec 2025 13:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FDD5117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B8F80EEE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nW0YLDurI2u6 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 13:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F10380EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F10380EC2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F10380EC2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:50:44 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DAA99B00535;
 Mon, 15 Dec 2025 14:50:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Mon, 15 Dec 2025 14:50:23 +0100
Message-ID: <20251215135023.3541586-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765806642;
 bh=RS+za71TTS3tztJLXH4UOwvJU8PRbE5KfThSYetR3js=;
 h=From:To:Cc:Subject:Date:From;
 b=jrI8ix9R3EBC2q8Cw8H2sHQpEHlUJzazCwaFetHxUE4ngUvkLLn39wvXAW18sgbOa
 HJts33KPDyl3IvN5/4DpMBqOlAsNij8G0ZRWkhrg6YM6SiZC9rZN2/vHLZKBBhhsig
 Q4XquqaV754+7MAa6aJjOFGdxdiw+Hoeg1u5disVEXGRQC/XsdY3sVJbVI1/cnVeSS
 qj6AloYQ9AtXOumT9egzzqvmnegoIUZQ/Hk52QwUqWQBCnolW3CVJ9YAn23DuI3pvy
 ZJwO8vLMn+FekK8UgeEn0xm6M3/79Z9va+lKwocwRTlCXQs3wo0Cc6C7JaHiWKBV5q
 SJ+N1GBdYaReg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jrI8ix9R
Subject: [Buildroot] [PATCH 1/1] package/ed: bump package to version 1.22.3
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 44d5bc765370..605c4854f718 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html
-sha256  1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb  ed-1.22.1.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html
+sha256  47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be  ed-1.22.3.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 10092d513f0d..3042b3c3707f 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.1
+ED_VERSION = 1.22.3
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
