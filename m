Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1900DF99C73
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 13:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D4C40654;
	Sat, 18 Apr 2026 13:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVTtzX8x6EPb; Sat, 18 Apr 2026 13:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EC340692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776520219;
	bh=S2qhYTC4tsW9/KVz2IeVXlvfnIqXlkei3AwAq7UMCls=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JcPm/qKztBZo/QLSlIdnU+jnWDTWR5XvJimQuhb7yagAD5ouj39Zj1Fbg7f0B5C6l
	 2CDXMl2vcEr49LuzMiGxulCkFnhSWMuLDNnPE9OO8BDCp06hnebl1/4uTpGDnUKfSS
	 SWEAf+cq9z/XjRaAhz79L8sa3zZ4S4IxS9DzvRAYMKsvsjkobDzhjsEtMZPHuAnweS
	 g0eSScy5t2D8rGLwOG814snJTowiSarwUS9nDyV6ei6429KFPnt/Gx0PxFWHfr24Wi
	 zgijLfuR954A36PxaYYZZtOelUQDxzyY+HCEceJYHQCghq2sOJkLS3e9W99o2iZiDK
	 lgdL90wlOc/2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EC340692;
	Sat, 18 Apr 2026 13:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C076259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31E25400F8
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8laKBy-F-pW for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 13:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 091BC40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 091BC40057
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 091BC40057
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:50:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 07E9F6013F;
 Sat, 18 Apr 2026 15:50:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 15:50:07 +0200
Message-ID: <20260418135007.558260-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776520214;
 bh=eQkcrnmGUOO4v5kcgUNZZfbeBNqWSFxNnR8XLic/K28=;
 h=From:To:Cc:Subject:Date:From;
 b=nJ1sbup60zbGmp6MjMufXORHNCU0yn8OS/AMq3c0/H4nuOyjOJJDjOHafTlo4HBJY
 kPfiyJ/bw5S4BiPnMokGRZXwbqh7s9Cb7eBUIPAgUQ5Egn45SS4kIp1Q6BYGomxNb5
 DZLwjlLrAPzwiZy3p2vzQO5zTadHnwuhW14D1OPmHECVBmtk6QM5Kaog24p8FG0E1s
 XcvkzPFcVfe9atNgtvVuBQumcgNi4SHoP3Wvku0FIo2JYuE7XLNTiGxULm+TCMmOIG
 CBK3UVBP29WkdWUT/J48ajICWuLBFixIFx2aeqaHhXZ9WE31+01PtLLCg+XjPCamSl
 m+ONhe/u3uPIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nJ1sbup6
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to 0.21.00
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

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2462479253
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index f91aa76054..81123b3587 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe9e5161ac186c6ada22963251ff701fe3275fac2c5b87bdb59c4cab08aaeaae  stress-ng-0.20.00.tar.gz
+sha256  1339cbc6ccbff7e2ee2177bf0fd67e7b94e8ff7b07fe89bcfaec0280d800cf34  stress-ng-0.21.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 32ac21b540..4181c5ed1a 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.20.00
+STRESS_NG_VERSION = 0.21.00
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
