Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129AC04E69
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B66B81D21;
	Tue,  8 Aug 2023 18:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B66B81D21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D63bwoP4_RMf; Tue,  8 Aug 2023 18:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B24F582127;
	Tue,  8 Aug 2023 18:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B24F582127
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1E1E1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB78460D80
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB78460D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cg8EF0GcFiww for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:53:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3F6E6073E
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F6E6073E
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69D4AA4C110E;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnS-0005AS-0U;
 Tue, 08 Aug 2023 20:51:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:04 +0200
Message-Id: <20230808185108.3787835-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=MclIIOGipNYPdJ0dZryo7gICCoxUIuGrUahX2t7p5rU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ju5sajsMWTPVPkkmUnWYpwIyv6BwBtxYwU/qQP07x9HfnBc4atVDXFzXAr6qD3QIn
 q2XLHzaTDYx0rrV+m6fSC5c5fNhnHeG4rIC+16At0sDhAeeadOzst8In8Bk+Pm2Ic6
 1ZyUixyvMiwxWnCvpd2v0EkeRmSgBePX2gA9+c3Vjv+dhIEQzzrOAjswZQpbIzAdrO
 ah7x+HkbK2Vb1SWaHCobuESOqQgxKlobbAcEymU0Ur3ASG9zgTLArryFCFBXYhDAqO
 a/ZwSWE8OvXodnGZkC/BFm6ZG9x7X8tkPTsmxfsDZYmPIgtu3LPmTlu/VGCuToutkZ
 AUfXIw4p4Lwgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ju5sajsM
Subject: [Buildroot] [PATCH/next 12/16] package/python3: use upstream build
 system to disable CJK codecs
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
 ...-Add-an-option-to-disable-CJK-codecs.patch | 30 -------------------
 package/python3/python3.mk                    | 15 ++++++++--
 2 files changed, 13 insertions(+), 32 deletions(-)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch

diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
deleted file mode 100644
index 63a07fb514..0000000000
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:55 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 201cad0bfc..ecdd7dbc07 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_ARG_ENABLE(codecs-cjk,
-+	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
-+	[ if test "$enableval" = "no"; then
-+		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
-+	fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ea65a0c66b..35f9c286af 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -25,7 +25,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-codecs-cjk \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -41,6 +40,12 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__curses_panel=n/a \
 	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -126,7 +131,13 @@ PYTHON3_CONF_ENV += \
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-PYTHON3_CONF_OPTS += --disable-codecs-cjk
+PYTHON3_CONF_ENV += \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
