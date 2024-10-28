Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D2D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1C2607B5;
	Mon, 28 Oct 2024 01:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlelEqDE87P8; Mon, 28 Oct 2024 01:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAE1607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAE1607C0;
	Mon, 28 Oct 2024 01:48:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD744EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ADD28128E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EnvqL8BMypW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 845EE811C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 845EE811C6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 845EE811C6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:48:00 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83abcfb9fd4so141626639f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730080079; x=1730684879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i651VmdL3GWv82ORdabSKx6LbKXhcoUIWoYlKXq2Cm4=;
 b=A+0UcE+tZudZp3M8RA/LJz4GBEILhLDlSeNaarorL6ulGgatAd/ZiXxNkH4TBucZUD
 HDmDgZ8qDzRSUjcf3LTpnPbWaxaWFLuW0mUEzq2ebqmCl0O3e3iakLdV4FR3AHqri235
 xfMw5smiY0mChtP1AcX7ILZFkkv9Y6X8LWu66iO2HumuIu2+6VpgFd8FTG8hgt+rWOrt
 ThBPdSFCdY/nonyV/nTcIBvCLNyMuSM+E4EOY5oY8jZfSGKv2Ym6/0gU5V2tlayjx/4x
 8e5wvmTmT1R9A9TlIRbtnqVxIAkNLfNKEee3x0u0KTxTXtLXKBWqMhh9IEmK5l8Ysc1W
 7KUA==
X-Gm-Message-State: AOJu0YzhEaC0jVSF8/1OyEwORESeMoDmCesgyNQxEqIBTvcUcH2pMkDM
 VN7jKfQlO9Ar8x7aUjfrZPF6ALtyPyA8Jq5lHDuX5pLshrb2qLKaUN9+rQ==
X-Google-Smtp-Source: AGHT+IFfDQAUPjjR1QmoMbOPg1MmAX/a/c9uK08ER1n4nlbtjVtiLVP51UwBW57jgeyCDqKVJBFM8w==
X-Received: by 2002:a05:6602:2dca:b0:835:4b2a:e52b with SMTP id
 ca18e2360f4ac-83b1c4c2db5mr585597739f.10.1730080078836; 
 Sun, 27 Oct 2024 18:47:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72781364sm1405253173.140.2024.10.27.18.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:47:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:47:55 -0600
Message-Id: <20241028014755.4142535-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730080079; x=1730684879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i651VmdL3GWv82ORdabSKx6LbKXhcoUIWoYlKXq2Cm4=;
 b=guZoM1rwHNuvhWORfSV8JzVFzRP4bupHPI6uIDEJDZ9Ofvd5GomEzod2sw0ZtA6Eh9
 FNO9RRUA6AMKuhlMoYek+R67MoxqQx0+tO7q6hiqgnj+o/lvVykkEEUUVNZ8fqKqrY/R
 bNosJTphuZG1V4brOY3UNtnJiZ4EhXFDT82z2hzOKUGmbofeMbR1T7LCrPDkrYWbKuSm
 aJS4onOYcBP7nMdYgltiMUxEvqFcD2QEP0QMjfil7fn1qMEM+/AfdhoVBuPuGYkc0lWI
 LDA7ELBuU1uoQ7M/XE0uklY2MGCM2mABqGBj8xcp5Ja6yCkDcwvnXnpq1QDFK3pd0vkb
 Oexg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=guZoM1rw
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.136.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Drop no longer required python-async-timeout runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zeroconf/Config.in            | 1 -
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
index 69ea81d93a..1570674f59 100644
--- a/package/python-zeroconf/Config.in
+++ b/package/python-zeroconf/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ZEROCONF
 	bool "python-zeroconf"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_IFADDR # runtime
 	help
 	  Pure Python Multicast DNS Service Discovery Library
diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index dbc54b1e1c..a40bbacb5e 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  c4d49cca10d8d10f12e9152d6380de35  zeroconf-0.123.0.tar.gz
-sha256  c50f24c9a7a6c7ba4bb301defad03a9d85dffb3ee280953de44eee9f432f2550  zeroconf-0.123.0.tar.gz
+md5  f72c481e45177fa6811822d65881b95c  zeroconf-0.136.0.tar.gz
+sha256  7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf944320b5f3519586bbc82  zeroconf-0.136.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 726d874034..970633c269 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.123.0
+PYTHON_ZEROCONF_VERSION = 0.136.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/db/47/85eafb277f6ef78e1a1895cc72f0035dfa6a5e51396134eb9ce21564c72f
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/82/e4/17075a9f1951b031dfd92d57916505574e0d1eab3f2fb7deecabd2be581e
 PYTHON_ZEROCONF_SETUP_TYPE = pep517
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
