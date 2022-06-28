Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DEFC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 16:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A4FC40613;
	Tue, 28 Jun 2022 16:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A4FC40613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nXwEaCAjm-R; Tue, 28 Jun 2022 16:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A22140CA2;
	Tue, 28 Jun 2022 16:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A22140CA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3CF81BF28D
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 16:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0AD40528
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 16:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D0AD40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZwyS7LEthOo for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 16:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC3CA404F8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC3CA404F8
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 16:42:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so9782718wma.4
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 09:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Cp6PwVVmV8jyvyMA8lAZZIJ9ZvUvTfx8VMCAScXD3I=;
 b=GyApupbA/h1U8Z8mtlivJI1bS7Z/ryrL15kE2E+xjSYTX4tp0OeWizuxsm2UwKWwQa
 7fFfdzzVbcppogoNmN7a6JJ2CePlzqvVKn69BA/mQlhK3rYVHoSZdJ6njcZBeOln4T/1
 b+kAcbvNimjGyYUTx24KBXVKmIfgzR9opyxWrU3/ofoXsrUlr/7z4pXvvpthltg4Etra
 4R7Ki2GM3Ie6GKsHKBt5ob2XHvoq9UgE6LgPifOYO2HN8xnobr7UrJHPf6kR8Zm0Y3TO
 Cr78yukjPa3e73E1uV09F2PQmYjDBoPHSOBSskQuSsuHtZdm7a1os6LtQyirZKwEg50m
 SNqA==
X-Gm-Message-State: AJIora8takuW5nU2ZQA7IbSuOw1LMg1WwMEfZcGwkPpw1HzMlE7CPc9Y
 ubtmXXw2cO72NiiChSRI+7MJRRh2xag=
X-Google-Smtp-Source: AGRyM1vpvB7wVlMCDl3B3wiLX+4els5AMbOk2HexjSKh5uNCQ4ZNqYA+7eplTEbHUzRs8I0pHolKnQ==
X-Received: by 2002:a05:600c:3658:b0:3a0:390e:ea00 with SMTP id
 y24-20020a05600c365800b003a0390eea00mr574109wmq.128.1656434553931; 
 Tue, 28 Jun 2022 09:42:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm144510wmg.4.2022.06.28.09.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 09:42:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 18:39:39 +0200
Message-Id: <20220628163939.2836587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Cp6PwVVmV8jyvyMA8lAZZIJ9ZvUvTfx8VMCAScXD3I=;
 b=TPfYmPC1IXRTQ/tWD62FQwBuqXoD8CEvg5oFL9IgtvNRX639CDPzk1FujO7m2p1NZg
 Xec/G1CukecGEXnvlCZG/tPr1zWF9UpkusYM6k1dU7JbNcOE73KyeNi4Cms+Y6h85Kvc
 J/ROqcrYeA8rG0EUbDcOjfMZ3P0oDC1Qv87TjvjpB/xECO1nF0kv+ukd9+IaKWpa2jG9
 05mk/nPwJbXzF6ksKWh/5uwLKIkwrUyQRdvqizWDaXaahoVc7SEnEmVaBFC84fbQq/2B
 +Nwta2WhohXWeI7u19ZNnf3v3FnlFC5v0ffQo8lw5DcBT11IZz7C0uIUKI4gDS8OScF4
 AP0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TPfYmPC1
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: fix libsndfile.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libsamplerate or minimodem raised
since bump to version 1.1.0 in commit
c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9:

powerpc-buildroot-linux-uclibc-gcc.br_real: error: EXTERNAL_MPEG_LIBS@: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/6de2d7634b1958693b7cf96fbcc79121f92347e9
 - http://autobuild.buildroot.org/results/bf66b19cacd6394957f534035af647ddd8037d60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch | 24 +++++++++++++++++++
 package/libsndfile/libsndfile.mk              |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch

diff --git a/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch b/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
new file mode 100644
index 0000000000..44ed6dc2cb
--- /dev/null
+++ b/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
@@ -0,0 +1,24 @@
+From e4fdaeefddd39bae1db27d48ccb7db7733e0c009 Mon Sep 17 00:00:00 2001
+From: Michael Cho <cho-m@tuta.io>
+Date: Sun, 17 Apr 2022 21:31:07 -0700
+Subject: [PATCH] configure.ac: substitute EXTERNAL_MPEG_LIBS in sndfile.pc
+
+[Retrieved from:
+https://github.com/libsndfile/libsndfile/commit/e4fdaeefddd39bae1db27d48ccb7db7733e0c009]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 727b67bc0..a4c776d70 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -739,6 +739,7 @@ AC_SUBST(SNDIO_LIBS)
+ AC_SUBST(EXTERNAL_XIPH_CFLAGS)
+ AC_SUBST(EXTERNAL_XIPH_LIBS)
+ AC_SUBST(EXTERNAL_XIPH_REQUIRE)
++AC_SUBST(EXTERNAL_MPEG_LIBS)
+ AC_SUBST(EXTERNAL_MPEG_REQUIRE)
+ AC_SUBST(MPG123_CFLAGS)
+ AC_SUBST(MPG123_LIBS)
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 12a6601b6b..2660d3dba6 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -11,6 +11,8 @@ LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
+# We're patching configure.ac
+LIBSNDFILE_AUTORECONF = YES
 
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
