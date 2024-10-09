Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3956CCEE348
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 20:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06548132C;
	Wed,  9 Oct 2024 20:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nk_D8USTtebN; Wed,  9 Oct 2024 20:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E1C81322
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E1C81322;
	Wed,  9 Oct 2024 20:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7F851BF3E1
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D71AC81322
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlxcX7WTTFN3 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 20:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB6381320
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB6381320
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 20:36:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C39E385C03; Wed,  9 Oct 2024 20:36:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Oct 2024 22:35:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 451470b7a5f2bf26954673a87e74b580735f2d6e
X-Git-Newrev: e0fb031d8cd1ee5ad5a1cfd8c868705503dbe114
X-Patchwork-Hint: ignore
Message-Id: <20241009203648.C39E385C03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix build
 with latest setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0fb031d8cd1ee5ad5a1cfd8c868705503dbe114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When setuptools was updated to version 75.1.0 in buildroot commit
f01897aa6ceca00831c9b2c14f3ae90faaefce68 it broke gobject
introspection builds which relied on a deprecated MSVCCompiler
distutils module.

Backport an upstream patch removing this module dependency.

Fixes:
 - http://autobuild.buildroot.net/results/8e0/8e020d65509181148c597997280f196c33b28574
 - http://autobuild.buildroot.net/results/2db/2db8ce60917b66030286da936c1f1f3aa657b6b7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...emove-dependency-on-distutils.msvccompile.patch | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
new file mode 100644
index 0000000000..a3231a5ad6
--- /dev/null
+++ b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
@@ -0,0 +1,104 @@
+From c8310afa42dfa598097eb0e003cef7965b5ed7be Mon Sep 17 00:00:00 2001
+From: Christoph Reiter <reiter.christoph@gmail.com>
+Date: Wed, 28 Aug 2024 21:26:02 +0200
+Subject: [PATCH] giscanner: remove dependency on distutils.msvccompiler
+
+It was removed with setuptools 74.0.0. Since we still depend on the
+MSVCCompiler class use new_compiler() to get it some other way.
+
+Remove any reference to MSVC9Compiler, which was for Visual Studio 2008
+which we no longer support anyway.
+
+Fixes #515
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a2139dba59eac283a7f543ed737f038deebddc19
+---
+ giscanner/ccompiler.py    |  7 +++----
+ giscanner/msvccompiler.py | 14 +++++++-------
+ 2 files changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
+index 2912fe0e..766c9a36 100644
+--- a/giscanner/ccompiler.py
++++ b/giscanner/ccompiler.py
+@@ -26,7 +26,6 @@ import tempfile
+ import sys
+ import distutils
+ 
+-from distutils.msvccompiler import MSVCCompiler
+ from distutils.unixccompiler import UnixCCompiler
+ from distutils.cygwinccompiler import Mingw32CCompiler
+ from distutils.sysconfig import get_config_vars
+@@ -167,7 +166,7 @@ class CCompiler(object):
+         # Now, create the distutils ccompiler instance based on the info we have.
+         if compiler_name == 'msvc':
+             # For MSVC, we need to create a instance of a subclass of distutil's
+-            # MSVC9Compiler class, as it does not provide a preprocess()
++            # MSVCCompiler class, as it does not provide a preprocess()
+             # implementation
+             from . import msvccompiler
+             self.compiler = msvccompiler.get_msvc_compiler()
+@@ -453,7 +452,7 @@ class CCompiler(object):
+             return self.compiler.linker_exe
+ 
+     def check_is_msvc(self):
+-        return isinstance(self.compiler, MSVCCompiler)
++        return self.compiler.compiler_type == "msvc"
+ 
+     # Private APIs
+     def _set_cpp_options(self, options):
+@@ -479,7 +478,7 @@ class CCompiler(object):
+                     # macros for compiling using distutils
+                     # get dropped for MSVC builds, so
+                     # escape the escape character.
+-                    if isinstance(self.compiler, MSVCCompiler):
++                    if self.check_is_msvc():
+                         macro_value = macro_value.replace('\"', '\\\"')
+                 macros.append((macro_name, macro_value))
+             elif option.startswith('-U'):
+diff --git a/giscanner/msvccompiler.py b/giscanner/msvccompiler.py
+index 0a543982..e333a80f 100644
+--- a/giscanner/msvccompiler.py
++++ b/giscanner/msvccompiler.py
+@@ -19,30 +19,30 @@
+ #
+ 
+ import os
+-import distutils
++from typing import Type
+ 
+ from distutils.errors import DistutilsExecError, CompileError
+-from distutils.ccompiler import CCompiler, gen_preprocess_options
++from distutils.ccompiler import CCompiler, gen_preprocess_options, new_compiler
+ from distutils.dep_util import newer
+ 
+ # Distutil's MSVCCompiler does not provide a preprocess()
+ # Implementation, so do our own here.
+ 
+ 
++DistutilsMSVCCompiler: Type = type(new_compiler(compiler="msvc"))
++
++
+ def get_msvc_compiler():
+     return MSVCCompiler()
+ 
+ 
+-class MSVCCompiler(distutils.msvccompiler.MSVCCompiler):
++class MSVCCompiler(DistutilsMSVCCompiler):
+ 
+     def __init__(self, verbose=0, dry_run=0, force=0):
+-        super(distutils.msvccompiler.MSVCCompiler, self).__init__()
++        super(DistutilsMSVCCompiler, self).__init__()
+         CCompiler.__init__(self, verbose, dry_run, force)
+         self.__paths = []
+         self.__arch = None  # deprecated name
+-        if os.name == 'nt':
+-            if isinstance(self, distutils.msvc9compiler.MSVCCompiler):
+-                self.__version = distutils.msvc9compiler.VERSION
+         self.initialized = False
+         self.preprocess_options = None
+         if self.check_is_clang_cl():
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
