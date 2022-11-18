Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130DDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 19:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BAF41733;
	Fri, 18 Nov 2022 19:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84BAF41733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3z1B9C66_VfV; Fri, 18 Nov 2022 19:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49F1F419F8;
	Fri, 18 Nov 2022 19:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49F1F419F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E18AF1BF383
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 19:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CB682297
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 19:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CB682297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYTZ2YD2XI7l for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 19:00:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D3082216
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1D3082216
 for <buildroot@busybox.net>; Fri, 18 Nov 2022 19:00:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l14so10730750wrw.2
 for <buildroot@busybox.net>; Fri, 18 Nov 2022 11:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sh2glMCHc6tTfGR+9L9oDEdiWSfOuJIgwRcz51yHlls=;
 b=3hFY2Vikp4VOZPViIMxwO1Ltj3M5SlgjygKdRg1FbVv8szWKd2I2LTV3qaYj6kWwrZ
 ibAwQC+qEPGqzgEsqCP0qCEVBuI3/i06g/pMyuCNb4Q/4Bsf8JkWkCiq+gpI3zxDZMcL
 Osaw1QZYO550l1BTtoYlP1zvhK6BvkI1lSaPo23JqqI/oTiHMSVpmj8ysexacl7MZLVV
 q20y/vxcAyDoT1sIbn2skFNm6zZKedtxEW9jM+L6ydJoU21K/kSq5H2XdsjGinBK9U9m
 SP7HAkHDVSCvWTaQU5iZElilLR1MQJLSfGJBnswIySa/50o1/gxXbbYuzchcmnAffbap
 8sBQ==
X-Gm-Message-State: ANoB5pkKuHw83bYziTBUxSxMayBTFf25BHV5TsKoa9KLsQyMU2fxU1BS
 2HijGmIK+u2pHN8dI4w8jXnVCQ8OFVQ=
X-Google-Smtp-Source: AA0mqf4saC3ZodGcfus0cwjAC28RYTnfaqJCDzj5hINZibrJlXaOasQoEOKoa4oUtHgEpgegIUbLVA==
X-Received: by 2002:a05:6000:10d:b0:236:9aa8:e69a with SMTP id
 o13-20020a056000010d00b002369aa8e69amr5316740wrx.31.1668798025862; 
 Fri, 18 Nov 2022 11:00:25 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003cf71b1f66csm5941003wmo.0.2022.11.18.11.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 11:00:25 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 18 Nov 2022 20:00:14 +0100
Message-Id: <20221118190014.1401088-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sh2glMCHc6tTfGR+9L9oDEdiWSfOuJIgwRcz51yHlls=;
 b=QA0QtMMPtf5ozWWcCHdsFAAtpFp6G+1/P1SJ13wp1twbCjeYIzuQJCshSchn/RLMdP
 voFMQgeTuDCK5u30FF+H4MkXRTr82Gt1cQg72YxHv9XwFn2ZBy30Zrvm7Dj0z5Ft02cZ
 1XAZ47xdpQ7DPuBk5R8+NHSqLwKc//3JrQGjou7SlzHHnUyiIvGqz+IP8aTN/uRE7PGK
 NeCViibF47Y2QjXXr9Fap2nIqmTVRj9IhSJzfQGWlFZMuuDaZ1S4K2GqadBpSXQn/4wM
 isjYwdCx2LfixxngZa0yiYdlQzREwuQ0zPap8N5kfCF51glq6EwtK+xrgdCh9AgxsvX0
 j0BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QA0QtMMP
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.30.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstream patch

remove mkdir build-aux (no longer needed, like AUTORECONF)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-fix-prototype-generation.patch       | 61 -------------------
 package/fakeroot/fakeroot.hash                |  4 +-
 package/fakeroot/fakeroot.mk                  |  9 +--
 3 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 package/fakeroot/0001-fix-prototype-generation.patch

diff --git a/package/fakeroot/0001-fix-prototype-generation.patch b/package/fakeroot/0001-fix-prototype-generation.patch
deleted file mode 100644
index 960bad212..000000000
--- a/package/fakeroot/0001-fix-prototype-generation.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Subject: Fix prototype generation for openat
-Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
-Date: 2021-12-30
-Bug-Debian: https://bugs.debian.org/995393
-Forwarded: Yes (implicitely)
-
-    As jrtc27 pointed out in IRC, ppc64el is more strict than other
-    architectures when it comes to va_arg handling:
-
-        it's that ppc64le uses the elfv2 abi, and for variadic calls you
-        must reserve space for a parameter save area
-
-    So enhance wrapawk to create a proper prototype and argument
-    handling although it's specific to the openat call. Also add the
-    missing documentation for the sixth column to wrapfunc.inp.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
-
---- a/wrapawk
-+++ b/wrapawk
-@@ -37,7 +37,25 @@
-   argtype=$3;
-   argname=$4;
-   MACRO=$5;
--  if(MACRO){
-+  openat_extra=$6;
-+  if(openat_extra){
-+    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
-+    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
-+    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
-+
-+    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
-+    print "  mode_t mode = 0;"                          > tmpffile;
-+    print "  if (flags & O_CREAT) {"                    > tmpffile;
-+    print "    va_list args;"                           > tmpffile;
-+    print "    va_start(args, flags);"                  > tmpffile;
-+    print "    mode = va_arg(args, int);"               > tmpffile;
-+    print "    va_end(args);"                           > tmpffile;
-+    print "  }"                                         > tmpffile;
-+    print "  load_library_symbols();"                   > tmpffile;
-+    print "  return  next_" name,  argname ";"          > tmpffile;
-+    print "}"                                           > tmpffile;
-+    print ""                                            > tmpffile;
-+  } else if(MACRO){
-     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
-     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
-     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
---- a/wrapfunc.inp
-+++ b/wrapfunc.inp
-@@ -9,8 +9,10 @@
- /**/									  */
- /* each line of this file lists 4 fields, seperated by a ";".		  */
- /* The first field is the name of the wrapped function, then it's return  */
--/* value. After that come the function arguments with types, and the last */
-+/* value. After that come the function arguments with types, and the fifth */
- /* field contains the function arguments without types.                   */
-+/* A sixth field is a special needed when wrapping the openat syscall.    */
-+/* Otherwise it's like the third (function arguments with types).         */
- /**/
- 
- /* __*xstat are used on glibc systems instead of just *xstat. */
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 3d53eeb09..5c50c83e1 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,4 @@
-# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.26-1.dsc
-sha256  480a578ffdc5592e73df4c086950d321b4adc78dbdaec56c82e4fe1fb68de8e9  fakeroot_1.26.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.30.1-1.dsc
+sha256  32ebb1f421aca0db7141c32a8c104eb95d2b45c393058b9435fbf903dd2b6a75  fakeroot_1.30.1.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 3fadf1c0f..5b4fb26a3 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.26
+FAKEROOT_VERSION = 1.30.1
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20210907T092512Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://deb.debian.org/debian/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,9 +18,4 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-define HOST_FAKEROOT_BUILD_AUX
-	mkdir -p $(@D)/build-aux
-endef
-HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX
-
 $(eval $(host-autotools-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
