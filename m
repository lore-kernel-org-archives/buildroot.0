Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFA5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BBB403D8;
	Sat,  8 Jan 2022 19:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ja0mApJNpQjr; Sat,  8 Jan 2022 19:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA84403A8;
	Sat,  8 Jan 2022 19:26:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEFA1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5142F81463
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asPHcWt9LwwU for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87DD781460
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:26:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F710832B5; Sat,  8 Jan 2022 19:20:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 20:26:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e71f5111988fe57531d1c84bdf631f1932b14bc
X-Git-Newrev: 329f71ed3038af9403d606ec1f1b0d2d96c6f340
X-Patchwork-Hint: ignore
Message-Id: <20220108192000.9F710832B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/civetweb: drop
 BR2_PACKAGE_CIVETWEB_WITH_LUA
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

commit: https://git.buildroot.net/buildroot/commit/?id=329f71ed3038af9403d606ec1f1b0d2d96c6f340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop BR2_PACKAGE_CIVETWEB_WITH_LUA and enable Lua support depending on
BR2_PACKAGE_LUA and BR2_PACKAGE_LUAJIT

It should be noted that civetweb will still use its embedded version of
sqlite

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: add !BR2_STATIC_LIBS, pass LUA_SHARED_LIB_FLAG, explicitly link with
	-ldl, rework order]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |  9 +++++++++
 package/civetweb/Config.in   | 12 ------------
 package/civetweb/civetweb.mk | 18 +++++++++++++++---
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 141d43a479..75873ff74b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_CIVETWEB_WITH_LUA
+	bool "civetweb lua support option removed"
+	select BR2_LEGACY
+	help
+	  Lua support does not depend on a version of Lua bundled
+	  within the Civetweb sources anymore. Lua support is
+	  automatically enabled if an Lua interpreter (lua or luajit)
+	  is enabled in Buildroot.
+
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	bool "sunxi-mali-mainline-driver package was renamed"
 	select BR2_LEGACY
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index 9e43969085..6bca5ed8fd 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -21,18 +21,6 @@ config BR2_PACKAGE_CIVETWEB_LIB
 	  Enable the civetweb library for embedding in another
 	  application.
 
-config BR2_PACKAGE_CIVETWEB_WITH_LUA
-	bool "enable Lua support"
-	# required by the bundled Sqlite3 and Lua code
-	depends on !BR2_STATIC_LIBS
-	help
-	  Enable Lua support in Civetweb. Note that this will use a
-	  version of Lua and Sqlite bundled within the Civetweb
-	  sources, and not the packages from Buildroot.
-
-comment "lua support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
 
 comment "civetweb needs a toolchain w/ threads"
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 22618fb443..a299de85e9 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -26,9 +26,21 @@ ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
 CIVETWEB_COPT += -DNO_ATOMICS=1
 endif
 
-ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
-CIVETWEB_CONF_OPTS += WITH_LUA=1
-CIVETWEB_LIBS += -ldl
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+CIVETWEB_CONF_OPTS += WITH_LUAJIT_SHARED=1
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs luajit` -ldl
+CIVETWEB_DEPENDENCIES += host-pkgconf luajit
+else ifeq ($(BR2_PACKAGE_LUA):$(BR2_STATIC_LIBS),y:)
+CIVETWEB_CONF_OPTS += WITH_LUA=1 WITH_LUA_SHARED=1 LUA_SHARED_LIB_FLAG=''
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs lua`
+CIVETWEB_DEPENDENCIES += host-pkgconf lua
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=501
+else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=503
+else ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=504
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
