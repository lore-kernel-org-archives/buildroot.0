Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807C0E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B61B81342;
	Sat, 30 Sep 2023 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B61B81342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3nBDRRS44PU; Sat, 30 Sep 2023 08:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D905D81433;
	Sat, 30 Sep 2023 08:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D905D81433
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA6EC1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90421813A6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90421813A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3aPJNHpHokX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F3E8138B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F3E8138B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C671E828C0; Sat, 30 Sep 2023 08:00:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 09:58:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 380cf4279df25be64003f5609dd2143c98c6e39c
X-Git-Newrev: 2af0e6c86555450a1238a7e5ff7e5c2a2c8b47ef
X-Patchwork-Hint: ignore
Message-Id: <20230930080010.C671E828C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=2af0e6c86555450a1238a7e5ff7e5c2a2c8b47ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-config --variable=version luajit returns 2.1.1693350652 since bump of
luajit in commit c9dcd9e459d6e0a955129ab42916d4c1140bdc3d, but the directory
is still host/share/luajit-2.1 - resulting in the following build failure:

luajitluajit::  unknown luaJIT command or jit.* modules not installedunknown luaJIT command or jit.* modules not installed

Fixes:
 - http://autobuild.buildroot.org/results/d1cac93407122bb5a6e2c13f49b542e1db619fb5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luvi/luvi.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 4a8072dee5..a8e645fab3 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -32,14 +32,15 @@ endif
 
 # LUAJIT_VERSION and the luajit installation path may not use the
 # same value. Use the value from luajit.pc file.
-LUVI_LUAJIT_VERSION = `$(PKG_CONFIG_HOST_BINARY) --variable=version luajit`
+LUVI_LUAJIT_MAJVER = `$(PKG_CONFIG_HOST_BINARY) --variable=majver luajit`
+LUVI_LUAJIT_MINVER = `$(PKG_CONFIG_HOST_BINARY) --variable=minver luajit`
 
 # Bundled lua bindings have to be linked statically into the luvi executable
 LUVI_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DWithSharedLibluv=ON \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
-	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_VERSION)/?.lua
+	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_MAJVER).$(LUVI_LUAJIT_MINVER)/?.lua
 
 # Add "rex" module (PCRE via bundled lrexlib)
 ifeq ($(BR2_PACKAGE_PCRE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
