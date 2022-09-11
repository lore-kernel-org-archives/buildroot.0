Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CE6C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8E6540C26;
	Sun, 11 Sep 2022 21:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E6540C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJIY2E6A5Co5; Sun, 11 Sep 2022 21:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07B23404FE;
	Sun, 11 Sep 2022 21:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07B23404FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD97F1BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99711404FE
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99711404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I49Dtn5izCrx for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:32:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD73C404C8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD73C404C8
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:32:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t14so12482172wrx.8
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+m6hhH4aLnSneQ5vIBZO38j0BNKTWWkpIrGdZmRG690=;
 b=UEee4zcBB+mvYb3QMr2lDMfgQQYMuJeV2+iMsjukoQbByvmxmdqxpznsSz39FKmym2
 +krMlzG671O+Okc7gBOTam7Xgz8f8a32n2vNcfPUIT7ebr7B6BA7BlIH3EU7q7syiwUZ
 Uqh8PZDFMVbNjTgAf6/aNBGDCrvwkgDOhJs/MWa8riaBBiSOMsDqS3NZNDjXItjwDj4+
 uOgAXTLgYBxOVm4ZJfHDaXw395wmJ7ru/Z8WiXEGAzZTE2LAsZDakUb+Xjza0QDJe8Ca
 1KSjdD6kg3+n5JGSR7lQFaksFgWrS5PSKAo1bnPmyR3Z5filtnvCDXnKEF9JtvfFRLwr
 qVqA==
X-Gm-Message-State: ACgBeo2RhlvhHbcfSywEQXpHdKk1oLHDow5qk35ye96CSpQCov8BCWVp
 50svwWJNhbOV507D+ds8cs7ZcQaI9Oo=
X-Google-Smtp-Source: AA6agR5cmrLzsQPkhntsZAYAML0FhK25BIsLsepdWoSGP8XK7XuYIG86yhUZ1oYoIarB8yT43Ln/3g==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id
 e35-20020a5d5963000000b0022a47edf98fmr4488252wri.155.1662931921739; 
 Sun, 11 Sep 2022 14:32:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b002253604bbefsm5746077wrx.75.2022.09.11.14.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:32:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:31:59 +0200
Message-Id: <20220911213159.179075-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+m6hhH4aLnSneQ5vIBZO38j0BNKTWWkpIrGdZmRG690=;
 b=NZasdj1LZZf3lRUJkp2t9MkCnSy6wpIKvrQ41WQxPY1rpSdAQ1nSe0G/3+e8yk1EX4
 xwPg4m8A3hM+BGrMRS7SU9BOdbGnL3OCMB/3y53xxHgqosvyzocvzSkOMumOiDVu1rB1
 +DnNkEFKM4FkJagFyIYqwuLIdzypCfsmaOc5+3lo+Hwrm8DoeAlnPKI8RmUbOqKF8u1Q
 FnAYIIy5R2PVf0y5MbhH/LyRAzPjBMRrWqjaUnb8YlUDFo0hotCpDPH3G+rmtwqXR0GI
 gazwDI/EP8iahAW125oOYYlAzc8lOEBzXXVhbyYqFV/h4Uw2LzL2LVtZ8TfhdiAjirUD
 QU9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NZasdj1L
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: bump to version 4.19.0
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

Drop patch (already in version) and so autoreconf

https://gitlab.com/gnutls/libtasn1/-/blob/v4.19.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fuzz-Makefile.am-do-not-force-static.patch | 35 -------------------
 package/libtasn1/libtasn1.hash                |  4 +--
 package/libtasn1/libtasn1.mk                  |  5 +--
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch

diff --git a/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch b/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
deleted file mode 100644
index 1f1abc7d9d..0000000000
--- a/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cf1b20f3d881a1cfbf8cae1f615f45a5a4fbb3b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Apr 2020 18:35:55 +0200
-Subject: [PATCH] fuzz/Makefile.am: do not force static
-
-Don't force static when linking corpus2arry to libtasn1 otherwise the
-build will fail if libtasn1 has been built only as a shared library:
-
-  CCLD     corpus2array
-/home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/8.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `../lib/.libs/libtasn1.so'
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/gnutls/libtasn1/-/merge_requests/61]
----
- fuzz/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fuzz/Makefile.am b/fuzz/Makefile.am
-index c6310d1..1fb7152 100644
---- a/fuzz/Makefile.am
-+++ b/fuzz/Makefile.am
-@@ -26,7 +26,7 @@ AM_CFLAGS = $(WERROR_CFLAGS) $(WARN_CFLAGS) $(CODE_COVERAGE_CFLAGS)
- AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes -I$(srcdir) \
-  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl -DSRCDIR=\"$(abs_srcdir)\" \
-  $(CODE_COVERAGE_CPPFLAGS)
--AM_LDFLAGS = -no-install -static
-+AM_LDFLAGS = -no-install
- 
- LDADD = ../lib/gl/libgnu.la ../lib/libtasn1.la $(FUZZ_LIBS) $(CODE_COVERAGE_LIBS)
- 
--- 
-2.25.1
-
diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index fa39dd2c73..4bcb6a3feb 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.18.0.tar.gz.sig
-sha256  4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898  libtasn1-4.18.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz.sig
+sha256  1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a  libtasn1-4.19.0.tar.gz
 # Locally calculated
 sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 11ab223962..3af1bcdcbb 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.18.0
+LIBTASN1_VERSION = 4.19.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
@@ -12,9 +12,6 @@ LIBTASN1_LICENSE_FILES = COPYING doc/COPYING doc/COPYING.LESSER
 LIBTASN1_CPE_ID_VENDOR = gnu
 LIBTASN1_INSTALL_STAGING = YES
 
-# We're patching fuzz/Makefile.am
-LIBTASN1_AUTORECONF = YES
-
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
