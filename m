Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1E2CF648B
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 23:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06FB941210;
	Fri, 27 Sep 2024 23:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Soexg0n5z91P; Fri, 27 Sep 2024 23:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9445E411CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9445E411CC;
	Fri, 27 Sep 2024 23:53:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDF91BF349
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A67411CC
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stqEtvnp7Cug for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 23:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC895411BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC895411BB
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC895411BB
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:53:06 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82aa6be8457so93933939f.0
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 16:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727481185; x=1728085985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xs6ni5NB7Eva1pPnTMMkA3xxP6rbUxw20AO6GT4P34E=;
 b=XK4qL6t6lmnCao9Qaya+ZJaDVEbjC+bJi02tuow+TFk9r3sMN4Ls5P/ApbNDKSXEmr
 TrkpXIPJ3JpX5joNmsIPuHXlAzRMG+e7sv9+xxTzY9AmcRy7Pxfr4EAXsbiNWVM491w8
 MhhJyUca9HvVsW+RZd19ficboMXC+rM9U7dDfwseZ4uktT3OQssOkdFRyGqvc/FrZQa0
 xe6J1gdNvz92lhTP2Ke4Vx8F9h+twT8qCkI1f8PmQX1VB03k5ET2Kz9WPoZconm3zLC7
 u+t3mi+uoYMOYAlHl3GyKIyLLXzLqYw07CBfQvM9gYpYQYUIPdqaf5WxVtOCTSZCSfan
 12sA==
X-Gm-Message-State: AOJu0YxB5ghayI2gUYK/WBcRjXB3KOuPfvHDU+kaUV7QIYQDnzcNm6nB
 P9zG0oGnZmoQ+iWQoJvWkbREtvr30HGnlVqLJ2hNEAtpsy2sKrWfNzoCTq+m
X-Google-Smtp-Source: AGHT+IEtsyuiJER+qCovUCXN2wLmS1ELI7NDzOg7AIlNnjWJ6fBhUBn+fERH5a1K1xVXEuvRe0NAnQ==
X-Received: by 2002:a5d:8d0a:0:b0:81f:8665:da0a with SMTP id
 ca18e2360f4ac-83251c0e910mr619972639f.1.1727481185133; 
 Fri, 27 Sep 2024 16:53:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-834936c8597sm82174939f.16.2024.09.27.16.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 16:53:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 17:52:59 -0600
Message-Id: <20240927235259.2046297-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727481185; x=1728085985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xs6ni5NB7Eva1pPnTMMkA3xxP6rbUxw20AO6GT4P34E=;
 b=dPMU6cTl7RE8BQqyA05VJxphrTkml6lRah4cJ7la9DRZsnR5mAwqakGwpjRZdNMVaM
 qX8znkcbtdKhew0ht6tPrBrTioFaE1bMsHAQwwGsLFNUJjVfyh5qpyDwRxcvQw959jbk
 bzDCT2M16r038OYEp4S8dBcbqhcEcc3wEpE3GbhUnk1XY2XzjaWQ31PLovUrS7AKoxNj
 4R4fjY2Ql1SYOphepYlONRQV+v82jfbMFPohtt3WVSdyNJVQUfZ19W8JQxaEyJVCkcDM
 zcUd5FFZIIBPok6AUxM58tnlzLEvt+71UKwdw5f1N0+mfc+AR1eI8mx+8LgGkdA047QZ
 BNyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dPMU6cTl
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix build
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When setuptools was updated to version 75.1.0 in buildroot commit
f01897aa6ceca00831c9b2c14f3ae90faaefce68 it broke gobject
introspection builds which relied on a deprecated MSVCCompiler
distutils module.

Backport an upstream patch removing this module dependency.

Fixes:
 - http://autobuild.buildroot.net/results/8e0/8e020d65509181148c597997280f196c33b28574
 - http://autobuild.buildroot.net/results/2db/2db8ce60917b66030286da936c1f1f3aa657b6b7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-dependency-on-distutils.msvccompile.patch | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
