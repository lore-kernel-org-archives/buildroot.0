Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 21:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 052C14023F;
	Thu,  2 Nov 2023 21:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052C14023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_ccBWyrEvLa; Thu,  2 Nov 2023 21:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 177A24028D;
	Thu,  2 Nov 2023 21:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177A24028D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 090441BF59C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D693C80E5E
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D693C80E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-JLg5To0Wgr for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 21:34:52 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C39D80BD0
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 21:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C39D80BD0
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40838915cecso10315515e9.2
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 14:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698960889; x=1699565689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxMsIDGyWRbWKYlWLV5swgMtq0SwhdxAf6XlHySX6tA=;
 b=CIkSUKU5dxaI9oimSW8hHlZFruyc0qQyQiQOP+SnUtVBn4b5rB/ljTPtUv4oye2Q5X
 nbrYRakfE7YSfXkmdU5epsavQikiSuNWzjuWHZsefKgFxQHqyLhhMJ5qSMXGQP9/4qdJ
 iSHxFazX3BVG4jzNDOrNNFD2a15W6StQd8o/0Kbmeur8tOWWjmp7G1OqIMIk7KBuCMAO
 z16Z/TbLpzO93bgh83CySerVjJgUbwYsYrjDJ08RgQgX5bheDG2xKxvr0vMpNfwpF8bq
 BajcvOem5Rh6X0rPb/zafoUPSP1xwk3MQa4vlz0h/Xe1fdgComsTXvU5o1SsbXiWtoVQ
 0RRw==
X-Gm-Message-State: AOJu0YzMPIAC1VgciGfeY5pj130x0Qdg8s7ABABnNRnHEb8EKTCkNitV
 rQ/EN/ucapubIyGhZZ5iCsdS2T9DFNY=
X-Google-Smtp-Source: AGHT+IHWo4xO09rQTGaNqAcdRBwn9ojKbaS+kyNPqIX/G0YIVppKEo9YCS8rRgXdULy2KpN6RPzSFg==
X-Received: by 2002:a05:600c:4ed1:b0:408:e441:1697 with SMTP id
 g17-20020a05600c4ed100b00408e4411697mr15551477wmq.39.1698960889213; 
 Thu, 02 Nov 2023 14:34:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b004064288597bsm339314wmq.30.2023.11.02.14.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 14:34:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 22:34:43 +0100
Message-ID: <20231102213443.201027-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698960889; x=1699565689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bxMsIDGyWRbWKYlWLV5swgMtq0SwhdxAf6XlHySX6tA=;
 b=DS4Fs5ZzS3jcvE/1EuLdkw+XA5Y6l8ZUW49FiLtZmLgzpJoOAyuLNGKnQNCVeog5IS
 o3LHXhqwNZ+knZEZELJB5aKIf7KQCtkO9o6bmay7MD7r/mz15/tbbGN4Y6K6uX3jXTHe
 ldQfgpc3pm2Q5a9mIwous0SVA4QJY7Nlwsq3EC1sHNJ+DGPG03t2TkOESbiiFJJO2uBX
 gsfgGBnTJ2x6Fsuxu8Z3+TI3DMNHJJXMzlXoP33NHoiNDzx7sDpD3oZYExthzXqnOX9B
 DogWd1Q+EiJ1ZN+vL9JiHL39nfj1RnvDVGq/GCfN5NgNnz/Iq+dY6KqAwKZ374przjSU
 o5AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DS4Fs5Zz
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump to version 1.7.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dgibson/dtc/releases/tag/v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 29b7e0b121..5856156f00 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  65cec529893659a49a89740bb362f507a3b94fc8cd791e76a8d6a2b6f3203473  dtc-1.6.1.tar.xz
+sha256  29edce3d302a15563d8663198bbc398c5a0554765c83830d0d4c0409d21a16c4  dtc-1.7.0.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 53f9c9c8df..ff3ed49b37 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.6.1
+DTC_VERSION = 1.7.0
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
