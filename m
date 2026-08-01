Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0BCC5516F
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5DB40845;
	Sat,  1 Aug 2026 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9M9z6_CXyZv; Sat,  1 Aug 2026 08:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FBF40829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785573116;
	bh=RKx2mAx4nhlMBXtOAkgBygdCAFVWAgm4RelqxJs3IIc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N/jy+G2uNy8ppIdD/T3SWjv0NneX7BerqRgBWKACfzO/OKJ0TFWr7kuN7/Qoihobr
	 EIyszVE2hNvDzwO/UjyLiK4zTb4k4MTw7FGDiO8CbN9Fhh/jqxL5atQiIXg9JV3pSy
	 ghcn/XZ8t/8Eo8zZ1/CPBVPxtjnogLCC0244YB9j/CF1fEI03tVxqVjY5QZ+fmp/5U
	 /QfmVa7qVd4vvuSXkFCeB6SpaATvRKpbPGDqrwtsKOK2ScUMenB4iUVpUA8Hmvva2m
	 IPbTIwLUxnJePpQ6MfRhaC2VLnBlUXucUCFadU8lv/YXV2nsN1/qrZqVBrUPZ3YLvP
	 f6OzwpjcWj/Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FBF40829;
	Sat,  1 Aug 2026 08:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A835E3A6
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A9314008E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SR1lQPWddMb7 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 08:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D2D74004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D2D74004E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D2D74004E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:31:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C403D31E0CF2; Sat, 01 Aug 2026 10:31:50 +0200 (CEST)
Date: Sat, 1 Aug 2026 10:31:50 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <am2u9u6kKC5O1kFl@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1785573111; bh=C4hFTX7h9jsSumPTTQdHMKGhtY6E55QHMD4uL4UaoTQ=;
 h=Date:From:To:Subject:From;
 b=I+NLR7tFlgf0nvMUhfGgTmxNIbJR62U9R/wK4MJhrYMvjjbmGgiQ4c/8YiXqtjgQr
 m9qK3OSxu/3U+FBglqrnL7HhA0w+61GF33Xzju4qMoImqAoIIstOO5NIIFgsm/3QIP
 1CNEmMRoO7yj3fFt/lQRBrK0S/+NGpilNxYplx+9/8SVLmkj9G1dXztMEsMbjF0f8G
 rWb2F7B4EfoxS3RylXmHbUBRWgRn7k8IcQg+hQ2/zKOsNjT9UZzjTXc6dN2NyC7ZkP
 FMY4/CcDlBNflzJ7kPOH+7S8FNPs07KEkHuu6ZoeoNyYZPuJFcV0oov+QXLYiNpfaB
 RHcbDeT8Uujdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/atop: bump to 2.13.0
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

See here for changes:
https://github.com/Atoptool/atop/releases/tag/v2.13.0

This commit fixes uClibc-ng autobuild failures:
https://github.com/Atoptool/atop/commit/5e853bba484d22620e8b6f97bf329da3075070b5

Fixes:
 - https://autobuild.buildroot.net/results/f98/f983d97b232a45ce4e176d93684fffcc771daa44

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 7b4bd2e942..fc5b33ce79 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4fdbe67c5dfaf89405639e18599f4eae77978073ffa54f3c78c368ab54bd12f6  atop-2.12.1.tar.gz
+sha256  ea182f84c9f52ca922e5af4f17dff97ff424400a4f2f92393317a6af66e6a874  atop-2.13.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 346bd0ff57..677b60ac1b 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.12.1
+ATOP_VERSION = 2.13.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
