Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC2E63F2B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A8480F80;
	Tue, 17 Feb 2026 07:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAjqtjW69WLC; Tue, 17 Feb 2026 07:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 353EB812E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771314669;
	bh=3whM55TKVqpYeyIBq/DRZquz0lKhKRFe+nXgYa/gWuA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a09EK7CRxIXHO6ainBPMXwsuXHbJLn4SB1zStzDqxSbQ1eQv+a7zCxW/60kyJf70p
	 1yBmt7sYEZ3Tbn+f7xtheevYKStTIQZ/Cy5uuga92yzm/ZUqh7C8ZAtGvf2EWzTUY6
	 aSZILm4NSoonJJ3nznWya4FvDPuLjJBWLmOCBIce+YVGNd+Pl4RjhFNZyLAgGPF8Jl
	 xe6UROYyP2YuUKPZmj6Y+doB/4O+44cSSo/PEX+7Iwkm0dAIj+KwIc7LkelwJ0VeXr
	 N/8bGdm3JPUsJH8zSB52WcC+kQjXKY4LMg03GafRCpCu/fUedyVDs4OB7RwVJKF0M/
	 gFhemEa1cWzqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353EB812E6;
	Tue, 17 Feb 2026 07:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8021B270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B91812E6
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stIMSXZKJ-zB for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 07:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AFA880F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFA880F80
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AFA880F80
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:51:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bf.dip0.t-ipconnect.de [84.161.180.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D19FA4C0C4D;
 Tue, 17 Feb 2026 08:51:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41160)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsFrL-000000007yV-2NrY;
 Tue, 17 Feb 2026 07:51:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 17 Feb 2026 08:51:03 +0100
Message-ID: <20260217075103.425981-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771314663;
 bh=9y7/pY4Ztwki+Tasv7gpdDEdo16NS+B36nxF4PKTbEo=;
 h=From:To:Cc:Subject:Date:From;
 b=iWahVeRHKBptxsSwa8zB5EsKlYRuC+xEjak5oT/PjEy6RzdywfxcuDZQYtdDb+oYp
 4IMqw1xX5yATv7/xRhSlsGlFBusCDqC36/Tiupo8wtJgHD6SsYF8SfCiPERPpeFCa7
 krZoM/vst9mgUNi+hVIhSAyxkxfrcAM+cvM2iXh9gPcyQ+7iSL5wHMn+O+1T1/YnvL
 xNKFGagvnbxWYYIn8FmNBadr7AT2lKXIcUCmpKr9mHUpL6zw3dDd10qajd7gpUjKNv
 r+KDJsXYGQyjLtrKlRKrfSPUXq/BrUEpoRfWl83v631MR2Qs6WhBnVMKIRFeUq6+nc
 rEX2wB7kaj25Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iWahVeRH
Subject: [Buildroot] [PATCH 1/1] package/libtalloc: bump version to 2.4.4
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

Switched license file to upstream provided one:
https://gitlab.com/samba-team/samba/-/blob/master/lib/talloc/LICENSE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtalloc/libtalloc.hash | 4 ++--
 package/libtalloc/libtalloc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index 5577583881..c7223bf5bd 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  85ecf9e465e20f98f9950a52e9a411e14320bc555fa257d87697b7e7a9b1d8a6  talloc-2.4.2.tar.gz
-sha256  e01fb092aaed2b431be26674e2b791c77fb5984537c29b514e957582c6b31465  talloc.h
+sha256  55e47994018c13743485544e7206780ffbb3c8495e704a99636503e6e77abf59  talloc-2.4.4.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 676076b857..27d0778f6b 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.4.2
+LIBTALLOC_VERSION = 2.4.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
-LIBTALLOC_LICENSE_FILES = talloc.h
+LIBTALLOC_LICENSE_FILES = LICENSE
 LIBTALLOC_INSTALL_STAGING = YES
 
 # libtalloc is extracted from the samba source tree, and that has a workaround
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
