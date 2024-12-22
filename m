Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D453E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43346608A4;
	Sun, 22 Dec 2024 14:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAbi63VJI-0G; Sun, 22 Dec 2024 14:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBFB6082E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBFB6082E;
	Sun, 22 Dec 2024 14:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C45FD8
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 634F4406C3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6kKvEbmr5mq for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E07A406A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E07A406A1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E07A406A1
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:57:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F2440002;
 Sun, 22 Dec 2024 14:57:53 +0000 (UTC)
Date: Sun, 22 Dec 2024 15:57:23 +0100
MIME-Version: 1.0
Message-Id: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANMoaGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMj3aTS3IL41Jy00pLMnGJdc4PklBQTs2QDU2NjJaCegqLUtMwKsHn
 RsbW1AMfuuGdfAAAA
X-Change-ID: 20241222-bump_elfutils-70cdd46c0533
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Vicente Olivert Riera <Vincent.Riera@imgtec.com>, 
 Bernd Kuhls <bernd.kuhls@t-online.de>, Peter Seiderer <ps.report@gmx.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734879475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s92lXego6l9TZEi4aetf035OWbyb7uIbrH/0WsAOC08=;
 b=JU3Uf/OoSEkqfF0kzXH2LtraXSNVt+O9sdXChCoLzSxXLJgQUuoZgfzZqrRavcqvudQb8m
 7amhjKV19mr+WJMNFR2bqE5BeLQ0veuoMBi+UlPLpEOUIUlFxy8Gnbw/Nmqv5qh5MRWabi
 qHvOT3WTe4tCOKwaF89O4emhdBnJQbTw6LQcSclshggxtxEmsKZosxpb0yFOqx85Ym8Iam
 c59InZW9W0ZgeU4u+lm7SOm25iKAya5lQS5e5tQCuse/rjPBvpP9bxSTVsspzYm8qThJKA
 BnrfVBqbGDPeSAMgtceRRkFwstF7q9mJwTcFanf1Ep+x+VFoGOh25M2PIVs5kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JU3Uf/Oo
Subject: [Buildroot] [PATCH] package/elfutils: bump to version 0.192
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
    https://autobuild.buildroot.org/results/29502fe97a15e4926de7cf129b641505697de9cd/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 ...d-a-enable-disable-progs-configure-option.patch | 22 ++++++++++++----------
 package/elfutils/elfutils.hash                     |  2 +-
 package/elfutils/elfutils.mk                       |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
index bac9bc124579befb13446ef8f18014aab856c786..7f6dff94f09cc4ccc3cc0f07c0033a848fff4535 100644
--- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
+++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
@@ -1,4 +1,4 @@
-From 73e4da5ca780196d23db8029dcd28f87a0402711 Mon Sep 17 00:00:00 2001
+From 571445ec4643865566d2c5a9e27d9b78b8b00107 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 29 May 2017 23:03:48 +0300
 Subject: [PATCH] Add a --{enable,disable}-progs configure option
@@ -22,13 +22,15 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Fabrice: don't error out if obstack is not found]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Rebased on 0.192]
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 ---
  Makefile.am  | 6 +++++-
- configure.ac | 6 ++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
+ configure.ac | 8 +++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9c47afa..edf8dfc 100644
+index 92130b57..00f5176b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -26,8 +26,12 @@ AM_MAKEFLAGS = --no-print-directory
@@ -43,13 +45,13 @@ index 9c47afa..edf8dfc 100644
 -	  libasm debuginfod src po doc tests
 +	  libasm debuginfod $(PROGS_SUBDIR) po doc tests
  
- EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
- 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING SECURITY \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3 CONDUCT
 diff --git a/configure.ac b/configure.ac
-index d345495..0dd4b1e 100644
+index f191488f..87d91f8f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -393,6 +393,12 @@ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
+@@ -426,6 +426,12 @@ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
  AM_CONDITIONAL(TESTS_RPATH, test "$tests_use_rpath" = yes)
  
@@ -62,7 +64,7 @@ index d345495..0dd4b1e 100644
  dnl zlib is mandatory.
  save_LIBS="$LIBS"
  LIBS=
-@@ -579,7 +585,7 @@ saved_LIBS="$LIBS"
+@@ -670,7 +676,7 @@ saved_LIBS="$LIBS"
  AC_SEARCH_LIBS([_obstack_free], [obstack])
  LIBS="$saved_LIBS"
  case "$ac_cv_search__obstack_free" in
@@ -72,5 +74,5 @@ index d345495..0dd4b1e 100644
          *) obstack_LIBS= ;;
  esac
 -- 
-2.30.1
+2.47.1
 
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index e3cc67dc0e5bc957d2208eaf4f7200e9e59895a7..19f628de46d2899d9ec14db0258eb692e5cb084f 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
 # From https://sourceware.org/elfutils/ftp/0.189/sha512.sum
-sha512  93a877e34db93e5498581d0ab2d702b08c0d87e4cafd9cec9d6636dfa85a168095c305c11583a5b0fb79374dd93bc8d0e9ce6016e6c172764bcea12861605b71  elfutils-0.189.tar.bz2
+sha512  543188f5f2cfe5bc7955a878416c5f252edff9926754e5de0c6c57b132f21d9285c9b29e41281e93baad11d4ae7efbbf93580c114579c182103565fe99bd3909  elfutils-0.192.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8738af7751fdb8adc06e95ac476b0e5881f2a9e9..e7c2efe86750f9f6f44c3614be9f73a942be4a0a 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.189
+ELFUTILS_VERSION = 0.192
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES

---
base-commit: 87706103a6bdee8ed3b6ea51b45626aa9d2185ab
change-id: 20241222-bump_elfutils-70cdd46c0533

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
