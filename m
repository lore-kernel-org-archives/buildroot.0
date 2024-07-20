Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ADDC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08FE9404E2;
	Sat, 20 Jul 2024 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l77bC6h5_3fr; Sat, 20 Jul 2024 21:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E96040309
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E96040309;
	Sat, 20 Jul 2024 21:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37991BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF90380F51
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDeICCk7dFvE for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E756680F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E756680F10
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E00DB86E96; Sat, 20 Jul 2024 21:05:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:04:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16598146fbbbf492283f7b42d7c02e0d9fde2000
X-Git-Newrev: 910e91f3b0311bc9dc5ef00c43b6e3c930eac300
X-Patchwork-Hint: ignore
Message-Id: <20240720210557.E00DB86E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: fix build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=910e91f3b0311bc9dc5ef00c43b6e3c930eac300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 14:

termcap.c:45:14: error: conflicting types for 'boolcodes'; have 'char *[]'
   45 | static char *boolcodes[] = {
      |              ^~~~~~~~~
In file included from ../../Src/zshterm.h:1,
                 from ../../Src/zsh_system.h:932,
                 from ../../Src/zsh.mdh:17,
                 from termcap.mdh:17,
                 from termcap.c:38:
/home/autobuild/autobuild/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/term.h:764:56: note: previous declaration of 'boolcodes' with type 'const char * const[]'
  764 | extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];
      |                                                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fe2f7170465e96cc1de3dae139a25f615331f4b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pointer-types-in-terminfo-global-variable.patch | 51 ++++++++++++++++++++++
 package/zsh/zsh.mk                                 |  2 +
 2 files changed, 53 insertions(+)

diff --git a/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
new file mode 100644
index 0000000000..c67c374918
--- /dev/null
+++ b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
@@ -0,0 +1,51 @@
+From 4c89849c98172c951a9def3690e8647dae76308f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 8 Dec 2023 21:58:07 +0100
+Subject: [PATCH] 52383: Avoid incompatible pointer types in terminfo global
+ variable checks
+
+Upstream: https://sourceforge.net/p/zsh/code/ci/4c89849c98172c951a9def3690e8647dae76308f
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog    |  3 +++
+ configure.ac | 12 ++++++------
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2a8221e1f..2871dcb7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1768,27 +1768,27 @@ if test x$zsh_cv_path_term_header != xnone; then
+   fi
+ 
+   AC_MSG_CHECKING(if boolcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) boolcodes=yes],[boolcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) boolcodes=yes],[boolcodes=no])
+   AC_MSG_RESULT($boolcodes)
+ 
+   AC_MSG_CHECKING(if numcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) numcodes=yes],[numcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) numcodes=yes],[numcodes=no])
+   AC_MSG_RESULT($numcodes)
+ 
+   AC_MSG_CHECKING(if strcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) strcodes=yes],[strcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) strcodes=yes],[strcodes=no])
+   AC_MSG_RESULT($strcodes)
+ 
+   AC_MSG_CHECKING(if boolnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) boolnames=yes],[boolnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) boolnames=yes],[boolnames=no])
+   AC_MSG_RESULT($boolnames)
+ 
+   AC_MSG_CHECKING(if numnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) numnames=yes],[numnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) numnames=yes],[numnames=no])
+   AC_MSG_RESULT($numnames)
+ 
+   AC_MSG_CHECKING(if strnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) strnames=yes],[strnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) strnames=yes],[strnames=no])
+   AC_MSG_RESULT($strnames)
+ 
+   dnl There are apparently defective terminal library headers on some
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index e790bf4c5e..7e577fa9e1 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -13,6 +13,8 @@ ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 ZSH_CPE_ID_VENDOR = zsh
+# 0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
+ZSH_AUTORECONF = YES
 
 # zsh uses TRY_RUN to determine these
 ZSH_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
