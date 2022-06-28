Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DBBC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 21:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE21C4032A;
	Tue, 28 Jun 2022 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE21C4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6kl8mn4_k7q; Tue, 28 Jun 2022 21:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C253740101;
	Tue, 28 Jun 2022 21:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C253740101
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E51AE1BF31F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB12460B2B
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB12460B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qoTlKVWU6B4 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 21:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 557BF60888
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 557BF60888
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 21:37:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso8762434wma.2
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 14:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3pK1U2rlxe79/0PjfG7u4EelCW0ueVIaxa92f8XC7aQ=;
 b=FG3bFYShwuiYCwBg0FtO9ixPGiutpgVhhp9A1Cl693dgd02r5BlA8ke5ccQTZqLciO
 sdouS259T/cpHSYnXm1dw7GCsJCCFn1Bz9vOEoYHBuPjxjnM05z3TLFXi++8tDUBEVIp
 QhgCbbyutrDwP88xP3PK/Bsy1qSGCzhgCKA/lwDicV9hjGP/NHszftAObYzFJSg5rxOM
 bJqqOyWuhlyFizXQo5KQl645O9hQAkXLXry9W96IWDaNyLkZFLvJp1I6AkEC73Sqq2a5
 eT+RUHbtZ/BjcWbRhKuMYH75gSosQoGb2wUOi6l2JACQWCqXngUodBmB8/uPdHjMnKWZ
 Jk1A==
X-Gm-Message-State: AJIora/kypUK/97Mv/MK7Nob2OGxUt5eZ1K2y9qvRctdQRq+z85AnCD8
 5nBTGWC5PD90pHOxplVW2Jj5jj/5rJc=
X-Google-Smtp-Source: AGRyM1tTO5gztiwzz161CTCLJs7moPb5JNBTPqvOIsnNDarmoIZvvTHjndWAMsigjUH3DWnRYlroOw==
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id
 bg42-20020a05600c3caa00b003a018e4781bmr1830781wmb.199.1656452257338; 
 Tue, 28 Jun 2022 14:37:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d44c2000000b0021a3d94c7bdsm14744940wrr.28.2022.06.28.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:37:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 23:34:48 +0200
Message-Id: <20220628213448.2886869-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3pK1U2rlxe79/0PjfG7u4EelCW0ueVIaxa92f8XC7aQ=;
 b=P/ehuXYbgLQWF+tYSw4rern/n2u+1jTr0WFCAcHm/LXOeFgvkHgBNh/jBJMwBQk4hi
 baemE/vILOhVtkQ99OkeZX0peMzCkVhfteHWYczuz4lHtQVJ6/VWLg5hAmYGSL8zLYW4
 Ym+WLNAsqlNOzNGV77lBgk1lQb12U1ZVvvOog8EDwJ0ppTGXRBwm68Vr4uvk1d1Ihk61
 o7C0MjQLoMzp+qoXI4+NT4GqyvvfG2N76E3E7dC9buvHua69dToWk5IH74GSpZdmN0CW
 L5JcaO/5UZwxpvuzJtBmWauigidS7mlcOJlnNi+PTYAxhrnVhuoSkAtwz7Nc7yoDkHIN
 4aNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P/ehuXYb
Subject: [Buildroot] [PATCH v2,1/1] package/libsndfile: fix libsndfile.pc
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

Add host-pkgconf dependency to avoid the following build failure when
running autoreconf:

configure.ac:345: error: macro PKG_INSTALLDIR is not defined; is a m4 file missing?
m4/ax_require_defined.m4:35: AX_REQUIRE_DEFINED is expanded from...

Fixes:
 - http://autobuild.buildroot.org/results/6de2d7634b1958693b7cf96fbcc79121f92347e9
 - http://autobuild.buildroot.org/results/bf66b19cacd6394957f534035af647ddd8037d60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add host-pkgconf dependency

 ...ute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch | 24 +++++++++++++++++++
 package/libsndfile/libsndfile.mk              |  3 +++
 2 files changed, 27 insertions(+)
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
index 12a6601b6b..0b57a1fdd8 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -11,6 +11,9 @@ LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
+# We're patching configure.ac
+LIBSNDFILE_AUTORECONF = YES
+LIBSNDFILE_DEPENDENCIES = host-pkgconf
 
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
