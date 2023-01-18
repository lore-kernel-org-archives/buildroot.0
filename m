Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207BCC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDAF561122;
	Tue, 21 Feb 2023 01:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDAF561122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbvOvnf78O9U; Tue, 21 Feb 2023 01:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B6161142;
	Tue, 21 Feb 2023 01:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B6161142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA7C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA0576FB81
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA0576FB81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LH0wtbSo5cUQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 131EE6FB83
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131EE6FB83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0742181979; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 22:18:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7797603d260b498c864d089b107d01679edf0a6
X-Git-Newrev: c77c66b7df478f508b8f2affa7a64795504db699
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.0742181979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua: add options for
 coercion between number and string
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

commit: https://git.buildroot.net/buildroot/commit/?id=c77c66b7df478f508b8f2affa7a64795504db699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The default behavior of Lua 5.3/5.4 interperter (and the only way with
Lua 5.1) is the automatic coercion. This default behavior could change
in future version (ie. Lua 5.5).

Disabling automatic coercion increases the performance of the interpreter.

Currently, using automatic coercion is not a good/recommended practice,
but there are no way (expect testing) to say if a Lua module relies on it.

We add two options to drive coercion in either way, and we make those
options default to y, as this was the de-facto situation until now; lua
5.1 forces those options: this will help when/if we have packages that
actually requires them, but has otherwise no requirement on the lua
version.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr:
  - don't limit options to lua 5.3||5.4
  - force those options for lua 5.1
  - extend commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua/Config.in | 16 ++++++++++++++++
 package/lua/lua.mk    |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 309dd6eec2..456f3b8c12 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -21,6 +21,8 @@ choice
 config BR2_PACKAGE_LUA_5_1
 	bool "Lua 5.1.x"
 	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	select BR2_PACKAGE_LUA_CVT_N2S
+	select BR2_PACKAGE_LUA_CVT_S2N
 
 config BR2_PACKAGE_LUA_5_3
 	bool "Lua 5.3.x"
@@ -43,6 +45,20 @@ config BR2_PACKAGE_LUA_32BITS
 
 endif
 
+config BR2_PACKAGE_LUA_CVT_N2S
+	bool "automatic coercion from number to string"
+	default y  # legacy
+	help
+	  If unsure, say y, this is the default behavior of the Lua
+	  interpreter. See LUA_NOCVTN2S in luaconf.h
+
+config BR2_PACKAGE_LUA_CVT_S2N
+	bool "automatic coercion from string to number"
+	default y  # legacy
+	help
+	  If unsure, say y, this is the default behavior of the Lua
+	  interpreter. See LUA_NOCVTN2S in luaconf.h
+
 choice
 	prompt "Lua command-line editing"
 	default BR2_PACKAGE_LUA_EDITING_NONE
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 01b554eb6b..16086e7bf4 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -31,6 +31,14 @@ else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
+ifeq ($(BR2_PACKAGE_LUA_CVT_N2S),)
+LUA_CFLAGS += -DLUA_NOCVTN2S
+endif
+
+ifeq ($(BR2_PACKAGE_LUA_CVT_S2N),)
+LUA_CFLAGS += -DLUA_NOCVTS2N
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LUA_BUILDMODE = static
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
