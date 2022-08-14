Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC422C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2916B41677;
	Sun, 14 Aug 2022 12:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2916B41677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffDidyP_fxHk; Sun, 14 Aug 2022 12:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED2DD41484;
	Sun, 14 Aug 2022 12:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2DD41484
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59771BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0AE481985
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0AE481985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZekMwz738XMH for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:56:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1B38188A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D1B38188A
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:56:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z20so6584672edb.9
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VdEV69bDbQToStTX54QnEeTWQF4fb2w4+/rjmpVFLWw=;
 b=hMUwkwW4oetUAd3O8spwW6ngTnMtY18xoNScpySyhwfqe5+X+bfCtT9urM5qKWWsWY
 JfB2TqWgos7r4OGxOrsM1HfUNYXz+0VrbLNFb7VhrtNIjN/L4MpqxXCEZmjoeOyItaPL
 v8nirUcSNNHQdgE2R32V+0MGIbFECljD80BhJoYgfFMHRfjHFQIIibk6DUrXUr80+/mz
 56tGzlEIUgOd/eUu0jjrH+nQ6TYcb8pMdCZptJn2cVSsJ+lZlQVrhlzGAB9pwlmvSxBn
 +hMyXbqxFMNMRLYtNprNQgILW278cdBc2miw1UOMvgq1zCOjglgBYDUOrag6OAJqPzo4
 Q/YA==
X-Gm-Message-State: ACgBeo3bo/7lzxe40ZeMvM3Y9nB7jcN4ARUIU8RDUoOWetO9kr1Tg/Kk
 oWYSOjlqYsmQWdiNUS4NtkVjAenidw8=
X-Google-Smtp-Source: AA6agR4J1nF2usgEm7xEQU9dxCpKSBLrg+qhYBDEL//QiHcMmmWBhAnt7eTM94UAE58X7fsKlOMcPg==
X-Received: by 2002:a05:6402:5305:b0:443:be9:7242 with SMTP id
 eo5-20020a056402530500b004430be97242mr10563775edb.428.1660481794832; 
 Sun, 14 Aug 2022 05:56:34 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a056402041700b0043cfda1368fsm4755242edv.82.2022.08.14.05.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:56:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:56:30 +0200
Message-Id: <20220814125630.1227952-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VdEV69bDbQToStTX54QnEeTWQF4fb2w4+/rjmpVFLWw=;
 b=FBo3YI5sW+fhtCiW18ekcpnty305tOQkkiokdEu61Y9e6DLEzdXGVrBXZUnbCoO9Op
 CK0nr0ecqSyssoyHWQCf4szmzcFkpBFthUt3RpezYWpwrzylc3iItLrWztzc78HYQWxe
 irDhMkJiCMkGLgviPxhXKO6r3hFXqdZIeeHLLIonsvVAk9XmRae2JtBQ0XsZoE6YhHto
 NvAAYkG25wftj8GTxA+y2el/Hz9gw1ZOxX+yIoHe23KYCgn8jZFFhIYwVTYYOiaWPHdF
 3GLzkFL+/7OVz8y53ALCUSISbgC0ltlm95TfzFjmr+Fgb37iO02uBp8+fktEke9u2fzu
 c1yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FBo3YI5s
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.2.4
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index a95086e81..969e4cd3d 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6  libwebp-1.2.2.tar.gz
+sha256  7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df  libwebp-1.2.4.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 670a7b801..38a1564a6 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.2.2
+WEBP_VERSION = 1.2.4
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
