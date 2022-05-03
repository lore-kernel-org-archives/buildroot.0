Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06491C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D5F6100B;
	Tue,  3 May 2022 20:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSEsCpCEUzWy; Tue,  3 May 2022 20:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF6A60BDB;
	Tue,  3 May 2022 20:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C75E61BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B685B417A4
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7EYR0gOQG13 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A114171C
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6EA8E854F2; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe740dcac8b065e4d52674b84cd3ff4e65959442
X-Git-Newrev: e11431dd611bd3f9f23a2fc48f3b077d35073b9d
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.6EA8E854F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: depend on !BR2_PACKAGE_LUA
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

commit: https://git.buildroot.net/buildroot/commit/?id=e11431dd611bd3f9f23a2fc48f3b077d35073b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't enable lua and luajit at the same time as they both provide
the virtual luainterpreter package.

Fixes:
package/luajit/luajit.mk:80: *** Configuration error: both "luajit" and "lua" are selected as providers for virtual package "luainterpreter". Only one provider can be selected at a time. Please fix your configuration.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luajit/Config.in | 2 ++
 package/snort3/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 3111a2548f..f27099e80c 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	depends on !BR2_STATIC_LIBS # dlopen
+	# Luajit conflicts with the regular lua package
+	depends on !BR2_PACKAGE_LUA
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index dcc29b820a..9b96e7cb58 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SNORT3
 	bool "snort3"
+	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
 	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU # fork()
@@ -34,6 +35,7 @@ config BR2_PACKAGE_SNORT3
 	  https://www.snort.org/snort3
 
 comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+	depends on !BR2_PACKAGE_LUA
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
