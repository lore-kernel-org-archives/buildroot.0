Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA43C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2032161B27;
	Tue, 21 Feb 2023 01:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2032161B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYnwakAdipHY; Tue, 21 Feb 2023 01:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403BD6F9E8;
	Tue, 21 Feb 2023 01:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 403BD6F9E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4B3A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD8E6FBDA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD8E6FBDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1iqDClYVlQm for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85896FBB8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85896FBB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6C16828C8; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Feb 2023 08:22:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6f692c548904c5ae130f6e17e303ff4ad0b482b5
X-Git-Newrev: aff4317797c34c78747f4c6c5ee8d9a1bc0ae270
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.A6C16828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: needs arch
 support and C++ for wasm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aff4317797c34c78747f4c6c5ee8d9a1bc0ae270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See:
https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms

MIPS & RISCV32 are mentioned in the supported list,
but that seems to be wrong, so excluded those.

Fixes:
- http://autobuild.buildroot.org/results/dfb/dfb8f71d7e016cdfd3beb4b8196081898bd49ae2/build-end.log
- http://autobuild.buildroot.org/results/ecf/ecfe7b67af68cd7f397a50360900cd9a7afc830e/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
[Peter: Move arch dependency to _WASM_ARCH_SUPPORTS blind option, add help
	text, use normal style for prompt and fix indentation]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/Config.in     | 21 +++++++++++++++++++++
 package/fluent-bit/fluent-bit.mk |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 11ceb55d4f..6c2299e695 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -8,5 +8,26 @@ config BR2_PACKAGE_FLUENT_BIT
 
 	  https://github.com/fluent/fluent-bit
 
+if BR2_PACKAGE_FLUENT_BIT
+
+config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
+	bool
+	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
+	default y if BR2_arc
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_RISCV_64
+	default y if BR2_xtensa
+
+config BR2_PACKAGE_FLUENT_BIT_WASM
+	bool "wasm runtime support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
+	help
+	  Support for WASM-based plugins.
+
+endif
+
 comment "fluent-bit needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index c84042a0fa..6e9a33e02e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -17,6 +17,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
 FLUENT_BIT_DEPENDENCIES += luajit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
