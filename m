Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F10CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 16:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17B64140C;
	Mon, 15 Jun 2026 16:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omJ-c4Je2acg; Mon, 15 Jun 2026 16:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BDE413B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781540301;
	bh=kaNSLAUeJvnn/PYNZpsX2X8k5Q8/vR317/5rVMiUevo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j6F/C8LJtdyPbpTR+3X0ZfXFM79mczsq1mMHmBGIn9vlbo7UvM2EUOlnO/JJ8JGrl
	 3UZQd6OZXDYC9CMusEhU61cVVWekBH3XPzHVM+6vuZRgL3vYE42dNq+DqR4k6h0F18
	 LKViQ5RGVL7KF/2ibhdpp6JjTB7QgaqR7vouah/Mh321p16IavYzMOZbTFNbp8AA+B
	 N+Cwr1ytTT8G9R1ux2sB7iQzwdgJMxSLqXXUJlD8/kW+FG1jMcc15iCuN5O1GEyQOj
	 sEsP5p036OeIrpKyksdQW+P9yvCB9fCrfj1NkETVP7slVdhyFNy0wCvXYH8qh19HNK
	 OW4PHXuAP6LWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BDE413B1;
	Mon, 15 Jun 2026 16:18:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0710D2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E13B7412D5
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PCGCIuozWk8 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 16:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8202B4024B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8202B4024B
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8202B4024B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:18:18 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZA0uwlBtb4OeoZA0uwjHMR; Mon, 15 Jun 2026 18:18:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 15 Jun 2026 18:18:15 +0200
Message-ID: <20260615161815.1945181-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIfPvaJcDVmUO+2WKEqNgjLqlrfDtY1uEQIFzvBv9aAqvbtSFr+YsrbmOzCCx5QmnOmMk4nYmPhryGtyQw5HsnP8a5JPRibi9PEFHeV+41qX2HvSe3fw
 FleNH7pV9js3YTK9TmTrqd0mo+0P431Bm3h+E0+33jlBiJLGo4xBpK1OSqYad0YGxV7eG9mjnn6RjTm+tSqClPwmVCMidRgqXCuO8jXbaMvHMJbaerrQb0JU
 cod4gJPyeqkoxA7ZNEWl018ovn+hdiS7OAhVI2b1pQ23tUcoRHHti8ZaO5k2poADin/6GaTw2VcaSTX/jgoJMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781540296; bh=yXsx/QHKzhNUiXCIOLecQ1gp/KIf4/5avjNqqErXbNs=;
 h=From:To:Subject:Date:MIME-Version;
 b=VZ2D/4JmRnhenwqHmgzVbwcaiFTXebwf0xH8u0NtGhCpoywNN82D43HclunhM3B89
 qJpyvryAr7TlYXi4p5dj2Fo0+Gqob74qTVRKSTDDnjcc4FRw5j1BowU9LJsbbPeibB
 Ic10HWlzlxg3P659T3/KHA+LOwdxxgVt2V2OGkbjvaF86F9tTvvMC37DlxRWOGsCTB
 fwRE7433KJb1Vl9qI9Nek7vroCB7BjyTa6Gjah/se6zakl6eHPxtM/S8R7SJ4j95je
 mhGccCwTc/kqVQTz4qiB8ZTYRuQAYhyq21R03s+mF9KzLMO9TM0l5oDD4AbX7CBGiG
 mFiUGTq3YzjpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VZ2D/4Jm
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.1
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

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 615bd02104..73e4200b5f 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
+sha256  e5c1951f819f553a34f61f33124b4c8dba1d665d9bba422e15752fe4fb52337d  erlang-jiffy-2.0.1.tar.gz
 sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b07db71a09..ae1ae0004f 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 2.0.0
+ERLANG_JIFFY_VERSION = 2.0.1
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = Apache-2.0, \
 	MIT (core), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
