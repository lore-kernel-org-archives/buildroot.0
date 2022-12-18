Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF83C10F1E
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 270FC60B5D;
	Sun, 18 Dec 2022 13:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 270FC60B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqZnFm1fKW8Q; Sun, 18 Dec 2022 13:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5959C6068D;
	Sun, 18 Dec 2022 13:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5959C6068D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3551BF3BB
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F4B4815AD
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4B4815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnincWGrgmYa for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:02:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF06C81516
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF06C81516
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:02:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so7103493wma.1
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 05:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Sg71CZu6791zzP8rTkLj6nnKMcmynoLo4UoldWpUow=;
 b=zeMFeIGgg4J419uIJI6pXlNfqPk0b8O3levKquK4fhF9LfZnS0KQu/riWlmDfBUN+p
 fHoXU6mNlvZ46xGMcTSQa1BWRMKKX7C6L5jlkl67QWzcHALbXaGJ/rwK/5dGkQKwAk7u
 5qK8KPP+gYfidTn1oFKRzt0ccanlMCnvzHw4eXGfV5nHhEU85AynzmDbfX7/npHJhD9b
 dcy1ayjo/a1RgGGLKqlo7ps5Aor1GVxnGD/NmCIe8wNJYBiLtxC+SXwgJZNYGpd8i0Ye
 5vTOR2QEr55CL0HKy6vA4EGgw2JzJ6v8Qe8lZwj7H7ajF6hu2rDD/vxL2QtYHz+sHHV1
 mTrA==
X-Gm-Message-State: ANoB5pmtFJGSw69mnKLoXcT5yFMbbC2SB4H9ntAsrtAN+GJ8ofzgKHTt
 /mLt8XFVijSlS+t3+azBNPx9FljnGF8=
X-Google-Smtp-Source: AA0mqf7FvZvNmUL9wHYd+T/lagexNi0Dg2WmjFVHrgCk2KpCTrfYY/RLM3rZpG4eYSa/YNsT9kuqlA==
X-Received: by 2002:a1c:f315:0:b0:3cf:a5df:8bb0 with SMTP id
 q21-20020a1cf315000000b003cfa5df8bb0mr30633815wmq.37.1671368549395; 
 Sun, 18 Dec 2022 05:02:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p16-20020a1c5450000000b003d07de1698asm15755100wmi.46.2022.12.18.05.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 05:02:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:02:25 +0100
Message-Id: <20221218130225.353325-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Sg71CZu6791zzP8rTkLj6nnKMcmynoLo4UoldWpUow=;
 b=U56W1N+yYcCpoRvHMl50IdhVIlsci9R6CNe+3tky9I4wywSvAMGk5qy3nHZDkUuqAk
 Vnwbte2vBeK/xqhyAaEMZ/DGpkSXhicDjxm4FViKubkg+wqDQuP+kB/6NcbKhfOwj+Aw
 7Hl+j224ACtr22dbTFbQ1SH7SUL9iDCGWAGKQ/4/ZH8bffjoTXtqcMM2wNf/AidsB3WH
 njh25JXFMSCs50IgaVcq2jnKan/UdVw+EjUmZ5L/rQJwdK4GOKpDUeb2RjgHw4ngMcxO
 oHSLv3eqWXvYx31HuK3Wn9Ss4HYmpJBhXbc+nLuaEcyYGLDisPC1/0e84sq9f5J4HoKg
 9JVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U56W1N+y
Subject: [Buildroot] [PATCH 1/1] package/libarchive: do not add iconv for
 Requires.private
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

Fix the following build failure with fwup raised since bump to version
3.6.2 in commit 380341b249175382691f268de4b41d3843ff0acc and
https://github.com/libarchive/libarchive/commit/a83f3d327aefe8d628230f326621b014d82f55b4:

checking for pkg-config... /tmp/instance-19/output-1/host/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for ARCHIVE... no
configure: error: Requires libarchive. Libarchive must be built with zlib support.

Fixes:
 - http://autobuild.buildroot.org/results/fe4c4b73e337610020273fdede5a0e25e184212e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...o-not-add-iconv-for-Requires.private.patch | 28 +++++++++++++++++++
 package/libarchive/libarchive.mk              |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch

diff --git a/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
new file mode 100644
index 0000000000..1f0c75298a
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
+
+[Retrieved from: https://github.com/libarchive/libarchive/pull/1817]
+SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cfc148d01d..e64ea7a69e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -11,6 +11,8 @@ LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
+# We're patching configure.ac
+LIBARCHIVE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
