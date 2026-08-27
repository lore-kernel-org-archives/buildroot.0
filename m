Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F873C61DC2
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 09:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC81A80DD4;
	Thu, 27 Aug 2026 09:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KM8JTl_8zdbK; Thu, 27 Aug 2026 09:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787821274;
	bh=uGszLnkr+C6dpGvCfg9n/Zh/Ci4JasbsPapHJ0sK6W4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bm2sWATAcSWpxtIEjEiG559E7H8p6y6UouazREvRPSGK57e5HAnl26qcZZyshw38/
	 kDF6RyLbKmjye0OKsjdXHIDLfcAuS+11jkOEJOwLJRYQ3JZwxPfiNwllY1ssyKz0v7
	 VURpdWXHLXlYHX/LlAVzCTmPVDglNfcDhzjMtu8NanxnJZ28Wh0V5Ohi5mmwRuxumN
	 DR8nA6kagk1GIDfUIt+NRuKk0o52/ErBUFhKBbzrI1js3tu01w3jeIrGRKeCKzyGcy
	 x+fAox+8B1A4Qa5TBsgw1viMOBF6SMxEFJ54fz57+dY7zV+oigRYVXWh8pHSF0m4GK
	 YXufzS68WHYmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A362380DDE;
	Thu, 27 Aug 2026 09:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 883697AA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A0F9406C0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UCzcxg7BNHw for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 09:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NI+CJiAO
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E462E406A0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:01:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so16906345e9.1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787821268; x=1788426068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KFsGz4dH5Z58HE7RZUXYqVraBhpko7xYGzajSvEeRPU=;
 b=NI+CJiAOJyIIDY8l4qdnruR8doAyuYotzgZYJtxiYWmGu+mOyTbKeotEgNtPFQyr84
 9iEXCZorrhZJrKd4i/BaZO7V5anr2myxXr1zqnn2mUP8JRwC+YdvDbjSzJl1TZJCPiXk
 g/oh9Nhgj2W5eJXTjy+p+b4SV5RaDSqdfCIZxMhRqXegxSZKTfOG6eoGmnL/MtPTYt+u
 E8DKS+0F33Vv/Ar+Fz3bmRubUlwMUIXEpu8uWqI9RD0k1lIIYVCEOaF2ZtBCo3pdV2hg
 JtYdR7FcjHP9mX3KJRgJPRjU+8Urm8sHjVVPgP3HO2kBvxqBFbdPORlKLGprOjhGGi5Q
 2eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821268; x=1788426068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KFsGz4dH5Z58HE7RZUXYqVraBhpko7xYGzajSvEeRPU=;
 b=N2YPALOHG0CQymRyNBiB0uVtvvkvoxIWnLtJ1GqyBsWYIwEsyJwguPah8BRr6+du8v
 juXT9u2p4tcmuhloZ+FKL6f+PhU3EHwnTxtTH41T3tkrm4/fbQHqiGjbFYqlLmwFsuU4
 kRLHL8zsUEjyeYp7zfGOcSEsiUkrThgevJhrjDWpZL9OQ2kDe6RfTFZjSe5m3EBZRsoi
 jufLmVHe1JSD18fgIjBybOrYV4oxxU8EvlG9Tv1ja0ZBETRbVDBDw64m/p/Jcpplsw0K
 /GsVLq+kCl08PHvnuBBraSHzpvWQJdatsFoDRjFoZ25CctowxUFzo5M5ApsV+p5afdfO
 crvA==
X-Gm-Message-State: AFuF++kXe34bjXwVDIGaSMOSkKZyCMdbSMhOHSm2W7rVLKQsODRAxGCm
 7UQCGBIvVV9qi3cbA00eFJs6093BxO04lBJZcxX4R13cDmLXW9gDTH8nRCQIfjADjaU=
X-Gm-Gg: AR+sD12GPgKnj7XWHSUm19Qsk5P067qwJfPY1xDXY8w49s4p+smcC++tOo03hDL8ldb
 fGWpci8jJmLs8ZMnaFNaHhknVXsLJxFHLd8SD2TC1E7qv+VvoRdJsuqTYPsQbQllhY09HW4Yru7
 XbzpMq7hB2IS6nj9/A4T1D6t+IWhea39zppEZ8lko1vJi/FZwpD6MRJ0uE0O9i2/ZD6cChaLQfm
 M7AhGO/lMZ2INh2/R5iS4V1nREqqwYd6OUAvhvsnu6v+oGTa+Y14UInpqBp2NBB8RtBb+CAbEku
 TsxjjNQNCy3VtHstwc38NVYfoCZQuBv6GwJvR01ZYJ7AwHPiBN8jCYOkd8W1iFPk688BcFgLJOZ
 /r12blG0jN02+1tgpb1p8Fnds/qu4jMY/lpxWirsdv9SjwcctcuMVLG3wN726nGJuvSuC4sShjB
 GiCayRMfPAuQK59UXI5PRPwAieqhRqh0BfkDAY7AZQaknky4PFzG4X3f4pqYChHgZCPVXxNY2Qn
 MVnWiT77fodfCmmdF0IZ6em9CqBvTTHImaeP6M74mIkkpC68ssWL02hulFzeas5Q2yNEDi9LcH/
 5Ks+rUZhpc5QGFWYxY1fOJgJekOKMUmT5ffuaxfWNESfUR4lCYnCBw==
X-Received: by 2002:a05:600c:8901:b0:49b:5521:785d with SMTP id
 5b1f17b1804b1-49b5530be2cmr44692585e9.4.1787821267712; 
 Thu, 27 Aug 2026 02:01:07 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-482e28dc10asm7912061f8f.19.2026.08.27.02.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 02:01:07 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Thu, 27 Aug 2026 11:01:00 +0200
Message-ID: <20260827090100.3046806-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310090903.19287-1-thomas@devoogdt.com>
References: <20260310090903.19287-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6] package/sema-linux: add new unified adlink
 sema drivers package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Devreese Jorik <jorik.devreese@barco.com>

Add the unified sema-linux package, which replaces the archived
sema-linux-ec repository from Adlink. This unified upstream repository
provides support for both BMC (Board Management Controller) and EC
(Embedded Controller) devices.

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: reworked patch
 - added user sw step
 - fixed help text
 - fixed hash and license info
v3: fixed build args
v4: fix missing util-linux dependency
v5: reworked patch
 - fix parallel build
 - add and use app_build/app_install
v6: rework to use sema-linux as sema-linux-ec was archived
---
 package/Config.in                             |  1 +
 ...CC-variable-instead-of-hardcoded-gcc.patch | 54 +++++++++++++++++++
 ...ure-that-lsema-is-always-built-first.patch | 32 +++++++++++
 ...3-Makefile-add-cross-install-support.patch | 38 +++++++++++++
 ...file-add-a-separate-app_build-target.patch | 42 +++++++++++++++
 package/sema-linux/Config.in                  | 14 +++++
 package/sema-linux/sema-linux.hash            |  5 ++
 package/sema-linux/sema-linux.mk              | 34 ++++++++++++
 8 files changed, 220 insertions(+)
 create mode 100644 package/sema-linux/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
 create mode 100644 package/sema-linux/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
 create mode 100644 package/sema-linux/0003-Makefile-add-cross-install-support.patch
 create mode 100644 package/sema-linux/0004-Makefile-add-a-separate-app_build-target.patch
 create mode 100644 package/sema-linux/Config.in
 create mode 100644 package/sema-linux/sema-linux.hash
 create mode 100644 package/sema-linux/sema-linux.mk

diff --git a/package/Config.in b/package/Config.in
index 6058800682..b0793ed6cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -609,6 +609,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch b/package/sema-linux/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
new file mode 100644
index 0000000000..f9b454eef5
--- /dev/null
+++ b/package/sema-linux/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
@@ -0,0 +1,54 @@
+From 6492dcc89737799b39555fdcb79e7254332fe2f4 Mon Sep 17 00:00:00 2001
+From: Devreese Jorik <jorik.devreese@barco.com>
+Date: Mon, 19 Jan 2026 15:00:00 +0000
+Subject: [PATCH] Makefile: use CC variable instead of hardcoded gcc
+
+Allow the compiler to be overridden via the CC variable for
+cross-compilation support.
+
+Upstream: https://github.com/ADLINK/sema-linux/pull/2
+Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1c4274d..cfad0c7 100755
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@ all: libsema.so semautil wdogtest modules
+ driver: modules
+ 
+ libsema.so: $(SEMA_OBJS)
+-	@gcc -shared -fPIC -g -o lib/$@ $^
++	@$(CC) -shared -fPIC -g -o lib/$@ $^
+ 
+ modules:
+ 	@make -C /lib/modules/`uname -r`/build M=`pwd` $@
+@@ -52,16 +52,16 @@ app_clean:
+ 	@rm -f semautil wdogtest app/*.o lib/*.o lib/*.so
+ 
+ semautil: $(APP_OBJS)
+-	@gcc -g -o $@ $^ -Llib -lsema -luuid
++	@$(CC) -g -o $@ $^ -Llib -lsema -luuid
+ 
+ wdogtest: $(WDOG_OBJS)
+-	@gcc $^ -g -o $@
++	@$(CC) $^ -g -o $@
+ 
+ lib/%.o: lib/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+ 
+ app/%.o: app/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+ 
+ watchdogtest/%.o: watchdogtest/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+-- 
+2.43.0
+
diff --git a/package/sema-linux/0002-Makefile-ensure-that-lsema-is-always-built-first.patch b/package/sema-linux/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
new file mode 100644
index 0000000000..d278b30b06
--- /dev/null
+++ b/package/sema-linux/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
@@ -0,0 +1,32 @@
+From 2f1e58beeee7aedd1000f85e5f3a63766d131bc5 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 10 Mar 2026 09:08:05 +0100
+Subject: [PATCH] Makefile: ensure that -lsema is always built first
+
+When using parallel builds, there is no guarantee that libsema.so
+is built first.
+
+Upstream: https://github.com/ADLINK/sema-linux/pull/2
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index cfad0c7..37926e1 100755
+--- a/Makefile
++++ b/Makefile
+@@ -51,8 +51,8 @@ driver_clean:
+ app_clean:
+ 	@rm -f semautil wdogtest app/*.o lib/*.o lib/*.so
+ 
+-semautil: $(APP_OBJS)
+-	@$(CC) -g -o $@ $^ -Llib -lsema -luuid
++semautil: libsema.so $(APP_OBJS)
++	@$(CC) -g -o $@ $(APP_OBJS) -Llib -lsema -luuid
+ 
+ wdogtest: $(WDOG_OBJS)
+ 	@$(CC) $^ -g -o $@
+-- 
+2.43.0
+
diff --git a/package/sema-linux/0003-Makefile-add-cross-install-support.patch b/package/sema-linux/0003-Makefile-add-cross-install-support.patch
new file mode 100644
index 0000000000..0e84e9cbb6
--- /dev/null
+++ b/package/sema-linux/0003-Makefile-add-cross-install-support.patch
@@ -0,0 +1,38 @@
+From dcd82a06551ade5c7dd85c3dbb472bd3593602ef Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 10 Mar 2026 09:09:59 +0100
+Subject: [PATCH] Makefile: add cross install support
+
+Add support to override the DESTDIR & PREFIX.
+
+Upstream: https://github.com/ADLINK/sema-linux/pull/2
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 37926e1..1432e0d 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,3 +1,5 @@
++DESTDIR ?=
++PREFIX ?= /usr
+ 
+ SEMA_OBJS = $(patsubst %.c,%.o,$(wildcard lib/*.c))
+ WDOG_OBJS = $(patsubst %.c,%.o,$(wildcard watchdogtest/*.c))
+@@ -38,8 +40,9 @@ driver_install:
+ 	@depmod -a
+ 
+ app_install:
+-	@cp lib/libsema.so /usr/lib
+-	@cp wdogtest semautil /usr/bin
++	@install -d $(DESTDIR)$(PREFIX)/lib $(DESTDIR)$(PREFIX)/bin
++	@install -m 755 lib/libsema.so $(DESTDIR)$(PREFIX)/lib
++	@install -m 755 wdogtest semautil $(DESTDIR)$(PREFIX)/bin
+ 
+ driver_clean:
+ 	@make -C /lib/modules/`uname -r`/build M=`pwd` clean
+-- 
+2.43.0
+
diff --git a/package/sema-linux/0004-Makefile-add-a-separate-app_build-target.patch b/package/sema-linux/0004-Makefile-add-a-separate-app_build-target.patch
new file mode 100644
index 0000000000..346d31a75d
--- /dev/null
+++ b/package/sema-linux/0004-Makefile-add-a-separate-app_build-target.patch
@@ -0,0 +1,42 @@
+From 6c7f7a88357c291780236738fabf82229d2598c5 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 10 Mar 2026 09:25:07 +0100
+Subject: [PATCH] Makefile: add a separate app_build target
+
+By this, there is:
+ - app_build
+ - app_install
+ - app_clean
+
+This makes compilation of the app-only a bit easier to maintain.
+
+Upstream: https://github.com/ADLINK/sema-linux/pull/2
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1432e0d..ee8089d 100755
+--- a/Makefile
++++ b/Makefile
+@@ -17,13 +17,15 @@ obj-m := driver/adl-bmc.o \
+ 
+ adl-bmc-nvmem-sec-m := driver/adl-bmc-nvmem-sec.o driver/nvmem-common.o	 
+ adl-bmc-nvmem-m := driver/adl-bmc-nvmem.o driver/nvmem-common.o	 
+-all: libsema.so semautil wdogtest modules
++all: app_build modules
+ 
+ driver: modules
+ 
+ libsema.so: $(SEMA_OBJS)
+ 	@$(CC) -shared -fPIC -g -o lib/$@ $^
+ 
++app_build: libsema.so semautil wdogtest
++
+ modules:
+ 	@make -C /lib/modules/`uname -r`/build M=`pwd` $@
+ 
+-- 
+2.43.0
+
diff --git a/package/sema-linux/Config.in b/package/sema-linux/Config.in
new file mode 100644
index 0000000000..04a1448444
--- /dev/null
+++ b/package/sema-linux/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEMA_LINUX
+	bool "sema-linux"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux
+
+comment "sema-linux needs a toolchain w/ dynamic library, Linux kernel"
+	depends on BR2_STATIC_LIBS || !BR2_LINUX_KERNEL
diff --git a/package/sema-linux/sema-linux.hash b/package/sema-linux/sema-linux.hash
new file mode 100644
index 0000000000..c2e086c5c5
--- /dev/null
+++ b/package/sema-linux/sema-linux.hash
@@ -0,0 +1,5 @@
+# locally computed
+sha256  fe67c77b12db6db02e2c745dce79085b5fc16be2dabd3eedda625d53ccbd5b26  sema-linux-ec-v4.3.12.tar.gz
+sha256  71be2577bc5028f0e15bb170439878b61593967460e88e0d26a889430a32db00  LICENSE.BSD3
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
+sha256  f484be998be05569aa68e5afb1d29a37cbe2cc7947aea66df83bab7bbdfd74f3  LICENSE.dual
diff --git a/package/sema-linux/sema-linux.mk b/package/sema-linux/sema-linux.mk
new file mode 100644
index 0000000000..daabd8b8c0
--- /dev/null
+++ b/package/sema-linux/sema-linux.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# sema-linux
+#
+################################################################################
+
+SEMA_LINUX_VERSION = v4.4.3
+SEMA_LINUX_SITE = $(call github,ADLINK,sema-linux,$(SEMA_LINUX_VERSION))
+SEMA_LINUX_LICENSE = BSD-3-Clause or GPL-2.0
+SEMA_LINUX_LICENSE_FILES = LICENSE.BSD3 LICENSE.GPLv2 LICENSE.dual
+SEMA_LINUX_DEPENDENCIES = util-linux
+
+define SEMA_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) app_build
+endef
+
+define SEMA_LINUX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) app_install
+endef
+
+define SEMA_LINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BACKLIGHT_CLASS_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIOLIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HWMON)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C_BOARDINFO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NVMEM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG_CORE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
