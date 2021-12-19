Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D34C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 15:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8741160B61;
	Sun, 19 Dec 2021 15:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuintQwmmxzF; Sun, 19 Dec 2021 15:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EFD60B5F;
	Sun, 19 Dec 2021 15:32:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73C331BF475
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B5483E9D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5-C5MGTMODb for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 15:32:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41F7883E6B
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 15:32:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so5011663wms.3
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PHvIuIRia09+bRgvdG5D4A7LkBgLyJHqkPAAOavOLnE=;
 b=W2gAvPcgzrgdGt1BVWyImd0NComuXbyX6UrU+Guepo++7mUdrcymbcXfwGat4TA37j
 HZ2S4W3ySVtJdBf5lsQhUMERZislH9oX/gl4CwgpyhBfFBLmeaeQBNT835UH9Sm4iR5L
 GSO9Li0E8ojUdzsIlpXC/o502nby71bol7aPMPIgEnSxLNvPsZcWWXZSqz8iU6Pb6UBG
 aeWiOQPgCshD/IjXeRmEK04J1WUBM+OkkyApV4qMyXt232R1BvScmc6945otez0IaOSK
 cAE/3zpX3Hs8NIidyozwhnG5e5aGT14d9iPZA3ZENNGt1Z56NY1NS7VTQ88pUZ54UxcW
 C5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PHvIuIRia09+bRgvdG5D4A7LkBgLyJHqkPAAOavOLnE=;
 b=Uhbn6wlXQJG0OFbE/QDBX0DTrfoEKuFQuuDwLnLMYuifLmgm94ypmsoWZSLf/VapdZ
 /UMrrqR6i5WOBPNEUh5VZkrYbH6tlH4lTxwGVYCFzc4Es1Fj9HZ0cU3QWEqDQ7vmGFwh
 EkVyJkRVz68T8xe1PwDN3Ir5J8EUCPelFbzXCqzi9lWeuC22It45gPBcjEOsjfTlFPnQ
 B7KMQI4r9pGK3ATSYl487k1PjbSLFEGGGRrGT0C3XZaQiykIArtADqXs6L/IgKbkmM4Z
 w9ySQYF2XAyG2M3sk+L21Pc7tKZQ4HtrlZp3rVObXWj+MRwOV9WSPbTpperrhVDIioqZ
 DdEw==
X-Gm-Message-State: AOAM533wEuf7o8d9PCpb7fo6oP5uwpY8MXd36G6u8xPKMstCzNoP1npg
 rwAaqRBV5UX8UDm2J7ZQKWXtNyECxz2hWA==
X-Google-Smtp-Source: ABdhPJxsEXskuF1vTjZuh1vD+YFOesxof8l79GNT2Rul6R3iVIupW/WbQmMaX+g/Cpd42dK787lcyQ==
X-Received: by 2002:a05:600c:600a:: with SMTP id
 az10mr17421501wmb.69.1639927955379; 
 Sun, 19 Dec 2021 07:32:35 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id q13sm9562787wrr.64.2021.12.19.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 07:32:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 16:32:07 +0100
Message-Id: <20211219153207.1084655-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: fix build
 without stack-protector
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without stack-protector raised since
bump to version 3.3.1 in commit 3965f09cb427af411055a783cd14b501b2b28285
and
https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'

Fixes:
 - http://autobuild.buildroot.org/results/8de/8dee462d16d934dd173d58f17933c6911e4336bf/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 +++++++++++++++++++
 .../jitterentropy-library.mk                  |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch

diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
new file mode 100644
index 0000000000..c4388663b0
--- /dev/null
+++ b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
@@ -0,0 +1,52 @@
+From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Dec 2021 11:36:13 +0100
+Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
+
+Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
+stack-protector is again broken since
+https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
+jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
+---
+ Makefile | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index dfb96a8..c999ef5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,7 @@
+ 
+ CC ?= gcc
+ #Hardening
++ENABLE_STACK_PROTECTOR ?= 1
+ CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
+ CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
+ LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
+@@ -13,10 +14,12 @@ else
+   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
+ endif
+ 
+-ifeq "$(GCC_GTEQ_490)" "1"
+-  CFLAGS += -fstack-protector-strong
+-else
+-  CFLAGS += -fstack-protector-all
++ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
++  ifeq "$(GCC_GTEQ_490)" "1"
++    CFLAGS += -fstack-protector-strong
++  else
++    CFLAGS += -fstack-protector-all
++  endif
+ endif
+ 
+ # Change as necessary
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 830da0e065..4cdebf46a3 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -26,7 +26,7 @@ endif
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
+		ENABLE_STACK_PROTECTOR=0 $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
 define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
