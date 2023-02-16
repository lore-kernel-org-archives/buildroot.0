Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35432C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 17:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9451B820DD;
	Thu, 16 Feb 2023 17:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9451B820DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcTHgM407MKZ; Thu, 16 Feb 2023 17:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D055A820DB;
	Thu, 16 Feb 2023 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D055A820DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 327F71BF2A9
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 17:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CC954104E
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 17:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC954104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUmEyFY3IdtN for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 17:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BDF4012D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BDF4012D
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 17:40:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so4380280wmp.1
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 09:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SOP2g2oe/NxntD8NSEqGyfKHGVzo1Oa3gFPqFEy5FoI=;
 b=YGOPk26jFVKhrSu7WfT19ABDGThUlsej6P4xL8xpphayjpM6yTzpF8w/nBLmMWWCRp
 TojM7s66xVfYgcTzOaTdFARKLk8ioB81r1rPM/vRi+q/X+7ogqKgNltAI7+XcQjOOkz6
 EwsPktz8SW/6EamqVnZFw2Q7A0CpP9rpsHari9mJmiupgjsbWkHdgaZH+yTsxUk3ZhjK
 13HPvhh8q8XyEoNgV77fI7p/BLPduPG3HB+m4bjQvZn07SP9mJpb38qIMeFcjSNVEl6W
 IdFT28bOY6/z6fys/tHcdYic2VYP5JtXkh4d3ABwe/CHgEeMBoFiwqoFfoCnrL09rqKj
 K2Cg==
X-Gm-Message-State: AO0yUKV/118lQ8cpbCZ2w4xjR4SM3WMbnIJ/YaiY/Zx+t0+qI93lRhFD
 kONxyy/eJRfBvwfGLNBToUCrjmCEr4I=
X-Google-Smtp-Source: AK7set81tCgg21SpH6o5Xk3rCrEGOb9d/5CvItqAeWiuTG7svNph9vpAh2J6Z6ktjb+Nhi29SwcBJQ==
X-Received: by 2002:a05:600c:2b0f:b0:3da:22a6:7b6b with SMTP id
 y15-20020a05600c2b0f00b003da22a67b6bmr5536130wme.13.1676569220917; 
 Thu, 16 Feb 2023 09:40:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c451300b003dfe549da4fsm6520496wmo.18.2023.02.16.09.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:40:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 18:40:18 +0100
Message-Id: <20230216174018.33199-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SOP2g2oe/NxntD8NSEqGyfKHGVzo1Oa3gFPqFEy5FoI=;
 b=MX/imzupDTBISUdO7Ss1hxYb/rPAMCQz69cb6l/dtsNbr9DZMLTJwjFr98XqlZ44c+
 lY+RwV8Zn/968Wfu1CBhOvtU3YFt8ioCGyQ+miInWmNMPtDDz9tr6Z8Rww05aWoRpa2f
 mAGnBJk46NCwQmH017zK2qa8ukYeMRe5Lh/a3+XLQCuqQ7GZe5yM6TwvO/LhdqGMDoLH
 ygCwVqibeBZ46l7axnndh5TgtQYKtOSCBhqVzqNM5lF2uC7JHrAuyCcinKdx20OUgCzD
 Q3NAQREejWD7HYzA1iN7fSAJCT9LTpN1rQXHeRaHRq7HJxXSjZHpRBb8RGzGR3UIIdUV
 wvoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MX/imzup
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.10.0
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

https://github.com/FreeRDP/FreeRDP/releases/tag/2.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index f6adc05312..55314cfdd3 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.9.0.tar.gz.sha256
-sha256  fcf71cf5b09c5c2636341ba212f34b8fb728246ea28e08caf6cef8b4a96184b7  freerdp-2.9.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.10.0.tar.gz.sha256
+sha256  a673d3fc21911dd9f196834f2f3a23c3ebc7e5e4deab2f7686fcec879279e2c1  freerdp-2.10.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index fb0e6920cf..01c511819d 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.9.0
+FREERDP_VERSION = 2.10.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
