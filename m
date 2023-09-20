Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ABCC04AB4
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DA060B2A;
	Wed, 20 Sep 2023 17:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DA060B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sb3XpvNGn5M9; Wed, 20 Sep 2023 17:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A4C60BD8;
	Wed, 20 Sep 2023 17:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A4C60BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 777281BF3DC
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5184D4187C
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5184D4187C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjC-H1z5ILKR for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:07:21 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E00F409E6
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E00F409E6
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso459725e9.1
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 10:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695229637; x=1695834437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MwmG6xySBYBJ6jxIUKXOAxcXL6c+ps0afVRTdvMxo7E=;
 b=olUDv/avUMw51rVGjvAFk6ayT4NINITSV0Z6D1ubJWamh7t6G1MR/qcesqKhVaNG0Q
 CjbidSSYBom6fsrKaRoXj53IovcfeMktPRvglbMBpIZmc9mar4BUDGtYgwK299aPZU4y
 sZ4WF8+jniL3wBaPWOF4gVNAlrkKJquAPuzxjmCdOBrnANDrYOE7MiS1kjZ6b6bEZlbn
 wutqHOZzZx++Qex9hRjKqCp+TcOZQDryoDE2JHig7p8a3rOzVPAL3nLeuT3+DoWag+vj
 FXN90mKMopTDRVSCe0sRqnn5v3SXau0cLuBKP9VBogAYv93nkZhIilpp64xklBIcsLiV
 VRHQ==
X-Gm-Message-State: AOJu0YwxVt7FRm5lmIyl++Qg1muxuK232RQgjJceg5kziJ/DwjqrwhmI
 b50lKVBag9+kAdVvNs+ahoVz5/5GgpU=
X-Google-Smtp-Source: AGHT+IH75CytN7T1Aemsl8ab5jpSNQi9iWQNhHCRdezqY5pZpQt175UW47pQg5E7+Zzc1U2dKNH23w==
X-Received: by 2002:a1c:4b07:0:b0:402:ff8d:609b with SMTP id
 y7-20020a1c4b07000000b00402ff8d609bmr3165775wma.33.1695229636478; 
 Wed, 20 Sep 2023 10:07:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c281400b003fe1630a8f0sm2481912wmb.24.2023.09.20.10.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 10:07:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 19:07:11 +0200
Message-Id: <20230920170711.3901-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695229637; x=1695834437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MwmG6xySBYBJ6jxIUKXOAxcXL6c+ps0afVRTdvMxo7E=;
 b=Ua/wOzFKQT/u1vypugSJVCx9jyi6EXdkTGCpwDr3XWyyqamd5uWAC4wt0bxf2blvkL
 KDCaA4MV3EPIXcxa1d4sPHn3Q7+gg+v18elAjawraV/NmxQZOKebT+waKSr0xrNyCcB3
 aSkcKjhWb7HIXWLeXzZfZkLNwNzDmVe6ZnV2c145EpGvUrUwh7ma+aGB+9QNc9UzjNHb
 g2QSZvmNAJHc3GOIOV/D7CZXTVNDkA4Jb4uMABWY6dtDzKG7y3SCxSco0hm6h2XLG0fm
 LZ3nhbFqTBPFEBlBdrsGCdMkykHeH+HYmJ9vhy3j89bB8Qv5GRhaBeS1my0PZddv7L2V
 fEMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ua/wOzFK
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.02.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-36664: Artifex Ghostscript through 10.01.2 mishandles
  permission validation for pipe devices (with the %pipe% prefix or the |
  pipe character prefix).
- Fix CVE-2023-38559: A buffer overflow flaw was found in
  base/gdevdevn.c:1973 in devn_pcx_write_rle() in ghostscript. This
  issue may allow a local attacker to cause a denial of service via
  outputting a crafted PDF file for a DEVN device with gs.
- Fix CVE-2023-38560: An integer overflow flaw was found in
  pcl/pl/plfont.c:418 in pl_glyph_name in ghostscript. This issue may
  allow a local attacker to cause a denial of service via transforming a
  crafted PCL file to PDF format.

https://ghostscript.readthedocs.io/en/gs10.02.0/News.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-without-BUILD_PDF.patch    | 34 +++++++++++++++++++
 package/ghostscript/ghostscript.hash          |  4 +--
 package/ghostscript/ghostscript.mk            |  2 +-
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch

diff --git a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
new file mode 100644
index 0000000000..af69cd3670
--- /dev/null
+++ b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
@@ -0,0 +1,34 @@
+From 088f3cd6e58cff5fa51e072d1829f7691a5f6681 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 20 Sep 2023 13:44:28 +0100
+Subject: [PATCH] Fix build without BUILD_PDF
+
+The PDFSetParams PostScript extension operator was missing a stub function definition
+when the PDF interpreter is not built in.
+
+ Author:    Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=088f3cd6e58cff5fa51e072d1829f7691a5f6681
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zpdfops.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/psi/zpdfops.c b/psi/zpdfops.c
+index e7e0a42ee..271687a18 100644
+--- a/psi/zpdfops.c
++++ b/psi/zpdfops.c
+@@ -1507,6 +1507,11 @@ static int zPDFdrawannots(i_ctx_t *i_ctx_p)
+     return_error(gs_error_undefined);
+ }
+ 
++static int zPDFSetParams(i_ctx_t *i_ctx_p)
++{
++    return_error(gs_error_undefined);
++}
++
+ static int zPDFInit(i_ctx_t *i_ctx_p)
+ {
+     return_error(gs_error_undefined);
+-- 
+2.34.1
+
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 2e4b6ac750..77c8faccbe 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/SHA512SUMS
-sha512  ee20f0e12f553a3d04578e71a0d45defebc71117ce4dc2c14043985bfe7348ad7f8b2fe98fc9b4f5b935ecb32e50dc340be67d6ef58190542ec6d0f9da1de380  ghostscript-10.01.2.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/SHA512SUMS
+sha512  c49344151063e915add55a0a842c2a645d8362a5cbca663bd07638f4bd3699a08cade37a9efe905ad5a41e014353e5e1b1268b7925e43128ad30d5b031396b71  ghostscript-10.02.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 8a39d4b695..161521f970 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.01.2
+GHOSTSCRIPT_VERSION = 10.02.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
