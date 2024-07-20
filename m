Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9288BC3DA70
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169664027D;
	Sat, 20 Jul 2024 21:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSylagu5pcCL; Sat, 20 Jul 2024 21:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1E340491
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1E340491;
	Sat, 20 Jul 2024 21:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA621BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19227400D8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcKie-V5xE1X for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62EAF40217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62EAF40217
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62EAF40217
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:33:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4266eda81c5so24536065e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721511231; x=1722116031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r4JcfdIfeMvZ13cxlGnd7yA1z6ezmO4mAin4z/xeqJw=;
 b=H+c++uT5+YkMiIftWANR/L9P4s0/yX5LjJzj4wXEi0NhkcYTl0EbeYL7u7fApEizb7
 gomd7PAru+RhsWfFwTdBI4t7nON/VOYy9cPD7AGE0mkDK883qa/9KIs2354BgdTtzbVi
 Jir/AWXdn4/RfLBJqIguPL6awYTUc8PD+7ncZWaE1/Zr+abrEY066dIkENJ8VXxZHZBN
 wKtoHSV2JjsIzylcWowHRitneUYG+V8orCrChOKM7fwuz4hYcbEKgATBjGPYl7Mqpl1M
 QLRCBR2p4i99M6v6dfWsJN79sIdFMjHP/RxZg1o6POEfEjhxp8GoJPN+EXybIWIeUv8x
 t1Cw==
X-Gm-Message-State: AOJu0YzHoUWTzszcS2nRJ/X2huTOe8Rg1YdibhVRwjdOLrz1uEs/GU2E
 yvlrfBr8cvENlazQw2HvfgPMhaB6YvBLfuNalTWB4VLRLZpJdTitf5uorg==
X-Google-Smtp-Source: AGHT+IG6N/AepecdbZlSKRyeDa1geD21Mgre7s/v77xEMta6sYYQoqAUz14bj+xXy4hZgPc0QjS9bQ==
X-Received: by 2002:a05:600c:19d3:b0:426:5f09:cf53 with SMTP id
 5b1f17b1804b1-427dc5208e1mr18729295e9.15.1721511230837; 
 Sat, 20 Jul 2024 14:33:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a5c34bsm95961685e9.16.2024.07.20.14.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 14:33:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:33:47 +0200
Message-ID: <20240720213347.1740848-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721511231; x=1722116031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r4JcfdIfeMvZ13cxlGnd7yA1z6ezmO4mAin4z/xeqJw=;
 b=K5V6ci1Fw55thm0UFOnqceuKxoPJOmhYYV/k9ykPng6Z8eZaqy4WbKA5U1xyNNt9VP
 72snCbmkzB3qWnVtoZVAP0xtInGOul7f5n+c7MS4mRBZjvZm+gSGTQlIV7SVz+fqY7TA
 /Syj+E5qobcVKia2SI9RKq7K9qs0NL7zjA8FVXdIMf+4FxkrAxzHxWQcrzdsiO+6sJts
 0HPXoErr0GbA+eUWUfiw9WbhqizWTH8Yy3SZnAD8oyMi6Xi/xf2E5UekrpV7sDRrtIq6
 5+MKzuFRQQbXdzJHAhyLAz0EfIYgzLW0ea9v0dkeTub3OrbCTgiDyK85BZ4oBJRiWcG5
 XLsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K5V6ci1F
Subject: [Buildroot] [PATCH 1/1] package/gengetopt: fix patch fuzz
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use upstream patch to fix patch fuzz and avoid the following build
failure raised since commit 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
which reduced the fuzz factor:

Applying 0001-configure.ac-add-disable-doc-option.patch using patch:
patching file Makefile.am
Hunk #1 FAILED at 18.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej

Fixes:
 - http://autobuild.buildroot.org/results/4cfa513e024ea2cb2058fde4ffdd727bd379dae7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                 |  1 -
 .../0001-configure.ac-add-disable-doc-option.patch  | 13 +++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f0fa13eb4f..e6538af999 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -604,7 +604,6 @@ package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
-package/gengetopt/0001-configure.ac-add-disable-doc-option.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
diff --git a/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
index d43714a3df..80bda9b721 100644
--- a/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
+++ b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
@@ -1,22 +1,22 @@
-From 250bee9e02546846d70dbe88ac36bb83c6a7ebdf Mon Sep 17 00:00:00 2001
+From e3fe8db2b67cdb18e1a2a6765644c8cc476d0b0a Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 22 Sep 2019 09:27:24 +0200
-Subject: [PATCH] configure.ac: add --disable-doc option
+Subject: configure.ac: add --disable-doc option
 
 Add --disable-doc option to allow the user to disable documentation
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Sent upstream: https://savannah.gnu.org/bugs/index.php?56931]
+Upstream: https://git.savannah.gnu.org/cgit/gengetopt.git/commit/?id=e3fe8db2b67cdb18e1a2a6765644c8cc476d0b0a
 ---
  Makefile.am  | 6 +++++-
  configure.ac | 7 +++++++
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index dbb5719..2db307a 100644
+index 1f184c2..76ac21a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -18,6 +18,10 @@
+@@ -18,7 +18,11 @@
  ACLOCAL_AMFLAGS = -I m4 -I gl/m4
  
  EXTRA_DIST = configure TODO LICENSE gl/m4/gnulib-cache.m4
@@ -28,6 +28,7 @@ index dbb5719..2db307a 100644
 +endif
  
  gengetoptdoc_DATA = ChangeLog COPYING NEWS THANKS INSTALL README LICENSE
+ 
 diff --git a/configure.ac b/configure.ac
 index 0ee89db..915706c 100644
 --- a/configure.ac
@@ -47,5 +48,5 @@ index 0ee89db..915706c 100644
  	[gengen],
  	[  --with-gengen=mygengen       gengen to use],
 -- 
-2.23.0
+cgit v1.1
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
