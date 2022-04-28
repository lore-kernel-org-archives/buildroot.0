Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 19:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B49F831C1;
	Thu, 28 Apr 2022 19:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdznvOSE87dt; Thu, 28 Apr 2022 19:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E0D818C0;
	Thu, 28 Apr 2022 19:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5570B1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35FBD60E69
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njevxpsUv6Vc for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 19:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F28E660B68
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 19:42:35 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id f2so7341209ioh.7
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dbS2nRv5JFCWSrAW4ytS8TxqC2g+Egbwz06uU3CFiw=;
 b=d+qSod/EFdCvhbvNyF/K5yj2H7cnC844K/V4xb8f9vEyx757bMPhNJkxUaVT4YqdpN
 86lm1M46bRZdSVmDr7Zaw5aM0Hla02aZnVlviPFnk/Ot80+2QT3FwCr1s/8/stLvVmPX
 tz65DI2iTtq98UVyTZc6pr9wm/wtqv4r5EGnbawCxWzOy5DQLV/x8AN3mS9iAkOCELgM
 Ay1X2weQO1CZyfEHlT1Hg3CNt1TIalc80XzBA2qNDHLGaTT2TJ3FGfkVC86qT2kPnTrk
 XPaynthbGwkEhv4WtmHuw5NZTfzZC0AnjN66MkZJnr6Zs/1+D1FjnTgLt90V0bVPBKjz
 nzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dbS2nRv5JFCWSrAW4ytS8TxqC2g+Egbwz06uU3CFiw=;
 b=7DW9T2FCtEfkOmhc0tic/INVkpYxK9eImUKMwaZuaqdihE8ZKQ5Z1nDSjwunIMEd+q
 ilZaQrVKqL9MDSg/++LkKcoI02xLpan80ENcj6L4t4z3+ov22fwwD/FLV/vjJnwCOKow
 2QG/pV98kfF+ECLn4/OVmy1DuD3GLszXxkt6KPH0wvoFYQCn8U1sLfJNdp8C/UjvyoPc
 j/5WKieROjfZtToNCKfTW3KkZ2IWxwcFUjMMzEzf2Eo5DXJMOMDiWeYDfuIfLFoQFUAd
 DTrX9HR8TFUHL6BGXE4w2RzBi4bH2xXndVB0pKVujDOLhonRy4iq7WiQzSi1d31f6PAk
 VkAQ==
X-Gm-Message-State: AOAM531pjvmcz0G/I8gyuOR8+VwN/nnAdFM0nwmjo6IgwdnCnFR7xnYj
 KL5rwfpqKYmJsSBSftIuxk1yZrIkOBI=
X-Google-Smtp-Source: ABdhPJxcuh8Q5f3MPe4b/OTpDEXyNaluhaneD1O/btDvzKja8j3vShzRBDlpAsUWh0eYTToG2ofGAw==
X-Received: by 2002:a05:6602:26cd:b0:649:2bae:a63a with SMTP id
 g13-20020a05660226cd00b006492baea63amr14855816ioo.148.1651174954701; 
 Thu, 28 Apr 2022 12:42:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 f5-20020a6b5105000000b006572915097asm486710iob.35.2022.04.28.12.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 12:42:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 13:42:32 -0600
Message-Id: <20220428194232.775056-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 62.1.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 1a378d1b76..d4a9ba3d88 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  6c6a97cf68e1db789a2e5c054f067278  setuptools-60.9.3.tar.gz
-sha256  2347b2b432c891a863acadca2da9ac101eae6169b1d3dfee2ec605ecd50dbfe5  setuptools-60.9.3.tar.gz
+md5  95f4924aacd634ab579f17fc71f79fb1  setuptools-62.1.0.tar.gz
+sha256  47c7b0c0f8fc10eec4cf1e71c6fdadf8decaa74ffa087e68cd1c20db7ad6a592  setuptools-62.1.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3309cd9df4..c6a2137e1d 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 60.9.3
+PYTHON_SETUPTOOLS_VERSION = 62.1.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/14/74/54890935244ce053abcc4fa01ef4982a84743a8d128d4cf5eae56e2d156c
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ea/a3/3d3cbbb7150f90c4cf554048e1dceb7c6ab330e4b9138a40e130a4cc79e1
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
