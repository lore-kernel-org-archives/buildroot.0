Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBDCC47DB3
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 489CA40025;
	Mon, 29 Jan 2024 20:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 489CA40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5h-5cH1xN0ES; Mon, 29 Jan 2024 20:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9A67401B7;
	Mon, 29 Jan 2024 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A67401B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59C041BF36D
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A5E1408ED
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5E1408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAgd2EqCndHd for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:43:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08FED408E6
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08FED408E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8C1B82875; Mon, 29 Jan 2024 20:43:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 21:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fbeacf91f985df5834968e7ce95d5c0340b7fab
X-Git-Newrev: 8f403f013720417e958b089d3431795a48702c1d
X-Patchwork-Hint: ignore
Message-Id: <20240129204342.E8C1B82875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython-lib: merge with,
 and install as part of micropython
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f403f013720417e958b089d3431795a48702c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, micropython-lib was a package that installed v1.9.3, which is
more than 6 years old. This was acceptable since micropython never made
any other official release of the library until v1.20.

Meanwhile, the libraries underwent a reorganization, and they are now
available in a directory structure that cannot be copied directly into
the target. This might explain why v1.9.3 is still present in the
current day buildroot (which comes with micropython v1.22).

As part of the changes made by the micropython project, the libraries
are now released together with the interpreter. They are cloned as a
submodule into the lib/micropython-lib directory, and are present in the
release tarball.

This commit introduces an auxiliary script to collect those libraries
and reorder them into a structure that can then be copied into
/usr/lib/micropython. The script utilizes a module from the tools
directory of the micropython repo.

The helper script is kept as simple as possible, and makes use of
existing micropython tools (used to process manifests) to discover the
list of packages available in micropython-lib. The hope is that by
relying on them, any future changes in directory structure will be
covered by the official "manifestfile.py" tool.

It is to be noted that, even though the manifestfile.py script/module is
part of the micropython package, it is actually written for CPython, and
is not expected to even work when using micropython as an interpreter.
This we do not need to introduce host-micropython to use that tool, and
microython already depends on host-python3 for other parts of the build.

With this commit, micropython-lib is installed (optionally) as part
of micropython, and thus a separate package is no longer needed. The
original config variable name was retained as it fits with the
micropython package "namespace", and thus this is backward compatible
and no legacy handling is needed.

This commit also ensures that the libraries in micropython-lib will
be updated together with newer versions of micropython in the future.

Signed-off-by: Abilio Marques <abiliojr@gmail.com>
[yann.morin.1998@free.fr:
  - use if-block in Config.in
  - simplify PYTHONPATH
  - fix check-package
  - reword and reorder parts of the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 -
 package/Config.in                              |  1 -
 package/micropython-lib/Config.in              |  8 ---
 package/micropython-lib/micropython-lib.hash   |  3 -
 package/micropython-lib/micropython-lib.mk     | 18 ------
 package/micropython/Config.in                  | 10 ++++
 package/micropython/collect_micropython_lib.py | 79 ++++++++++++++++++++++++++
 package/micropython/micropython.mk             | 16 ++++++
 8 files changed, 105 insertions(+), 31 deletions(-)

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
index 30161c8b70..26a00baab0 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -9,5 +9,15 @@ config BR2_PACKAGE_MICROPYTHON
 
 	  http://micropython.org
 
+if BR2_PACKAGE_MICROPYTHON
+
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	select BR2_PACKAGE_PCRE # runtime
+	help
+	  Core Python libraries ported to MicroPython.
+
+endif # BR2_PACKAGE_MICROPYTHON
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
index 37c148da94..125a0edcfb 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -57,4 +57,20 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
 		install
 endef
 
+ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
+define MICROPYTHON_COLLECT_LIBS
+	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools \
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
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
