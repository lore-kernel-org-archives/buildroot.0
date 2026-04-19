Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51486EA718A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 12:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 173FB80F39;
	Sun, 19 Apr 2026 12:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ic6jNn0HYIM; Sun, 19 Apr 2026 12:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E9980E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776600601;
	bh=mriLbKr1BU9VoCks2Jt8E2lAQlpnp+eW/XepIu+lyIM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BIZXzDVVQQMmUGEJjLiSWbSysTPF8dkykfTjQM8x5QzZYbeugwB/imKU3nM1Ut4DY
	 AY2ZLCLvhLiPt4yIsOzcBx3FApmuSrXjhJewU1BpuanF8wfsoUGZw/jP0pDG50lzQx
	 SH/7RoiKAWtJEI9RPABR0xtWNSo5+axkHILz6sri2deFRtC30UEh6TABAtp9vaxsYl
	 H7sAJB185gMDC9MookJvFTgYL5Ss5WbMqns4xBdiizyja3DHYbucAHuaEjuxtX7HPg
	 LhOClJy/DUXf7HhnG4W3Gst8ZikbxBXAuT1MhKRxHLyLNA6AZ0va/bOCCLEDoFxG3n
	 Nrqq1ctWHZMGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E9980E44;
	Sun, 19 Apr 2026 12:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B243F2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98692403A4
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chv9KSumuACX for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 12:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1489F400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1489F400E6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1489F400E6
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:09:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DDDE65FFBA;
 Sun, 19 Apr 2026 14:09:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 19 Apr 2026 14:09:51 +0200
Message-ID: <20260419120951.543386-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776600597;
 bh=UPQqBYbf6UVCORX+GOXgsEndRuP60Ed5oFJD0ey8Ozg=;
 h=From:To:Cc:Subject:Date:From;
 b=YXX9Coky6uGkUMLubGMUkqf5+KzBy2+EHMCHNXwFunuxV0XPTuDOJ80G9A6gQcOxR
 AXAy/UXHh2NMLiwaJ/0/ipKt3zehJgnSjzBXAthFFe2STdp68JsP9Jul1rdf7djLjZ
 xBQs6YjfFSa7T+aE2XCCS7IEUE+PnEjH41Zji3l+4B8j2tTBlj05WBx4UlhZixoPjX
 wpZNosYOZpeFLuYp2BT10BsITEiFYsDcs4GAZhRm/5d9/4BoLG4cL5VjeR06s2oYsR
 ppJXooKuw2VNsWYMN4NCZk/r5lchGZ2iNxI6qU3bfjdeDqJdS4ukPKR3rY6jq9Sy6F
 jes56rUacEfSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YXX9Coky
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v62.0
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

For change log since v61.0, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v62.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/13988027879
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index e2da879aa2..e1a7b55587 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c7db745c72fca8168503b73bb0c6f0ff110a865944b7f73f791480c2bff1ab87  rdma-core-61.0.tar.gz
+sha256  7e2db2cb97b18047a40a4054159f64e588801bcece9d5dd9be2c4aca8909f6b5  rdma-core-62.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 4ace1b8a3d..93021fd882 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 61.0
+RDMA_CORE_VERSION = 62.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
