Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBFB41738;
	Sun,  5 Nov 2023 21:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBBFB41738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7n927ReYiB2; Sun,  5 Nov 2023 21:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E964174C;
	Sun,  5 Nov 2023 21:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E964174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89FFA1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B2040A68
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61B2040A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIbHqlqYlqD3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:39:31 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD28C400CB
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD28C400CB
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40859c464daso28709175e9.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699220368; x=1699825168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LSZHdygH7U4+MBPtdRNZ4BZEY0+yM011iKe90XtIStY=;
 b=r6dn8D4xSRvK9eRdwyNaZslH1JmX2ad5hpzX8Mzp1K4b0JS8mlQpfsk0gn0jbKrrSU
 nTh5ZffO9FIIagKRwkzehaAczNhBKiFMQfF6dYF820friBHCgCBZlNfiJVBvd2BAiJkD
 uFWk5rW8WRwBUic4ww8WdNZpoCakN8rAWBi7GUa3fiM5CKZHpNBT2uuAhjHPoLuhY7n0
 GsCP96B6moc6zClmI9/i9KS7g2eE56dix+hrw5PJZ3S2LgxZEKu+GDg+NSnpbzeZbrpi
 VidtIuTP6Ed0I+KhYJr8hiV0tcAwYffsc2gBV4Hggen4Noy4cQlq5ULeA4iQRRu+zyF0
 Mq1g==
X-Gm-Message-State: AOJu0Yxv2h+hyIEfhOk2nQawW8etV8tDNZyqWtEfDGBYVdxGkj8kVsqq
 CZoPZrv7MuDoNOQY+3ld8zAw8Jh23M4=
X-Google-Smtp-Source: AGHT+IEWY0+eEnKeaLJGKazTa5p/4EhyBvnZYt7q6HMfp2C26FtJu5gvIb3grWaajMYMnWNnoW8z/w==
X-Received: by 2002:a05:600c:4445:b0:405:3251:47a1 with SMTP id
 v5-20020a05600c444500b00405325147a1mr20720339wmn.40.1699220367707; 
 Sun, 05 Nov 2023 13:39:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00406447b798bsm10307761wmq.37.2023.11.05.13.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:39:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 22:39:23 +0100
Message-ID: <20231105213923.82625-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699220368; x=1699825168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LSZHdygH7U4+MBPtdRNZ4BZEY0+yM011iKe90XtIStY=;
 b=jYQqAS/CP5ES95Xv0FPjNDx0B+K5lCQieMWKc9VNPr09CxaQXx61PSX4bju3eJKsCS
 sllMMt0EDGVvsPWidJFUoURmxNAjsN0wj2JmBX1U0RV5KGDChjG5aEEqiBNH4Z/6UWLO
 HCYJksFPeb8fqz/rK/DNp1AIQgSm+UHhupJwtl79maABl5AHEHFWne4K4omphhvVY4Ss
 qJdY6Bvs37pr7hwptLvZQYR2h0aT5xOJJVrgauyGqAh0/pKPpd5cjwpUzrTgG8bWElGv
 ZUu8UpY2UeDabKUyrBpUf95LSHBiSifQHHy9EiKr62dCKxGQ8NA6bPY4jc0Q0I6v9DkK
 855A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jYQqAS/C
Subject: [Buildroot] [PATCH 1/1] package/ranger: bump to version 1.9.3
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to github to get latest release
- Drop patch (already in version)
- Update RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME as scripts/ranger
  symlink to ranger.py has been removed
- Update hash of AUTHORS and add LICENSE file:
  https://github.com/ranger/ranger/commit/8263cbac888c9619bc024071bafb7b3223a7da83

https://github.com/ranger/ranger/blob/v1.9.3/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...heme-check-for-compiled-python-files.patch | 31 -------------------
 package/ranger/Config.in                      |  2 +-
 package/ranger/ranger.hash                    |  5 +--
 package/ranger/ranger.mk                      |  8 ++---
 5 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 package/ranger/0001-colorscheme-check-for-compiled-python-files.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 7a76b31a44..2ea44d79f4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1199,7 +1199,6 @@ package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch Upstream
 package/quagga/0003-Fix-build-with-gcc-10.patch Upstream
 package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch Upstream
-package/ranger/0001-colorscheme-check-for-compiled-python-files.patch Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch Upstream
 package/rdesktop/0001-8bit-colors.patch Sob Upstream
diff --git a/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch b/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
deleted file mode 100644
index bde3fee035..0000000000
--- a/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 654e3116825c4d12340613196279fb13a5662113 Mon Sep 17 00:00:00 2001
-From: Thijs Vermeir <thijsvermeir@gmail.com>
-Date: Tue, 20 Oct 2015 18:13:36 +0200
-Subject: [PATCH] colorscheme: check for compiled python files
-
-Some systems only provide *.pyc files
-
-Patch accepted upstream:
-https://github.com/hut/ranger/commit/d69f1ed3207c785d1a39ddd2992f6abb021b7540
-
-Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
----
- ranger/gui/colorscheme.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ranger/gui/colorscheme.py b/ranger/gui/colorscheme.py
-index d6afcac..d2b3b2d 100644
---- a/ranger/gui/colorscheme.py
-+++ b/ranger/gui/colorscheme.py
-@@ -86,7 +86,7 @@ def _colorscheme_name_to_class(signal):
-     usecustom = not ranger.arg.clean
- 
-     def exists(colorscheme):
--        return os.path.exists(colorscheme + '.py')
-+        return os.path.exists(colorscheme + '.py') or os.path.exists(colorscheme + '.pyc')
- 
-     def is_scheme(x):
-         try:
--- 
-2.6.1
-
diff --git a/package/ranger/Config.in b/package/ranger/Config.in
index a379002f95..056f806c33 100644
--- a/package/ranger/Config.in
+++ b/package/ranger/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_RANGER
 	  file launcher that is good at automatically finding out
 	  which program to use for what file type.
 
-	  http://ranger.nongnu.org
+	  https://ranger.github.io
 
 comment "ranger needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index dee088f229..b1ae8a8b8f 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  94f6e342daee4445f15db5a7440a11138487c49cc25da0c473bbf1b8978f5b79  ranger-1.7.2.tar.gz
+sha256  ce088a04c91c25263a9675dc5c43514b7ec1b38c8ea43d9a9d00923ff6cdd251  ranger-1.9.3.tar.gz
 # Locally computed
-sha256  fa3b40d44066b033ac8a134b792a4a4a1915aa7bc7757098e0f67080648a3271  AUTHORS
+sha256  ef973501404bd0556fd47324411fc69679f30daf7128e042eafa64e2c4f9ecb9  AUTHORS
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index 1c948db848..d8a55b1fc2 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-RANGER_VERSION = 1.7.2
-RANGER_SITE = http://ranger.nongnu.org
+RANGER_VERSION = 1.9.3
+RANGER_SITE = https://ranger.github.io
 RANGER_SETUP_TYPE = setuptools
 RANGER_LICENSE = GPL-3.0
-RANGER_LICENSE_FILES = AUTHORS
+RANGER_LICENSE_FILES = AUTHORS LICENSE
 
 # The ranger script request python to be called with -O (optimize generated
 # bytecode slightly; also PYTHONOPTIMIZE=x). This implicitly requires the python
@@ -16,7 +16,7 @@ RANGER_LICENSE_FILES = AUTHORS
 # files are installed.
 
 define RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
-	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
+	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/ranger.py
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
