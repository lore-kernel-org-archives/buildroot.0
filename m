Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD0CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEEE607A8;
	Tue,  2 Apr 2024 21:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhHaBR3m_-RX; Tue,  2 Apr 2024 21:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E058060A96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E058060A96;
	Tue,  2 Apr 2024 21:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 087A71BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D8A60BED
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJKGw6CfVMZ8 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78F160A96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A78F160A96
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B3A8465A; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 23:23:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a29521747e78b68e4bfa3a06150163921dd4908
X-Git-Newrev: be2ed289684e610b2229339b315706c03ca60da7
X-Patchwork-Hint: ignore
Message-Id: <20240402212732.A0B3A8465A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaposix: fix build with glibc 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=be2ed289684e610b2229339b315706c03ca60da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing luaposix's libcrypt dependency this
broke any luaposix build using glibc version 2.39.

To fix this select the libxcrypt dependency to luaposix when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: use more traditional ifeq-endif block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luaposix/Config.in   | 1 +
 package/luaposix/luaposix.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 85943f9915..bd2105743d 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
 	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
 	  like most libraries it simply binds to C APIs on the
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index d09a1bcd1d..c5d98fbbd4 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -10,6 +10,10 @@ LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LUAPOSIX_DEPENDENCIES += libxcrypt
+endif
+
 define LUAPOSIX_BUILD_CMDS
 	(cd $(@D); \
 		$(LUA_RUN) build-aux/luke \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
