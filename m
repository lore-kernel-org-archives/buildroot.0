Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB1C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD8480DD2;
	Sun,  6 Sep 2026 10:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6BaSBbYpavO; Sun,  6 Sep 2026 10:33:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ACC6780D73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690837;
	b=E2CxTCEAD9O4Tv8E0xaR609zzfbIRwhzaz8f8yQO5C6MEI0pzOKIq6Y1Ij+qe+1tLAx2
	 DJZ8Kigm2+BTh1FwUuXuATDVsnwrv4Bh+ziyJPIWUt/lt1IBSYz4nzEOjw9OPqktauNZE
	 lNQB4GNi0tHVjn6YRL1MfS357AQIuIar/9kszE9VxY/sBtmWRJLHiSe3cIcNYyu7wkudw
	 gDrp6bpTWl/h+g6FGXd+5EIyb5V3U1jdhnS5BzIFmI6juyjUKsarKhPCuO2xcfG2rpZnS
	 MSn0xcL3huDIaWi0niFAKZYn45pmcnqXIQLkGV4x061klBMXx4vEs5ivi6C2D263u3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1bqBsJ6HxU85DLKQNu/iFRKlBL/W22iyAf+lQbhWux0=;
	b=gJxp+5jzFF1oF+JNt2mtgCZFsI67Fv/hBNrAFxUZeE0Y+oJjFEBuxtwrMCilnscNyWt7
	 LheZz7Zjccj8k6qlY9YSjGHFQLzvAxtXDBjcwK/E5y9GALiSGe07qt1zwpn53JW7cprSx
	 eMXdxlK/5iPrTSl38J0u5N+k/BR7BHYYNBS8XxySv9ZIgNYx8Mzu6bbLZ4iPr5PXM4kU+
	 seUE5lL72v7Z0qVRB6n72bKeFAFyPo8/nnIAaDW+MAlNXlSJHlVklfxYeoHssM2ACWZ/c
	 YabtYTHEGak56GENWdwUCPKrGgEZU6mQfS0k2gjwiMlPX1kbyFe5veK5UpcX13Bfb5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690837;
	bh=1bqBsJ6HxU85DLKQNu/iFRKlBL/W22iyAf+lQbhWux0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gp6B6TfZfEcNQi4+mqTGPhSLiuy1swS/j9MeRleGH3/vdCHgeao+cgS8fLGQZIAlg
	 ik4PMlGpjcYeu3LL6RklJPbO78lxQrcmY3Nj+sE6HwBcLjBqzzyeKUJDliEHXn4uBl
	 SiWy0j+hpV/aq/VZWsmu8jm6n71IlKrfNbehKs0mOn9jeOQpFWsDZ2aBq+USRHXcak
	 70cZmm5R1ILFaBioF5JrAkZo9gc0ALZb+Q/nzSVGy41U55ybAd09Ya1zbvHrcynmZR
	 +laaHrJSAaTFPDP9llSGQ6cLeabe5ziLbdpMJF3PdQOwtJeCgl+WF6Wa0m4B3e9kIm
	 DVjLgD8qJg7WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC6780D73;
	Sun,  6 Sep 2026 10:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 959A93AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86CE4605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBx-c2_4cV3I for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C72AB605E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690834;
 b=pfbKgbgqEqrus+2R5lsgJKbhF7zBABR3ap7YfxHQ1hQ85wpOVlmEql54xz/uq9F7sxgt
 Fz/9X73G7Agcp4bQa9jP0564HsmaMrvryENQ43A6Pxzs7Puk+or9D8x1aS0ZUlL68uJAf
 9lMNHu496e0C1P3r6kK/REY0+l6ZKbVxeFHUkgoJrBRclvmTLD67c2R4A8aSQVLd62BA7
 /7btp1lJKz3NMhc+D2UxEcgv5Kt65xMVXIjZLkc9FTXgXCvU1mHXfs6ch05mHsM00Bwdj
 AWzEYnXChpjD4MozSMA6PvNrpCuvFO2QGXoHlKGQmgqMSyYay2fHnUyYSTmB+nZ4sQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690834;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6b8LoPtxPGPbNHzu245fGxO1iTLAxjN3YR+p4FZxTik=;
 b=SgGZU1tsSGiQi9gbPUFRXk8JDN6qwX8hOxMoGDFwv9yhqWoVU+7pWvNQtn66579I36fy
 deCoRXWN8lDg+pROa45zj5l4Y36WKjBIy7GQlmunQ29ced0wi/d6D6/TDL8k3/VrnMrtj
 8jQ8Y4HNY21tQw+fVnlPIAHvrbrqTYblu3cZlsjLaFoPQ1/F7GHJfHODSQ4PAUJ8VXBtf
 eyTGcL8tBwYCxAZJ6lNTdQjbUGr28v8itt4/WZWqe8HUrgoPh7+Sqqf/0vFs/Ft/fsoe7
 vwk7NhMjOEvHvbBY6ORR5jBY+41swI/rR+djsDtSumhvT54zwCmcHwc8CgfUNNKa/6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aUsgfFZG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aUsgfFZG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C72AB605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690781;
 bh=6b8LoPtxPGPbNHzu245fGxO1iTLAxjN3YR+p4FZxTik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aUsgfFZG2idB0JJ/SRnBP1Gt4Tz0Cj7JRJET4Bw1SRXbQYzamDorafme7seEU+cK2
 36322Rhy0JKwIu0D0kVOqu2xI2FgXkzit8crqeFGpFunIvR87x8xPOGAPPKrIw6Tsz
 SlM6DU7OBTYF4/C1eHFDIU3ZwFfyuWoC4xdhk7qRZ8axrchnJTXGsEYbHJ+tonUpuH
 qFBc9xG5VHLdRLfuKTil7yYdQyByqIzE4rQj2Ll5uBX1JaZvHwPGVPVAy3iKEoYS53
 1cADQKgHYtpfkjEyXArJZPyX+58yP/YDtowxE+10cWWa1kiS2vM7zTb1d7h3Cw837t
 fohnpmNeHfgwQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95C84A4C38EB;
 Sun,  6 Sep 2026 12:33:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABG-0000000048S-0yiL;
 Sun, 06 Sep 2026 10:32:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:55 +0200
Message-ID: <20260906103257.3688362-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 5/7] package/binutils: add support for binutils
 2.47
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceware.org/pipermail/binutils/2026-July/150449.html

We bring and rebased patches 0001 and 0002 that we carry for binutils
2.46.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/2.47/0001-sh-conf.patch      |  52 +++
 .../2.47/0002-poison-system-directories.patch | 312 ++++++++++++++++++
 package/binutils/Config.in.host               |   4 +
 package/binutils/binutils.hash                |   1 +
 4 files changed, 369 insertions(+)
 create mode 100644 package/binutils/2.47/0001-sh-conf.patch
 create mode 100644 package/binutils/2.47/0002-poison-system-directories.patch

diff --git a/package/binutils/2.47/0001-sh-conf.patch b/package/binutils/2.47/0001-sh-conf.patch
new file mode 100644
index 0000000000..8d9f8497c1
--- /dev/null
+++ b/package/binutils/2.47/0001-sh-conf.patch
@@ -0,0 +1,52 @@
+From 0bf75276c392cac7794e78e1572abcd793d99e4e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for version 2.47]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bbfb5979546..bcd95684ae1 100755
+--- a/configure
++++ b/configure
+@@ -4197,7 +4197,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index f9694cdf901..d6a3623ba50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1366,7 +1366,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.51.1
+
diff --git a/package/binutils/2.47/0002-poison-system-directories.patch b/package/binutils/2.47/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..933d15106e
--- /dev/null
+++ b/package/binutils/2.47/0002-poison-system-directories.patch
@@ -0,0 +1,312 @@
+From 92f4bd0e1713577e30491e99a0226088eaeae740 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 2.47]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 88 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 790efd336be..2b237bcda5e 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -86,6 +86,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index cd410bd64d1..7e9913949d4 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -843,6 +843,7 @@ enable_checking
+ with_lib_path
+ enable_targets
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1537,6 +1538,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15768,7 +15771,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index f528ae42ef7..dcf1e17fae6 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index c8688153bd4..0b16caf347a 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texi b/ld/ld.texi
+index cf750d15259..1acaa26f107 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3427,6 +3427,18 @@ bit string identifying the original linked file does not change.
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 75fd360d5e3..3526ea8146c 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -326,6 +326,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
+ }
+ 
+ static void
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index c8d61478c60..4b175dca108 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -174,6 +174,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 67c60c3f80d..c2365e4006c 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -760,6 +760,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index bde20465835..422866f4ea9 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -653,6 +653,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -665,6 +673,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1849,6 +1858,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1999,6 +2016,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.51.1
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 251dbf96f5..fc8733bfec 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,6 +20,9 @@ config BR2_BINUTILS_VERSION_2_45_X
 config BR2_BINUTILS_VERSION_2_46_X
 	bool "binutils 2.46.1"
 
+config BR2_BINUTILS_VERSION_2_47_X
+	bool "binutils 2.47"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -27,6 +30,7 @@ config BR2_BINUTILS_VERSION
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
 	default "2.46.1"	if BR2_BINUTILS_VERSION_2_46_X
+	default "2.47"		if BR2_BINUTILS_VERSION_2_47_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 37d14af006..214a0db791 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263b19d25302c37759784e14fcb4b9421b29e0e2c7f450bd99f6bb4595c  binutils-2.46.1.tar.xz
+sha512  3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98  binutils-2.47.tar.xz
 
 # locally computed
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
