Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E66C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BCA61087;
	Tue, 30 Jun 2026 13:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDyruVA5DfnG; Tue, 30 Jun 2026 13:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9209060F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782825967;
	bh=8XSuwVErR++W/xQW5pgog9gEyPnh3wW++g0+dB0/7xs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NCOmSfoiudRNmnvjLCv9r1iwvtpqSm9blCilPGvLOLVlV0ei71BVRDkZbaW+9sUvJ
	 YQ0s6H1EMdqyt1qM0W3g+H/DZ1auEh4rel1PwnAPY63CqLUk+XYTrvWux/u6dvrXYX
	 PkWwNdFteNQdrOBPvylKYrtJmrySkQYblDkR+QFO/lKocQl4F+UJ38Q8AtgXqEc6xG
	 P5ieRICloz+qk0hTsuWRlluqAVv1pqvBihkNoEjApPWwaD8DZDesaUYC1u7H3H9a6Y
	 bJ4SSbIUfPyLZl5k2EpHb0LF2KF5MkbrK6y8kS2iSC5CnQAFciFSMAGChBbGvA+ev7
	 VGCNxuHodGnmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9209060F58;
	Tue, 30 Jun 2026 13:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CBFC1338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 13:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E46360F58
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 13:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmc5nCVMczxg for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 13:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.98;
 helo=out30-98.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE68960F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE68960F08
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE68960F08
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 13:25:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037009110;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=1; SR=0;
 TI=SMTPD_---0X6.eQdn_1782825946; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X6.eQdn_1782825946 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 30 Jun 2026 21:25:49 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jun 2026 21:25:43 +0800
Message-ID: <20260630132544.1937-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1782825950; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=WasovCREefDcp2iUxc2ZKQZfZ8jU3ZAGS6KEKt3cj7Q=;
 b=SNUyccTF7U3ucHmLwrDiqXQ3K+l4WsyV+vieAITYPVTAfNg9vYic88ZtxwNpvfavPlYlXMieehGjCpX5v19iaWzEuYMoMpL3mzuywnsj2RVCcCfH0Rgf44h75KoFn2PgL8jHsHfTzn6JmwdKlh8FUQA0MerRbwpaVUUKbJYW7+w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=SNUyccTF
Subject: [Buildroot] [PATCH] package/ndctl: bump to version 85
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

Upstream v85 no longer requires the -Dfwctl=enabled / -Dkeyutils=enabled
workaround, so drop both options along with the stale comment.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/ndctl/ndctl.hash | 2 +-
 package/ndctl/ndctl.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/ndctl/ndctl.hash b/package/ndctl/ndctl.hash
index f731fb7263..dbba1d16dc 100644
--- a/package/ndctl/ndctl.hash
+++ b/package/ndctl/ndctl.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  dd4b9b9a9dc0a15e980670b6f889e910a80ad60f2309e03bfd9cc6071d14dd30  ndctl-83.tar.gz
+sha256  69039ee12c75c44f67b5fa3f1abb61d1c38ff9303021e50cec0b45801cc93b2e  ndctl-85.tar.gz
 sha256  1334f22048052d69647860fe9fb24997dc3b33737cb494297d68949f589fa1cf  COPYING
 sha256  5c37e41135091a39821cfb306ad8516625b0bb49510ce56ad85c347bbc46df29  LICENSES/other/CC0-1.0
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/other/MIT
diff --git a/package/ndctl/ndctl.mk b/package/ndctl/ndctl.mk
index ceb01d633f..47d51e6b1a 100644
--- a/package/ndctl/ndctl.mk
+++ b/package/ndctl/ndctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDCTL_VERSION = 83
+NDCTL_VERSION = 85
 NDCTL_SITE = $(call github,pmem,ndctl,v$(NDCTL_VERSION))
 NDCTL_LICENSE = \
 	CC0-1.0 (helper routines), \
@@ -26,12 +26,8 @@ NDCTL_DEPENDENCIES = \
 	udev \
 	util-linux-libs
 
-# Currently, disabling keyutils or fwctl support will cause builds to
-# fail. Therefore, always pass the -Dfwctl=enabled and -Dkeyutils=enabled.
 NDCTL_CONF_OPTS = \
 	-Ddocs=disabled \
-	-Dfwctl=enabled \
-	-Dkeyutils=enabled \
 	-Diniparserdir=$(STAGING_DIR)/usr/include/iniparser
 
 ifeq ($(BR2_PACKAGE_LIBTRACEFS)$(BR2_PACKAGE_LIBTRACEEVENT),yy)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
