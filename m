Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74FFD401CE;
	Thu, 13 Jan 2022 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8d90wDkR-kEQ; Thu, 13 Jan 2022 21:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82F7040222;
	Thu, 13 Jan 2022 21:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8B91BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B696831C1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NO1xl-b7ic-k for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:04:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB4583145
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:04:42 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:04:31 +0000
Message-Id: <20220113210431.1361727-1-paul@crapouillou.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Config.in: add option to only use ccache
 for BR
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
Cc: Paul Cercueil <paul@crapouillou.net>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option, disabled by default, to only use ccache for Buildroot
packages.

When enabled, ccache will be used when building Buildroot itself, but
the toolchain exported as SDK will not make use of ccache to build
external programs, unless the "BR_USE_CCACHE" environment variable is
set.

The motivation behind this change is to be able to speed up iterative
building of a Buildroot based distribution, without forcing the users of
the SDK to use ccache, which has the problem of clobbering the
filesystem in a hidden directory if the cache directory is left as
default, or trying to access a cache folder that existed on the machine
that built the SDK but which may not exist on the machine on which it
was later installed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Config.in                      | 9 +++++++++
 linux/linux.mk                 | 4 ++++
 package/Makefile.in            | 4 ++++
 toolchain/toolchain-wrapper.c  | 5 +++++
 toolchain/toolchain-wrapper.mk | 4 ++++
 5 files changed, 26 insertions(+)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..fec2332077 100644
--- a/Config.in
+++ b/Config.in
@@ -374,6 +374,15 @@ config BR2_CCACHE_USE_BASEDIR
 	  the section "COMPILING IN DIFFERENT DIRECTORIES" in the ccache
 	  manual for more information.
 
+config BR2_CCACHE_BR_ONLY
+	bool "Only use ccache for building Buildroot packages"
+	default n
+	help
+	  When enabled, ccache will be used when building Buildroot
+	  itself, but the toolchain exported as SDK will not make use of
+	  ccache to build external programs, unless the "BR_USE_CCACHE"
+	  environment variable is set.
+
 endif
 
 config BR2_ENABLE_DEBUG
diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..339848e29b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -69,6 +69,10 @@ LINUX_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
+ifeq ($(BR2_CCACHE_BR_ONLY),y)
+LINUX_MAKE_ENV += BR_USE_CCACHE=1
+endif
+
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..34556fa7b0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -263,6 +263,10 @@ export PERL5LIB=$(HOST_DIR)/lib/perl
 
 TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
+ifeq ($(BR2_CCACHE_BR_ONLY),y)
+	TARGET_MAKE_ENV += BR_USE_CCACHE=1
+endif
+
 TARGET_CONFIGURE_OPTS = \
 	$(TARGET_MAKE_ENV) \
 	AR="$(TARGET_AR)" \
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 0fb6064b1c..bf0194c8fc 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -510,6 +510,11 @@ int main(int argc, char **argv)
 	if (getenv("BR_NO_CCACHE"))
 		/* Skip the ccache call */
 		exec_args++;
+#ifdef BR_CCACHE_BR_ONLY
+	else if (!getenv("BR_USE_CCACHE"))
+		/* Skip the ccache call */
+		exec_args++;
+#endif
 #endif
 
 	/* Debug the wrapper to see final arguments passed to the real compiler. */
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index cbf46f15fa..cda9eaf342 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -73,6 +73,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_CCACHE_BR_ONLY),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BR_ONLY
+endif
+
 ifeq ($(BR2_PIC_PIE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_PIC_PIE
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
