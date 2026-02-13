Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B37EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C13F845E0;
	Fri, 13 Feb 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyWRzGmSBK7v; Fri, 13 Feb 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467A684612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011379;
	bh=dBU2E8cG8+OH0QpjTkhj+OthJyGr+PQ71EzHIwVgcJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ES1KeWNz4tRWuX9ug9rd1iYAg/TmXR8ohBIkpNLFCdDQlxHqHuXhRu/t+mmYs5YCl
	 3994Ovjl/ImDv3A/pSk/lfj9TcWZP2PK0mvbWh7TcU9XPi1rqVbRABovusxrstVwSf
	 5MxDnyHH4kXvY10eImdT2JxMZavLhp9gOAlU3F+7w6R35EL9BWsNy2LjEWB0mUcUWv
	 NMCAxZxhCZ37Z17l6zhpVUGc7batVMglpC/3c4zHehdXNfMO5LHS7mOrs2y1OTcDWj
	 s774AdQDYNwmLYBPsXhv1lIXN9f7K8WUrwo/UmHp4iaQudNJWTMbUk0lHz0jCgpVYq
	 DlkYMoy73WTyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467A684612;
	Fri, 13 Feb 2026 19:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F039283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23E30844B5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAvk3GtlQlpY for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C8A084539
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C8A084539
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2211F81EB5; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b6f85bbc9caf83345bc2806382626c61f91e641b
X-Git-Newrev: 0f7d6cfc45c4773d5c8ef9b4e5e97ce6431c84cd
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.2211F81EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/screen: fix usage
 with readonly rootfs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f7d6cfc45c4773d5c8ef9b4e5e97ce6431c84cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 4769724ee2bebd671f6a9372fb8922a8c22c5079 bumped the
package from 4.9.1 to 5.0.0 which includes a major rewrite of the
configure script
https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.4.9.1
https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.5.0.0

By default, screen puts the socket directory in $HOME/.screen, which
is not writable when the rootfs is readonly:

 # screen
 Cannot access /root/.screen: No such file or directory

The --enable-socket-dir option added in upstream commit
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=78a961188f7da528c7cefcc63e07f35f04e69a93
allows to configure this, and actually its default value of
/run/screen is sensible, so we fix the problem by simply passing
--enable-socket-dir, and rely on its default setting.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/issues/123

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 21311f79c61050bbb289fba1328bd4df1abdd52d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/screen/screen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 74453faff8..c85abaf411 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -13,7 +13,7 @@ SCREEN_SELINUX_MODULES = screen
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
-SCREEN_CONF_OPTS = --enable-colors256
+SCREEN_CONF_OPTS = --enable-colors256 --enable-socket-dir
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
