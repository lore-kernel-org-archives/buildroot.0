Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD2C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9785E418A1;
	Wed, 30 Aug 2023 06:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9785E418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzZdBYI2qcdW; Wed, 30 Aug 2023 06:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08049418BC;
	Wed, 30 Aug 2023 06:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08049418BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10CC51BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8CB84190E
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CB84190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHTh3qgX2VMr for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40FB0418E8
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FB0418E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266AC86517; Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:11:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 66f47a5c1b3d1a8c18d22edeed30fdf879a76810
X-Git-Newrev: 69b34c93ecbd33e2dbb8a35512494007364c1a62
X-Patchwork-Hint: ignore
Message-Id: <20230830062759.266AC86517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 boot/arm-trusted-firmware: add patch to fix fiptool link
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6233824059615962970=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6233824059615962970==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69b34c93ecbd33e2dbb8a35512494007364c1a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

When building a fip firmware (BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y), the
TF-A build recipe starts by building the host program fiptool with the
proper build environment variables. Then the main TF-A target firmware
build step takes place, with the expectation that the fiptool program will
be used under the hood if necessary.

In TF-A, the build recipe for the host program fiptool has subtly changed
after v2.7, in commit cf2dd17ddda2 ("refactor(security): add OpenSSL 1.x
compatibility"). This change has the effect to force re-linking fiptool
each time.

If we try to build with Buildroot a fip firmware with a TF-A version after
v2.7 comprising the aforementioned change, the fiptool program is forcibly
re-linked during the main firmware build step. This happens without the
proper build environment variables and consequently, if openssl is not
installed on the host, the libcrypto shared library will not be found by
the linker and the link will fail with the following error:

  /usr/bin/ld: cannot find -lcrypto: No such file or directory

A patch has been integrated into TF-A to avoid re-linking fiptool when not
necessary, which should solve the problem starting with version v2.10. Add
that patch in Buildroot for versions v2.8 and v2.9, to repair the build in
the cases described above.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4664845767

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998@free.fr:
  - don't use symlink in v2.9, just copy patch
  - fix numbering in v2.8 which now has two patches
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3597910cfa47790047fe75d569a0755b4cdb73f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-build-tools-avoid-unnecessary-link.patch  | 77 ++++++++++++++++++++++
 .../0001-build-tools-avoid-unnecessary-link.patch  | 77 ++++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch b/boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
new file mode 100644
index 0000000000..9e0ea74248
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1,77 @@
+From aa57ce632c629fe72ff417e261e0f5bfd8db6bab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 4 Jul 2023 16:14:02 +0200
+Subject: [PATCH] build(tools): avoid unnecessary link
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In their respective makefiles, cert_create, encrypt_fw and fiptool
+depend on the --openssl phony target as a prerequisite. This forces
+those tools to be re-linked each time.
+
+Move the dependencies on the --openssl target from the tools to their
+makefiles all targets, to avoid unnecessary linking while preserving the
+OpenSSL version printing done in the --openssl targets when in debug.
+
+Fixes: cf2dd17ddda2 ("refactor(security): add OpenSSL 1.x compatibility")
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+Change-Id: I98a3ab30f36dffc253cecaaf3a57d2712522135d
+Upstream: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=aa57ce632c629fe72ff417e261e0f5bfd8db6bab
+---
+ tools/cert_create/Makefile | 4 ++--
+ tools/encrypt_fw/Makefile  | 4 ++--
+ tools/fiptool/Makefile     | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
+index 042e844626..b911d19d2b 100644
+--- a/tools/cert_create/Makefile
++++ b/tools/cert_create/Makefile
+@@ -85,9 +85,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__; \
+                 const char platform_msg[] = "${PLAT_MSG}";' | \
+diff --git a/tools/encrypt_fw/Makefile b/tools/encrypt_fw/Makefile
+index 2939b142be..924e5febab 100644
+--- a/tools/encrypt_fw/Makefile
++++ b/tools/encrypt_fw/Makefile
+@@ -65,9 +65,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__;' | \
+                 ${HOSTCC} -c ${HOSTCCFLAGS} -xc - -o src/build_msg.o
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index 2ebee33931..4bdebd9235 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -68,9 +68,9 @@ DEPS := $(patsubst %.o,%.d,$(OBJECTS))
+ 
+ .PHONY: all clean distclean --openssl
+ 
+-all: ${PROJECT}
++all: --openssl ${PROJECT}
+ 
+-${PROJECT}: --openssl ${OBJECTS} Makefile
++${PROJECT}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	${Q}${HOSTCC} ${OBJECTS} -o $@ ${LDLIBS}
+ 	@${ECHO_BLANK_LINE}
+-- 
+2.25.1
+
diff --git a/boot/arm-trusted-firmware/v2.9/0001-build-tools-avoid-unnecessary-link.patch b/boot/arm-trusted-firmware/v2.9/0001-build-tools-avoid-unnecessary-link.patch
new file mode 100644
index 0000000000..9e0ea74248
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.9/0001-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1,77 @@
+From aa57ce632c629fe72ff417e261e0f5bfd8db6bab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 4 Jul 2023 16:14:02 +0200
+Subject: [PATCH] build(tools): avoid unnecessary link
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In their respective makefiles, cert_create, encrypt_fw and fiptool
+depend on the --openssl phony target as a prerequisite. This forces
+those tools to be re-linked each time.
+
+Move the dependencies on the --openssl target from the tools to their
+makefiles all targets, to avoid unnecessary linking while preserving the
+OpenSSL version printing done in the --openssl targets when in debug.
+
+Fixes: cf2dd17ddda2 ("refactor(security): add OpenSSL 1.x compatibility")
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+Change-Id: I98a3ab30f36dffc253cecaaf3a57d2712522135d
+Upstream: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=aa57ce632c629fe72ff417e261e0f5bfd8db6bab
+---
+ tools/cert_create/Makefile | 4 ++--
+ tools/encrypt_fw/Makefile  | 4 ++--
+ tools/fiptool/Makefile     | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
+index 042e844626..b911d19d2b 100644
+--- a/tools/cert_create/Makefile
++++ b/tools/cert_create/Makefile
+@@ -85,9 +85,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__; \
+                 const char platform_msg[] = "${PLAT_MSG}";' | \
+diff --git a/tools/encrypt_fw/Makefile b/tools/encrypt_fw/Makefile
+index 2939b142be..924e5febab 100644
+--- a/tools/encrypt_fw/Makefile
++++ b/tools/encrypt_fw/Makefile
+@@ -65,9 +65,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__;' | \
+                 ${HOSTCC} -c ${HOSTCCFLAGS} -xc - -o src/build_msg.o
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index 2ebee33931..4bdebd9235 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -68,9 +68,9 @@ DEPS := $(patsubst %.o,%.d,$(OBJECTS))
+ 
+ .PHONY: all clean distclean --openssl
+ 
+-all: ${PROJECT}
++all: --openssl ${PROJECT}
+ 
+-${PROJECT}: --openssl ${OBJECTS} Makefile
++${PROJECT}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	${Q}${HOSTCC} ${OBJECTS} -o $@ ${LDLIBS}
+ 	@${ECHO_BLANK_LINE}
+-- 
+2.25.1
+

--===============6233824059615962970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6233824059615962970==--
