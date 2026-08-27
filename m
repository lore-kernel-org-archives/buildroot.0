Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A654C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C05A8407F6;
	Thu, 27 Aug 2026 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaEww5DhSNRO; Thu, 27 Aug 2026 19:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787857215;
	bh=+0V9Vd5a3I6liJa6jgqWa5fRoB53fRAg+fBTu8NLhFM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2G6hVtCI+o1nO1hfilwOuBJ2sJTGXJuWU/CDacgIESBYbRinu/QUa0Ho+PjDHRWf
	 qtmG/D5YKibw8XcRoauZcDk17ZyhiK7Nxr/KZn0c0Z3IkVPYBFndbSuoaqURCkj6kk
	 uOPRLpd2MHwEj/hYzE8Mj1+toixNI6UMZI5byWcf9e59LtSrSjElf/vLzp26tq5wrC
	 L3qQvn5JthaWju7n/g5HT22RK/grqno73uRfXytHLqLQItyxBv7QCVS8cvHtm/k9U7
	 6Mrx26QTZp9nrBk/2Us1rdzPex1pO8vObCWsmsTxIhfsFQZYxVs6FpxiudhFtoCJG7
	 nblnJPCmAkMuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF58D407E8;
	Thu, 27 Aug 2026 19:00:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C503075
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAF28407E8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDgmZSoYYadF for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RN0xBLz0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F877407E7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:12 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4864ebb6268so285491b6e.3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787857211; x=1788462011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jn4L+oRHx62bcACKjevEmEqLLLp7uYgaZwNblUnM4qA=;
 b=RN0xBLz0p8AbBtPZU6zoR6yUALnEL926kz4nBICdmnfR9/jrQ6JAk/Y5Ti1bJ/Kc47
 QJR3S6WVKOEcx+XrBfEmVsOq6/icYTF7juQ04KWui72oboTv4AHJQuqkMeerhNfkQI/7
 GYjwU7NkjyHKnvA/Q59Xvb2XiFcFVGW5ea/MjoM9VvdfBGgVY4fgATLslZdOyrnaYj2p
 /xQVPMv9sx9dNM9AIbISIDsuqmz3rFzfVxzH0Es+4MYPUQMwu1ykRntvgt0gee90Wl/I
 7xdpqig5gRgkey9ZOUV4GXWIYZgbX7+ET0uq2xG8lkUbnppzj0KKTVJK9eWNyGMvxk68
 hzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787857211; x=1788462011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jn4L+oRHx62bcACKjevEmEqLLLp7uYgaZwNblUnM4qA=;
 b=ABFr3b6kAMxnSWeX/2e5aUZNS1jY+xFDW8HYvq2AXcgEGWrc62f0FlVsgFZQcSboRt
 TJZDA2UDkvc+EyehOu2tkNE3L9alXc5CMOFjgefLmhSSK2+BZmWmEYQtQIKc2aUm6F31
 L7FA1b3MaFqMRaNUqfc8/dmuisDMVqHP7Tqs+VyT38UlLYRSb3yrBxULY6VelEP9tLHF
 ub/HE6nGlF2DrlrRC8ydNmM4y3TVLxM/pIXj1ZdPSW2G1Y/m34wIdYS3kU53rjeNPo72
 yZRE57iGBRTrFKpaE8yHsZOreGtxnNCRGAQO3tremvTE/NzJ5mSopKCEETVEVMzmE/ep
 cZtQ==
X-Gm-Message-State: AFuF++mtdbpIT5n3CDQe07pAeAFW39GbbER/UrfFXHRhioYvSyGGXXG0
 fg+xz9jBf8+hIE1rVOS8H5SxpKBHBNBn2cTFEZLSAk1wFw2QnQIh9gNI2izTg8Ps
X-Gm-Gg: AR+sD122GSvKcw1L98JVckDFic+kVY1eV7G1JqFyMCv08z0RdG1vuLBAHoQ8qWeq3jL
 zapQp2p94Jl0HJnDOHuWrB3VAoaCNZbel6p3xhVUMEC6SfzEMwcfNa35HtvaL69cy8wj0MMw99o
 tAWCDnSGH0i5YkMHSJtckHklvsRWbIw3ruCXjnGGjDVf0EK2aycZ0nCM3sK60qqB7m7RTEj40/U
 m3seXvGAIYk+y28kXZ5Gf8wtj2MDDIQHL4AZki+tAPn0C2RY5pTVcpPGjSYTmNCVAH5O3WzK8CU
 qbj9o1a5OIBynPaLvS539We7vDSd+P3sL6DcQkhoY49V0kTo6jc6Ub8C0Q6fYpwVQ/Bqnj0Uoz/
 ELfzQKvSU1BYqopDAouDT585+aHlDqOTG5hm4Z3WRs9gNkwuqBk+q9q/S2zuJtx5kJi1cz2Gtyj
 2U/9V8mVI0TjHKNyH/jS6CkVjkr9asGOmD0fE+clwhkyK5LTxrUsjf7lLLfX70n7hAbC+R1INjf
 1JtkL9vpjHEAHXpP/3ZOCyn0Nil3KxXwPSMw0VU/W3CB+ZOTDTDYgp0KmCUsgPG6REutB42c/5M
X-Received: by 2002:a05:6808:3308:b0:4b3:7c33:456 with SMTP id
 5614622812f47-4b398190c24mr1262213b6e.11.1787857211203; 
 Thu, 27 Aug 2026 12:00:11 -0700 (PDT)
Received: from 4769c4e2f3e3.nos.boeing.com
 (138-28-90-168.fttx.imoncommunications.net. [138.28.90.168])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b3984e0d40sm263428b6e.9.2026.08.27.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 12:00:10 -0700 (PDT)
From: matt@thewebers.ws
To: buildroot@buildroot.org
Cc: "Matthew Weber" <matthew.l.weber3@boeing.com>,
 Clayton Shotwell <clayton.shotwell@boeing.com>
Date: Thu, 27 Aug 2026 18:59:48 +0000
Message-Id: <20260827185951.3180679-1-matt@thewebers.ws>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/libc-test: new package
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

From: "Matthew Weber" <matthew.l.weber3@boeing.com>

Add the musl libc-test suite as a Buildroot target package. This
provides POSIX API conformance tests for musl libc covering the
upstream test suite.

Includes one patch:
- 0001: adds a cross-compilation build target

Tested using: https://gist.github.com/matthew-l-weber/a028a69bdbb99690a43b5729dcd641c5

Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...d-build-target-for-cross-compilation.patch | 32 +++++++++++
 package/libc-test/Config.in                   | 14 +++++
 package/libc-test/libc-test.hash              |  3 ++
 package/libc-test/libc-test.mk                | 54 +++++++++++++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 package/libc-test/0001-add-build-target-for-cross-compilation.patch
 create mode 100644 package/libc-test/Config.in
 create mode 100644 package/libc-test/libc-test.hash
 create mode 100644 package/libc-test/libc-test.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..3fa3cf2378 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2394,6 +2394,9 @@ F:	package/gtkiostream/
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
+N:	Matthew Weber <matthew.l.weber3@boeing.com>
+F:	package/libc-test/
+
 N:	Maksim Kiselev <bigunclemax@gmail.com>
 F:	package/ledmon/
 
diff --git a/package/Config.in b/package/Config.in
index 6058800682..657e345c37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -114,6 +114,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kmemd/Config.in"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
+	source "package/libc-test/Config.in"
 	source "package/libbpf/Config.in"
 	source "package/libtraceevent/Config.in"
 	source "package/libtracefs/Config.in"
diff --git a/package/libc-test/0001-add-build-target-for-cross-compilation.patch b/package/libc-test/0001-add-build-target-for-cross-compilation.patch
new file mode 100644
index 0000000000..8f711d7521
--- /dev/null
+++ b/package/libc-test/0001-add-build-target-for-cross-compilation.patch
@@ -0,0 +1,32 @@
+From cb892239cd677bd74a4633f1bcda02ac57b4e9d3 Mon Sep 17 00:00:00 2001
+From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
+Date: Wed, 22 Jul 2026 18:58:21 +0000
+Subject: [PATCH] add build target for cross-compilation
+
+The default 'all' target both builds and runs tests, which is not
+suitable for cross-compilation. Add a 'build' target that only
+compiles the test executables without attempting to run them on the
+build host.
+
+Upstream: https://repo.or.cz/libc-test.git (not yet submitted)
+Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cf2ab2b..ccaec4e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -150,5 +150,7 @@ $(B)/%.exe: $(B)/%.o
+ %.err: %.exe
+ 	$(RUN_TEST) $< >$@ || true
+ 
+-.PHONY: all run clean cleanall
++build: $(BINS) $(LIBS)
++
++.PHONY: all run clean cleanall build
+ 
+-- 
+2.34.1
+
diff --git a/package/libc-test/Config.in b/package/libc-test/Config.in
new file mode 100644
index 0000000000..1c1553768a
--- /dev/null
+++ b/package/libc-test/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBC_TEST
+	bool "libc-test"
+	depends on BR2_USE_MMU
+	help
+	  libc-test is a collection of programs for testing the
+	  C library implementation against the requirements of
+	  various standards (C99, POSIX, etc). It includes
+	  functional tests, regression tests, math conformance
+	  tests, and API header verification.
+
+	  This package is typically used with musl libc but also
+	  works with glibc and uClibc-ng.
+
+	  http://nsz.repo.hu/git/?p=libc-test
diff --git a/package/libc-test/libc-test.hash b/package/libc-test/libc-test.hash
new file mode 100644
index 0000000000..8209b84cbf
--- /dev/null
+++ b/package/libc-test/libc-test.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  93d659f35a129e39cc72efa52a0a059ffcbe5b39336126edff8d154588d821f6  libc-test-97e8e863b4fbfa7a9d74254a9a33db0a3dbf41a1-git4.tar.gz
+sha256  41b8f2e2706012eb534f89e72ff547308cb81dcb9acf077c40a9058a7c06088d  COPYRIGHT
diff --git a/package/libc-test/libc-test.mk b/package/libc-test/libc-test.mk
new file mode 100644
index 0000000000..30b3b72200
--- /dev/null
+++ b/package/libc-test/libc-test.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# libc-test
+#
+################################################################################
+
+LIBC_TEST_VERSION = 97e8e863b4fbfa7a9d74254a9a33db0a3dbf41a1
+LIBC_TEST_SITE = https://repo.or.cz/libc-test.git
+LIBC_TEST_SITE_METHOD = git
+LIBC_TEST_LICENSE = MIT
+LIBC_TEST_LICENSE_FILES = COPYRIGHT
+
+# The upstream Makefile both builds and runs tests in the default target.
+# We only want to build during the Buildroot build phase; tests are run
+# on the target at runtime. Patch 0001 adds the "build" target.
+#
+# The Makefile uses config.mak for compiler flags. We generate one
+# suitable for musl (no glibc-specific libraries). The Makefile's own
+# CFLAGS already includes -I paths for the test framework headers, so
+# we must not override CFLAGS on the command line.
+define LIBC_TEST_CONFIGURE_CMDS
+	printf '%s\n' \
+		'CC = $(TARGET_CC)' \
+		'AR = $(TARGET_AR)' \
+		'RANLIB = $(TARGET_RANLIB)' \
+		'CFLAGS += -pipe -std=c99 -D_POSIX_C_SOURCE=200809L -Wall' \
+		'CFLAGS += -Wno-unused-function -Wno-missing-braces -Wno-unused' \
+		'CFLAGS += -Wno-overflow -Wno-unknown-pragmas -fno-builtin' \
+		'CFLAGS += -Werror=implicit-function-declaration' \
+		'CFLAGS += -Werror=implicit-int -Werror=pointer-sign' \
+		'LDLIBS += -lpthread -lm -lrt' \
+		> $(@D)/config.mak
+endef
+
+define LIBC_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
+endef
+
+define LIBC_TEST_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/common
+	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/functional
+	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/math
+	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/regression
+	cp -a $(@D)/src/common/runtest.exe \
+		$(TARGET_DIR)/usr/lib/libc-test/src/common/
+	find $(@D)/src/functional -name "*.exe" -exec cp {} \
+		$(TARGET_DIR)/usr/lib/libc-test/src/functional/ \;
+	find $(@D)/src/math -name "*.exe" -exec cp {} \
+		$(TARGET_DIR)/usr/lib/libc-test/src/math/ \;
+	find $(@D)/src/regression -name "*.exe" -exec cp {} \
+		$(TARGET_DIR)/usr/lib/libc-test/src/regression/ \;
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
