Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788BACD98E6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 06:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A6085458;
	Fri, 19 Jun 2026 06:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pazYzMN-migL; Fri, 19 Jun 2026 06:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229E185445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781851151;
	bh=GpJ3lWRYJFpojUZrxUiefRdihdIBOjW9FGM35fKpLnc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UoOYakoTt3Ym7Gq4UjlSAddlmm3naQ563N99ItDgEILnrZa6Co++vcDz4trEwQ8yT
	 SMdgc/go+6tBZn+Z+TgvxxcX7/cL+/bH/mtJTbTuUXG9pM9w4PZ0xSGhaD8h4MsRHQ
	 ZT/rg9/TeEsqFl1gcmzFPuCbsx/tzGAJoO028CvvyxDu4C+GvOZxltCDvzx17QM5gB
	 JKTmEZENT/kYmXYF+0TfxFU35eZMF/pQDJ9sx0LyChlFT2NDrT74C2Z0H40q+iSHiI
	 rMGr+6leV9IE86GELdzZwlc3XfltQvWnDRNkegBDTboCcWgxu4yUdGCpNDRB538Cu7
	 FBGsQ47EOlSpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229E185445;
	Fri, 19 Jun 2026 06:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F20F8279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE06C41E02
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6y6dRyhi7ib for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 06:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06A4B41DF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A4B41DF2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A4B41DF2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:39:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bc.dip0.t-ipconnect.de [84.161.180.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 280D1A4C036D
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 08:39:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39802)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waSsd-000000006ND-138K
 for buildroot@buildroot.org; Fri, 19 Jun 2026 06:39:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 08:39:06 +0200
Message-ID: <20260619063906.3467492-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781851147;
 bh=BsGcVc4HLb0N+IniGLbiABRFM9ER2MZDFZOx1XSIiio=;
 h=From:To:Subject:Date:From;
 b=bVvVEJxiauXFxCqsWe13sV8VDDzCfx03/daEddEiBiBCSrRvM46FvBkHNQVu43wXG
 AjiLNU11RMwHe9NPKALZDUNdnihYe/PPEFRpWFHx17qWfQZ1m7wOLO3SHguqZWUFBz
 dMnMS+UVfaClZYoJbu0t6weHY5OWEucS9cduEXUDAgbP7Vb9A465E3V8dDNe6ifOL/
 Kc5xDwBMA7XRD+uk4bBoA9D+p3c95ybKSlKf4C0SF7XMVIPasp22P+zlUBJRQGU2tb
 ZSwZOuNpmCU+ZsffyrDwL5h+KCIWgwAnW3rUk5qS0a3ztRkVNAoM9JiSKMI5ZwnV8q
 h05BZRG8KAd9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bVvVEJxi
Subject: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.10.3
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

https://github.com/oetiker/rrdtool-1.x/blob/v1.10.3/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a9ea38c90edfa70108dfa66d77f3b3e9f5a14cf1

 package/rrdtool/rrdtool.hash | 4 ++--
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index ce1186cb18..85e894a642 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,5 +1,5 @@
-# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.2
-sha256  9787114551ee9b5db7c72722736388dcc54bf00ded51b5dd47feed11fb179fe4  rrdtool-1.10.2.tar.gz
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
+sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
 # Locally calculated
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 73832cb635..f911d54623 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.10.2
+RRDTOOL_VERSION = 1.10.3
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
