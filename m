Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C64FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 19:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A79D80D6B;
	Mon,  9 May 2022 19:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLGJS21Q4xWU; Mon,  9 May 2022 19:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292B880C8C;
	Mon,  9 May 2022 19:06:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5A1E1BF23C
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D102860AAA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDUbddic2Mni for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 19:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A29C60A88
 for <buildroot@buildroot.org>; Mon,  9 May 2022 19:06:54 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so162993pjb.3
 for <buildroot@buildroot.org>; Mon, 09 May 2022 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4slR1ZJ4mLhd0XkOh86h3zYVghrvdrKsYXoTrF32Bk=;
 b=MZOoty5jAuzxpeipJnrzBnKgwoHYqlf4pLG1jqUCS4EdSCCnDmwFHGE6Xkj4sHHVto
 BRI8f+EdGsbq8jlqCryfQzsXHaGgLpGt4xv7KxFS8/QgHtDWezlgfvetUuhmWwNreK6x
 9+FHtpgxwxcpNt6yghYByjfnyXOP8i4mMuVMZPd5089Y24+mI4mkb54hFQO+bLAWL+gl
 QwqSP75VDQuWdi2cP4QZtvLHs1zSHCfGoMk5vEW4mHUDtY0Zk8V37uq+uk0OJPjFjaEA
 XgA/kUrt3TQxE3sWi/yzSQTupS6YXRFsLBnVBiwNLrpgY+dr0bnY7Sc/cFYR0lwQ8a9+
 bhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4slR1ZJ4mLhd0XkOh86h3zYVghrvdrKsYXoTrF32Bk=;
 b=aUfdhU6FZPJHmHdkGN8EiSiY55aEFfnbNeI8KkyrM06f8XsUDOxK0xIyH1VVM2QD7S
 Sp40A/8Aa/OeguIo/37TtGOZJ2prKsCCKZOu5oHnpzFnO/uBlhoAgR/gsp1TYl5rHdxC
 CsB70Ge3xrRE1WjjB3t6cUydFSHBws6AQ8mcRfo1UBgW39Of5G/I6muiH8nHm4nZs1yM
 MVhME8D7HPUzWee9YVOE8DrYrE2jVIKxE6ewWjQ0GH0F8IN4bZvhrXcyC5x+z8xSQobH
 gE5fwp5U1+b2ebaX0xlExy4mu/XtcGRo5YlVoeTP9S3Rtuf8hzyxQMkQAnmGgTSxVt+m
 meKg==
X-Gm-Message-State: AOAM530CwlvQO8TzwyLJj01aCf6Kidcq2sE5gEUWFudWYrZ5uFRbc5X6
 ztAuSONz4Ks/qq6ABAl6T3vrOVReX71o5w==
X-Google-Smtp-Source: ABdhPJzY+VjIVhTo0OdTjU4D+rDgnJyMrmpwowN0smakMQAKPCNcpTaqCwOAnivIW6CtztKMuw7NNA==
X-Received: by 2002:a17:90b:3812:b0:1dc:8502:2479 with SMTP id
 mq18-20020a17090b381200b001dc85022479mr19554873pjb.97.1652123214267; 
 Mon, 09 May 2022 12:06:54 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a056a000d5c00b0050dc7628148sm8952408pfv.34.2022.05.09.12.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 12:06:53 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 12:06:49 -0700
Message-Id: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-orjson: bump version to
 3.6.8.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 5ef2726d82..2c00164702 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
+sha256  2b0259ff26455c4f9ad2290b49ba184a35e98eea4839f0d6d5c2b7d91383b3d9  python-orjson-3.6.8.tar.gz
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 5de4b2c5fa..cfcaedc280 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.6.7
+PYTHON_ORJSON_VERSION = 3.6.8
 PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
