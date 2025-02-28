Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93ECC19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3D06FAD5;
	Fri, 28 Feb 2025 14:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_WsQBDVJf_k; Fri, 28 Feb 2025 14:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95126FACF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B95126FACF;
	Fri, 28 Feb 2025 14:48:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09019711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1EEC84710
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zk5enjX78Qa for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 14:48:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE4178470F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4178470F
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE4178470F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dbf65c0c4fso372351a12.0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740754108; x=1741358908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayxl4/GqfBVfKChCz7wY2msVU0KwrsNy8B5iPz56+SY=;
 b=LFni3sMMoYSNtg57U7O5E7IK+dBxDSRlBbXA48GIdFjzyjCR1R3VkQTs2HtqHc9BWc
 E/mfLzh7lQf8ta7zvHynmrXz6HczAhJN3q/a4slqIXMP/F/Xj8iicz+WuAmdcdo3sTFT
 Zs0LToKN2uZIcYYE7BbG5PQzlE517OSVMB26e4NYI9PMLs9kgW/7gngNQeZc4ej9LH7+
 iv1Z2025OVadPzXAs/3Fhz8UxKOtB29DN2lz+yyYr2iRZfQKQkeuyKQn732pQ4kvF2s1
 4TSBXShDp9UCnwIz6w06S58qpfea4JI8wqI2oRZuEtZakpcjCkdf9i3QLQHHI9vu+HDv
 Eqvw==
X-Gm-Message-State: AOJu0YxOyoTMkw9KtVp87KfO0SwQvp2baVc7aOZfFRefwC+FweC3PNnU
 qQPMEisA9uB5AsxJ8sJP+uYWTt9eIUFjc/iX9BnU9MxYfhYiBiyNF6YjcyexAIBMabAgsuy9nxr
 H
X-Gm-Gg: ASbGncvpB/rPkp1DLO1O9rx/o5gt5ZYuQmnEHxvgE0F+6hwdqMep2+fUX/Du04/qqjh
 BQRJKDW1Q1nfVbl9IfxaGXNtp6rrs8lnETeLymI0ruuJi6ijGQ2yHaqGJlXKWFoG8CAdwE5quUT
 nhqW2pvuG7nGZZ4bhRM59IUuS3oVVR7TDcsiZiisiSoQnqHoS69KzuN3GYZY4GjPGNI8pkCN4xm
 HLK8f019mApedfnaEevE1o8d2JGkFJX1rUy2moGD6DvylHz67MokY2Rvr8PpTQmn0RI7x4srd9Q
 zoQAtotnErCFRtzqaJSfrdanjprODt1bemrimbKYnHBpRY3oJIkIm8rTDiFCYD/6OLBp5taS2Om
 SxBAXtXjX/W93
X-Google-Smtp-Source: AGHT+IEXqOKbURNW8FetGuWyYe+lzY6M+qHv3m70SSsWjxk9m74r0V/P8rn/E/oldPKDP56Jnie1qw==
X-Received: by 2002:a17:907:968e:b0:ab6:d660:c84a with SMTP id
 a640c23a62f3a-abf261d3b23mr143830166b.4.1740754107411; 
 Fri, 28 Feb 2025 06:48:27 -0800 (PST)
Received: from fedora.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4b3sm293663566b.112.2025.02.28.06.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:48:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 28 Feb 2025 15:48:22 +0100
Message-ID: <20250228144822.860085-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
References: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740754108; x=1741358908;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayxl4/GqfBVfKChCz7wY2msVU0KwrsNy8B5iPz56+SY=;
 b=W09myDg5s8KCSERUnK4T23K7ZM4aggaWq61nRq44vHSXJ/2itvEmCYFGJ3IurM2lxC
 6EEck4tQS+SC1ebzWQSJtQlKw/cPHCuON/Hv31r8kYUYuK0b7auPV2ZdlZu1x26vOdKO
 96ES4Boq8nNvgdF4Tnjr0a7Lcxw35nBa5iKpo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=W09myDg5
Subject: [Buildroot] [PATCH 5/5] package/flutter-engine: bump to version
 3.29.0
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

As of Flutter 3.27.4, the flutter-engine github repository is archived, and the
flutter-engine source code now resides at https://github.com/flutter/flutter/.

Because of the above, the following changes must occure:

- Paths are now prefixed with engine/src.

- The "name" field in the dot-gclient file is now "./", and the gen-tarball
  script:
   - Makes the dl-tmp/src dir
   - Copies the dot-gclient file to the dl-tmp/src dir
   - Runs gclient.py inside of the dl-tmp/src dir

Without these changes, gclient creates two directores:
dl-tmp/src/flutter and dl-tmp/src/engine, and cloning fails with the following
error:

```
python3: can't open file 'dl-tmp/src/engine/src/flutter/tools/pub_get_offline.py':
[Errno 2] No such file or directory
```

because the file resides at src/flutter/engine/src/flutter/tools.
Changing the name from src/flutter to ./ and running gclient.py directly in
the src directory creates a proper directory structure suitable for compiling.

Of course, this also means there is a new pushd in the gen_tarball method to
move to ${SCRATCH_DIR} to ensure the tarball is generated outside of the
source directory.

Tested with run-tests tests.package.test_flutter.TestFlutter.test_run.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-disable-pre-canned-sysroot.patch     |  8 +++----
 .../0002-remove-explicit-x11-dependency.patch |  8 +++----
 .../0003-fix-toolchain-paths.patch            | 10 ++++----
 ...onfig.py-do-not-prepend-sysroot-path.patch |  8 +++----
 package/flutter-engine/dot-gclient            |  4 ++--
 package/flutter-engine/flutter-engine.hash    |  2 +-
 package/flutter-engine/flutter-engine.mk      | 24 +++++++++----------
 package/flutter-engine/gen-tarball            |  6 +++--
 8 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
index a9776d7388..2c02fc4948 100644
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -11,13 +11,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/config/sysroot.gni | 2 +-
+ engine/src/build/config/sysroot.gni | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/build/config/sysroot.gni b/build/config/sysroot.gni
+diff --git a/engine/src/build/config/sysroot.gni b/engine/src/build/config/sysroot.gni
 index 7987e519d..1de694263 100644
---- a/build/config/sysroot.gni
-+++ b/build/config/sysroot.gni
+--- a/engine/src/build/config/sysroot.gni
++++ b/engine/src/build/config/sysroot.gni
 @@ -12,7 +12,7 @@ declare_args() {
  
    # Whether to use the default sysroot when building for Linux, if an explicit
diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
index 23d7ec9b06..85f6db1c38 100644
--- a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
+++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
@@ -10,13 +10,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- flutter/shell/platform/linux/config/BUILD.gn | 4 ----
+ engine/src/flutter/shell/platform/linux/config/BUILD.gn | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/flutter/shell/platform/linux/config/BUILD.gn b/flutter/shell/platform/linux/config/BUILD.gn
+diff --git a/engine/src/flutter/shell/platform/linux/config/BUILD.gn b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 index da0ac056b..70c7a0ea1 100644
---- a/flutter/shell/platform/linux/config/BUILD.gn
-+++ b/flutter/shell/platform/linux/config/BUILD.gn
+--- a/engine/src/flutter/shell/platform/linux/config/BUILD.gn
++++ b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 @@ -5,10 +5,6 @@
  import("//build/config/linux/pkg_config.gni")
  import("//flutter/shell/platform/glfw/config.gni")
diff --git a/package/flutter-engine/0003-fix-toolchain-paths.patch b/package/flutter-engine/0003-fix-toolchain-paths.patch
index ba5d5f8023..93239c039f 100644
--- a/package/flutter-engine/0003-fix-toolchain-paths.patch
+++ b/package/flutter-engine/0003-fix-toolchain-paths.patch
@@ -4,7 +4,7 @@ Date: Sun, 5 Mar 2023 10:43:02 -0800
 Subject: [PATCH] fix toolchain paths
 
 Flutter includes a copy of clang which is required to build. However, by
-default, build/toolchain/custom/BUILD.gn attempts to use several gcc utilities
+default, engine/src/build/toolchain/custom/BUILD.gn attempts to use several gcc utilities
 such as ar, readelf, nm, and strip. Change these to the proper llvm provided
 utility.
 
@@ -13,13 +13,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/toolchain/custom/BUILD.gn | 4 +++++------
+ engine/src/build/toolchain/custom/BUILD.gn | 4 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
 
-diff --git a/build/toolchain/custom/BUILD.gn b/build/toolchain/custom/BUILD.gn
+diff --git a/engine/src/build/toolchain/custom/BUILD.gn b/engine/src/build/toolchain/custom/BUILD.gn
 index 65b1623..8b3f6f8 100644
---- a/build/toolchain/custom/BUILD.gn
-+++ b/build/toolchain/custom/BUILD.gn
+--- a/engine/src/build/toolchain/custom/BUILD.gn
++++ b/engine/src/build/toolchain/custom/BUILD.gn
 @@ -12,11 +12,11 @@ toolchain("custom") {
    # these values in our scope.
    cc = "${toolchain_bin}/clang"
diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
index a31be7d77f..43b4a3ce2e 100644
--- a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
+++ b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
@@ -14,13 +14,13 @@ IE: output/host/.../sysroot/output/host/.../sysroot
 Upstream: https://github.com/flutter/flutter/issues/132152
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/config/linux/pkg-config.py | 4 +---
+ engine/src/build/config/linux/pkg-config.py | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/build/config/linux/pkg-config.py b/build/config/linux/pkg-config.py
+diff --git a/engine/src/build/config/linux/pkg-config.py b/engine/src/build/config/linux/pkg-config.py
 index b4a6aff17..44ffdcaea 100644
---- a/build/config/linux/pkg-config.py
-+++ b/build/config/linux/pkg-config.py
+--- a/engine/src/build/config/linux/pkg-config.py
++++ b/engine/src/build/config/linux/pkg-config.py
 @@ -207,9 +207,7 @@ def main():
    all_flags = flag_string.strip().split(' ')
  
diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
index 6ead80c8c2..7dfebdde2c 100644
--- a/package/flutter-engine/dot-gclient
+++ b/package/flutter-engine/dot-gclient
@@ -3,8 +3,8 @@
 
 solutions = [{
     "managed": False,
-    "name": "src/flutter",
-    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
+    "name": "./",
+    "url": "https://github.com/flutter/flutter.git@!FLUTTER_VERSION!",
     "custom_vars": {
         "download_android_deps": False,
         "download_windows_deps": False,
diff --git a/package/flutter-engine/flutter-engine.hash b/package/flutter-engine/flutter-engine.hash
index 3309082139..13f52ee6ea 100644
--- a/package/flutter-engine/flutter-engine.hash
+++ b/package/flutter-engine/flutter-engine.hash
@@ -1 +1 @@
-sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  flutter/LICENSE
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index a399296247..72d7b958ea 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -22,7 +22,7 @@
 # There is no hash provided for the source tarball, as the gn binary
 # (used for configuration) relies on the .git directories. As such, a
 # reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.27.1
+FLUTTER_ENGINE_VERSION = 3.29.0
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -41,7 +41,7 @@ FLUTTER_ENGINE_DEPENDENCIES = \
 
 # Dispatch all architectures of flutter
 # FLUTTER_ENGINE_TARGET_TRIPPLE must match the directory name found in
-# buildtools/linux-x64/clang/lib/clang/*/lib
+# engine/src/buildtools/linux-x64/clang/lib/clang/*/lib
 ifeq ($(BR2_aarch64),y)
 FLUTTER_ENGINE_TARGET_ARCH = arm64
 FLUTTER_ENGINE_TARGET_TRIPPLE = aarch64-unknown-linux-gnu
@@ -62,13 +62,13 @@ FLUTTER_ENGINE_RUNTIME_MODE=release
 endif
 
 FLUTTER_ENGINE_BUILD_DIR = \
-	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
+	$(@D)/engine/src/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
 
 FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so
 
 # Flutter engine includes a bundled patched clang that must be used for
 # compiling or else there are linking errors.
-FLUTTER_ENGINE_CLANG_PATH = $(@D)/flutter/buildtools/linux-x64/clang
+FLUTTER_ENGINE_CLANG_PATH = $(@D)/engine/src/flutter/buildtools/linux-x64/clang
 
 FLUTTER_ENGINE_CONF_OPTS = \
 	--clang \
@@ -97,10 +97,10 @@ endif
 ifeq ($(BR2_CCACHE),y)
 define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
 	$(SED) "s%cc =.*%cc = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang\""%g \
-		$(@D)/build/toolchain/custom/BUILD.gn
+		$(@D)/engine/src/build/toolchain/custom/BUILD.gn
 
 	$(SED) "s%cxx =.*%cxx = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang++\""%g \
-		$(@D)/build/toolchain/custom/BUILD.gn
+		$(@D)/engine/src/build/toolchain/custom/BUILD.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
 endif
@@ -154,10 +154,10 @@ FLUTTER_ENGINE_DEPENDENCIES += libxcb
 else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
-		$(@D)/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
-		$(@D)/build/config/BUILDCONFIG.gn
+		$(@D)/engine/src/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 endif
@@ -167,10 +167,10 @@ FLUTTER_ENGINE_DEPENDENCIES += wayland
 else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
-		$(@D)/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
-		$(@D)/build/config/BUILDCONFIG.gn
+		$(@D)/engine/src/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 endif
@@ -198,7 +198,7 @@ endef
 # We must set the home directory to the sdk directory or else flutter will
 # place .dart, and .flutter in ~/.
 define FLUTTER_ENGINE_CONFIGURE_CMDS
-	cd $(@D) && \
+	cd $(@D)/engine/src && \
 		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
@@ -208,7 +208,7 @@ define FLUTTER_ENGINE_CONFIGURE_CMDS
 endef
 
 define FLUTTER_ENGINE_BUILD_CMDS
-	cd $(@D) && \
+	cd $(@D)/engine/src && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
 		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 5bfb8f60e8..e5203b7bca 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -41,8 +41,8 @@ parse_opts() {
 
 prepare() {
     rm -rf "${SCRATCH_DIR}"
-    mkdir -p "${SCRATCH_DIR}"
-    pushd "${SCRATCH_DIR}" >/dev/null
+    mkdir -p "${SCRATCH_DIR}"/src
+    pushd "${SCRATCH_DIR}"/src >/dev/null
 }
 
 copy_dot_gclient() {
@@ -63,6 +63,7 @@ run_gclient() {
 gen_tarball() {
     message "Generating tarball"
     mkdir -p "${DL_DIR}"
+    pushd "${SCRATCH_DIR}" >/dev/null
     # There are two issues with the flutter-engine buildsystem:
     # - it expects empty directories created by gclient.py to be present; that
     #   means we can't use the mk_tar_gz helper method from support/download/helpers,
@@ -72,6 +73,7 @@ gen_tarball() {
     # So we just create a plain tarball.
     ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
+    popd >/dev/null
 }
 
 cleanup() {
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
