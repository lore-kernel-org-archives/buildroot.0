Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 17:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D72812A0;
	Sun, 30 Oct 2022 17:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34D72812A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyoMAIR52Z8s; Sun, 30 Oct 2022 17:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A8881292;
	Sun, 30 Oct 2022 17:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A8881292
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D820A1BF402
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F954031E
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F954031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaKasuzkUAyD for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 17:56:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1EF4030C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F1EF4030C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 17:56:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v1so13073352wrt.11
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JmDYJq2J8cY9g90K4tAddswBqSxVuPzo0mm3tJTgSM=;
 b=Q1xZziOh8p3804zJg5Mp0lkbNGwmR7RvthocaSehrj51i5eDaN47Wdmz7DIjeE4MF4
 3cA2Dd2Qjw5l5z3sb7PhnSfkQWVszsXA3kK2UuLl6OFG0SPirWqmstzjRAbdKVPQ3YMC
 kVAce/dPErpExWsAdOFzNBmyfrgeGSX0DlPtj1Ee8+U6gLEUtGZmZqC9xZ+2AQTvQIxn
 bazDTntBrGnOcdv+RQV2FrCu/VEvXgPKgji025Hnubd3BojK2ueUSdWx8TisDRomWQ1H
 8AIT+iZMmY/K0XoZ6kB5Okm+YTUFj0AGgHxguEhFFfpagvpWeBA2NHLPgpTlL5HGneIo
 UvoA==
X-Gm-Message-State: ACrzQf14JRcbQiSxLWsvEmICZFOQW2H70dQSY0SflUP1l+0tNOSWsqKR
 kLRq76Kc6zI1zXnastUPZkeCB+Hev7c=
X-Google-Smtp-Source: AMsMyM4rXWrvB2UEEhKASY1PW867nDtwsytXG5Pf1QvmTPSQ3e5rP0awmO3ygKtj5Qv3ZWdNxwYutA==
X-Received: by 2002:adf:f511:0:b0:236:60be:e885 with SMTP id
 q17-20020adff511000000b0023660bee885mr5456338wro.663.1667152594853; 
 Sun, 30 Oct 2022 10:56:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003c71358a42dsm5398764wmi.18.2022.10.30.10.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 10:56:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 18:56:31 +0100
Message-Id: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2JmDYJq2J8cY9g90K4tAddswBqSxVuPzo0mm3tJTgSM=;
 b=T5HWq0UDjapOUYLyEMbTuE9YfDWe9lOxEzKqjpsUTYXTuJaDIqSXcE0Z0UVhPRjOlS
 6vbq1TvfGYddLmY4/SeBplqHTMf0A9SYja4vi2eO1I1y5EORq8FHgfR00uS+a/UjL7qA
 qAuy+jrBef/QnIXvbi0a3/Eh0IPNK6mKvCRC2g//r611AGz/p+QS6vuc0QKh6ERwVJyU
 /rAetdksEZDY+MCNtOwGyxMXBewfWPwvDZgh4eYM+AHbT3J9ms3B2FCvwNUJq+E71feu
 RRDVBJNJy8pFMgtJvVH7eL+Qk7wEurkb2+9d0/c1qnDxZXexMgchTy6xnhsjE0FadGK7
 MPcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T5HWq0UD
Subject: [Buildroot] [PATCH v2,
 1/2] package/openipmi: add libexecinfo optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add libexecinfo optional dependency as upstream rejected the patch to
add --with-execinfo=no

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Add missing local patch

 ...igure.ac-add-without-execinfo-option.patch | 55 -------------------
 package/openipmi/openipmi.mk                  |  6 +-
 2 files changed, 5 insertions(+), 56 deletions(-)
 delete mode 100644 package/openipmi/0002-configure.ac-add-without-execinfo-option.patch

diff --git a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
deleted file mode 100644
index e1838a06f4..0000000000
--- a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 388033e3d0129510c3884333bc428cefeb75e0b8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 3 Jan 2022 23:27:21 +0100
-Subject: [PATCH] configure.ac: add --without-execinfo option
-
-Add an option to allow the user to disable execinfo to avoid the
-following build failure on musl with
-https://github.com/mikroskeem/libexecinfo:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'
-
-Fixes:
- - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/openipmi/patches/36]
----
- configure.ac | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 607864b9..f369166f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,16 @@ AC_ARG_WITH(poptlibs,
-     POPTLIBS="$withval"
- )
- 
-+tryexecinfo=yes
-+AC_ARG_WITH(execinfo,
-+[  --with-execinfo[[=yes|no]]      Look for execinfo.],
-+    if test "x$withval" = "xyes"; then
-+      tryexecinfo=yes
-+    elif test "x$withval" = "xno"; then
-+      tryexecinfo=no
-+    fi,
-+)
-+
- # If UCD SNMP requires OpenSSL, this tells where to find the crypto lib
- tryopenssl=yes
- AC_ARG_WITH(openssl,
-@@ -275,7 +285,9 @@ AM_PROG_CC_C_O
- AC_PROG_LIBTOOL
- AC_STDC_HEADERS
- 
--AC_CHECK_HEADERS(execinfo.h)
-+if test "x$tryexecinfo" != "xno"; then
-+   AC_CHECK_HEADERS(execinfo.h)
-+fi
- AC_CHECK_HEADERS([netinet/ether.h])
- AC_CHECK_HEADERS([sys/ethernet.h])
- 
--- 
-2.34.1
-
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index b3a4d90d4b..81492ec131 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -15,7 +15,6 @@ OPENIPMI_INSTALL_STAGING = YES
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
-	--with-execinfo=no \
 	--with-glib=no \
 	--with-tcl=no \
 	--with-perl=no \
@@ -26,6 +25,11 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
 OPENIPMI_DEPENDENCIES += gdbm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+OPENIPMI_DEPENDENCIES += libexecinfo
+OPENIPMI_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENIPMI_DEPENDENCIES += openssl
 OPENIPMI_CONF_OPTS += --with-openssl=yes
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
