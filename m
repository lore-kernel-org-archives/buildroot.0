Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D5EC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57FD81A6D;
	Tue,  8 Aug 2023 18:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57FD81A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqsKMgfOecnw; Tue,  8 Aug 2023 18:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB59B81756;
	Tue,  8 Aug 2023 18:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB59B81756
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C89441BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE94C408A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE94C408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rk6XESXNC4C for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:53:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94717401D8
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94717401D8
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32E4FA4C110C;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnR-0005AS-3B;
 Tue, 08 Aug 2023 20:51:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:02 +0200
Message-Id: <20230808185108.3787835-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=eAcFyvWpT1iuuK+qAgmnsuld6SrdX2rsGRtyx+SUAas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XddS9pFGTCMEFOz1TX/g8K+K9qEKoDOBSjqZZSUdPXk+NjBJ93FjBTAqvqUuyJ6ie
 bvinTGhBpBNNJckcFtxRBz7Q/r/J7kJIEYDC66PFY1JpLJbebX/C2AGjP1+uW1Ul2t
 ByHcEVqR8//aSdvX0grfGBn4ZnZDdBvfiB1HQ3LrwJnLvj9pb9AG6D4zFviHz+lmHD
 33ZNR4cev3TS86afDDhcbtr0e9VquzixRpbboucBrS6XUPtyU7OlgHue5GmgEf+WuV
 /uuEiAzCQuhEkzeDyV3a+SrjrbwWpdMTwq+rJNRPtFXaY5FG9iUH9hWsDJkXNf/t77
 TNYTpmmJLmfcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XddS9pFG
Subject: [Buildroot] [PATCH/next 10/16] package/python3: use upstream build
 system to disable nis module
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
 .../0018-Add-an-option-to-disable-NIS.patch   | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch

diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index 977955d1cb..0000000000
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
- 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
- 	fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e047cf8a56..324c35838b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -26,7 +26,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-tk \
 	--with-expat=system \
 	--disable-codecs-cjk \
-	--disable-nis \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -40,6 +39,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
@@ -167,6 +167,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -194,7 +195,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
