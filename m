Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE0EF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B6261452;
	Fri, 13 Feb 2026 19:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNGt-h7_hphy; Fri, 13 Feb 2026 19:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E9961451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011581;
	bh=QSJFa61BkoknXNL//HcJPfBk1MVgwKuaCqo2BUpBSZM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GOKnZqwoW1iFkC+HR+xv8sfbZIE7cUcmUMrQh5b8AF1ptEELbu81W8yP5dMOExG8G
	 tRpVM/gp7STUeCxwOEQMPfuzsmnY63oRVV4VJfzLrSEAlpvt0svhOmQYDkodj+FFg/
	 p1uwyTnPPmfch5XfK8klAGRAzIoCeLW/g1FqWBXwZYdHAWNHyjMjrlrXsWgaHq1JG0
	 BVFxzq+qmHdVGab5JpQrV51G5m8i8JAWfnFgKluN7wZAiEfTOjk/nvSoOwvFfllwZE
	 YhH4hUG3OalHBimjzEYQmXblFhoBhbauzTs6J9JD+LuV83T8NF6/0U4I3ispTvX9GE
	 Nty2db0U0hddQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E9961451;
	Fri, 13 Feb 2026 19:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7665F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C2E41312
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyPu7TBNA71L for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE17413C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE17413C5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A263C83593; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: efa9144d57d52c41c7cb9b11afb07d8697ea4b17
X-Git-Newrev: 84d7d2c3ac0a9a6ae3df769cbb59bc9948dded0e
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.A263C83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/screen: fix usage
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84d7d2c3ac0a9a6ae3df769cbb59bc9948dded0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
