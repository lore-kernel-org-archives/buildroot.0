Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EFEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16AC680D74;
	Mon, 27 Dec 2021 21:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4abo3Vzsk1N; Mon, 27 Dec 2021 21:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FFF80C3A;
	Mon, 27 Dec 2021 21:26:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC6331BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D33401A3
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_ouDSHfcK4W for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:26:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB3564014E
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:26:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D280282B85; Mon, 27 Dec 2021 21:20:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:25:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9892fd8f06e51be6b838e99dce5075aceeda1142
X-Git-Newrev: a15cb73b4930912a0f31646759c354a52f4c946c
X-Patchwork-Hint: ignore
Message-Id: <20211227212054.D280282B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-argon2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a15cb73b4930912a0f31646759c354a52f4c946c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/lua-argon2/Config.in                     | 13 ++++++++++++
 package/lua-argon2/lua-argon2.hash               |  2 ++
 package/lua-argon2/lua-argon2.mk                 | 23 ++++++++++++++++++++++
 support/testing/tests/package/test_lua_argon2.py | 25 ++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2eda8f6ad7..d499785801 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -662,6 +662,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-argon2/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
diff --git a/package/lua-argon2/Config.in b/package/lua-argon2/Config.in
new file mode 100644
index 0000000000..98bdd88199
--- /dev/null
+++ b/package/lua-argon2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_ARGON2
+	bool "lua-argon2"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # libargon2
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  Lua C binding for the Argon2 password hashing algorithm.
+
+	  https://github.com/thibaultcha/lua-argon2
+
+comment "lua-argon2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/lua-argon2/lua-argon2.hash b/package/lua-argon2/lua-argon2.hash
new file mode 100644
index 0000000000..cb3404d303
--- /dev/null
+++ b/package/lua-argon2/lua-argon2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d109c6e8e93cd9e27e8738567a998a2763d56252cc1abca1f0f2ac36ef8ce0f4  lua-argon2-3.0.1.tar.gz
diff --git a/package/lua-argon2/lua-argon2.mk b/package/lua-argon2/lua-argon2.mk
new file mode 100644
index 0000000000..6f787a907a
--- /dev/null
+++ b/package/lua-argon2/lua-argon2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lua-argon2
+#
+################################################################################
+
+LUA_ARGON2_VERSION = 3.0.1
+LUA_ARGON2_SITE = $(call github,thibaultcha,lua-argon2,$(LUA_ARGON2_VERSION))
+LUA_ARGON2_LICENSE = MIT
+LUA_ARGON2_DEPENDENCIES = luainterpreter libargon2
+
+define LUA_ARGON2_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CC=$(TARGET_CC) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		PREFIX="$(STAGING_DIR)/usr"
+endef
+
+define LUA_ARGON2_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/argon2.so $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/argon2.so
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lua_argon2.py b/support/testing/tests/package/test_lua_argon2.py
new file mode 100644
index 0000000000..8a2a57e659
--- /dev/null
+++ b/support/testing/tests/package/test_lua_argon2.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaArgon2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_ARGON2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("argon2")
+
+
+class TestLuajitLuaArgon2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_ARGON2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("argon2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
