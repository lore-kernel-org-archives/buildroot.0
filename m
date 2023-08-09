Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36FBC001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C0E4192F;
	Wed,  9 Aug 2023 17:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C0E4192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tg7et1PsriGy; Wed,  9 Aug 2023 17:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF4841930;
	Wed,  9 Aug 2023 17:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF4841930
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A04A01BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78732418E5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78732418E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A10P9i4JD248 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:36:03 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75534418DF
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75534418DF
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B248A4C1114;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3w-0001yu-0t;
 Wed, 09 Aug 2023 19:33:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:30 +0200
Message-Id: <20230809173334.2514813-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=1gWkktNSM5hl8tIF/WQAm5ro90EGILezEAZaNQhv9wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DiBq6aXi2TVsnt6iIeAvUgrPcGBJJIzD7PWzPmBqKaMKsZn97LdJh3KUPV/VZhXmK
 hfToyLiqFjYsOYvfE8LV046uxXf671rKnDdEkGoSO+zWQnJQsxhE2UcX6yRZ2XtRC5
 6GmybzOllMhKWyemNSSb7Tel2JOSZ9zteXM6tuQaO2LE0ecTo2ivL+dzUwE5K+4u3R
 thAdYEvdu4f/tF6iJACgTR8DM4lpn1+Wh+k+frL7dadqW/+vigrHUSaTAh2vehUVYT
 +N47w9xT4kQIwpMsvIs4MtvBDE408KzmFjDNc5OYvM/PcfDU9ttE4oKKZMA8lK+eVQ
 r82Aivrni5PhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DiBq6aXi
Subject: [Buildroot] [PATCH/next v2 12/16] package/python3: use upstream
 build system to disable CJK codecs
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
 .checkpackageignore                           |  1 -
 ...-Add-an-option-to-disable-CJK-codecs.patch | 30 -------------------
 package/python3/python3.mk                    | 15 ++++++++--
 3 files changed, 13 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 7fe885589c..c6db6f21c1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1221,7 +1221,6 @@ package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
-package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
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
