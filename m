Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C2C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DFB409B3;
	Sat, 10 Dec 2022 20:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DFB409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXnqzZnL6Dfx; Sat, 10 Dec 2022 20:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC579410A0;
	Sat, 10 Dec 2022 20:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC579410A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB38F1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B9F410A0
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B9F410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOffaXj8oFho for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62456409B3
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62456409B3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:33:08 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id o13so1580671ilc.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh42TsQgfe9EeQZFjk3aMfLAuQX/T4N2RImO7JYDqwM=;
 b=y3/k1DweAUYNlKn07qu4kzHbtVrrnj1ztm7s7jOCD4x/AF28J3RAjWkiqijqUsDTf7
 QIcL4CuT/9qXsgNbxxALNxH4zk1U9d788iffoq2EXyooW6JIQZcEZYPEV0hnUm/r/F3i
 5GPkZ1R5Ee+slLGNseMmXUxIkYQvKxc6fbquCUnz+Q+kb9PBK2Eo+6Mg2AyzlcYB8ZG/
 eBpWui3bb3KXCWyOvLhz7BUd+fbY+fBPmhyUs7TwpIO3w6vokOwmRHI4PrASt9A2gEZG
 InNfrKzRSd3F8Ik1UAPr4brKGfNQZKjr0eNoPJIXzRT561nU9Ak16JWfSv9ULHA3Welj
 VZ2w==
X-Gm-Message-State: ANoB5pl81dUUnYxazTQbNuPj6VQPT6dGMWohA3BT0K7SXYR3SnB12hYN
 y0lNFmS1CceqWf8mtFDvDmyhFXERjWgC9JoI
X-Google-Smtp-Source: AA0mqf75puL1JzLo6VbWg1YprCw6L/igx+4shnDppiiy29z18mlmqJqidWUOc4qysMtnGfimKrybqg==
X-Received: by 2002:a92:d205:0:b0:303:11da:8d5 with SMTP id
 y5-20020a92d205000000b0030311da08d5mr5746686ily.6.1670704387259; 
 Sat, 10 Dec 2022 12:33:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 t10-20020a92cc4a000000b00304aa34b405sm606739ilq.81.2022.12.10.12.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:33:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:33:05 -0700
Message-Id: <20221210203305.3569369-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gh42TsQgfe9EeQZFjk3aMfLAuQX/T4N2RImO7JYDqwM=;
 b=KjH5Rn7XhNEFKAcXFdTda4mlGHMLH5R4GH4EwkbmLFDNFvyj74cSDK8qwE17Pg7bUj
 3k9IeP6MHUL2Eguf/Lelfui3cbIIEE9pfdv5AK7AO0lwG+M51c9NZiJBA9CcHcOPnapL
 E9u+diEakXzZO/LyuM5yPWPn//Nqsu9Kh5ZRAeClrvC9EHD24cF2rGZnAZZ/juKG/D5K
 gI2VhjK0+V7HmlSn4VZjUl1ya2IV8U2wxr3PU1zaDTQmTOCEVE5578PHcOJKLJhNXSoD
 CIhey5EuFOWMs6Jh9NZGMum5FLP+LXCcW0IrOwZ0D4+RIVOama7SYe+Dtc3f/wvHNUIU
 vvww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KjH5Rn7X
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 1.11.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 729ffe94c4..2aa739f398 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  7f31bd0d6d968c711f8b1d928836eaaa  sentry-sdk-1.10.1.tar.gz
-sha256  105faf7bd7b7fa25653404619ee261527266b14103fe1389e0ce077bd23a9691  sentry-sdk-1.10.1.tar.gz
+md5  4980e01dc73c6bcf794b0b7d3f3e08d7  sentry-sdk-1.11.1.tar.gz
+sha256  675f6279b6bb1fea09fd61751061f9a90dca3b5929ef631dd50dc8b3aeb245e9  sentry-sdk-1.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index d8e9e8a2c9..056a015952 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.10.1
+PYTHON_SENTRY_SDK_VERSION = 1.11.1
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/43/37/89598a56119199b69a3c4b13e2ce1b57ff69f68313ed393016086d6b487b
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/a3/d5/db26377e9817407ae8d7b65e15b3c3b8d817c301633be15bd2aef61f38a3
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
