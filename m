Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D8C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 20:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B10A4028D;
	Fri, 27 Jan 2023 20:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B10A4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s26CZxJ-rJNg; Fri, 27 Jan 2023 20:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D37B40260;
	Fri, 27 Jan 2023 20:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D37B40260
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 286A31BF2A9
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 20:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F28282690
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 20:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F28282690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGXKPxzwPgUl for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 20:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F1B8236E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1F1B8236E
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 20:20:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id q8so4214046wmo.5
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 12:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4h6E9b5/nchcOsyyIQrkyhIpSwi8AZZjJOASyREIXc=;
 b=eyCtmYfdHmUuUfOUrRyZ2oc3FePcykmTwkLUMt5LzWt5wUMCDNKsfJdllvqeGq2+Wx
 R3Yx6oJMJ5mEXERLVouBTOOvghA2jcJ+D4VnbTYeHCwnnBqxLEjMcTIglvTH3jltG9Bi
 G97oRITzNeSEarE2VADjke/YQOo5N8g9r189AKhRQ+qYNTbrZRVpDCLqHLAgtSrV3Psb
 ePX883a10fSg/AudSpIC2UKuPhicrqpdLBVODxM7OhE0S6B4ln3efglHfjJfDD14fThA
 nztBgH49nLRubfwAV86GannzXMeZvun8OKnxOtMSjG87SwZrt7LXmL0x0arn9igKBayB
 ajvw==
X-Gm-Message-State: AFqh2kqeLeoHknfSmZ+/v0QcaUrEz4OtQY0rKw/IKT0+MQSACsP1PJCl
 xcXKEl/iuufw5vZ9Vw/RevBpTzIYJqk=
X-Google-Smtp-Source: AMrXdXutNW870bZVknPAKr+4BFbzUZNCOCS1cITkdt24hNdiJGKUgxq6BHuTIH7QJYDMklFowZr0Og==
X-Received: by 2002:a05:600c:1c9c:b0:3d3:49db:9b25 with SMTP id
 k28-20020a05600c1c9c00b003d349db9b25mr38506639wms.26.1674850805814; 
 Fri, 27 Jan 2023 12:20:05 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 hu10-20020a05600ca28a00b003d9f14e9085sm8405567wmb.17.2023.01.27.12.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 12:20:05 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 27 Jan 2023 21:19:58 +0100
Message-Id: <20230127201958.7309-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4h6E9b5/nchcOsyyIQrkyhIpSwi8AZZjJOASyREIXc=;
 b=MOHyHk/gEizvMhxKUbKaYZznV4AOZEMMOOdwIFVPjB8mFDiksafzVuft76rCeWIXK2
 xima141RKfrBRnEiqDnx1hvwK6k/q1JTo5VigG+NDOP6ZEEHJ+MlvFTik2WfyCC1IYMf
 /lOM5L+8yO18L4088ZciEv1CwNGTI3XE5kSvSP04mSwmRN0Z5/B5t8TTUELEariRLn+w
 10mU+7rEGo8LxzsF2j4jLr650Z5hm6RHZ7M8h/kNGYXoZJOKohFHKTK2Ydz3zISlwDyQ
 N4/FPTqP2QsHHNH893IX5nkXEJG/1uMBWy13mk1e5xOD8DQpRCdcQ87Vw2KAAJXZzZnj
 PqRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MOHyHk/g
Subject: [Buildroot] [PATCH] package/lualogging: bump to version 1.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

diff COPYRIGHT:
-Copyright (c) 2004-2022 Kepler Project.
+Copyright (c) 2004-2010 Kepler Project, 2011-2013 Neopallium, 2020-2023 Thijs Schreijer

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/lualogging.hash | 4 ++--
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 5ed012ea5..af1ee1055 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  285edf8abc9844cb37da94888ca01cb26a2ba08411ea13a3ee0f4d029ca512dd  lualogging-1.8.0-1.src.rock
-sha256  d900082cb26f8cf4a491ca51c00241f2c2e9cd9ae3531c62234017a360706adb  lualogging/COPYRIGHT
+sha256  7bc2dcd13dbe85e48de50f05000b391e467a54d537b44ed856c1f7ad29c3549a  lualogging-1.8.2-1.src.rock
+sha256  9740a719a5e4ee280e65f42e3624354c3c4464e61d94de33efca9d7072d31092  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 96c09c5a4..c7969fb7b 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.8.0-1
+LUALOGGING_VERSION = 1.8.2-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
