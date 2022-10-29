Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D057C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 17:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAE97813DB;
	Sat, 29 Oct 2022 17:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE97813DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhCSjljs4Gzk; Sat, 29 Oct 2022 17:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1725813D8;
	Sat, 29 Oct 2022 17:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1725813D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5EB31BF867
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD8C04087A
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8C04087A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3z5g_7F5vu8 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 17:00:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC37440877
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC37440877
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 17:00:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so8360626wms.0
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 10:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXGLn3sGG8SGh2l51IhqLKmcdC8FNhOWr+uRVzgbrJ4=;
 b=l3Oh5EbDN/DMpEDY7LyWPBGtfGH3EHpwBlsq5yaROhyDLdasnbZfvw1eC6vvd5bL/V
 4zjHywJG4XBtObFpx/EEF+iylRTGnq1mQ53G5HkN+uJ+GTCDvE0Vuqp1V26IpdhW5/SU
 1h89115zznk432l/28jQMtIn1yjj1BhxsJ6xIcd7NSYU4DCMKo60K9XzL8w+qmL8tOQJ
 bxsrk0IUFgeusNjdrY+2zTsFnEcaa/pGQ8pTqxsTkl3fqfvERGYCzYNC+750ToM15zm8
 qU1l9HwiCoMzQIahI/DBnTkACQ0/tSkGeIZfyRu0sXVKr6AqS2EIips9QrjduE/YtoCZ
 TSAQ==
X-Gm-Message-State: ACrzQf3fWLE30WnaJIB/KZL3UjTVqFCtA0zHnZdPZAnk8ECmdHcxtK/t
 c3+9S7ZKWDfUQVvpJ/E46bq2R0QSZUU=
X-Google-Smtp-Source: AMsMyM577R9+Dk7fwLsfEw8v6JIbNoZB25r0divttY84q9vpX7qhmAnjG7b0BCZAsHKjDzm4wz4XpQ==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id
 j30-20020a05600c1c1e00b003c6fa3c32a9mr12898490wms.203.1667062831599; 
 Sat, 29 Oct 2022 10:00:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b00228a6ce17b4sm2076606wry.37.2022.10.29.10.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 10:00:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 19:00:22 +0200
Message-Id: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TXGLn3sGG8SGh2l51IhqLKmcdC8FNhOWr+uRVzgbrJ4=;
 b=eSDdY09b+0ck2slDIp9U+Ud4k+FPAzouzdA/E5HcPDAmGO2bvxb3uIhBQ5Mr+SUIzJ
 Ww1hwdrimUw4jy7qguUgibCxZClGPWHOzc6pwqkvaq71AEARlDtrRLtgB7fVHQJu+fUu
 jFpUJcx92zSf+t6wLDnXbDTiBMnfafOieTZZetZhtF5Cezow0pBE2pIMQoyYjS/7xyri
 JXZJL0gy27mnawfDlXsX6VptdHP7abcVQ1GzQthtiMXivUx8QnGrNTgz7FwUwG4dsGTm
 ux3J6z0PhtDCv1abtg6xnxFPb69mS9wPHuGBWtLKnJTfnc7/czDxWW4906+Ic42sbp0c
 eOAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eSDdY09b
Subject: [Buildroot] [PATCH 1/2] package/f2fs-tools: add lz4 and lzo
 optional dependencies
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lz4 and lzo are optional dependencies (enabled by default) since bump to
version 1.14.0 in commit cf566658f28f3e4b362cc8f9235e6b7768af355c and
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=b585244e726c1024f7b842033689992a383808cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-configure-ac-fix-cross-compilation.patch | 88 +++++++++++++++++++
 package/f2fs-tools/f2fs-tools.mk              | 18 +++-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch

diff --git a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
new file mode 100644
index 0000000000..0e3d4da191
--- /dev/null
+++ b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
@@ -0,0 +1,88 @@
+From 32e7d272344024c216f155c3463dd2d548f3fafd Mon Sep 17 00:00:00 2001
+From: Nick Hainke <vincent@systemli.org>
+Date: Mon, 4 Jul 2022 11:29:19 +0200
+Subject: configure.ac: fix cross compilation
+
+AC_CHECK_LIB seems to not work correctly with OpenWrt. Add possibility
+to disable lz4 and lzo2 manually.
+
+Fixes errors in the form of:
+  Package f2fsck is missing dependencies for the following libraries:
+  liblz4.so.1
+  liblzo2.so.2
+
+Signed-off-by: Nick Hainke <vincent@systemli.org>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=32e7d272344024c216f155c3463dd2d548f3fafd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 44 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ea39461..dbe9ad3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,6 +50,18 @@ AC_ARG_WITH([blkid],
+ 	[],
+ 	[with_blkid=check])
+ 
++AC_ARG_WITH([lzo2],
++	[AS_HELP_STRING([--without-lzo2],
++	  [Ignore presence of liblzo2 and disable lzo2 support])],
++	[],
++	[with_lzo2=check])
++
++AC_ARG_WITH([lz4],
++	[AS_HELP_STRING([--without-lz4],
++	  [Ignore presence of liblz4 and disable lz4 support])],
++	[],
++	[with_lz4=check])
++
+ # Checks for programs.
+ AC_PROG_CC
+ AM_PROG_AR
+@@ -71,17 +83,29 @@ AS_IF([test "x$with_blkid" != xno],
+         fi
+ 	], -lblkid)])
+ 
+-AC_CHECK_LIB([lzo2], [main],
+-	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
+-		AC_DEFINE([HAVE_LIBLZO2], [1],
+-		[Define if you have liblzo2])
+-	], [], [])
++AS_IF([test "x$with_lzo2" != xno],
++	[AC_CHECK_LIB([lzo2], [main],
++		[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
++			AC_DEFINE([HAVE_LIBLZO2], [1],
++			[Define if you have liblzo2])
++		],
++		[if test "x$with_lzo2" != xcheck; then
++			AC_MSG_FAILURE(
++                [--with-lzo2 was given, but test for lzo2 failed])
++        fi
++	], -llzo2)])
+ 
+-AC_CHECK_LIB([lz4], [main],
+-	[AC_SUBST([liblz4_LIBS], ["-llz4"])
+-		AC_DEFINE([HAVE_LIBLZ4], [1],
+-		[Define if you have liblz4])
+-	], [], [])
++AS_IF([test "x$with_lz4" != xno],
++	[AC_CHECK_LIB([lz4], [main],
++		[AC_SUBST([liblz4_LIBS], ["-llz4"])
++			AC_DEFINE([HAVE_LIBLZ4], [1],
++			[Define if you have liblz4])
++		],
++		[if test "x$with_lz4" != xcheck; then
++			AC_MSG_FAILURE(
++                [--with-lz4 was given, but test for lz4 failed])
++        fi
++	], -llz4)])
+ 
+ AS_IF([test "x$with_selinux" != xno],
+ 	[AC_CHECK_LIB([selinux], [getcon],
+-- 
+cgit 
+
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 2c4ee9185b..60f1004d77 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -22,6 +22,20 @@ else
 F2FS_TOOLS_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+F2FS_TOOLS_CONF_OPTS += --with-lz4
+F2FS_TOOLS_DEPENDENCIES += lz4
+else
+F2FS_TOOLS_CONF_OPTS += --without-lz4
+endif
+
+ifeq ($(BR2_PACKAGE_LZO),y)
+F2FS_TOOLS_CONF_OPTS += --with-lzo2
+F2FS_TOOLS_DEPENDENCIES += lzo
+else
+F2FS_TOOLS_CONF_OPTS += --without-lzo2
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 # util-linux is a dependency already, no need to list it again
 F2FS_TOOLS_CONF_OPTS += --with-blkid
@@ -34,7 +48,9 @@ endif
 # blkid support even if we have host-util-linux
 HOST_F2FS_TOOLS_CONF_OPTS = \
 	--without-selinux \
-	--without-blkid
+	--without-blkid \
+	--without-lz4 \
+	--without-lzo2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
