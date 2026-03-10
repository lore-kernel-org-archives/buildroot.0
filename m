Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874C6EFCD9F
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 09:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349CE822E9;
	Tue, 10 Mar 2026 09:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8K6XSl6-QIe; Tue, 10 Mar 2026 09:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A7D822EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773133752;
	bh=SOcwGSRwGqdJRH1MuxezrTpTCe71r9MiQTB5U457ymY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WsllYgWZC/y0iIJRGNwTUq/KPFUdET809eWm+widTU1FlLsPnhQ+xql8tyoNltHC+
	 ygi29+GP1lR/b/lIODFarQFRiZ9b3UZEOMW6wW8w347xQcAZNymmhpRw1uA2TlkKCW
	 LsP0DROPV6KUQIxpz0CELuORVWaqUUCTbXXjuJTY9CPayvKiqfq37BJD07x/O0J6Nj
	 nmxqgeR+feJEp8MQd8ReoC31NXzF3U466KH5RYduYEo4Wl9wM/05OI8qPqqgSxI2Eq
	 IKg+ZSo/nbFfaUDJD3QpAtKkjLvQMMjzqfW/IAOpkk7GNXNTldegasP365uGeIcCLz
	 3vwiKgTCB+qjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A7D822EC;
	Tue, 10 Mar 2026 09:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD06B8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 09:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EFA3608F4
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 09:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6e5PX04YTa2 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 09:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA0566080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0566080A
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA0566080A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 09:09:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so2688959f8f.0
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 02:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773133748; x=1773738548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gCTC0PUiDiM82vjBPqjy/qDifyCoCIHiIyQjZ1i6yWU=;
 b=n5xkYS9PGTexfOJV7cCYpwmPQDyL689BRhEZQY3jRm5JjabhPI85YRd1jtONLccJgy
 jpUdanHVHUtlbHT7al9jdSFTvd06Yz9DgZEvbKGaQpMTEKo4KyJd748B+Jlk/Fc088Aj
 boIgLbx+yrOOKSNBGnwvdn/gxfXnBs+MWzwcS02Bx8Sy3cUU9fcHY0lRdedToczU7kbk
 +6NeIAjMb/7a5QxZo4ewGiVd56ODgHazs4O0L3gW6I5peoZ8hTelbKnVcchvJACEtgd8
 fAAwwzVxwM4TfskF4A8hMx3x9S3ZrEf9MIWPG7n/znzfmGMSaW492u2C40u1K+4GDdOt
 ZJVw==
X-Gm-Message-State: AOJu0YwPuXcMWoc3m/JQfyNtd89JiB1H3fgGqfrKRlyMWiGRQPMGJM2Q
 W26v4g92tVygmbe5txSMA58WJsgdjJYy1WTPh6lTTGHxo2MSrI4+lt+G
X-Gm-Gg: ATEYQzwPVwFXx5zD0H9SAJLAXx2ftx7pTxs6zl8vrw8h20kiRoZ/auaGACJjSXAMp4w
 0AEf7uKHUlCFfTxcBcV4fFuD0W/UDPQO4CEemEvFTA2QJFqYsG7lzWN9xcM2njYmDfeDO0FnpgD
 HZn7reU3Qgx0DLhxNkFIv0TuFvcfSkHiaaR2QE8gzpOsaVzvbKImuJ/3f1Kr9wesYULZVf2ewF8
 gLQWQW5JVhDWJQ5ZNnh8nEt9zXmqt9lAeY+1qfXVestbjH9XMoh+S/VbIwzxzM1bV8QA2K67uAk
 3gtijIWlQ2rquy97/pclwEX09UFLBseQ3tisWntxdiOsYMJyN/FSv/mksBfXyHrbOQvXqsDpIYC
 AtVA4v6zlo/gqq52oerOikKiEh7nGWN6rC1jSrLmPGQQWqO7WEooAa9ktX9ygoUlgkUFE/HVs6A
 I52Nrv2XkXgj6Z2MOCtUGFdxbdsJZW0aEqYqDV6hm6bhxdzE3260GB7mtNLPm7RbIR0XRBJwATX
 w6zg3S7+wpqyee68EGb3dq2Q6e441Pj7cvswACSyqz6H/XDZHtWA89qK3Das0k56pzhl4JDfkuJ
 UVHDXmwsDWnTCnZ3d/o=
X-Received: by 2002:a05:6000:1886:b0:439:b541:a091 with SMTP id
 ffacd0b85a97d-439da8a2cd8mr25167869f8f.56.1773133747165; 
 Tue, 10 Mar 2026 02:09:07 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-439dad8ec97sm37369392f8f.5.2026.03.10.02.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 02:09:06 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Tue, 10 Mar 2026 10:09:03 +0100
Message-ID: <20260310090903.19287-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309211032.2109039-1-thomas@devoogdt.com>
References: <20260309211032.2109039-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v5] package/sema-linux-ec: add new adlink sema
 drivers package
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

SEMA (Smart Embedded Management Agent) is an agent used to
manage system health and access the I/O pins through an API.

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

--> Actually, I found this missing dependency after removing `$(eval $(kernel-module))`
and the kernel dependency, only then I was able to run `./utils/test-pkg -p sema-linux-ec -a`.
So there is not really a way to check for the generic package compilation by using
`./utils/test-pkg` when there is a kernel-module defined. We should perhaps fix that.

$ ./utils/test-pkg -p sema-linux-ec -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: OK
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/Config.in                             |  1 +
 ...CC-variable-instead-of-hardcoded-gcc.patch | 54 +++++++++++++++++++
 ...ure-that-lsema-is-always-built-first.patch | 32 +++++++++++
 ...3-Makefile-add-cross-install-support.patch | 40 ++++++++++++++
 ...file-add-a-separate-app_build-target.patch | 42 +++++++++++++++
 package/sema-linux-ec/Config.in               | 14 +++++
 package/sema-linux-ec/sema-linux-ec.hash      |  5 ++
 package/sema-linux-ec/sema-linux-ec.mk        | 34 ++++++++++++
 8 files changed, 222 insertions(+)
 create mode 100644 package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
 create mode 100644 package/sema-linux-ec/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
 create mode 100644 package/sema-linux-ec/0003-Makefile-add-cross-install-support.patch
 create mode 100644 package/sema-linux-ec/0004-Makefile-add-a-separate-app_build-target.patch
 create mode 100644 package/sema-linux-ec/Config.in
 create mode 100644 package/sema-linux-ec/sema-linux-ec.hash
 create mode 100644 package/sema-linux-ec/sema-linux-ec.mk

diff --git a/package/Config.in b/package/Config.in
index 0da9dc29287..ae32bcdd055 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -604,6 +604,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux-ec/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch b/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
new file mode 100644
index 00000000000..9d4e9c49083
--- /dev/null
+++ b/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
@@ -0,0 +1,54 @@
+From 78de4c2656d76ffd69dc67815f6f8dc6dae8719d Mon Sep 17 00:00:00 2001
+From: Devreese Jorik <jorik.devreese@barco.com>
+Date: Mon, 19 Jan 2026 15:00:00 +0000
+Subject: [PATCH] Makefile: use CC variable instead of hardcoded gcc
+
+Allow the compiler to be overridden via the CC variable for
+cross-compilation support.
+
+Upstream: https://github.com/ADLINK/sema-linux-ec/pull/14
+Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 440e377..ad02cf9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,7 +25,7 @@ all: libsema.so semautil wdogtest modules
+ driver: modules
+ 
+ libsema.so: $(SEMA_OBJS)
+-	@gcc -shared -fPIC -g -o lib/$@ $^
++	@$(CC) -shared -fPIC -g -o lib/$@ $^
+ 
+ modules:
+ 	@make -C /lib/modules/`uname -r`/build M=`pwd` $@
+@@ -91,16 +91,16 @@ app_clean:
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
diff --git a/package/sema-linux-ec/0002-Makefile-ensure-that-lsema-is-always-built-first.patch b/package/sema-linux-ec/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
new file mode 100644
index 00000000000..3cab4315537
--- /dev/null
+++ b/package/sema-linux-ec/0002-Makefile-ensure-that-lsema-is-always-built-first.patch
@@ -0,0 +1,32 @@
+From f14f0874bc3dcc5cee1f9c1b4ae1d9918a005139 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 10 Mar 2026 09:08:05 +0100
+Subject: [PATCH] Makefile: ensure that -lsema is always built first
+
+When using parallel builds, there is no guarantee that libsema.so
+is built first.
+
+Upstream: https://github.com/ADLINK/sema-linux-ec/pull/14
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ad02cf9..b6d9af9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -90,8 +90,8 @@ driver_clean:
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
diff --git a/package/sema-linux-ec/0003-Makefile-add-cross-install-support.patch b/package/sema-linux-ec/0003-Makefile-add-cross-install-support.patch
new file mode 100644
index 00000000000..1178253a21a
--- /dev/null
+++ b/package/sema-linux-ec/0003-Makefile-add-cross-install-support.patch
@@ -0,0 +1,40 @@
+From 6e1e0e69682a92c22d07b0db1dd083273eb6fa15 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 10 Mar 2026 09:09:59 +0100
+Subject: [PATCH] Makefile: add cross install support
+
+Add support to override the DESTDIR & PREFIX.
+
+Upstream: https://github.com/ADLINK/sema-linux-ec/pull/14
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b6d9af9..fefae79 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,7 @@
+ # SPDX-License-Identifier: BSD-3-Clause
++DESTDIR ?=
++PREFIX ?= /usr
++
+ SEMA_OBJS = $(patsubst %.c,%.o,$(wildcard lib/*.c))
+ WDOG_OBJS = $(patsubst %.c,%.o,$(wildcard watchdogtest/*.c))
+ APP_OBJS = $(patsubst %.c,%.o,$(wildcard app/*.c))
+@@ -77,8 +80,9 @@ driver_install:
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
diff --git a/package/sema-linux-ec/0004-Makefile-add-a-separate-app_build-target.patch b/package/sema-linux-ec/0004-Makefile-add-a-separate-app_build-target.patch
new file mode 100644
index 00000000000..70409f0d23d
--- /dev/null
+++ b/package/sema-linux-ec/0004-Makefile-add-a-separate-app_build-target.patch
@@ -0,0 +1,42 @@
+From 831e8b1e95cd4add7a6d7fadf4d022dc8df8290c Mon Sep 17 00:00:00 2001
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
+Upstream: https://github.com/ADLINK/sema-linux-ec/pull/14
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fefae79..54ee050 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,13 +23,15 @@ DIR2 = /lib/modules/$(shell uname -r)/extra
+ 
+ adl-ec-nvmem-sec-m := driver/adl-ec-nvmem-sec.o driver/nvmem-common.o	 
+ adl-ec-nvmem-m := driver/adl-ec-nvmem.o driver/nvmem-common.o	 
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
diff --git a/package/sema-linux-ec/Config.in b/package/sema-linux-ec/Config.in
new file mode 100644
index 00000000000..39663d542cf
--- /dev/null
+++ b/package/sema-linux-ec/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEMA_LINUX_EC
+	bool "sema-linux-ec"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux-ec
+
+comment "sema-linux-ec needs a toolchain w/ dynamic library, Linux kernel"
+	depends on BR2_STATIC_LIBS || !BR2_LINUX_KERNEL
diff --git a/package/sema-linux-ec/sema-linux-ec.hash b/package/sema-linux-ec/sema-linux-ec.hash
new file mode 100644
index 00000000000..d32864316e1
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.hash
@@ -0,0 +1,5 @@
+# locally computed
+sha256  daef5a95e686ce1fa59511280759ccdaf59d41eb698b7c5df0a35e98c0718127  sema-linux-ec-v4.3.12.tar.gz
+sha256  c45298c445058c0f8413c94be71ecedd55f306f3149ed2aea90b0e098ddc8810  LICENSE.BSD3
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
+sha256  2358eef45f799ab496fe93f4791f509524d3d65ca046e562706e62d72f738f20  LICENSE.dual
diff --git a/package/sema-linux-ec/sema-linux-ec.mk b/package/sema-linux-ec/sema-linux-ec.mk
new file mode 100644
index 00000000000..58af1bb2220
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# sema-linux-ec
+#
+################################################################################
+
+SEMA_LINUX_EC_VERSION = v4.3.12
+SEMA_LINUX_EC_SITE = $(call github,ADLINK,sema-linux-ec,$(SEMA_LINUX_EC_VERSION))
+SEMA_LINUX_EC_LICENSE = BSD-3-Clause or GPL-2.0
+SEMA_LINUX_EC_LICENSE_FILES = LICENSE.BSD3 LICENSE.GPLv2 LICENSE.dual
+SEMA_LINUX_EC_DEPENDENCIES = util-linux
+
+define SEMA_LINUX_EC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) app_build
+endef
+
+define SEMA_LINUX_EC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) app_install
+endef
+
+define SEMA_LINUX_EC_LINUX_CONFIG_FIXUPS
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
