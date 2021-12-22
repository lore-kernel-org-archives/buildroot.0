Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2275DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB7060B9C;
	Wed, 22 Dec 2021 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1H7t_WyChWD; Wed, 22 Dec 2021 17:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2D760E61;
	Wed, 22 Dec 2021 17:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7B9A1BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB6D4098A
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVaIoT6VGFle for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:16:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 659EC40273
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:16:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so6222176wrg.11
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyhTMGKJatuBemTpOHbSh13WzqyfmxAcOo+f+7NOyGk=;
 b=Vf9ykI3o7I7jTcyyDRluThYOhtLPtuXcnA15x7JID1eBYBtky5Kc1fnTivThSdlKsD
 pcsJANYprFI4CFaaryiXSA9ixx7QtE+0dgmRKQVwNQ93NXsHWnn3acLd5DHT+n3f7ZKk
 3S3sk1WzcC4rL/Yl8XaYlVXLCQcE2m8dsvEuu7dQzi/nS4WmK3BDXGBoJzUhIeIhAUaS
 05JqIwP35qjewerSiiIc/9ppZkd6PhjeURsA/CblEM5gsUKMk4BhuP6ODx0/HLoyPPpe
 asQMzro8JMJOTmMSaIGqoCKbKw2TKZ6m0FCtBL8YFLLHBMSJEakryRB9qXXGlyMMeMi2
 Tlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyhTMGKJatuBemTpOHbSh13WzqyfmxAcOo+f+7NOyGk=;
 b=zuFJWJliUaUTRZT7yB7pUjU1P4vFQwzTdmuykos49wi3dFL7jtM5FHTOxIxC17Dl6d
 H1rTZLGu7MGN1+D+Qbr4UTDWRRfFTl4/GfiMLE8H9BOhZtG/c1Pv4p685A8k7Hq7Xt5Z
 OJCoLHpP3qpOirWOx6GDV4TlKHEblYCWcd6gEGFBrnXmCeNUdFD1rmrpnqGBHCHFfp5O
 64zgI19QkuZAzzFBx+/LUpNHPkkzJC6Bc4RLBE1oRGAIL0LyL/N68f46Sx0bT56xnd/S
 Bicw5Q5kXTxngxGshlwPFsVcoE7Kl0dRghQIjYheES6p+FWMKReq7Uh/b20JK6kBt7il
 3fZQ==
X-Gm-Message-State: AOAM532gZZTBTIbIaPJszfYKupFsxmoXTlDoZvBse7mymD8o8atdy+3r
 g+uctbcU+irVtJlfpMdjiv3ZzZkQRSfJXA==
X-Google-Smtp-Source: ABdhPJwtCCjTdaRbPuztd/pZD9PRFGRIJPf7ZElwOKOUWwjNKTaTb9uWSa0C+Sbk/kbtmF72FanPKw==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr2691419wrq.178.1640193408272; 
 Wed, 22 Dec 2021 09:16:48 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id j85sm9595008wmj.3.2021.12.22.09.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:16:47 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:16:40 +0100
Message-Id: <20211222171641.306788-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lttng-libust: bump to version 2.13.1
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to disable building of docs and tests,
the tests cause problems unless the package is
reconfigured.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 .../lttng-libust/0001-remove-doc-and-test.patch   | 15 +++++++++++++++
 package/lttng-libust/lttng-libust.hash            |  4 ++--
 package/lttng-libust/lttng-libust.mk              |  3 ++-
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 package/lttng-libust/0001-remove-doc-and-test.patch

diff --git a/package/lttng-libust/0001-remove-doc-and-test.patch b/package/lttng-libust/0001-remove-doc-and-test.patch
new file mode 100644
index 0000000000..5077138444
--- /dev/null
+++ b/package/lttng-libust/0001-remove-doc-and-test.patch
@@ -0,0 +1,15 @@
+diff -burN lttng-ust-2.13.1.org/Makefile.am lttng-ust-2.13.1/Makefile.am
+--- lttng-ust-2.13.1.org/Makefile.am	2021-12-09 20:45:58.000000000 +0100
++++ lttng-ust-2.13.1/Makefile.am	2021-12-12 01:10:44.097204904 +0100
+@@ -6,8 +6,6 @@
+ 	include \
+ 	src \
+ 	tools \
+-	doc \
+-	tests \
+ 	extras
+ 
+ dist_doc_DATA = \
+
+---
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 40bd870e86..23839e42cc 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.1.tar.bz2.sha256
-sha256  48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051  lttng-ust-2.12.1.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
+sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
 
 # Hash for license file
 sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 608e8781b1..e9a1aecbc1 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.12.1
+LTTNG_LIBUST_VERSION = 2.13.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
@@ -15,6 +15,7 @@ LTTNG_LIBUST_CONF_OPTS = \
 	--disable-man-pages \
 	--disable-examples \
 	--with-lttng-system-rundir=/run/lttng
+LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
