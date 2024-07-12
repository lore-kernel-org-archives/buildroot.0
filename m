Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6619C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939ED4067C;
	Fri, 12 Jul 2024 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VuKRJYYmmN9; Fri, 12 Jul 2024 20:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D5D24062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D5D24062F;
	Fri, 12 Jul 2024 20:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9B021BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F554067C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkFWn7wNQwMP for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 372A44062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 372A44062F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:38:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D912861E8; Fri, 12 Jul 2024 20:38:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:38:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be5f14657a5540fdabb03ba8b5ff64c0da804e32
X-Git-Newrev: f6d9fa3692b0e5dd75bb1fee5d151fe58da7800d
X-Patchwork-Hint: ignore
Message-Id: <20240712203846.2D912861E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: fix build with host make >=
 4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6d9fa3692b0e5dd75bb1fee5d151fe58da7800d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When build host has a many CPUs (more that 20) and GNU Make 4.4
(included for example in Fedora 40), fwts can randomly fail to build.

This commit adds a package patch to fix the issue.

Fixes:

    mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
    mv: cannot stat 'prparser.tab.c': No such file or directory

See also:
https://github.com/fwts/fwts/issues/7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...iasl-fix-parallel-build-with-GNU-Make-4.4.patch | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch b/package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch
new file mode 100644
index 0000000000..a5568d1fd9
--- /dev/null
+++ b/package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch
@@ -0,0 +1,133 @@
+From 65a89b6253ef527ab4bc951eb8f9deba12f0121a Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 20 May 2024 11:14:02 +0200
+Subject: [PATCH] libfwtsiasl: fix parallel build with GNU Make >= 4.4
+
+When a build host has a large number of cores (like 20+) and GNU Make
+version is >= 4.4, fwts randomly fail to build in parallel, with a
+"make -j$(nproc)" command, with error:
+
+    mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
+    mv: cannot stat 'prparser.tab.c': No such file or directory
+
+This issue has been reported here:
+https://github.com/fwts/fwts/issues/7
+
+The Makefile.am of libfwtsiasl is using the GNU Make ".NOTPARALLEL"
+special target with prerequisites to handle commands generating
+multiple outputs (like lex/yacc invocations). See:
+https://github.com/fwts/fwts/blob/V24.03.00/src/libfwtsiasl/Makefile.am#L61
+
+First, the .NOTPARALLEL special target _with_ prerequisites is a
+feature added in GNU Make 4.4. See:
+https://git.savannah.gnu.org/cgit/make.git/commit/?id=f6ea899d83bf00fe9201fde0ca9cf7af8e443677
+https://lists.gnu.org/archive/html/help-make/2022-10/msg00020.html
+
+GNU Make version < 4.4 will interpret it as if it was written without
+prerequisite (as a standalone ".NOTPARALLEL:"). The effect is that the
+parallel compilation is disabled for the whole libfwtsiasl. The
+standalone .NOTPARALLEL special target was introduced in GNU Make 3.79
+in 2000. This is why parallel builds are working with Make older than
+version 4.4.
+
+Secondly, the reason why the build is failing on GNU Make >= 4.4 is
+because the usage of .NOTPARALLEL in incorrect.
+
+Quoting the Make manual:
+https://www.gnu.org/software/make/manual/html_node/Parallel-Disable.html
+"""
+If the .NOTPARALLEL special target has prerequisites, then each of those
+prerequisites will be considered a target and all prerequisites of these
+targets will be run serially.
+"""
+
+Note the serialization will happen on the prerequisites of the targets
+set as prerequisites of .NOTPARALLEL.
+
+The targets will not be correctly marked to disable parallel
+execution.
+
+Thirdly, the use of multiple targets in a rule is incorrect here. See
+Make manual:
+https://www.gnu.org/software/make/manual/html_node/Multiple-Targets.html
+The construct used in Makefile.am of libfwtsiasl for lex/yacc parsers
+assumes they are independant targets (so they can be executed in
+parallel). Finally, the "mv" command is failing, because there will be
+one parallel execution per target, the first mv will suceed and the
+other ones will fail. Multiple independant targets are often used in
+Makefiles for lex/yacc, they are working because they are not using
+"mv". Even in multiple execution, files are just overwritten.
+
+Fixing this .NOTPARALLEL usage with prerequisites would require Make
+version 4.4 or greater. This is a strong requirement, as there is
+still many Linux distros with older Make version (as an example Ubuntu
+22.04 LTS has Make 4.3).
+
+The .WAIT special target could be used, but was also introduced in
+Make version 4.4. See:
+https://git.savannah.gnu.org/cgit/make.git/commit/?id=f6ea899d83bf00fe9201fde0ca9cf7af8e443677
+
+GNU Make 4.3 also introduced "Grouped Targets" for that purpose. See:
+https://www.gnu.org/software/make/manual/html_node/Multiple-Targets.html
+But this would add a requirement on a recent Make version.
+
+This commit fixes the issue by declaring the first generated file as a
+dependency of the other extra generated files. This has the effect of
+completely solving the parallel build for all GNU Make versions. Also,
+this enables parallel build for libfwtsiasl (except for the parser
+generation) and makes the whole build faster.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: https://github.com/fwts/fwts/commit/c0962cd74c725418523c46ca44101e0e70201f81
+---
+ src/libfwtsiasl/Makefile.am | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/libfwtsiasl/Makefile.am b/src/libfwtsiasl/Makefile.am
+index cb10bc58..ac54f621 100644
+--- a/src/libfwtsiasl/Makefile.am
++++ b/src/libfwtsiasl/Makefile.am
+@@ -58,32 +58,32 @@ aslcompiler.y: $(ASL_PARSER)
+ aslcompilerlex.c: $(ASL_LEXER)
+ 	${LEX} ${AM_LFLAGS} -PAslCompiler -o$@ $(top_srcdir)/src/acpica/source/compiler/aslcompiler.l
+ 
+-.NOTPARALLEL: aslcompiler.c
+-aslcompiler.c aslcompiler.y.h: aslcompiler.y
++aslcompiler.c: aslcompiler.y
+ 	${YACC} ${AM_YFLAGS} -d -baslcompiler -pAslCompiler $^
+ 	mv aslcompiler.tab.c aslcompiler.c
+ 	cp aslcompiler.tab.h aslcompiler.y.h
++aslcompiler.y.h: aslcompiler.c
+ 
+-.NOTPARALLEL: dtcompilerparserlex.c
+-dtcompilerparserlex.c dtcompilerparser.c dtcompilerparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.l $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
++dtcompilerparserlex.c: $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.l $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
+ 	${LEX} ${AM_LFLAGS} -PDtCompilerParser -odtcompilerparserlex.c $<
+ 	${YACC} ${AM_YFLAGS} -bdtcompilerparser -pDtCompilerParser $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
+ 	mv dtcompilerparser.tab.c dtcompilerparser.c
+ 	cp dtcompilerparser.tab.h dtcompilerparser.y.h
++dtcompilerparser.c dtcompilerparser.y.h: dtcompilerparserlex.c
+ 
+-.NOTPARALLEL: dtparserlex.c
+-dtparserlex.c dtparser.c dtparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtparser.l $(top_srcdir)/src/acpica/source/compiler/dtparser.y
++dtparserlex.c: $(top_srcdir)/src/acpica/source/compiler/dtparser.l $(top_srcdir)/src/acpica/source/compiler/dtparser.y
+ 	${LEX} ${AM_LFLAGS} -PDtParser -odtparserlex.c $<
+ 	${YACC} ${AM_YFLAGS} -bdtparser -pDtParser $(top_srcdir)/src/acpica/source/compiler/dtparser.y
+ 	mv dtparser.tab.c dtparser.c
+ 	cp dtparser.tab.h dtparser.y.h
++dtparser.c dtparser.y.h: dtparserlex.c
+ 
+-.NOTPARALLEL: prparserlex.c
+-prparserlex.c prparser.c prparser.y.h: $(top_srcdir)/src/acpica/source/compiler/prparser.l $(top_srcdir)/src/acpica/source/compiler/prparser.y
++prparserlex.c: $(top_srcdir)/src/acpica/source/compiler/prparser.l $(top_srcdir)/src/acpica/source/compiler/prparser.y
+ 	${LEX} ${AM_LFLAGS} -PPrParser -oprparserlex.c $<
+ 	${YACC} ${AM_YFLAGS} -bprparser -pPrParser $(top_srcdir)/src/acpica/source/compiler/prparser.y
+ 	mv prparser.tab.c prparser.c
+ 	cp prparser.tab.h prparser.y.h
++prparser.c prparser.y.h: prparserlex.c
+ 
+ pkglib_LTLIBRARIES = libfwtsiasl.la
+ 
+-- 
+2.45.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
