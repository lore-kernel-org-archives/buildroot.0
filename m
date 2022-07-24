Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDEFE84672;
	Sun, 24 Jul 2022 02:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDEFE84672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFp-BvJ5tqYR; Sun, 24 Jul 2022 02:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F4648466C;
	Sun, 24 Jul 2022 02:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F4648466C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C25E01BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1508466C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1508466C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaPmQnd3VCCC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:33:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A0883381
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A0883381
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:33:57 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id i1so2642123ilk.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UdL2RN9AVs/32exf+xpbkutEwpd44HcnxRYNqI0Fl2M=;
 b=yu0Y8vFX5z3P0HAVqaucmG4DQhsiALZkI9J7REVuy8k8yQOIcEI+wW8bM828Fp/kan
 v3o5ruuLC3KjEI0r/ijbWN/2BFgOMpK0pbf6yfkGAjk2XGjDto2evcytR204oBvu6cVV
 EiOUglB3Loxa6w/bA/R6k4fEmutLg4LTQuqxhb/UecCEf+4aBdV6Oz4TEzln2gNGdiny
 Etru7GZ87+APGeqYDSOEFXA48Q7WmCtVnu8Pv0C48sdalqh5TVaRv9jvIhR/YuWFnFkz
 oH1t3jU3TQvQKboyKC7wJ9Yt0s3WfnGEhrQtgscw9ZObFnClMK1pBIsveYE8BrVgqslT
 gPQg==
X-Gm-Message-State: AJIora8mu8Dose2AnraoeBBDTeV3ztVJ5Sglx+Lc37pcG3TcvMVkT+cn
 9a2w5QoODgVKxn7FBLl1ztAuO6ni55EQkA==
X-Google-Smtp-Source: AGRyM1tNu3Bfg0sS9rbyMmFOQj38T+uSrehmsWCICSMQGA90bQ+lJZ4TJ8A2dR6ZhifvZJhjnYLrYg==
X-Received: by 2002:a05:6e02:2149:b0:2dc:7abd:e129 with SMTP id
 d9-20020a056e02214900b002dc7abde129mr2486245ilv.24.1658630036682; 
 Sat, 23 Jul 2022 19:33:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 f11-20020a02a10b000000b0033fbab06b75sm3755376jag.46.2022.07.23.19.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:33:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:33:54 -0600
Message-Id: <20220724023354.1025542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UdL2RN9AVs/32exf+xpbkutEwpd44HcnxRYNqI0Fl2M=;
 b=WQg4DG4+pRTwdF9K/Z8rpVYNKObN+n3Aw83H16Tm4XOfWnereia/RdHPHETQd7zsKv
 BKxRTSawBUDstCuO+wUO761brSV+IwAHBFRMuIN9ezudFDlr+Hco26A/QcC9tyNWFIx+
 w5Cf4QRfGFKXQRq+4ycYPZgRB+YsepFTHR6ayYR26qXUy4dbu/13h5kiv8KU/BXgTVSl
 w7iouxZZ9H5lIEfi0u3/nbQuxrq6rRAnvNMcB5iO0dZq1Vumj+un+Hs7fyl+b9GcJO+u
 f/TZ/rZSZixlkw2lG4x5aBTpDfD/BYdAF7ySb/lwN1ANvhnMCwIEuo+gUzrsq50Iu9xV
 9obw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WQg4DG4+
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.5.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 065c8ac1f3..a3d2a6be6c 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  3b9acf80a22c44d2d12eb7e20533934a  cssutils-2.4.2.tar.gz
-sha256  877818bfa9668cc535773f46e6b6a46de28436191211741b3f7b4aaa64d9afbb  cssutils-2.4.2.tar.gz
+md5  974bf7f07d52f92dd29485b6e7529aac  cssutils-2.5.1.tar.gz
+sha256  b4a4da58e78326ec9f4a9d3555004ddf706f3e99f7a1026c1880f0934362b8b4  cssutils-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index beb5f1c8ff..3acf26b3d5 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.4.2
+PYTHON_CSSUTILS_VERSION = 2.5.1
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/d4/12/1aba9a6c91d92de011ff97a9320ad37e5565adfe0cc324deee58d5891d7a
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/bd/f0/d3a02af54f292fe9d1f6bb18c7d2f79992b5cbae0db1ee91e5c73a3c7d7c
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
