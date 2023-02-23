Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27122C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 10:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53EC81D34;
	Thu, 23 Feb 2023 10:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C53EC81D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAubyGG7kQcH; Thu, 23 Feb 2023 10:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF3F81D18;
	Thu, 23 Feb 2023 10:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF3F81D18
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 921A11BF35E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D4B81C67
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D4B81C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCM46NFG2RjA for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 10:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043DD81D18
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 043DD81D18
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 10:53:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bo30so9774857wrb.0
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 02:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kYrUQ4+xBW1qprozSGvwZJF8fJAeJfnffqqhJ5PfZQ=;
 b=rrScrW2cxQ8NXzhmydLNGI2uDqNLpf24xVd1O+UBXceE+QM2RIxT4XgMkbosxYrvGE
 wPdC46Vk2uLOh429qlTL/FJTrZHihGsPiM2PWdW6QZNXFZQX/irJXZZmNDJZWUch73yb
 uZ1fShTrC/56UqSKoBLnI0PfZHgOrXgj+0ECMYk97vwm0szYR9RJnzqrNE5digZHrbUZ
 pyjfvEo+I8QYwnSTHmDnajqFBGXrv+am4MB824aFv0HwBU/0Fik1aeLvBmht8WQFXStN
 dnC5hXI2Btm4M1x18sh9mjGQVVy5TbRpQB30oJt32/YjUrsDV4gv/ZLhJr3KiFrvSkxH
 EynA==
X-Gm-Message-State: AO0yUKX8R6PG8SX0dSMR6XT0CchLhfmznDfC8IuXXjtHwc+Xq87Ggh6m
 eqBD/DTDt/8sOySZXyZd/qE1Er272bc=
X-Google-Smtp-Source: AK7set9O+A6w2nCPw53xKEionmsSBZk8EvIjyYO3VvRlI7vu2pZoRnFPmJZjVNBXQQ2Bg29E7xiYuw==
X-Received: by 2002:a05:6000:1cc:b0:2c5:598a:dd05 with SMTP id
 t12-20020a05600001cc00b002c5598add05mr10183534wrx.2.1677149585844; 
 Thu, 23 Feb 2023 02:53:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d4c81000000b002c560e6ea57sm9619140wrs.47.2023.02.23.02.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:53:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 11:53:03 +0100
Message-Id: <20230223105303.290875-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7kYrUQ4+xBW1qprozSGvwZJF8fJAeJfnffqqhJ5PfZQ=;
 b=Z+0czj9GzaJegJEEMIuJt8/34A39PFddXJpqdsants0lFy8awxUxvQnr2gX3T80nTs
 tFjkD4p/TOnQ308O+QPUrFo+NIaesqkU8FsFKKQtOg2V3x4D38lOrp84WuhqVdFalnwk
 SmUUlaLG+KKUcHvfADy7dAnCT5fQWgT5mgpXqggi6etC0blnqjWCtZGSJ1lpe/z9HjXn
 UqWUoYjHEGrMK+u9Yn3ajNdK4pyZGew2FTX33ddxw3cElyZuMr/vjWOxX0YsWvihvNuz
 73otULvs9QpfQWqmHrB7M1W8XRx3nXBntdpOyM6ditcpyXJzC7787dJZrP+CmoW7lpmz
 Re+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z+0czj9G
Subject: [Buildroot] [PATCH 1/1] package/efivar: fix build without threads
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

Fix the following build failure without threads raised since bump to
version 38 in commit f24029b561fbda0953c7dbd93d2485b03873996d and
https://github.com/rhboot/efivar/commit/cff88dd96b9d43e2c5875a24ba6180b196890ded:

thread-test.c:14:10: fatal error: pthread.h: No such file or directory
   14 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f2da14f91dc602a32dd5b2b7bdf3d3aa43afa7f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../efivar/0005-Add-NO_THREADS-variable.patch | 54 +++++++++++++++++++
 package/efivar/efivar.mk                      |  4 ++
 2 files changed, 58 insertions(+)
 create mode 100644 package/efivar/0005-Add-NO_THREADS-variable.patch

diff --git a/package/efivar/0005-Add-NO_THREADS-variable.patch b/package/efivar/0005-Add-NO_THREADS-variable.patch
new file mode 100644
index 0000000000..fdd874ab70
--- /dev/null
+++ b/package/efivar/0005-Add-NO_THREADS-variable.patch
@@ -0,0 +1,54 @@
+From 9fd025945212ab2b2bf71328588b2a5377655176 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 11:46:38 +0100
+Subject: [PATCH] Add NO_THREADS variable
+
+Allow the user to disable building thread-test to avoid the following
+build failure without threads raised since version 38 and
+https://github.com/rhboot/efivar/commit/cff88dd96b9d43e2c5875a24ba6180b196890ded:
+
+thread-test.c:14:10: fatal error: pthread.h: No such file or directory
+   14 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/277f783c33102a0cea7c82ca902119ab90f37ad4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rhboot/efivar/pull/238]
+---
+ src/Makefile            | 5 ++++-
+ src/include/defaults.mk | 1 +
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index ec1eabe..eb0427e 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -7,7 +7,10 @@ include $(TOPDIR)/src/include/defaults.mk
+ 
+ LIBTARGETS=libefivar.so libefiboot.so libefisec.so
+ STATICLIBTARGETS=libefivar.a libefiboot.a libefisec.a
+-BINTARGETS=efivar efisecdb thread-test
++BINTARGETS=efivar efisecdb
++ifeq ($(NO_THREADS),)
++BINTARGETS += thread-test
++endif
+ STATICBINTARGETS=efivar-static efisecdb-static
+ PCTARGETS=efivar.pc efiboot.pc efisec.pc
+ TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index 630da23..9632887 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -8,6 +8,7 @@ BINDIR	?= $(EXEC_PREFIX)/bin
+ PCDIR	?= $(LIBDIR)/pkgconfig
+ DESTDIR	?=
+ PKGS	?=
++NO_THREADS ?=
+ 
+ CROSS_COMPILE	?=
+ COMPILER 	?= gcc
+-- 
+2.39.1
+
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 8b1d338bec..27ad7a39e2 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -23,6 +23,10 @@ EFIVAR_MAKE_OPTS = \
 	SUBDIRS=src \
 	LD_DASH_T=-T
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+EFIVAR_MAKE_OPTS += NO_THREADS=1
+endif
+
 define HOST_EFIVAR_BUILD_CMDS
 	# makeguids is an internal host tool and must be built separately with
 	# $(HOST_CC), otherwise it gets cross-built.
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
