Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEEAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B05361101
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B05361101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D735B40255;
	Sun,  7 Nov 2021 20:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBwFmxWNjAW0; Sun,  7 Nov 2021 20:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B44C4026B;
	Sun,  7 Nov 2021 20:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 327871BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BEFE80C9D
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTsMhhgnAWSz for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C7280CBD
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB6AC8B50B; Sun,  7 Nov 2021 20:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:27:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05fb75e495d0b3f636de7558a14309f1e6061bfb
X-Git-Newrev: bb0ca7f32eaa3c3535c04e2f84763be75606714c
X-Patchwork-Hint: ignore
Message-Id: <20211107202455.BB6AC8B50B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb0ca7f32eaa3c3535c04e2f84763be75606714c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override LUA_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b385b78b30..844e165df0 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -40,12 +40,12 @@ LUA_MYLIBS += -ldl
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_READLINE),y)
-LUA_DEPENDENCIES = readline ncurses
+LUA_DEPENDENCIES += readline ncurses
 LUA_MYLIBS += -lreadline -lhistory -lncurses
 LUA_CFLAGS += -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
-LUA_DEPENDENCIES = linenoise
+LUA_DEPENDENCIES += linenoise
 LUA_MYLIBS += -llinenoise
 LUA_CFLAGS += -DLUA_USE_LINENOISE
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
