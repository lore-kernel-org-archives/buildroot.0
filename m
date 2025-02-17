Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD62C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D822F82082;
	Mon, 17 Feb 2025 20:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uHG1AJZscDz; Mon, 17 Feb 2025 20:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0DD811D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0DD811D3;
	Mon, 17 Feb 2025 20:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2963C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9640C60901
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkR4uad2tGvH for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64E260A63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64E260A63
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:52:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD5198772B; Mon, 17 Feb 2025 20:52:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 21:35:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef3d171e50fb6aec9d1477356b07036cadc2409c
X-Git-Newrev: 004db1f5f3adaab7264b84e0896f9761cd9a2657
X-Patchwork-Hint: ignore
Message-Id: <20250217205216.CD5198772B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: fix configure options for
 readline/editline support
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3344846711894112326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3344846711894112326==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=004db1f5f3adaab7264b84e0896f9761cd9a2657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autosetup script will skip checking for readline.h when cross-compiling,
which will cause line-editing support for the sqlite3 shell to always be "none".

In this case, if the --editline option is provided, an error will be reported:
ERROR: Explicit --editline failed to find a matching library.

However, we can enable readline or editline support by specifying the CFLAGS
and LDFLAGS values ​​instead of having it handled automatically by the
autosetup configure script.

In addition, the libedit package actually depends on the ncurses package,
just like the readline package. So when using the libedit package,
also add the ncurses dependency.

Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5a8b033ce0..255ddc937b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -44,9 +44,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --disable-readline --editline
+SQLITE_CFLAGS  += -DHAVE_READLINE=1
+SQLITE_LDFLAGS += -lreadline -lncurses
+else ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_LIBEDIT),yy)
+SQLITE_DEPENDENCIES += ncurses libedit
+SQLITE_CFLAGS  += -DHAVE_EDITLINE=1
+SQLITE_LDFLAGS += -ledit -lncurses
 else
 SQLITE_CONF_OPTS += --disable-readline
 endif
@@ -59,7 +62,7 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
 SQLITE_CONF_OPTS += --disable-json
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \

--===============3344846711894112326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3344846711894112326==--
