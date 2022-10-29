Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBFDC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109EE817A3;
	Sat, 29 Oct 2022 03:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109EE817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iImHD7YOQdxv; Sat, 29 Oct 2022 03:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E36381763;
	Sat, 29 Oct 2022 03:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E36381763
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEF91BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 563EC81763
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563EC81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jy2nqYHDQu8b for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:23:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BF88145F
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34BF88145F
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:23:59 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q142so34603iod.5
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fD1o0KXFszjwBhLi/0d+8TeEY/1PUjJM6Srm9mnWGTs=;
 b=NmcbWbkN4I7ophiWCADA0ilAwEDVijuWco8DgjcROQTB9+QZj1PMsz8sW1H6UpIuWx
 /YhyTKJFAoobWVq895czVtPzk1mqDBVOmZ2MOIf/JQc2iKdfmuRTn18ldXLzsgWIKq48
 6/MGFv29ilWjUFUhK7OMbs8gqt0TQPy20iUYPkJE0o94NRcm3JoElpRsWINmqjhF3Q3J
 0JW9d72QTN7sjAl4lZG636M+ZHSzy1X54f9A2vBIGZVaJoUPLUK/9stQWKcsoanT65Wf
 UntJkO358hI/VF9Ev7P7DvKVJcXX4ZA5cXpo5lw6WlFee8b8JZkmPNp0LIxc6HZQe6Bf
 vO8w==
X-Gm-Message-State: ACrzQf1GtW1ACoOJbn2BzgzNeUH7Fh4VNUtofIAZcywwwibNI4raxaDN
 KaafgVQZ9516K8oMDh5JkmWZOifnUBPqqA==
X-Google-Smtp-Source: AMsMyM6uzr8f6LGEWmdeizzj1rKFXxgwMYo1rDXFSSk+Lrnpkuyxv4C/3JMrTNr/T57u12Avz/bOQA==
X-Received: by 2002:a05:6602:26d2:b0:6a3:f044:a942 with SMTP id
 g18-20020a05660226d200b006a3f044a942mr1120487ioo.50.1667007204069; 
 Fri, 28 Oct 2022 18:33:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p21-20020a02b015000000b00363e4730a41sm78742jah.175.2022.10.28.18.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:33:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:33:21 -0600
Message-Id: <20221029013321.1403408-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fD1o0KXFszjwBhLi/0d+8TeEY/1PUjJM6Srm9mnWGTs=;
 b=f02iHiXDkQcSBv+RDJtnDfjBU+Kp3g6mmqBNT1fAI5A6nTJoc0HqWTgzmCHTjdm9aw
 QLBW1Cy+FxuI/bDHwdpvb5GWStxtmid5fu3lm/um3axEYitTFFQMzRkX/MlksSDQGe5H
 chF1SxjG979QTxI/ACUPfPSAran9O6YAGCM31gw0JKYmoM8mFLzwsfInjuvL95Ra/Z79
 apFOK2cBgU/GrGQEx7i+6Xcnn3Jd5U7VqD4eSctJYPryAYWAbvwHlmZ8D8F5qtQlNf4f
 RxRVpxBIY7zYB6I+Mg16GCiucjp1UkH+51GQ5D5lyeD4QDmTlUXHQqQE2tflCWbOodZL
 sJfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f02iHiXD
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.6.0
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
index a3d2a6be6c..cb989131a3 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  974bf7f07d52f92dd29485b6e7529aac  cssutils-2.5.1.tar.gz
-sha256  b4a4da58e78326ec9f4a9d3555004ddf706f3e99f7a1026c1880f0934362b8b4  cssutils-2.5.1.tar.gz
+md5  b01ea364e79eada181c3ae46d69249af  cssutils-2.6.0.tar.gz
+sha256  f7dcd23c1cec909fdf3630de346e1413b7b2555936dec14ba2ebb9913bf0818e  cssutils-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 3acf26b3d5..fff9e393f3 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.5.1
+PYTHON_CSSUTILS_VERSION = 2.6.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/bd/f0/d3a02af54f292fe9d1f6bb18c7d2f79992b5cbae0db1ee91e5c73a3c7d7c
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/43/d5/505d96b7456fd334f8b963c05bd9425dacd317e209bb9adf103613339325
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
