Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86CAF99C88
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 14:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9312640FB4;
	Sat, 18 Apr 2026 14:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBBpKpHnttTI; Sat, 18 Apr 2026 14:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2447140C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776523543;
	bh=C1eQLlNSLoXyfuOnvHqcw3E+0mCmdqnxwOimK59rwYM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bgTN5EevL3SPKgJSwNRcQV5rGW5NavIY/SZIxRED2j/QiVY0/T+1lbXL+OG0Byrnh
	 bxjjyxxrdYG2Rh2FHL4a1483jlz/YOAgqqVcHx4RYZh55EA7d3+6n3LjwnIxCEc8mM
	 SdeD44yCCbXeofEU5At6AUglJvbQmoq2wMueCvYy1YFcHXmeFyna3l0KNvblb/BSkl
	 wzJCOjL0jdcrSNgt41RxuYBZuxr4UCnw4Mu4IRYw8n7Fz56uMwExrvxo48QmCoEfMo
	 TbkK06/3i2Go9D8LXWLRAI98gKc8mcLLO7WBXYsPIfwVG1gpwfouwg8pIsWtHRWpFy
	 lV861SB1iOlzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2447140C64;
	Sat, 18 Apr 2026 14:45:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43559347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3928340C64
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWNoRfYu6_nm for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 14:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C17C40C0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C17C40C0D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C17C40C0D
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 14:45:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9A01A5FFC0;
 Sat, 18 Apr 2026 16:45:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 16:45:30 +0200
Message-ID: <20260418144531.706692-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776523538;
 bh=SCK0l+vhBEO8SaJUQryMVEVHS41PlY+XAzSFiwxN4ww=;
 h=From:To:Cc:Subject:Date:From;
 b=XhbF7neMk+iYdSbOtnVwlDHFoyqmlbYkcRMHdKob0sva+JEqzbOqSa7rDQcyXrtnu
 XJJy2cTaUbB5PtuX/GXvAUbbeFnuZ4H6UIlkxkbJJUEIRSYxbu0sF9Qn7J7XPagNmk
 lQjRg0XSDzfgSC1BLj0rDPivBd0Op56aMZOy07O7sxADgsLjHDqB2da0MO8d8IeZbZ
 icZaa3mEdlpI2RkkgYJUnEq41o5GjH/hHPFHMQgoJpD5VKuD6K6fm2FYkEbRPyhQNi
 m6VcHC9/ONJuEg26MSO43eI5TVUKkyH4SQ4gxa2Z/AKWC9Tvz6Pu2cUJD0ALbb+2pr
 d++WjFDiQHLVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XhbF7neM
Subject: [Buildroot] [PATCH 1/1] package/libjxl: security bump to version
 0.11.2
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

For release notes since v0.11.1, see:
https://github.com/libjxl/libjxl/releases/tag/v0.11.2

Fixes:
https://www.cve.org/cverecord?id=CVE-2025-12474
https://www.cve.org/cverecord?id=CVE-2026-1837

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 56d1909110..5e76f0ee7f 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  1492dfef8dd6c3036446ac3b340005d92ab92f7d48ee3271b5dac1d36945d3d9  libjxl-0.11.1.tar.gz
+sha256  ab38928f7f6248e2a98cc184956021acb927b16a0dee71b4d260dc040a4320ea  libjxl-0.11.2.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 18bebad662..b877e42d35 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.11.1
+LIBJXL_VERSION = 0.11.2
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
