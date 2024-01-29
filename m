Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA1CC47258
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 02:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC1D606D3;
	Mon, 29 Jan 2024 02:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAC1D606D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4B5CjZYOmT1; Mon, 29 Jan 2024 02:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E903760AD0;
	Mon, 29 Jan 2024 02:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E903760AD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABDD11BF2A6
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 02:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86D7681EEE
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 02:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D7681EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkUWZB0GTrWo for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 02:34:35 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34B2B81EB2
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 02:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B2B81EB2
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5f69383e653so25852097b3.1
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 18:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706495673; x=1707100473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvXpMzTICeku4VbaFDm0HWvcwWthz3SXHom4EzV5ebo=;
 b=enbzX4LjXcHMvwlCMY3jgeo9isDWJPlmRM91JrIw4usfSpr80Wez6mvDdUqpZWGN6L
 m7ZWiv9s1fZw77NrBZ1XRwmVvVD+nypsWZmQmvm+4yZasu63ftUUDeysqEonQFVvO/sl
 r69HrtPqrBF566CtrH8HLgiA6yaO4IcVDItjOQpBPa48vT1ud1YoOQFAYlpOHswJ6qQM
 bG7c6CFqJ7ompvLzZoyhP0hrIQLw5itYiqlyFeaPoIn2RQyTzHZR3RP2MD7QGXsXARlj
 JM1z9NP8JfWGLcRxf/aEmbucTSl0th5S7cUB7OvmY+2i11TV2Sp+XqqNNeRl0U4HSQFF
 DlfA==
X-Gm-Message-State: AOJu0YycuBEHdwDt1WkbfDEQ9VVlLQ/jORn0DWk39sg73EYxjuTetjcF
 JNACiJgS2mQA5iUGBrgP0JDUUfLwZCSAjF79H33+YTjDwOWurwCWJ9sQEbsRpwE=
X-Google-Smtp-Source: AGHT+IHsbnTsKZANYMkf155uYkpsQ7mQvcoBkxzo0YnNf2qt2/nhCcwhNbOVvLM8U8OKUrdxhIitlQ==
X-Received: by 2002:a81:ae27:0:b0:5ff:91d5:a379 with SMTP id
 m39-20020a81ae27000000b005ff91d5a379mr3224511ywh.44.1706495672910; 
 Sun, 28 Jan 2024 18:34:32 -0800 (PST)
Received: from thinkpad.lan ([2600:1700:3eca:ac1f:a11a:f043:3678:9ceb])
 by smtp.gmail.com with ESMTPSA id
 do5-20020a05690c23c500b005ffb11e67bdsm2123503ywb.62.2024.01.28.18.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 18:34:32 -0800 (PST)
From: Abilio Marques <abiliojr@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 18:29:13 -0800
Message-ID: <20240129022913.3367510-1-abiliojr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706495673; x=1707100473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DvXpMzTICeku4VbaFDm0HWvcwWthz3SXHom4EzV5ebo=;
 b=gNY/xqVHpAsQLe8ENPwolaP+vaYhP3fU/atOQKrpK0AhTAyRaNQ0Am9Gfv1Hyfb2U0
 DMAsxMDXF902PCRMhdx186sh3F+DA7cSPBEmX0udwHVUf3wwNSq37jBUbZ0cyVQRi6i/
 D7hrBRPnkg13v7H4DTEVQ5RXnE35FAUakubYU6TofObuxZTvhc4ZvpfEDVsRazT9AKt9
 0bbqPWBL054ocUFOwiAlo0EBHEhbzcB+4v3qe1OxlpQVRofqzVv2cO+qdlUeeJVe6wCs
 jjA+HIGVk1xBjw7lJJlf46pvMuCWh4VmO8TD7eTZkIRaZMeoVbEk0HEEZukHOkt8TxzK
 2jaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gNY/xqVH
Subject: [Buildroot] [PATCH v2 1/1] package/micropython: make use of recent
 micropython-lib
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
Cc: Chris Packham <judge.packham@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Abilio Marques <abiliojr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Until now, micropython-lib was a package that installed v1.9.3,
which is more than 6 years old. This was acceptable since micropython
never made any other official release of the library until v1.20.

Meanwhile, the libraries underwent a reorganization, and they are now
available in a directory structure that cannot be copied directly into
the target. This is my theory on why v1.9.3 is still present in the
current day buildroot (which comes with micropython v1.22).

This commit introduces an auxiliary script to collect those libraries
and reorder them into a structure that can then be copied into
/usr/lib/micropython. The script utilizes a module from the tools
directory of the micropython repo.

As part of the changes made by the micropython project, the libraries
are now released together with the interpreter. They are cloned as a
submodule into the lib/micropython-lib directory.

These are the 2 main reasons why the old buildroot micropython-lib
package is being removed.

With this commit, micropython-lib is installed (optionally) as part
of micropython. The original config variable name was retained as it
fits with the micropython package 'namespace", and thus this is
backward compatible and no legacy handling is needed.

I tried to keep it simple. It makes use of existing micropython tools
(used to process manifests) to discover the list of packages available
in micropython-lib. My hope is that by relying on them, any future
changes in directory structure will be covered by the official
"manifestfile.py" tool.

This commit also ensures that the libraries in micropython-lib will
be updated together with newer versions of micropython.

Signed-off-by: Abilio Marques <abiliojr@gmail.com>
---
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/micropython-lib/Config.in             |  8 --
 package/micropython-lib/micropython-lib.hash  |  3 -
 package/micropython-lib/micropython-lib.mk    | 18 -----
 package/micropython/Config.in                 |  8 ++
 .../micropython/collect_micropython_lib.py    | 79 +++++++++++++++++++
 package/micropython/micropython.mk            | 17 ++++
 8 files changed, 104 insertions(+), 31 deletions(-)
 delete mode 100644 package/micropython-lib/Config.in
 delete mode 100644 package/micropython-lib/micropython-lib.hash
 delete mode 100644 package/micropython-lib/micropython-lib.mk
 create mode 100755 package/micropython/collect_micropython_lib.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..cc9bc5b5cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -572,7 +572,6 @@ F:	package/coremark/
 F:	package/coremark-pro/
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
-F:	package/micropython-lib/
 F:	package/syslog-ng/
 
 N:	Christian Kellermann <christian.kellermann@solectrix.de>
diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..426bd7d090 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -798,7 +798,6 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/micropython/Config.in"
-	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
deleted file mode 100644
index 76557b220b..0000000000
--- a/package/micropython-lib/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_MICROPYTHON_LIB
-	bool "micropython-lib"
-	depends on BR2_PACKAGE_MICROPYTHON
-	select BR2_PACKAGE_PCRE # runtime
-	help
-	  Core Python libraries ported to MicroPython.
-
-	  http://micropython.org
diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
deleted file mode 100644
index cbdda23844..0000000000
--- a/package/micropython-lib/micropython-lib.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-1.9.3.tar.gz
-sha256  baed4196a4310c576c2010f0a49f987a49e63856df7cd45af11cb3571df4bf74  LICENSE
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
deleted file mode 100644
index 78ac0d3b35..0000000000
--- a/package/micropython-lib/micropython-lib.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# micropython-lib
-#
-################################################################################
-
-MICROPYTHON_LIB_VERSION = 1.9.3
-MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,v$(MICROPYTHON_LIB_VERSION))
-MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
-MICROPYTHON_LIB_LICENSE_FILES = LICENSE
-
-define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=$(TARGET_DIR)/usr/lib/micropython \
-		install
-endef
-
-$(eval $(generic-package))
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 30161c8b70..966e4b958e 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -9,5 +9,13 @@ config BR2_PACKAGE_MICROPYTHON
 
 	  http://micropython.org
 
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	default y
+	depends on BR2_PACKAGE_MICROPYTHON
+	select BR2_PACKAGE_PCRE # runtime
+	help
+	  Core Python libraries ported to MicroPython.
+
 comment "micropython needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/micropython/collect_micropython_lib.py b/package/micropython/collect_micropython_lib.py
new file mode 100755
index 0000000000..8dce78337a
--- /dev/null
+++ b/package/micropython/collect_micropython_lib.py
@@ -0,0 +1,79 @@
+#!/usr/bin/env python3
+
+"""
+Sometime after v1.9.3, micropython-lib's directory structure was cleaned up and
+enhanced with manifest files.
+
+Though cleaner, it means it cannot be directly copied into the target.
+This script is during build process to perform that conversion.
+
+It makes use of manifestfile.py, which is normally located in micropython's
+tool directory.
+
+It also depends on the micropython-lib that is cloned in lib/micropython-lib
+during build.
+"""
+
+import argparse
+import manifestfile
+import os
+import shutil
+
+
+def get_library_name_type(manifest_path: str) -> tuple[str, bool]:
+    split = manifest_path.split("/")
+    return (split[-2], "unix-ffi" in split)  # -1: "manifest.py", -2: library name
+
+
+def get_all_libraries(mpy_lib_dir: str):
+    # reuse manifestfile module capabilities to scan the micropython-lib directory
+
+    collected_list = manifestfile.ManifestFile(
+        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
+    )
+    collected_list.freeze(mpy_lib_dir)
+
+    for file in collected_list.files():
+        if file.target_path.endswith("manifest.py"):
+            yield get_library_name_type(file.full_path)
+
+
+def copy_file(src: str, target: str, destination: str):
+    s = target.split("/")
+    s.pop()
+    d = f"{destination}/{'/'.join(s)}"
+    os.makedirs(d, exist_ok=True)
+    shutil.copy(src, f"{destination}/{target}")
+
+
+def copy_libraries(manifest, destination: str):
+    for f in manifest.files():
+        copy_file(f.full_path, f.target_path, destination)
+
+
+def process_cmdline_args():
+    parser = argparse.ArgumentParser(
+        description="Prepare micropython-lib to be installed"
+    )
+    parser.add_argument("micropython", help="Path to micropython source directory")
+    parser.add_argument("destination", help="Destination directory")
+
+    args = parser.parse_args()
+    return os.path.abspath(args.micropython), os.path.abspath(args.destination)
+
+
+def main():
+    micropython_dir, destination_dir = process_cmdline_args()
+    mpy_lib_dir = f"{micropython_dir}/lib/micropython-lib"
+
+    manifest = manifestfile.ManifestFile(
+        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
+    )
+
+    for library, is_ffi in get_all_libraries(mpy_lib_dir):
+        manifest.require(library, unix_ffi=is_ffi)
+
+    copy_libraries(manifest, destination_dir)
+
+
+main()
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 37c148da94..5a0c5616a5 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -57,4 +57,21 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
 		install
 endef
 
+ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
+define MICROPYTHON_COLLECT_LIBS
+	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools:/$PYTHONPATH \
+		package/micropython/collect_micropython_lib.py \
+		$(@D) $(@D)/.built_pylib
+endef
+
+define MICROPYTHON_INSTALL_LIBS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/micropython
+	cp -a $(@D)/.built_pylib/* $(TARGET_DIR)/usr/lib/micropython
+endef
+
+MICROPYTHON_POST_BUILD_HOOKS += MICROPYTHON_COLLECT_LIBS
+MICROPYTHON_POST_INSTALL_TARGET_HOOKS += MICROPYTHON_INSTALL_LIBS
+endif
+
+
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
