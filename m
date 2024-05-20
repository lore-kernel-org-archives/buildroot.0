Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8642C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 09:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8EA44057B;
	Mon, 20 May 2024 09:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k741XdS8RwE; Mon, 20 May 2024 09:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B1440546
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B1440546;
	Mon, 20 May 2024 09:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1CC01C487E
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB68E81F41
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRARx77YR1Af for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 09:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BB4F81F38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB4F81F38
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BB4F81F38
 for <buildroot@buildroot.org>; Mon, 20 May 2024 09:52:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BEB4CB0059C;
 Mon, 20 May 2024 11:52:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 11:52:05 +0200
Message-ID: <20240520095205.81575-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716198740;
 bh=qXY2N/pxhlbkfUNgaUP/kP+LJw4M6+43skRPFZyPToQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cJdhedJtXiwD7wduun42hybw0wMy4pucQDLwT6sevA3kpfV9FK8zUPIJiLcPaMgFK
 daNJ9ByUXti6crMXsPm51LCGHM2E1FfYBLJj74SVSPq8mA7IRYgZyk0KB0PEzoKdtl
 ZCM118R2XWUTOUnrqVbJs5/n4A3KvsnuRzUaN3lx2OVucKe9fUGF+YLOt/n/qRNDCk
 kku6FnVXFpuw+y48xoSGpxuB+TQI64ouudewlEykhbIVDyx+VWkJ3RffBsgLHIkR2V
 5jJVeOUsabgj8rQg2WO65WEJzmWtgN2Ew6ANWna5UNIY+p14vyThFDsmUqjRepUkUx
 HLvXrJtOmEGMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cJdhedJt
Subject: [Buildroot] [PATCH 1/1] package/fwts: fix build with host make >=
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When build host has a many CPUs (more that 20) and GNU Make 4.4
(included for example in Fedora 40), fwts can randomly fail to build.

This commit adds a package patch to fix the issue.

Fixes:

    mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
    mv: cannot stat 'prparser.tab.c': No such file or directory

See also:
https://github.com/fwts/fwts/issues/7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: this patch is a follow up of:
https://patchwork.ozlabs.org/project/buildroot/patch/20240420132251.1349622-1-ju.o@free.fr/
This new patch allows to keep the parallel build and also fix the issue.
This is why it is not marked as v2. I marked the old proposal as "Rejected".
---
 ...fix-parallel-build-with-GNU-Make-4.4.patch | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch

diff --git a/package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch b/package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch
new file mode 100644
index 00000000000..2b09e6b378f
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
+Upstream: Proposed: https://lists.ubuntu.com/archives/fwts-devel/2024-May/013852.html
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
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
