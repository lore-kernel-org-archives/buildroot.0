Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC7EE95375
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04356606AA;
	Wed,  4 Feb 2026 10:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDdTVY25QIij; Wed,  4 Feb 2026 10:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E87BE60A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770201135;
	bh=XxIB6X/CfnLBcZuNPHCKwp0vmFjC8moLP3OCft5S9sU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H0FjbLZ0p9awP1xuxq6AoUZND2Xs3gQG6JQAOWzQWGzZVg8URaGVqYMil8Hmteb1a
	 YLQ9Mv5ZtY5h8jkZZBLDAWzIPIGGn3HZvu+wL2TBZ+jDBrhwLq+m7d+gyuYGURA792
	 TE9TGJMnxzL7qF6ePqBOjWoS9pUAlO9hWLb7eeko+KF6zDM0ldGXarMIVT0ih8yZCL
	 DzRSUGso3VFcRqBrCA0cCsoIPjm5frE9hZKwN9LHlyRxz/PsYlokB4w5a6qEMagZnY
	 NqTj0FpZPvBWF5bS6jL4/GzqeY0cmNp183U6oAMLhLnfmW/0LRQjSyeiCUCjLQ2VM4
	 QbZoZyH0HiMqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87BE60A6F;
	Wed,  4 Feb 2026 10:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66FD5173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C8D60A6F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pS63YlPjdHVz for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9533B606AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9533B606AA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:32:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6664D86878; Wed,  4 Feb 2026 10:32:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 11:31:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fefc82a35bc99b24c2f4923ecbd41fb5997d37b1
X-Git-Newrev: 21311f79c61050bbb289fba1328bd4df1abdd52d
X-Patchwork-Hint: ignore
Message-Id: <20260204103212.6664D86878@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: fix usage with readonly
 rootfs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21311f79c61050bbb289fba1328bd4df1abdd52d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
