Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ECDC4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 672994014D;
	Mon,  6 May 2024 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iphK1ia4EbmA; Mon,  6 May 2024 07:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9982B40395
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9982B40395;
	Mon,  6 May 2024 07:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49FDE1BF32E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 07:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36DB060789
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 07:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP76oS4z1ms5 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 07:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF3DC6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF3DC6064B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF3DC6064B
 for <buildroot@buildroot.org>; Mon,  6 May 2024 07:00:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34ef66c0178so781673f8f.1
 for <buildroot@buildroot.org>; Mon, 06 May 2024 00:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978852; x=1715583652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=keg4AnLQA0F4XKdCJILcyzOkdFEDutydK6AsCGHbVu4=;
 b=hxPQF7kWRGPfxaCY54dZFYU4lgCiDq6c3j49JwGW8kHK6sKYxD2CjDpIkT7o8lRHKk
 rM935Hn6OQ+VHvhgYPwJzFugo02BdcmvPmyWUOxzkMV0w3M1ImEPqpAHJAE/tHCQkEee
 Y3nPzaZCO1InaFQsr6MaNBMhJrE+AE0GYK1asS/r8twUCaYHqfmgC6TEcdekl8pTaVQg
 j9yPm0P2nh/18CUl1nLoORY9/LmWFfZ1O7TMSxGVCaitppsPVPsiWyfPFfjfovj4DGQs
 mGfVszoXkF3o9x/FZwoq3A2zb5tvS7hkeje9TDDwZmlb3accYmi3eqqbSvRokmkugFoF
 YYNw==
X-Gm-Message-State: AOJu0Yw2O+TrJJPjrfpZSPqyD83VzE+Pro+nj/HvRh9ZO83QhUjEkGsg
 uIoGv/GIRACN1G/demspiqpaXXafRbAmeOZDG9mESvmJYbRxSgFJ+1MM7Q==
X-Google-Smtp-Source: AGHT+IHkVlzT05QfLHSe8+3Ol+9qe4hUe2BjiIsfwSBbzsRrRqonhbf8vm2BnBV1Duxr2KteOfVP8w==
X-Received: by 2002:a05:6000:ac4:b0:34c:8b03:9e57 with SMTP id
 di4-20020a0560000ac400b0034c8b039e57mr8525083wrb.11.1714978851543; 
 Mon, 06 May 2024 00:00:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b0034d743eb8dfsm9890066wrt.29.2024.05.06.00.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 00:00:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 09:00:49 +0200
Message-ID: <20240506070049.137839-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714978852; x=1715583652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=keg4AnLQA0F4XKdCJILcyzOkdFEDutydK6AsCGHbVu4=;
 b=HMpmwJXtBTlxNUTM0ZsLStkQdTc8i3LF+jnVJidYrxeLF5XjHS/Lqgw5JJNNNYTbYv
 L8BhC7yWXASS1z11qqM0Tbq7yunVa7mhVls82yTwoxCVEqxkmOy3w4QxRoulp7Pfiqd3
 MTp6QR6uDCyEnw30QVpAr15cACC0ulxds9cI07cZvv8kdk1NKkC25n0Je8CvGm0cnYXs
 6vh/NciY//WfqlGcwCJwR9/5leeLYJaH8dwcxC2ZP8FZacrItOqqrUkKPCeT1hbJpemF
 lovwIKvg5vCScyF6jX3DTwzemg5ApkjIFRpylZAtoMiyk44pcl2n3ZJen+KjyfM12tzN
 9aIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HMpmwJXt
Subject: [Buildroot] [PATCH 1/1] package/oprofile: fix static build with
 binutils >= 2.40
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

sframe library was added by binutils 2.40 and
https://github.com/bminor/binutils-gdb/commit/19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
resulting in the following static build failure:

/home/buildroot/autobuild/run/instance-1/output-1/build/binutils-2.41/bfd/elf-sframe.c:220: undefined reference to `sframe_decode'

[...]

configure: error: bfd library not found

Fixes:
 - http://autobuild.buildroot.org/results/a9f3e09e6543b3773440c011e93bd41e357691e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-static-build-with-binutils-2.40.patch | 62 +++++++++++++++++++
 package/oprofile/oprofile.mk                  |  7 +++
 2 files changed, 69 insertions(+)
 create mode 100644 package/oprofile/0002-fix-static-build-with-binutils-2.40.patch

diff --git a/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch b/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch
new file mode 100644
index 0000000000..3134363abc
--- /dev/null
+++ b/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch
@@ -0,0 +1,62 @@
+From 1e4cd78bca2bd6e0d17b6cb9caf1b172d7bac564 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 May 2024 08:41:49 +0200
+Subject: [PATCH] fix static build with binutils >= 2.40
+
+sframe library was added by binutils 2.40 and
+https://github.com/bminor/binutils-gdb/commit/19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
+resulting in the following static build failure:
+
+/home/buildroot/autobuild/run/instance-1/output-1/build/binutils-2.41/bfd/elf-sframe.c:220: undefined reference to `sframe_decode'
+
+[...]
+
+configure: error: bfd library not found
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a9f3e09e6543b3773440c011e93bd41e357691e4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://sourceforge.net/p/oprofile/bugs/295
+---
+ configure.ac   | 2 +-
+ m4/binutils.m4 | 7 +++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc447f89..72ef0a21 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -334,7 +334,7 @@ AX_CHECK_DOCBOOK
+ dnl finally restore the original libs setting
+ LIBS="$ORIG_SAVE_LIBS"
+ LIBERTY_LIBS="-liberty $DL_LIB $INTL_LIB"
+-BFD_LIBS="-lbfd -liberty $DL_LIB $INTL_LIB $Z_LIB"
++BFD_LIBS="-lbfd -liberty $DL_LIB $INTL_LIB $SFRAME_LIB $Z_LIB"
+ POPT_LIBS="-lpopt"
+ AC_SUBST(LIBERTY_LIBS)
+ AC_SUBST(BFD_LIBS)
+diff --git a/m4/binutils.m4 b/m4/binutils.m4
+index c50e2f3c..e1ccd8e7 100644
+--- a/m4/binutils.m4
++++ b/m4/binutils.m4
+@@ -10,11 +10,14 @@ AC_CHECK_FUNCS(xmemdup)
+ AC_CHECK_LIB(dl, dlopen, LIBS="$LIBS -ldl"; DL_LIB="-ldl", DL_LIB="")
+ AC_CHECK_LIB(intl, main, LIBS="$LIBS -lintl"; INTL_LIB="-lintl", INTL_LIB="")
+ 
+-AC_CHECK_LIB(bfd, bfd_openr, LIBS="-lbfd $LIBS"; Z_LIB="",
++AC_CHECK_LIB(bfd, bfd_openr, LIBS="-lbfd $LIBS"; SFRAME_LIB=""; Z_LIB="",
+ 	[AC_CHECK_LIB(z, compress,
+ dnl Use a different bfd function here so as not to use cached result from above
+ 		[AC_CHECK_LIB(bfd, bfd_fdopenr, LIBS="-lbfd -lz $LIBS"; Z_LIB="-lz",
+-			[AC_MSG_ERROR([bfd library not found])], -lz)
++dnl Use a different bfd function here so as not to use cached result from above
++			[AC_CHECK_LIB(bfd, bfd_close, LIBS="-lbfd -lsframe -lz $LIBS"; SFRAME_LIB="-lsframe"; Z_LIB="-lz",
++				[AC_MSG_ERROR([bfd library not found])], -lsframe -lz)
++			], -lz)
+ 		],
+ 		[AC_MSG_ERROR([libz library not found; required by libbfd])])
+ 	]
+-- 
+2.43.0
+
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 512fbf9ea1..590e63b4ac 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,6 +12,13 @@ OPROFILE_CPE_ID_VENDOR = maynard_johnson
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--with-kernel=$(STAGING_DIR)/usr
+# 0002-fix-static-build-with-binutils-2.40.patch
+OPROFILE_AUTORECONF = YES
+
+define OPROFILE_CREATE_MISSING_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog
+endef
+OPROFILE_POST_EXTRACT_HOOKS += OPROFILE_CREATE_MISSING_FILES
 
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
