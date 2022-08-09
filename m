Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5D8C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66C7818BE;
	Tue,  9 Aug 2022 07:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66C7818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hafNn-STbsKg; Tue,  9 Aug 2022 07:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D465E818A7;
	Tue,  9 Aug 2022 07:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D465E818A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C077E1BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A467408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A467408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0q17T7FJJWUY for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF474085F
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AF474085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a89so14107428edf.5
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VGXEUjNNREOzW3X9r2pDIUaegPpKdpbp8c0qQ7PYKnQ=;
 b=ZWznVtv30cY0on8KkFvcjua3y8UDdV5oPn0lVcvbTL7/D+KXvolNT37323Z2vfwhuU
 ZGNry57JFwyACUCIjKFsFVqeSO7PMO1hn0MueRqQB8j9Tu4hQ8TsehL1XGpr2zHA7JtR
 e85bm2d1xF6ipFCQXTkr7qAV7legE7sgvVsB+yBULI+mnAx2VwOPLxvIkjnkxSkZ7A7w
 xkHvpnLJnRsNJmbHjQ7i8B6vdPs5hajbg/mWDaB4z9gKkLPRzJk/+1zBqKzcoFDoaTPI
 vJgf9mkaB3Gvc6xOfzUFJL5GpwfDYUyM4qsv32wR+PKLl5qOC6bCr1y5736d+5+4Lznb
 ojnw==
X-Gm-Message-State: ACgBeo2uftMF0ofccH2WcjxumjxcEs6zJDjpix+cYy3QZylloY30n6mS
 C7a64vmQE9kQsKGLAWE9xN2OcXIBKJE=
X-Google-Smtp-Source: AA6agR5xNnD0tix602ZHpQWzy8gXu9k07/p74YVrKGiK+ePSUlxQd3HNPEsLBtrW2tp9+GCs3InCOQ==
X-Received: by 2002:a05:6402:270c:b0:43d:efd3:883e with SMTP id
 y12-20020a056402270c00b0043defd3883emr21582497edd.221.1660031843030; 
 Tue, 09 Aug 2022 00:57:23 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:22 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:54 +0300
Message-Id: <20220809075704.86472-4-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VGXEUjNNREOzW3X9r2pDIUaegPpKdpbp8c0qQ7PYKnQ=;
 b=Cpa+k9yDvJJJkhcOxei707tSgxFZX/1GTBHyT6SArtPJvcH3BytN072YhLxaMzHbsT
 ouaSv780wQHjvxx8OJpDzI4xnrbi66MA+VSlMBpG9MBgt7kYaLXq985PkOF1MbygqY93
 gLoLs4UrjOC6ByA/HO8/wv7XyucU1u6XkN3kAqTpkXcWU/aZqpKYwbwhsComCqGMcztt
 qOVP6D9LLVd6Mu2qzMRsZS5f73yXpr2221dJUxwGFidNUIFyWcQFISAWtvIwcY1ln6j9
 /Qv/6Uy2ficzq1RGnwIhH1H/bttgLGxLrKyHCFm+tIq5Ws+ysK7IrcwAoSJOnfGj29FO
 nBqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cpa+k9yD
Subject: [Buildroot] [PATCH 03/13] nodejs: remove v8-qemu-wrapper stuff
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's pretty broken, so we won't use it.

Even with this wrapper, I get:
```
debug-wasm-objects.tq src/wasm/wasm-objects.tq
/bin/sh: 1: ../../out/Release/torque: Exec format error
[324/2786] CXX obj/src/libnode.node_wasi.o
ninja: build stopped: subcommand failed.
make[2]: *** [Makefile:127: node] Error 1
```

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 .../0001-add-qemu-wrapper-support.patch       | 88 -------------------
 package/nodejs/Config.in.host                 |  2 -
 package/nodejs/nodejs.mk                      | 32 -------
 package/nodejs/v8-qemu-wrapper.in             |  9 --
 4 files changed, 131 deletions(-)
 delete mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 delete mode 100644 package/nodejs/v8-qemu-wrapper.in

diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
deleted file mode 100644
index 1368ca5a38..0000000000
--- a/package/nodejs/0001-add-qemu-wrapper-support.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 27 Sep 2021 12:55:09 -0700
-Subject: [PATCH] add qemu-wrapper support
-
-V8's JIT infrastructure requires binaries such as mksnapshot and mkpeephole to
-be run in the host during the build. However, these binaries must have the
-same bit-width as the target (e.g. a x86_64 host targeting ARMv6 needs to
-produce a 32-bit binary). To work around this issue, cross-compile the
-binaries for the target and run them on the host with QEMU, much like
-gobject-introspection.
-
-However, for the host-variant we do not want to use a
-qemu-wrapper, so add @MAYBE_WRAPPER@ to the needed files and sed the path to
-the qemu-wrapper on target builds, and remove @MAYBE_WRAPPER@ entirely on
-host-builds.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- node.gyp                 | 4 ++--
- tools/v8_gypfiles/v8.gyp | 8 ++++----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/node.gyp b/node.gyp
-index 8ba0dfeb..c77f6f7d 100644
---- a/node.gyp
-+++ b/node.gyp
-@@ -491,7 +491,7 @@
-               'action_name': 'run_mkcodecache',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(mkcodecache_exec)',
-+                @MAYBE_WRAPPER@ '<(mkcodecache_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -516,7 +516,7 @@
-               'action_name': 'node_mksnapshot',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(node_mksnapshot_exec)',
-+                @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
-diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index 48ec392b..f9bb0fbe 100644
---- a/tools/v8_gypfiles/v8.gyp
-+++ b/tools/v8_gypfiles/v8.gyp
-@@ -220,7 +220,7 @@
-         {
-           'action_name': 'run_torque_action',
-           'inputs': [  # Order matters.
--            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
-+            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
-             '<@(torque_files)',
-           ],
-           'outputs': [
-@@ -351,7 +351,7 @@
-         {
-           'action_name': 'generate_bytecode_builtins_list_action',
-           'inputs': [
--            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
-+            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
-           ],
-           'outputs': [
-             '<(generate_bytecode_builtins_list_output)',
-@@ -533,7 +533,7 @@
-             ],
-           },
-           'inputs': [
--            '<(mksnapshot_exec)',
-+            @MAYBE_WRAPPER@ '<(mksnapshot_exec)',
-           ],
-           'outputs': [
-             '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1448,7 +1448,7 @@
-         {
-           'action_name': 'run_gen-regexp-special-case_action',
-           'inputs': [
--            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
-+            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
-           ],
-           'outputs': [
-             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
---
-2.31.1
-
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..d023ffc36d 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -5,8 +5,6 @@ config BR2_PACKAGE_HOST_NODEJS
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_HOST_QEMU
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3154dcd7ec..a8229eb4b1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -12,7 +12,6 @@ NODEJS_DEPENDENCIES = \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
-	host-qemu \
 	c-ares \
 	libuv \
 	nghttp2 \
@@ -174,37 +173,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 NODEJS_LDFLAGS += -latomic
 endif
 
-# V8's JIT infrastructure requires binaries such as mksnapshot and
-# mkpeephole to be run in the host during the build. However, these
-# binaries must have the same bit-width as the target (e.g. a x86_64
-# host targeting ARMv6 needs to produce a 32-bit binary). To work around this
-# issue, cross-compile the binaries for the target and run them on the
-# host with QEMU, much like gobject-introspection.
-define NODEJS_INSTALL_V8_QEMU_WRAPPER
-	$(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
-
-define NODEJS_WRAPPER_FIXUP
-	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
-	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
-endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
-
-# Do not run the qemu-wrapper for the host build.
-define HOST_NODEJS_WRAPPER_FIXUP
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
-endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
-
 define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
deleted file mode 100644
index e1083f47f7..0000000000
--- a/package/nodejs/v8-qemu-wrapper.in
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/usr/bin/env sh
-
-# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
-# is older than the target kernel.
-exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
-    @QEMU_USERMODE_ARGS@ \
-   -L "${STAGING_DIR}/" \
-    "$@"
-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
