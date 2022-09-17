Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC35C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF14A843B4;
	Sat, 17 Sep 2022 22:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF14A843B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qF7-uv5cO7p; Sat, 17 Sep 2022 22:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAEB8439D;
	Sat, 17 Sep 2022 22:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAEB8439D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F17F1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A9E0400AB
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9E0400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zv5JduEZRK7c for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 22:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B14A400E4
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B14A400E4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 22:17:11 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1278a61bd57so57027990fac.7
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YtOkK8b24PTAv+ymN0KIMW057JX4d2lvPMohmaL/mO0=;
 b=qOTBBh51+ULp98rpP2yKZAS5ePcpdzhGvMpYMaX84jbbYfd5MoaAhWfTgXUlTFhTSc
 ei2BzxzsSDOBK82OhfHLpyTxjuyjqyYDtph/HlpUVf+zgKLguTqM4y34pFpKu4p8WJPx
 prxycRydwsNABvX6laAiS+BUcV3NZW1jLYDSyIH0DopPGvYOXF1hDtCN6ca14t4+LcfT
 zhsSDK7E8tL+OG2qzcZxjoq5pA2IHLAQXAHlXaAxsyblyMXYxpuy1VHphib20B8yJol6
 bFbsvgLKpd7sFbhcF4NwuqN5Ub3g0G6+hF1pgvilTVSER8SzDaTcHH1iesIvUAfdsgC1
 GJgg==
X-Gm-Message-State: ACrzQf33HjIYEXusu/cQNT4VOtr6AMxfjzgSN0WfMPAucXIHRNyKmyL7
 suJL0BlYQwuvxLJjr/WKyPvn1LM3N3w=
X-Google-Smtp-Source: AMsMyM6wuvHD1eEK6wCUAJtcq83FUgS1dJNYFXjeBqSTOMH0KkfpDaWetwaNz5yIKLpknq19x1E42g==
X-Received: by 2002:a05:6870:c391:b0:10c:a937:aaf1 with SMTP id
 g17-20020a056870c39100b0010ca937aaf1mr6217764oao.272.1663453029657; 
 Sat, 17 Sep 2022 15:17:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 13-20020a9d080d000000b006596cafaeabsm3612822oty.47.2022.09.17.15.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 15:17:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:17:07 -0600
Message-Id: <20220917221707.1682729-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=YtOkK8b24PTAv+ymN0KIMW057JX4d2lvPMohmaL/mO0=;
 b=gEfNJKhbg09iJBSorrflHGM+SSfr7lA8mXMT5MPqI52tC/f9uZmZKsgnx+WBTyY4tw
 Tg8shCaVv5VI8tbCZ89QxAhRrFMbO1XiDz2G053hxRgsmwDO6Y7VuZZ9zt0ZE2njxUh4
 BNk8+cXNKDCM0xWWIa7UXoHg/XQ4Bf3ogz11WV8wGbNTbEAlpPMlODvv+iliSZ/EJSgT
 KjAdjrhIazugBF4g6NH55AQC4GLfpxuOnV7bTx9tkQwCXSTZqx2mLP3uKHAR4h2/vpQa
 PGRhC00+KYPc9GJGpp4mKf3zV3qiLqCLC45b+JvDIzDCfz2xkYfVYhfvWwzzMMlHM7B8
 6auQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gEfNJKhb
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index bf00a5f431..7babd70111 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  759ce1b8fa1208fc5569055e0b72155d3c5479ce0f31b8d5034feee3cffaa3a6  maturin-0.13.2.tar.gz
+sha256  33f7cc8cd0a05bdd577afda1482e6bd5e33ad881366b1e9333625e063852cdd7  maturin-0.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index cc45cb31ff..b239f282ba 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.2
+PYTHON_MATURIN_VERSION = 0.13.3
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/2a/51/4794343461971a67a85db5025b7c89928c603957d6b00c9e940bc26a3cb3
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/f2/5c/af29a40fde2c8fea1e34e79a5d43e2a4278a685c1c9039c107444f9312d9
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
