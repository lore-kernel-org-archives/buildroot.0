Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A7AC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 16:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A1C607C9;
	Tue,  7 Jul 2026 16:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxFMegM-w4-T; Tue,  7 Jul 2026 16:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 673A0607D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783440635;
	bh=jMskPqHLrKRIpmJBy/wmt657L6bLwbMjV5ydF3KirzA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JeVuY1WjQFKqzhuaRPBRas6CDoVOGOoz8JaRVJeghs7xSxZJSPlTG/M6phAruu8kT
	 CA3vRRHMRrLPC3haSBofKu0M5/SUk4huuSIO15Ifl0IkfLM2A0LD9QNf7DIRYxlibt
	 APHBUkyKf5e+DbFu1Ll7JJrEcuG37o3m2oZ7POYfsnmCCujNcb4wQVZmJVNgZ70ArJ
	 VQMKNIZaFoJWtlT/8N2RWtxbkI+nABeltQF+lo6wSkfYockliFXKPJhgrGMjVCK3x3
	 RTSRTITrqyfhxLxnZAX1eH9PXZ72AOSNxIQdx0dQFmZWgixwwyGkAlp8Dei+I/7gY3
	 PSoDTvcYxxJcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 673A0607D6;
	Tue,  7 Jul 2026 16:10:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BDCF315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DBBE607B2
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2rhZPznxE3S for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 16:10:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6777605CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6777605CF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6777605CF
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:32 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B753213F89C;
 Tue,  7 Jul 2026 18:10:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>, Vincent Jardin <vjardin@free.fr>
Date: Tue,  7 Jul 2026 18:09:58 +0200
Message-ID: <20260707161000.629475-2-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707161000.629475-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260707161000.629475-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783440630;
 bh=IO/X4ES2UtU6XFaWF0vh7WlIY8tIHfEyotE80YhZ6hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Me6njREspZnrlWp9aierhSdkBFeaZrI3eJ0XTN3TE3hChzMxi1cSk9UoClT9fBzzI
 A1QnPlXT/Kw0OTTw9Goajwm5c3kNu+ZG9hnfuiVcdIFNsp1MSgJ4MdMrxjoYt6NxDw
 PlptAETvMr9HFgrOhP5THgLM7Y5yyzUgVxgoTBWYchJi5XP92N08MioJ9/yB4WFjvl
 AZlW+qCYCC77KEjib6baPrlxhgMn9xDM+LKsfwAXk8dnO2pjeXss2sgN/y2iJLfqh4
 eMkl3uOIn0yWRmhhz3RP7mCKof3LhzwI0lpX1k0iPPOM46cuoOO33/K3sEs5xq9gzx
 N9p0RwCIZ8oVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Me6njREs
Subject: [Buildroot] [PATCH v2 1/3] package/mcpp: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mcpp (Matsui CPP) is a portable C/C++ preprocessor. Builds both
host and target with --enable-mcpplib, so libmcpp.{a,so} and
mcpp_lib.h are available to other packages in addition to the
standalone mcpp(1) CLI.

Upstream: https://mcpp.sourceforge.net/

Suggested-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...ined-assignment-between-differently-.patch | 36 +++++++++++
 ...POSIX.1-2008-so-readlink-is-declared.patch | 36 +++++++++++
 ...ue-false-labels-they-are-reserved-in.patch | 63 +++++++++++++++++++
 package/mcpp/Config.in                        |  7 +++
 package/mcpp/Config.in.host                   |  7 +++
 package/mcpp/mcpp.hash                        |  4 ++
 package/mcpp/mcpp.mk                          | 19 ++++++
 10 files changed, 177 insertions(+)
 create mode 100644 package/mcpp/0001-expand-split-chained-assignment-between-differently-.patch
 create mode 100644 package/mcpp/0002-system-request-POSIX.1-2008-so-readlink-is-declared.patch
 create mode 100644 package/mcpp/0003-system-rename-true-false-labels-they-are-reserved-in.patch
 create mode 100644 package/mcpp/Config.in
 create mode 100644 package/mcpp/Config.in.host
 create mode 100644 package/mcpp/mcpp.hash
 create mode 100644 package/mcpp/mcpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a09be9bff..03fe739986 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,9 @@ F:	package/adsp-ldr/
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
+N:	Philippe Nunes <nunes.philippe@free.fr>
+F:	package/mcpp/
+
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/babeltrace2/
 F:	package/lttng-babeltrace/
diff --git a/package/Config.in b/package/Config.in
index 27f61ca7bc..944f971db7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2328,6 +2328,7 @@ menu "Text and terminal handling"
 	source "package/libunibreak/Config.in"
 	source "package/libunistring/Config.in"
 	source "package/linenoise/Config.in"
+	source "package/mcpp/Config.in"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
 	source "package/oniguruma/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c17..50798d142b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -65,6 +65,7 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
+	source "package/mcpp/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
diff --git a/package/mcpp/0001-expand-split-chained-assignment-between-differently-.patch b/package/mcpp/0001-expand-split-chained-assignment-between-differently-.patch
new file mode 100644
index 0000000000..ee9657ea7c
--- /dev/null
+++ b/package/mcpp/0001-expand-split-chained-assignment-between-differently-.patch
@@ -0,0 +1,36 @@
+From: Philippe Nunes <nunes.philippe@free.fr>
+Date: Mon, 7 Jul 2026 12:00:00 +0200
+Subject: [PATCH] expand: split chained assignment between differently-typed
+ pointers
+
+GCC 14 promotes -Wincompatible-pointer-types from warning to error by
+default. The chained assignment `m_inf->args = m_inf->loc_args = NULL`
+in src/expand.c has different pointer types on each side
+(char * vs LOCATION *) so the assignment fails to build on GCC 14+
+toolchains.
+
+Split the chain into two independent assignments to avoid the
+implicit cross-type conversion.
+
+Upstream: N/A, mcpp is abandoned upstream (last release 2008).
+
+Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
+---
+ src/expand.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/expand.c b/src/expand.c
+--- a/src/expand.c
++++ b/src/expand.c
+@@ -710,7 +710,8 @@ expand_macro(
+         } else {
+             m_inf->locs.start_col = m_inf->locs.start_line = 0L;
+         }
+-        m_inf->args = m_inf->loc_args = NULL;       /* Default args */
++        m_inf->args = NULL;                         /* Default args */
++        m_inf->loc_args = NULL;
+         for (num = 1, recurs = 0; num < m_num; num++)
+             if (mac_inf[ num].defp == defp)
+                 recurs++;           /* Recursively nested macro     */
+--
+2.39.0
diff --git a/package/mcpp/0002-system-request-POSIX.1-2008-so-readlink-is-declared.patch b/package/mcpp/0002-system-request-POSIX.1-2008-so-readlink-is-declared.patch
new file mode 100644
index 0000000000..10089f0dc8
--- /dev/null
+++ b/package/mcpp/0002-system-request-POSIX.1-2008-so-readlink-is-declared.patch
@@ -0,0 +1,36 @@
+From: Philippe Nunes <nunes.philippe@free.fr>
+Date: Mon, 7 Jul 2026 12:00:00 +0200
+Subject: [PATCH] system: request POSIX.1-2008 so readlink() is declared
+
+configed.H defines _POSIX_C_SOURCE=1 (POSIX.1-1990), which pre-dates
+readlink(2) (added in POSIX.1-2001). Modern glibc treats readlink()
+as guarded by _POSIX_C_SOURCE >= 200112L; with only 1 requested, the
+declaration is invisible, and GCC 15+ turns the resulting
+implicit-declaration into a hard error.
+
+Bump the requested POSIX level to 200809L (POSIX.1-2008) at the top
+of system.c, before any header inclusion. Doing it in this one
+translation unit keeps the change tightly scoped to the file that
+needs readlink(); other .c files continue to see mcpp's default.
+
+Upstream: N/A, mcpp is abandoned upstream (last release 2008).
+
+Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
+---
+ src/system.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/system.c b/src/system.c
+--- a/src/system.c
++++ b/src/system.c
+@@ -37,6 +37,8 @@
+  *      1. specify the constants in "configed.H" or "noconfig.H",
+  *      2. append the system-dependent routines in this file.
+  */
++#undef  _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE 200809L
+ #if PREPROCESSED
+ #include    "mcpp.H"
+ #else
+--
+2.39.0
diff --git a/package/mcpp/0003-system-rename-true-false-labels-they-are-reserved-in.patch b/package/mcpp/0003-system-rename-true-false-labels-they-are-reserved-in.patch
new file mode 100644
index 0000000000..267431a1cd
--- /dev/null
+++ b/package/mcpp/0003-system-rename-true-false-labels-they-are-reserved-in.patch
@@ -0,0 +1,63 @@
+From: Philippe Nunes <nunes.philippe@free.fr>
+Date: Mon, 7 Jul 2026 12:00:00 +0200
+Subject: [PATCH] system: rename true/false labels (reserved in modern C)
+
+open_file() uses `true:` and `false:` as C label names for goto
+targets. Since C99, <stdbool.h> defines `true` and `false` as macros
+expanding to 1 and 0; in C23 they are outright keywords. Either way,
+using them as identifiers (labels here) is a syntax error on modern
+GCC (>= 14 / 15).
+
+Rename the two labels to `open_success:` and `open_failure:` (with
+the matching goto sites) so the code parses under both classic and
+C23-oriented compilers.
+
+Upstream: N/A, mcpp is abandoned upstream (last release 2008).
+
+Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
+---
+ src/system.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/system.c b/src/system.c
+--- a/src/system.c
++++ b/src/system.c
+@@ -3431,7 +3431,7 @@ search:
+     if (! fullname)                 /* Non-existent or directory    */
+         return  FALSE;
+     if (standard && included( fullname))        /* Once included    */
+-        goto  true;
++        goto  open_success;
+         
+     if ((max_open != 0 && max_open <= include_nest)
+                             /* Exceed the known limit of open files */
+@@ -3458,12 +3458,12 @@ search:
+         if ((fp = fopen( fullname, "r")) == NULL) {
+             file->fp = fopen( cur_fullname, "r");
+             fseek( file->fp, file->pos, SEEK_SET);
+-            goto  false;
++            goto  open_failure;
+         }
+         if (max_open == 0)      /* Remember the limit of the system */
+             max_open = include_nest;
+     } else if (fp == NULL)                  /* No read permission   */ 
+-        goto  false;
++        goto  open_failure;
+     /* Truncate buffer of the includer to save memory   */
+     len = (int) (file->bptr - file->buffer);
+     if (len) {
+@@ -3510,9 +3510,9 @@ search:
+     if (mkdep && ((mkdep & MD_SYSHEADER) || ! infile->sys_header))
+         put_depend( fullname);          /* Output dependency line   */
+ 
+-true:
++open_success:
+     return  TRUE;
+-false:
++open_failure:
+     free( fullname);
+     return  FALSE;
+ }
+
+--
+2.39.0
diff --git a/package/mcpp/Config.in b/package/mcpp/Config.in
new file mode 100644
index 0000000000..7ebcd039a1
--- /dev/null
+++ b/package/mcpp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MCPP
+	bool "mcpp"
+	help
+	  A portable C/C++ preprocessor with a reusable library
+	  (libmcpp).
+
+	  http://mcpp.sourceforge.net/
diff --git a/package/mcpp/Config.in.host b/package/mcpp/Config.in.host
new file mode 100644
index 0000000000..1d03dc3b57
--- /dev/null
+++ b/package/mcpp/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_MCPP
+	bool "host mcpp"
+	help
+	  A portable C/C++ preprocessor with a reusable library
+	  (libmcpp).
+
+	  http://mcpp.sourceforge.net/
diff --git a/package/mcpp/mcpp.hash b/package/mcpp/mcpp.hash
new file mode 100644
index 0000000000..651fcf50b8
--- /dev/null
+++ b/package/mcpp/mcpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864  mcpp-2.7.2.tar.gz
+# Locally calculated
+sha256  adcd59c07ccdb072c8e1d40adb5cac670fcf3f51ba3a7fb41d46362bfd883b1b  LICENSE
diff --git a/package/mcpp/mcpp.mk b/package/mcpp/mcpp.mk
new file mode 100644
index 0000000000..04ca6e15df
--- /dev/null
+++ b/package/mcpp/mcpp.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mcpp
+#
+################################################################################
+
+MCPP_VERSION = 2.7.2
+MCPP_SITE = https://downloads.sourceforge.net/project/mcpp/mcpp/V.$(MCPP_VERSION)
+MCPP_LICENSE = BSD-2-Clause
+MCPP_LICENSE_FILES = LICENSE
+
+MCPP_INSTALL_STAGING = YES
+
+# builds libmcpp.{a,so} alongside the mcpp CLI
+MCPP_CONF_OPTS = --enable-mcpplib
+HOST_MCPP_CONF_OPTS = --enable-mcpplib
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
