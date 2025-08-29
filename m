Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17020CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E866164E;
	Fri, 29 Aug 2025 15:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWbn-9MQluHP; Fri, 29 Aug 2025 15:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE116164F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE116164F;
	Fri, 29 Aug 2025 15:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A5E69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3600B82366
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb75H7a4y2C9 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBC7882342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC7882342
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBC7882342
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:25:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2F6B6C8F467
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:24:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0502605F1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFE901C228022; 
 Fri, 29 Aug 2025 17:24:49 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:24:39 +0200
Message-ID: <20250829152440.2183374-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756481098; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=5dSlc3cxUTQ2NjjuqCdRv3oyAWzU0hhFBDVyG6wexq0=;
 b=JD7lL4WLZl2PoZBYgeBAl6P96GtkY+z+cthC7goE+gZVpJpeKy+7khmEQ3oeckyITSuk4+
 lG5u9yfc4IfGy4eGc/Ke1Aezi5kMJJFoFJcoweiI1ANlLR6jnGnUUMieixRWgm5DB9byVv
 zI/RKa5HhvTVPv0XXqCwU1xnHkUJvYxNoESRlRmAkiodVsiELa66MzIJtZygR6BaKc3Bvr
 qQxikTf9A/wg3AKw5a5MOgdR2BmUTK6ny3WAOf3o+LBYwJ7aw0ExiAfndabDro2ojc7SXv
 66f4RG9tNp4aMpoQBPI4VnMc+bKC6YjvCnjTlxWLDL9s/3U9Nn36d2KIsYKEpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JD7lL4WL
Subject: [Buildroot] [PATCH v2] package/gdb: really fix build with GCC 15.x
 by using external readline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2: select ncurses for GDB TUI
---
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 package/gdb/Config.in                         |  3 +-
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 package/gdb/gdb.mk                            |  8 ++-
 6 files changed, 8 insertions(+), 211 deletions(-)
 delete mode 100644 package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
 delete mode 100644 package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
 delete mode 100644 package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
 delete mode 100644 package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch

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
index b1678e0d63..ff7afb8f13 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -60,7 +60,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_MPFR
-	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
 
 comment "full gdb on target needs a toolchain w/ wchar"
@@ -71,6 +71,7 @@ if BR2_PACKAGE_GDB_DEBUGGER
 
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
index ca9c6d74d5..c3c5573973 100644
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
@@ -187,6 +188,7 @@ GDB_CONF_OPTS += --disable-inprocess-agent
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
+GDB_DEPENDENCIES += ncurses
 GDB_CONF_OPTS += --enable-tui
 else
 GDB_CONF_OPTS += --disable-tui
@@ -262,10 +264,12 @@ HOST_GDB_CONF_OPTS = \
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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
