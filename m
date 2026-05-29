Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AA7CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22276072F;
	Fri, 29 May 2026 16:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rzas1Ftja6E; Fri, 29 May 2026 16:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C22F60733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780073287;
	bh=OhjX9Hg9HOHuVl66BHlE+jgdtjk3jiz94pA+KvTUfWk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I323eB1ZWt1Pr2bckKP4gL+Zj20DgsJM4Mt4nuhkD3NyT9Y2oNKuXLgsq/JXxZKXs
	 9EwRdgvVd0r59u9b9f26QX9mZPIybXF5wcH/csoQcu7A4EpeHOWP3OQgVe5CGyY1qI
	 DOUspuTG8tdrfzlDXmiru5ZAVEKX2zgOFUasjeFVZeelDVqhffRdJW6k2i9d2bBnze
	 GgKjXRgtfaoW4KdjzcIsHl2tL5a/jSLzLHyQRQGB8OT+pyMUgenBX8LzstrZynWCEU
	 V09TIWHaB1/KGMCG2ZcFWyfWESZsq6glflstvkkLeaRjxvCiKRsuu1gdq88AftzJu9
	 HG+7VtyyuiRjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C22F60733;
	Fri, 29 May 2026 16:48:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E66288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B35FC41EB7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jGFTu4dF35P for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B19841EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B19841EB6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B19841EB6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:48:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 677FCA4C3047;
 Fri, 29 May 2026 18:48:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34884)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wT0NM-000000002vI-2SSo;
 Fri, 29 May 2026 16:48:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 29 May 2026 18:48:01 +0200
Message-ID: <20260529164801.1299592-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780073281;
 bh=jUOJ6I4ghGGHH4hABvaCNGwZiQY87CYehIJQZQluXXs=;
 h=From:To:Cc:Subject:Date:From;
 b=OtlqniH6+tLFT3PQnWAubREm3ITjSA2Lq9i083zcnnNPdsRdeH6N3Y/QEMHEqWYom
 GmDw165BkzIq0wq7tW8FqZfHq8aC6dZF3zc2NOy2yBmsuGHs8APiJs5NfVIHLUfJsy
 CT6hloSuVBtwV3Uxns61jkZhjlcEP4JZUt6YMrCS379QBuWI6qq+KovdV6nj/MIP30
 L1fgj075rzf8FdHDgWo6yCYSAD/7DuwX437eFCn0BrIEuUOT7DpbAgHpXD2t9wbCEe
 LKNLN25ZQ4n7Dl0ANYEOjIv/F1iaUbDk8CYQz4rfSgsohYCTxGDWS2I2ggiBzXPsYu
 +ls8h1G/1v0PQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OtlqniH6
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.4
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

https://lists.exim.org/lurker/message/20260529.143857.4c75d7df.en.html
https://www.exim.org/static/doc/security/EXIM-Security-2026-05-19.1/EXIM-Security-2026-05-19.1.txt

Fixes CVE-2026-48840.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3861000877a0a8330b7c6b66a5c9d7aeb4bdcb89

 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index e95f7f5efe..cbf29c3f5d 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
+sha256  87ff38815700dfb1ee4eb7e8dba7916df7a755905354d2d0faa1ae1790c4fd9d  exim-4.99.4.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
+sha512  30fa01a301f8f4fe0c069f3da9e5247f0e22b19f64119cb8cccaf10aada8280ce02061a4671d110ad29b08af9e23ba3c3e8c7483874c7b1c992d90b51681ca9a  exim-4.99.4.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c72e25a2c4..60870474c4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.3
+EXIM_VERSION = 4.99.4
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
