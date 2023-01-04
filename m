Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F9EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 07:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8224C40A92;
	Wed,  4 Jan 2023 07:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8224C40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg6oSNLc6RTI; Wed,  4 Jan 2023 07:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2AE340137;
	Wed,  4 Jan 2023 07:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AE340137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 191201BF40B
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 07:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E72794180D
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 07:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72794180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vv-SqaxMvg1 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 07:36:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F5441808
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3F5441808
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 07:36:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso25810517wmb.0
 for <buildroot@buildroot.org>; Tue, 03 Jan 2023 23:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qt0Lya1Z7aYWMk8RE/F4Al+WP2sof8J+CRcF66AoBl0=;
 b=x1G/bgIv3C8ol9BZzF0lEhUur6kgMpcRCq9URHAtMZxond0MvGEoix0SMA2g6VdVRF
 JSD32HzDPEBQIA4BdgosgN5bVXsGXm+egFvK3RGbC/DvmSpjwvyORKYq7VoAed5XeBfT
 bAofxkyZhb2cmXl0ShcHj1bnE3uzsuWN+0dAEATERRPyUetFt6ncg8UroKJyyu66Cw5k
 cRxMmKrrkqgAUDbSeGWcouKIOfePb0m+gfBtEf5GxZXV9lVnzho+PNi9NSsfmx2wEhRN
 jn5rfTmLFRoeEfolpisA/oGg7IyGbhmpiLEpUaM+xGqeO7deP/HdYR7YXuoGgbUCrXMI
 xemg==
X-Gm-Message-State: AFqh2kpY25xPnrdNbAcSTu3utq3rHGrVv7vI8zan03XlCeHKpVJmmeMX
 mZWLIKFtHLgwfSXuc/VyUQx/YeN5n2I=
X-Google-Smtp-Source: AMrXdXvkZxQcAM4ZfNr37bUgOWcvN1D/y2tjAbEG5eSrqDVQ7JfmI53bibLQYSPhdr9ptVWWTBZAfA==
X-Received: by 2002:a05:600c:358f:b0:3d9:7847:96e2 with SMTP id
 p15-20020a05600c358f00b003d9784796e2mr23734003wmq.2.1672817795205; 
 Tue, 03 Jan 2023 23:36:35 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003d9b89a39b2sm8540999wmc.10.2023.01.03.23.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 23:36:34 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 08:36:30 +0100
Message-Id: <20230104073630.654488-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=qt0Lya1Z7aYWMk8RE/F4Al+WP2sof8J+CRcF66AoBl0=;
 b=XM0b6YtLUy+d1JnCqzbsl+tEWblxS8+6gH+0P87cJyVpwhov/qhqCiyg4u0wvB22yU
 4aHkUufLNG7CV3og1MhD989z9C6+9Hy8yW9cL3YvjM7vCVDREBKB7ceL4AebNjH5sCPY
 rdMUfDViXJ/lJntQfEJsdF6jpo9BX8VlAGwzEprK5J7r69KhokiEgSq6S0bpP4lgRmRB
 xSR6P7HeUD50ykldeJ0J7mI3emS2OIwfpH/wxPVTwOl5g9Sut7z6Xmyt4zzDP9lQS3MV
 Ff/C2IJ/Zuhw++L0AoEwUE84e1PoBWbt1Ug8hn8ivhv1vT8+HfYy4qJuGS+Z4f3xO1Cj
 1TuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XM0b6YtL
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.38.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, with a security patch for
CVE-2022-42799, CVE-2022-42823, CVE-2022-42824, CVE-2022-42852,
CVE-2022-42856, CVE-2022-42863, CVE-2022-42867, CVE-2022-46691,
CVE-2022-46692, CVE-2022-46698, CVE-2022-46699 and CVE-2022-46700.

Release notes:

 https://webkitgtk.org/2022/10/20/webkitgtk2.38.1-released.html
 https://webkitgtk.org/2022/11/04/webkitgtk2.38.2-released.html
 https://webkitgtk.org/2022/12/22/webkitgtk2.38.3-released.html

Accompanying security advisory:

 https://webkitgtk.org/security/WSA-2022-0010.html
 https://webkitgtk.org/security/WSA-2022-0011.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index c2512be9c6..eff7f5c18f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz.sums
-md5  a69cd8fc05f7299458b4faf1bc99b875  webkitgtk-2.38.0.tar.xz
-sha1  6dcb65b8dc56c52f086bfeecfca7920e9cc78348  webkitgtk-2.38.0.tar.xz
-sha256  f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd  webkitgtk-2.38.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.3.tar.xz.sums
+md5  1c1cc5eb59273091e228406937b23947  webkitgtk-2.38.3.tar.xz
+sha1  04cb5923d8ac6f435424b74115c3219ec597e9ad  webkitgtk-2.38.3.tar.xz
+sha256  41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a  webkitgtk-2.38.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 336744954e..b1bca7b88a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.0
+WEBKITGTK_VERSION = 2.38.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
