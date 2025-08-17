Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EB4CA0EDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3999843D3;
	Sun, 17 Aug 2025 21:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exuJNMYC5rd8; Sun, 17 Aug 2025 21:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D0D843D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D0D843D5;
	Sun, 17 Aug 2025 21:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8763E2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6CB418F6
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHGok87b_vHL for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 21:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2318B418F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2318B418F5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2318B418F5
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 21:22:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9E08D41C7C;
 Sun, 17 Aug 2025 21:22:50 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Aug 2025 23:22:48 +0200
Message-ID: <20250817212249.2653921-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedtjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeludeihedukeehffffudeltdejffekjeeiteejudeiueejledtfffgheelgeeftdenucffohhmrghinhepphgrthgthhdrihhnpdgsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755465770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WIjc4E3gBNmNnZq7cIFNQqg23NvSG8Wg2bJhqlYDaRA=;
 b=EPTSVr7BuW4bA/m2NBL+iTS/bhSs9n8zQlKhtqiBTKN6aEhP1RInjVcKpWQ9qO6tnfQPCB
 ysouF2jinsBW3u5zN8UtVRUtAmUVmzZ15i8w3YUdxK597QfNCAtOPwK4+aY9+moZ3xiDEL
 CXpXAXG2FR3TD6x1MDpRHVDKwe2+ZDh71lKn/W1GgkbDxy1aKVEkJ14iExJOwb1qn21MyR
 2IYDhllWE7whEVS8y4uf8c9ncdP+VGuiBl78nH3CUyTkVe+7zGYrX7QyVgfSpICbBMS501
 GTbPinNjZTbDDgSlVgk4NiL0nbkEzqFYxX2/k3VTScwZKh05DoXAQtM+dBHMkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPTSVr7B
Subject: [Buildroot] [PATCH] package/gdb: really fix build with GCC 15.x by
 using external readline
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

Fixes:

  https://autobuild.buildroot.net/results/3b0ce5cfac81e150816027fc1259600ee02f0f1f/ (host gdb 14.x)
  https://autobuild.buildroot.net/results/e64e3cd7aa5e7315464e380982f7febaff5df908/ (host gdb 15.x)
  https://autobuild.buildroot.net/results/2f2616a4ac7d9cbc06ba7775eb57bdd2a0419cb5/ (host arc gdb)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 package/gdb/Config.in                         |  2 +-
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 -------------------
 package/gdb/gdb.mk                            |  6 ++-
 6 files changed, 5 insertions(+), 211 deletions(-)
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
index b1678e0d63..03f5e2596b 100644
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
index ca9c6d74d5..c835b0646b 100644
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
@@ -262,6 +263,7 @@ HOST_GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--with-curses \
 	--disable-source-highlight \
+	--with-system-readline \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--with-mpfr=$(HOST_DIR)
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
