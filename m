Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6C5C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF41812EC;
	Sun, 30 Oct 2022 09:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF41812EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHJKSuPdse2n; Sun, 30 Oct 2022 09:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC76812E2;
	Sun, 30 Oct 2022 09:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC76812E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 843581BF336
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F16F605D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F16F605D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ift-q8xHvp8Y for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 09:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0617A605AC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0617A605AC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 09:52:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h9so12162635wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 02:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=emcJs7ZxaLusdIkjFSPLcDPDi0BB8CLyFlS2hCybA/o=;
 b=M0KMjHMWWZ9rM4F27rNj7P0D1wJpeQLRCpS+nVMsSVbnnUv+bEjrI9Hcx8C0dKrzSj
 hW+UYpPQElz9LTHJC7kQo2ktqeNuAWED6eyTP82xqxcVlWe+yykzL+tc0yMLPVZoZ7k+
 o85sPI92ZBjlejlZGL6EAkQftSnDMkChDdyREGYTwxNoDU9gCuV+uA9Vmk/v41oGCy+Q
 l0fVyMDhIOTwV3micfUbDdQ2M8NWbn6H9sWUn+0gjREnOJA21DJWl/Dt+o7ELDxO76Vc
 lVjv+ZmPuEYes1+Qg6yeXINoho40Kg4jJAAJSsGkKTi+76XUa6RFJ/d6fdLmrcyV5cDl
 iuig==
X-Gm-Message-State: ACrzQf2xQTNpxq9yYFZNg6K2AhsMfLrOOWdAZiK/kHBb1/NrpWHvoAgH
 YCMPypSsn8YfcHC2VuI5phv7Zb8dLh8=
X-Google-Smtp-Source: AMsMyM6H56h9oS9d6YhOgy31LYAi+2MHN1vDeaslbIf35YQmjyO/90SxQtinBdpVbgtJLoxq6Lp+Pg==
X-Received: by 2002:a05:6000:11cf:b0:236:b2f9:54a with SMTP id
 i15-20020a05600011cf00b00236b2f9054amr3712818wrx.275.1667123559893; 
 Sun, 30 Oct 2022 02:52:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b00228a6ce17b4sm3928384wry.37.2022.10.30.02.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:52:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 10:52:28 +0100
Message-Id: <20221030095228.59110-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=emcJs7ZxaLusdIkjFSPLcDPDi0BB8CLyFlS2hCybA/o=;
 b=jdzOI2HIUh3aLKXDJb+b1S83D6D9UONTseJpKLRva75QZN3umbH6JuvFPtH4QJnDRD
 V6QMUIMtviJ41JBmUIBKwsGRDhZmwXPVWxTxoS8E6LIypZbwa+YED4ON8bidV2IhcB8y
 T288xYAERmSWk9a/FaDjuYJFj4KAWPOyH60OKT798iE7zP80YQGSzDC9GSozAs1SJgny
 256+EBRGT2vdazSly0kiUcroyn2XaWBK+eA2GlSiKEQreCs5EeG9LxO9akz9Amuhk7Xn
 Dj6akwxiA/MKZ/is9GlB5xKB15l0m6UdmZMjIYIskcnfJIeIjELuquxQ3IXozyGTgpF4
 Kk4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jdzOI2HI
Subject: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.45
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.45 released on August 11, 2022. Some minor bugs are fixed.

Drop first patch (not needed since
https://github.com/cjlin1/liblinear/commit/7cf5d6e1c05d3147ee7890865c900757fc42d9ef)

https://github.com/cjlin1/liblinear/compare/v244...v245

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-blas-don-t-overwrite-ar-options.patch | 36 -------------------
 ...-lib.patch => 0001-build-static-lib.patch} |  0
 package/liblinear/liblinear.hash              |  2 +-
 package/liblinear/liblinear.mk                |  2 +-
 4 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
 rename package/liblinear/{0002-build-static-lib.patch => 0001-build-static-lib.patch} (100%)

diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
deleted file mode 100644
index 23ed6dd227..0000000000
--- a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From cae4c3b80fee0f3637d70f6d33946888c8105637 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 13 Dec 2014 17:16:58 +0100
-Subject: [PATCH] blas: don't overwrite ar options
-
-ar's rcv options get lost when AR is passed on
-the command line.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- blas/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/blas/Makefile b/blas/Makefile
-index 895fd24..78cec9a 100644
---- a/blas/Makefile
-+++ b/blas/Makefile
-@@ -1,4 +1,4 @@
--AR     = ar rcv
-+AR     = ar
- RANLIB = ranlib
- 
- HEADERS = blas.h blasp.h
-@@ -8,7 +8,7 @@ CFLAGS = $(OPTFLAGS)
- FFLAGS = $(OPTFLAGS)
- 
- blas: $(FILES) $(HEADERS)
--	$(AR) blas.a $(FILES)
-+	$(AR) rcv blas.a $(FILES)  
- 	$(RANLIB) blas.a
- 
- clean:
--- 
-1.9.3
-
diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0001-build-static-lib.patch
similarity index 100%
rename from package/liblinear/0002-build-static-lib.patch
rename to package/liblinear/0001-build-static-lib.patch
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 27aa4e3e87..6bc72909d0 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  45572b99d4eeffc3e8ad7b72c27370be867edf3523c396d8b278a2c873bfbb5c  liblinear-2.44.tar.gz
+sha256  3c64eec45c01943a656baac7aeb8ffd782fe0aea53629aa9f5fdb8eec177c92f  liblinear-2.45.tar.gz
 sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index c100ccc6c5..014f9e2de4 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.44
+LIBLINEAR_VERSION = 2.45
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
