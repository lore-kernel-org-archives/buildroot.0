Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98131CA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 21:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459B082ED2;
	Sat,  6 Sep 2025 21:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeEQ5a_9LUqR; Sat,  6 Sep 2025 21:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C693B82F4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C693B82F4F;
	Sat,  6 Sep 2025 21:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C21D4DCA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A83D14183E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeChXD8bU_ZW for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 21:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A734183B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A734183B
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:19:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C8BE8360A; Sat,  6 Sep 2025 21:19:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Sep 2025 22:37:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f255b90afcc0e9c163a711bfe483cdf39e45e672
X-Git-Newrev: d98e15a3639d9758ab3223f0a6de3a94d506e6fa
X-Patchwork-Hint: ignore
Message-Id: <20250906211959.3C8BE8360A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: really fix build with GCC
 15.x by using external readline
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d98e15a3639d9758ab3223f0a6de3a94d506e6fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy of readline bundled with gdb versions earlier than 16.x does
not build with GCC 15.x, despite our
0010-readline-tcap.h-Update-definitions-for-C23.patch. In GDB 16.x,
readline has been updated to 8.2, which fixes the issue, but
backporting this to older GDB versions results in a ~450 KB.

So let's take the approach we should have probably taken from the
ground up: use an external readline, instead of the bundled one. This
is exactly what this patch does. Instead of having gdb depend on
ncurses and host-gdb depend on host-ncurses, we make it depend on
readline/host-readline (which in turn already has a dependency on
ncurses). In fact, gdb does not need ncurses itself, it really needs
only readline.

Since the GDB TUI itself needs ncurses, we move the ncurses
select/dependency down to the GDB TUI option. This was pointed out by
Romain Naour.

Fixes:

  https://autobuild.buildroot.net/results/3b0ce5cfac81e150816027fc1259600ee02f0f1f/ (host gdb 14.x)
  https://autobuild.buildroot.net/results/e64e3cd7aa5e7315464e380982f7febaff5df908/ (host gdb 15.x)
  https://autobuild.buildroot.net/results/2f2616a4ac7d9cbc06ba7775eb57bdd2a0419cb5/ (host arc gdb)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774348 (TestGdbArc)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774349 (TestGdbFullTarget)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774355 (TestGdbserverOnly)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: as pointed out by Romain Naour:
 - also select and add readline dependency when
   BR2_PACKAGE_GDB_SERVER=y
 - add links to gitlab CI failures in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ----------------------
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ----------------------
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ----------------------
 package/gdb/Config.in                              |  4 +-
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ----------------------
 package/gdb/gdb.mk                                 | 16 +++++--
 6 files changed, 15 insertions(+), 213 deletions(-)

diff --git a/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
deleted file mode 100644
index 50100d8bfc..0000000000
--- a/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0f81e47dff4bddc6ba9c45402821f857251f2b0f Mon Sep 17 00:00:00 2001
-From: Chris Packham <judge.packham@gmail.com>
-Date: Wed, 30 Apr 2025 16:49:44 +1200
-Subject: [PATCH] readline/tcap.h: Update definitions for C23
-
-C23 changes how function definitions like int `int tputs ()` are
-interpreted. In older standards this meant that the function arguments
-are unknown. In C23 this is interpreted as `int tputs (void)` so now
-when we compile with GCC15 (which defaults to -std=gnu23) we get an
-error such as
-
-  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
-
-Add the function arguments for tgetent(), tgetflag(), tgetnum(),
-tgetstr(), tputs() and tgoto().
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
-Approved-By: Tom Tromey <tom@tromey.com>
-Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- readline/readline/tcap.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..9e2ed124e49 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *bp, const char *name);
-+extern int tgetflag (char *id);
-+extern int tgetnum (char *id);
-+extern char *tgetstr (char *id, char **area);
- 
--extern int tputs ();
-+extern int tputs (const char *str, int affcnt, int (*putc)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *cap, int col, int row);
- 
- #endif /* HAVE_TERMCAP_H */
- 
--- 
-2.49.0
-
diff --git a/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
deleted file mode 100644
index 64f741fe75..0000000000
--- a/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
-From: Chris Packham <judge.packham@gmail.com>
-Date: Wed, 30 Apr 2025 16:49:44 +1200
-Subject: [PATCH] readline/tcap.h: Update definitions for C23
-
-C23 changes how function definitions like int `int tputs ()` are
-interpreted. In older standards this meant that the function arguments
-are unknown. In C23 this is interpreted as `int tputs (void)` so now
-when we compile with GCC15 (which defaults to -std=gnu23) we get an
-error such as
-
-  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
-
-Add the function arguments for tgetent(), tgetflag(), tgetnum(),
-tgetstr(), tputs() and tgoto().
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
-Approved-By: Tom Tromey <tom@tromey.com>
-Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- readline/readline/tcap.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..9e2ed124e49 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *bp, const char *name);
-+extern int tgetflag (char *id);
-+extern int tgetnum (char *id);
-+extern char *tgetstr (char *id, char **area);
- 
--extern int tputs ();
-+extern int tputs (const char *str, int affcnt, int (*putc)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *cap, int col, int row);
- 
- #endif /* HAVE_TERMCAP_H */
- 
--- 
-2.49.0
-
diff --git a/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
deleted file mode 100644
index c9a34e9a89..0000000000
--- a/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f37d1bbe334c751b9bd77fa3a9d9accd93614677 Mon Sep 17 00:00:00 2001
-From: Chris Packham <judge.packham@gmail.com>
-Date: Wed, 30 Apr 2025 16:49:44 +1200
-Subject: [PATCH] readline/tcap.h: Update definitions for C23
-
-C23 changes how function definitions like int `int tputs ()` are
-interpreted. In older standards this meant that the function arguments
-are unknown. In C23 this is interpreted as `int tputs (void)` so now
-when we compile with GCC15 (which defaults to -std=gnu23) we get an
-error such as
-
-  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
-
-Add the function arguments for tgetent(), tgetflag(), tgetnum(),
-tgetstr(), tputs() and tgoto().
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
-Approved-By: Tom Tromey <tom@tromey.com>
-Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- readline/readline/tcap.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..9e2ed124e49 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *bp, const char *name);
-+extern int tgetflag (char *id);
-+extern int tgetnum (char *id);
-+extern char *tgetstr (char *id, char **area);
- 
--extern int tputs ();
-+extern int tputs (const char *str, int affcnt, int (*putc)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *cap, int col, int row);
- 
- #endif /* HAVE_TERMCAP_H */
- 
--- 
-2.49.0
-
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index b1678e0d63..0f4c6a6c3c 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -50,6 +50,7 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	select BR2_PACKAGE_READLINE
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the program.
@@ -60,7 +61,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_MPFR
-	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
 
 comment "full gdb on target needs a toolchain w/ wchar"
@@ -71,6 +72,7 @@ if BR2_PACKAGE_GDB_DEBUGGER
 
 config BR2_PACKAGE_GDB_TUI
 	bool "TUI support"
+	select BR2_PACKAGE_NCURSES
 	help
 	  This option enables terminal user interface (TUI) for gdb
 
diff --git a/package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch
deleted file mode 100644
index 64f741fe75..0000000000
--- a/package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
-From: Chris Packham <judge.packham@gmail.com>
-Date: Wed, 30 Apr 2025 16:49:44 +1200
-Subject: [PATCH] readline/tcap.h: Update definitions for C23
-
-C23 changes how function definitions like int `int tputs ()` are
-interpreted. In older standards this meant that the function arguments
-are unknown. In C23 this is interpreted as `int tputs (void)` so now
-when we compile with GCC15 (which defaults to -std=gnu23) we get an
-error such as
-
-  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
-
-Add the function arguments for tgetent(), tgetflag(), tgetnum(),
-tgetstr(), tputs() and tgoto().
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
-Approved-By: Tom Tromey <tom@tromey.com>
-Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- readline/readline/tcap.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..9e2ed124e49 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *bp, const char *name);
-+extern int tgetflag (char *id);
-+extern int tgetnum (char *id);
-+extern char *tgetstr (char *id, char **area);
- 
--extern int tputs ();
-+extern int tputs (const char *str, int affcnt, int (*putc)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *cap, int col, int row);
- 
- #endif /* HAVE_TERMCAP_H */
- 
--- 
-2.49.0
-
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ca9c6d74d5..1841002dc1 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -30,7 +30,7 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-zlib
+HOST_GDB_DEPENDENCIES = host-expat host-readline host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
@@ -136,9 +136,10 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
 GDB_DEPENDENCIES += zlib
 GDB_CONF_OPTS += \
 	--enable-gdb \
+	--with-system-readline \
 	--with-curses \
 	--with-system-zlib
-GDB_DEPENDENCIES += ncurses \
+GDB_DEPENDENCIES += readline \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
 # When only building gdbserver, we don't need zlib. But we have no way to
@@ -169,8 +170,12 @@ GDB_CONF_OPTS += --without-mpfr
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-GDB_CONF_OPTS += --enable-gdbserver
-GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+GDB_CONF_OPTS += \
+	--enable-gdbserver \
+	--with-system-readline
+GDB_DEPENDENCIES += \
+	$(TARGET_NLS_DEPENDENCIES) \
+	readline
 else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
@@ -187,6 +192,7 @@ GDB_CONF_OPTS += --disable-inprocess-agent
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
+GDB_DEPENDENCIES += ncurses
 GDB_CONF_OPTS += --enable-tui
 else
 GDB_CONF_OPTS += --disable-tui
@@ -262,10 +268,12 @@ HOST_GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--with-curses \
 	--disable-source-highlight \
+	--with-system-readline \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--with-mpfr=$(HOST_DIR)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
+HOST_GDB_DEPENDENCIES += host-ncurses
 HOST_GDB_CONF_OPTS += --enable-tui
 else
 HOST_GDB_CONF_OPTS += --disable-tui
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
