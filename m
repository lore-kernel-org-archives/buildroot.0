Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1358CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B090260C31;
	Tue,  2 Apr 2024 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2lnSjrWbDhm; Tue,  2 Apr 2024 21:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264A260BF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 264A260BF3;
	Tue,  2 Apr 2024 21:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18A741BF977
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D8080B30
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRRYUlcW3RHn for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A4D80B1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0A4D80B1E
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADCD08465B; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 23:25:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be2ed289684e610b2229339b315706c03ca60da7
X-Git-Newrev: 1ee056bfeb8bf8a4e0081ade283db28f21c50017
X-Patchwork-Hint: ignore
Message-Id: <20240402212732.ADCD08465B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: fix build with glibc 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ee056bfeb8bf8a4e0081ade283db28f21c50017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing screen's libcrypt dependency this
broke any screen build using glibc version 2.39.

To fix this select the libxcrypt dependency for screen when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/screen/Config.in | 1 +
 package/screen/screen.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index ee4c04ca9e..40cda77b50 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SCREEN
 	bool "screen"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
 	  Screen is a full-screen window manager that multiplexes a
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index d4052b1191..55fecb89bc 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -16,6 +16,10 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SCREEN_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SCREEN_DEPENDENCIES += linux-pam
 SCREEN_CONF_OPTS += --enable-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
