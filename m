Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E183C04E69
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066208210A;
	Tue,  8 Aug 2023 18:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066208210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0a6iPd_4QnDi; Tue,  8 Aug 2023 18:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D67E82089;
	Tue,  8 Aug 2023 18:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D67E82089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 828371BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B71D61199
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B71D61199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-CpPLotFVBN for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:52:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 904D961196
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 904D961196
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C0F7A4C110A;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnR-0005AS-2i;
 Tue, 08 Aug 2023 20:51:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:00 +0200
Message-Id: <20230808185108.3787835-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=O6nNt4HfyQO4gE/ge8DDvFteVIBLOkY9qfafyqNnggU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iIBykHv9D4a470DnVqj5UUYgPTgbIiY1nMH7YLch/ojq82JODdCGdab6zW4nzK6S7
 yPBBM05LGehMSoHhdGytIec5b1jjPxB+6SAmL1XoJOmPKYaEKE9KKPklSNCxUsHBLM
 2Wcpgeoorcq7urS3K/OOKfje5nd/+ACveYlheyP+IAZ0Aw9H9Kwdx84n5UfvvvtlOL
 oY3tOdDFUh+boNfk7TgEIfFnBLpNaAqpysFe6AOTESFzlejfoB4d/MNjUdjX/qTG9P
 T0GZMc2RwlWksLr1peVoaH1e2qOZBcHAYcnHxXoyLD2UL5pFq7YLhubo8yZ/Z+hbqD
 or2LDrOJGnFHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iIBykHv9
Subject: [Buildroot] [PATCH/next 08/16] package/python3: use upstream build
 system to disable ossaudiodev module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...on-to-disable-the-ossaudiodev-module.patch | 30 -------------------
 package/python3/python3.mk                    |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch

diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 56713a7f8f..0000000000
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 596bf44b56..4a2a19eadf 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -156,10 +156,8 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 # Make python believe we don't have 'hg', so that it doesn't try to
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
