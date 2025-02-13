Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F44C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA16D5096C;
	Fri, 28 Feb 2025 17:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tamH9t9VI0W; Fri, 28 Feb 2025 17:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86664FEC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86664FEC0;
	Fri, 28 Feb 2025 17:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F2968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8AC542D50
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03BYYvCSY7YH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE5542560
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBE5542560
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D82E587AD6; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 22:30:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 56cc6fa2c71eff27efcb66d60f254da04439ac18
X-Git-Newrev: a93680be30bc35f7d2465ef576035fb937ea1d64
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.D82E587AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sqlite: fix build
 issue since bump to 3.49.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a93680be30bc35f7d2465ef576035fb937ea1d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As of release 3.49.0, the author has replaced the configure script used in
the precompiled amalgamation tarball with Autosetup instead of Autotools.

Buildroot commit [1] bumped sqlite to 3.49.0 without changing the
package infra. This introduced build issues.

The "autotools-package" and "host-autotools-package" lines are no longer
available, so those have to be replaced by the "generic-package" and
"host-generic-package" lines in the .mk file.

The Autosetup configuration script does not support the
"enable-dynamic-extensions" and "disable-static-shell" options,
so the relevant lines in the .mk file are removed.

The Autosetup configuration script can automatically detect whether
threads are supported and set the relevant SQLITE_THREADSAFE flag,
so the relevant lines in the .mk file are removed.

Fixes:
  https://autobuild.buildroot.org/?reason=sqlite-3.49.0

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/db85638cea3414ca0293cbbb2352e5b0b63a2579

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: add link to commit which introduced the build issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.mk | 82 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a23f6e1d66..5a8b033ce0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
-endif
-
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
@@ -50,30 +42,64 @@ else
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
-
-ifeq ($(BR2_STATIC_LIBS),y)
-SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
-else
-SQLITE_CONF_OPTS += --disable-static-shell
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-SQLITE_CONF_OPTS += --enable-threadsafe
-else
-SQLITE_CONF_OPTS += --disable-threadsafe
-SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
-endif
-
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPTS += --disable-editline --enable-readline
 else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --enable-editline --disable-readline
+SQLITE_CONF_OPTS += --disable-readline --editline
 else
-SQLITE_CONF_OPTS += --disable-editline --disable-readline
+SQLITE_CONF_OPTS += --disable-readline
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CONF_OPTS += --fts3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
+SQLITE_CONF_OPTS += --disable-json
+endif
+
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
+
+define SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+		--prefix=/usr \
+		--host="$(GNU_TARGET_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(STAGING_DIR)" \
+		$(SQLITE_CONF_OPTS) \
+	)
+endef
+
+define SQLITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SQLITE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define SQLITE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+define HOST_SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+		--prefix=/usr \
+		--host="$(GNU_HOST_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(HOST_DIR)" \
+		$(SQLITE_CONF_OPTS) \
+	)
+endef
+
+define HOST_SQLITE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_SQLITE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) DESTDIR="$(HOST_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
