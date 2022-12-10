Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C046BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254B140AB9;
	Sat, 10 Dec 2022 16:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254B140AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_al8agQ5IXT; Sat, 10 Dec 2022 16:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D7DC40A02;
	Sat, 10 Dec 2022 16:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D7DC40A02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCC971BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B0840A02
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B0840A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UG6dbvdlqI7T for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890ED409DB
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 890ED409DB
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:24:23 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e189so3660093iof.1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEQYupUTeX1n6pvDxYgYQ5MZ7BjKMVdQ8pNLtq7ICfs=;
 b=bD74Q5ILNc6YFUoetUASKPb5Teqm3P5wE1koqOSyGWDQkn0yBe3oGiEpkwawsbrPsi
 oQVtVX0ZynQj43oJqZNxmbstmp9eB9Em4CQKl5sW8KzlOciRq8idBYSdbAZayIaVy93c
 xkgUSz7RFBCSimQXo76R6GdbcyUY8kkEV2HwseTwyKki4JQ25CPtEBHwh3bRW4c6kZ3Y
 ejlrW3KNs3lYygLXuZHtTGGJlxUluyrlDly6ZIN/591p/9G5WhUo8RNDD8bfrmrYOMuQ
 GTH5uZ75h5nUNrB8AeKdAAUAbELiVAg2WwQHhoqmMh1U2YF8RTCbu0lDUMUxOFNAbxvR
 xPKA==
X-Gm-Message-State: ANoB5pkTfpwQFNSYIWbmySpE2GZCD63slSfndZ+j1mLWg/vBtA2QhFN5
 nWQtRoruwZPdGwAYeJGOCF+haCxWeYK48Q==
X-Google-Smtp-Source: AA0mqf5iryCv1DvrYuOfvtAMweWVudKSDwsZNkvqSJBaHutF7NhXRX5G+kNoMK7chT2Jbaf3UlWZfw==
X-Received: by 2002:a5e:a713:0:b0:6bc:d71a:5701 with SMTP id
 b19-20020a5ea713000000b006bcd71a5701mr5860672iod.3.1670689462388; 
 Sat, 10 Dec 2022 08:24:22 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g25-20020a05663810f900b00363c2c5f229sm1520311jae.128.2022.12.10.08.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:24:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:24:20 -0700
Message-Id: <20221210162420.2472391-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gEQYupUTeX1n6pvDxYgYQ5MZ7BjKMVdQ8pNLtq7ICfs=;
 b=kI20KN8r+TF8ucS9RNh5IGWnFqZn8Bhw3aGAMnkBVPpVjuFx5AXDbnHb0UsKeddnLt
 XyxdgW1wq4LMifOlb2SMuVXDtd5apiETHG5hkoTDkDUw6vh0PulUYrXQ6Wap20tCO1fI
 +xfwVCGt6bUOVCJxvjmO9tj/QqGDaDA1M85kk7ouyr2anCysWuS4qzKP+rZ5ZEXAAU15
 TItUp5qgI7H7arQoav3W5luwxiomKZWfVLiKmJNpjcxZicIoEJG+L4V+A5o2ao+g98CG
 nVqDNr0u7dOfHMZg24k/oF+Uu576RXioLm9L36/aU9YuEB9SH5ZWcCoqoV1n1ZcOusqm
 sCOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kI20KN8r
Subject: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 5.1.0
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

Drop setuptools runtime dependency.

Update description as python 2 is no longer supported.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-chardet/Config.in           | 3 +--
 package/python-chardet/python-chardet.hash | 4 ++--
 package/python-chardet/python-chardet.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-chardet/Config.in b/package/python-chardet/Config.in
index 869888cfe0..59e7cbfa2c 100644
--- a/package/python-chardet/Config.in
+++ b/package/python-chardet/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_CHARDET
 	bool "python-chardet"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
-	  Universal encoding detector for Python 2 and 3.
+	  Universal encoding detector for Python 3.
 
 	  https://github.com/chardet/chardet
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 7721814279..7887dd769d 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  8013c248c098e165ac53d900e1a1278a  chardet-5.0.0.tar.gz
-sha256  0368df2bfd78b5fc20572bb4e9bb7fb53e2c094f60ae9993339e8671d0afb8aa  chardet-5.0.0.tar.gz
+md5  394bd03d7a258d2771040bfbd5a7bf66  chardet-5.1.0.tar.gz
+sha256  0d62712b956bc154f85fb0a266e2a3c5913c2967e00348701b32411d6def31e5  chardet-5.1.0.tar.gz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 1d737891a0..42646aa513 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 5.0.0
+PYTHON_CHARDET_VERSION = 5.1.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/31/a2/12c090713b3d0e141f367236d3a8bdc3e5fca0d83ff3647af4892c16c205
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/41/32/cdc91dcf83849c7385bf8e2a5693d87376536ed000807fa07f5eab33430d
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
