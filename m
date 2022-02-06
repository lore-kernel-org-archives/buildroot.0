Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656DDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E240440232;
	Sun,  6 Feb 2022 19:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9c8nS-XpZv30; Sun,  6 Feb 2022 19:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBDA3401C2;
	Sun,  6 Feb 2022 19:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12CE81BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED53605E0
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzO-xm0ILc_j for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:23:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 470DD605DB
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:23:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 46D5682BD5; Sun,  6 Feb 2022 19:16:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 20:22:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2
X-Git-Newrev: 13114d0f9352531e5d7ebed45cd3f679407c61d9
X-Patchwork-Hint: ignore
Message-Id: <20220206191613.46D5682BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cffi: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=13114d0f9352531e5d7ebed45cd3f679407c61d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                              |  1 +
 package/lua-cffi/Config.in                     | 19 +++++++++++++++++++
 package/lua-cffi/lua-cffi.hash                 |  3 +++
 package/lua-cffi/lua-cffi.mk                   | 14 ++++++++++++++
 support/testing/tests/package/test_lua_cffi.py | 14 ++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 43ce9013c6..d631ed784a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ menu "Lua libraries/modules"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
 	source "package/lua-bit32/Config.in"
+	source "package/lua-cffi/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
new file mode 100644
index 0000000000..64a36e1de4
--- /dev/null
+++ b/package/lua-cffi/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LUA_CFFI
+	bool "lua-cffi"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libffi
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBFFI
+	help
+	  This is a portable C FFI for Lua, based on libffi and aiming
+	  to be mostly compatible with LuaJIT FFI, but written from
+	  scratch.
+
+	  https://github.com/q66/cffi-lua
+
+comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
new file mode 100644
index 0000000000..a532c6c7b3
--- /dev/null
+++ b/package/lua-cffi/lua-cffi.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c30080d6309167f86d1a96d3ee33f33ef52e884052b7feac140b8c52db10ad7a  lua-cffi-0.2.1.tar.gz
+sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
new file mode 100644
index 0000000000..07d84ad5fa
--- /dev/null
+++ b/package/lua-cffi/lua-cffi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-cffi
+#
+################################################################################
+
+LUA_CFFI_VERSION=0.2.1
+LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
+LUA_CFFI_LICENSE = MIT
+LUA_CFFI_LICENSE_FILES = COPYING.md
+
+LUA_CFFI_DEPENDENCIES = libffi lua
+
+$(eval $(meson-package))
diff --git a/support/testing/tests/package/test_lua_cffi.py b/support/testing/tests/package/test_lua_cffi.py
new file mode 100644
index 0000000000..7f56eef566
--- /dev/null
+++ b/support/testing/tests/package/test_lua_cffi.py
@@ -0,0 +1,14 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaCffi(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_CFFI=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cffi")
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
