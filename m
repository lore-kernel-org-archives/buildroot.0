Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F61FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 19:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6DB822AF;
	Mon, 20 Feb 2023 19:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6DB822AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_xON15CECZS; Mon, 20 Feb 2023 19:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2360A822AB;
	Mon, 20 Feb 2023 19:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2360A822AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEC8F1BF321
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5F9A60FC9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 19:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F9A60FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EP5CqAxlnK0F for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 19:21:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773D86100B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 773D86100B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 19:21:30 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c12so2260057wrw.1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 11:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9a3dUIdATQU772Y3dXR7mvrw87VRRF2Ej6jQ9jOfcm8=;
 b=pFqaTAcRrKadwVSTkfe7W9mPmyHFUJt8hy+GEQ1rMJmDmiuFU3UXKctQLCfWTX1zdY
 GMSMl+7QmqMLG5rWRBYQPYXpQ7LrHFB7hn/+KVbBr5ualtIw/H3FWmwq7SU/I6L4KVty
 1t6c4TdGwaZP44SBv/EE418q4m5+txa3/bM2niXON6s6IXKdN/0k62fF7XsQBnKCMDbm
 FgejRp3DuYNHRMb/stAAvgeICwnhwoBmBLF8vWnyW2zABzK3rkpHfGnnYc82RQ7xMM2A
 M1vmcbzHlBHBdDJIIXlAba1G+pMpZtUY0+uQ28NOjzgvroRv3G9VSXQrUQb+KZrjztCs
 1pag==
X-Gm-Message-State: AO0yUKWdJsN0bkLs/qNyCPSYqffIROtqFXG3YrSfu6LKTp3ZfQX8smNX
 bZFugiCFOEtUPPvz+XzL049OyB6L0X8=
X-Google-Smtp-Source: AK7set+UfCAuAbCIC9Z2sO1DurBLqwY//XDJpxxONF2+F7Hqve+4e/YOGXF+pu1HyQb899m+xKolug==
X-Received: by 2002:adf:db4c:0:b0:2c5:4a89:f60b with SMTP id
 f12-20020adfdb4c000000b002c54a89f60bmr2464234wrj.38.1676920888223; 
 Mon, 20 Feb 2023 11:21:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfe546000000b002425be3c9e2sm2029955wrm.60.2023.02.20.11.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 11:21:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 20:21:25 +0100
Message-Id: <20230220192125.555632-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9a3dUIdATQU772Y3dXR7mvrw87VRRF2Ej6jQ9jOfcm8=;
 b=kFEVTNMKBCSqUWbrtLp3q65eh2MiYz1TFXtsdZo3ZQABzQNEoQExf9JmagZxsdvrGl
 cHSy3ByDzl3/pxbAl2FAJqgUSaBSwXPOq+/D1wEbFuTXZxn4LafJrKPDMuGOplxXMr5h
 BRpEOou6iSkqwjN9++tkXz6DKMxKhxnyTFMvYdx+XoeASdMvEvS4wL6ZfVPfmMv9TpGP
 wtaD5qk7sbSuAXKgU7EwX89yhmk6QAyl3wsr05auz8BczXfNFftuQ3++e6tlTri+1uLR
 v3bZOZ98pe6Eaiye/5pM1N3pcZcPJjk0f46BLZEZ6upbGUPkkPeCaUVfhG48T4RtMvRb
 eOzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kFEVTNMK
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix uclibc with
 libiconv build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace patch added by commit 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
as current patch is not correct, build failures are still raised by
uclibc-ng with libiconv on fwup/gvfs/...:

configure: error: Requires libarchive. Libarchive must be built with zlib support.

[...]

Run-time dependency libarchive found: NO (tried cmake)

../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency lookup for libarchive with method 'pkgconfig' failed: Could not generate cargs for libarchive:
Package iconv was not found in the pkg-config search path.
Perhaps you should add the directory containing `iconv.pc'
to the PKG_CONFIG_PATH environment variable
Package 'iconv', required by 'libarchive', not found

Fixes:
 - http://autobuild.buildroot.org/results/05a5496495e51da2c9caf7570695cc95e1745e30
 - http://autobuild.buildroot.org/results/98dc4b415115cca65b53e4cd986144ef85bf17ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...y-add-iconv-to-the-pc-file-if-needed.patch | 44 -------------------
 ...o-not-add-iconv-for-Requires.private.patch | 28 ++++++++++++
 2 files changed, 28 insertions(+), 44 deletions(-)
 delete mode 100644 package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
 create mode 100644 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch

diff --git a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
deleted file mode 100644
index c93944f789..0000000000
--- a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1f35c466aaa9444335a1b854b0b7223b0d2346c2 Mon Sep 17 00:00:00 2001
-From: Peter Pentchev <roam@ringlet.net>
-Date: Thu, 29 Dec 2022 00:04:40 +0200
-Subject: [PATCH] Only add "iconv" to the .pc file if needed (#1825)
-
-Hi,
-
-Thanks for writing and maintaining libarchive!
-
-What do you think about this trivial change that does not add "iconv" to
-the pkg-config file's list of required packages unless it is actually
-needed? On at least Debian GNU/Linux systems, the iconv(3) function is
-part of the system C library and there is no Debian package that
-installs an iconv.pc file, so I had to make this change to the Debian
-package of libarchive.
-
-Thanks again, and keep up the great work!
-
-G'luck,
-Peter
-
-Downloaded from upstream commit:
-https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99bff20d1..e2715cfde 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -378,7 +378,9 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-+    if test -n "$LIBICONV"; then
-+      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-+    fi
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
new file mode 100644
index 0000000000..91903866ef
--- /dev/null
+++ b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -0,0 +1,28 @@
+From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 14 Dec 2022 09:04:39 +0100
+Subject: [PATCH] autotools: do not add iconv for Requires.private
+
+There is no pkgconfig file for iconv, thus things break with this
+change. Let's drop iconv from Requires.private.
+
+Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
+[Retrieved from:
+https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99bff20d1..f245d0c55 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -378,7 +378,6 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
