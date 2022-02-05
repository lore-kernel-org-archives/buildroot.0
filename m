Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E38A60C21;
	Sat,  5 Feb 2022 22:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W06bSHqZhAtU; Sat,  5 Feb 2022 22:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535BC60AC6;
	Sat,  5 Feb 2022 22:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 644541BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2DAB60806
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ssUrysGkeD06 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF91160AA5
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CF6E282AA7; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:45:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f9a5659023c66fc166de28fd39a6c97a9490667
X-Git-Newrev: d32e062f1cc709893ed5893ebae736a54c36eef9
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.CF6E282AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: use Lua 5.4 as default
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

commit: https://git.buildroot.net/buildroot/commit/?id=d32e062f1cc709893ed5893ebae736a54c36eef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua-sdl2 is not available on Lua 5.4, so update its test to use Lua 5.3
instead.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua/Config.in                          | 2 +-
 support/testing/tests/package/test_lua.py      | 4 ++--
 support/testing/tests/package/test_lua_sdl2.py | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 5d4cee5d5b..309dd6eec2 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
-	default BR2_PACKAGE_LUA_5_3
+	default BR2_PACKAGE_LUA_5_4
 	help
 	  Select the version of Lua API/ABI you wish to use.
 
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 573ae01005..9703dffbd4 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -42,8 +42,8 @@ class TestLua(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.version_test('Lua 5.3')
-        self.g_version_test('Lua 5.3')
+        self.version_test('Lua 5.4')
+        self.g_version_test('Lua 5.4')
 
 
 class TestLuajit(TestLuaBase):
diff --git a/support/testing/tests/package/test_lua_sdl2.py b/support/testing/tests/package/test_lua_sdl2.py
index 22c4087f5d..b9aad15f45 100644
--- a/support/testing/tests/package/test_lua_sdl2.py
+++ b/support/testing/tests/package/test_lua_sdl2.py
@@ -5,6 +5,7 @@ class TestLuaLuaSDL2(TestLuaBase):
     config = TestLuaBase.config + \
         """
         BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_3=y
         BR2_PACKAGE_LUA_SDL2=y
         BR2_PACKAGE_SDL2_IMAGE=y
         BR2_PACKAGE_SDL2_MIXER=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
