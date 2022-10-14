Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5811C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CDE419F5;
	Fri, 14 Oct 2022 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CDE419F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CD7ONxUwH1c2; Fri, 14 Oct 2022 20:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE80B419E8;
	Fri, 14 Oct 2022 20:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE80B419E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03D8D1BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFD40419E8
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFD40419E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF3wdGgnq75y for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BADB3419C7
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADB3419C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4EE986D37; Fri, 14 Oct 2022 20:20:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 22:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db79dffcae63dbed021143203f1908f3f7db33f
X-Git-Newrev: b749d6dd7b5fc6cc8b85a316878721d42654759c
X-Patchwork-Hint: ignore
Message-Id: <20221014202025.A4EE986D37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: fix make-4.4 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b749d6dd7b5fc6cc8b85a316878721d42654759c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch fixing compatibility with upcoming make 4.4.

Fixes:
 - http://autobuild.buildroot.net/results/5a3/5a3f6414d75fbc8a272258bf3bdb6f4fe7e6da34
 - http://autobuild.buildroot.net/results/481/481c4617813da031beddaf00b97440071f646809
 - http://autobuild.buildroot.net/results/cf1/cf152e7a95bec3b6ebd0209dd716cbec56f9d477

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ix-MAKEFLAGS-assignment-for-upcoming-make.patch | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
new file mode 100644
index 0000000000..0c82d7abbe
--- /dev/null
+++ b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
@@ -0,0 +1,117 @@
+From 2d7ed98add14f75041499ac189696c9bd3d757fe Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Tue, 13 Sep 2022 13:39:13 -0400
+Subject: [PATCH] Makerules: fix MAKEFLAGS assignment for upcoming make-4.4
+ [BZ# 29564]
+
+make-4.4 will add long flags to MAKEFLAGS variable:
+
+    * WARNING: Backward-incompatibility!
+      Previously only simple (one-letter) options were added to the MAKEFLAGS
+      variable that was visible while parsing makefiles.  Now, all options
+      are available in MAKEFLAGS.
+
+This causes locale builds to fail when long options are used:
+
+    $ make --shuffle
+    ...
+    make  -C localedata install-locales
+    make: invalid shuffle mode: '1662724426r'
+
+The change fixes it by passing eash option via whitespace and dashes.
+That way option is appended to both single-word form and whitespace
+separated form.
+
+While at it fixed --silent mode detection in $(MAKEFLAGS) by filtering
+out --long-options. Otherwise options like --shuffle flag enable silent
+mode unintentionally. $(silent-make) variable consolidates the checks.
+
+Resolves: BZ# 29564
+
+CC: Paul Smith <psmith@gnu.org>
+CC: Siddhesh Poyarekar <siddhesh@gotplt.org>
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+2d7ed98add14f75041499ac189696c9bd3d757fe]
+---
+ Makeconfig     | 18 +++++++++++++++++-
+ Makerules      |  4 ++--
+ elf/rtld-Rules |  2 +-
+ 3 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index f8164a0025..842f49eb58 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -43,6 +43,22 @@ else
+ $(error objdir must be defined by the build-directory Makefile)
+ endif
+ 
++# Did we request 'make -s' run? "yes" or "no".
++# Starting from make-4.4 MAKEFLAGS now contains long
++# options like '--shuffle'. To detect presence of 's'
++# we pick first word with short options. Long options
++# are guaranteed to come after whitespace. We use '-'
++# prefix to always have a word before long options
++# even if no short options were passed.
++# Typical MAKEFLAGS values to watch for:
++#   "rs --shuffle=42" (silent)
++#   " --shuffle" (not silent)
++ifeq ($(findstring s, $(firstword -$(MAKEFLAGS))),)
++silent-make := no
++else
++silent-make := yes
++endif
++
+ # Root of the sysdeps tree.
+ sysdep_dir := $(..)sysdeps
+ export sysdep_dir := $(sysdep_dir)
+@@ -917,7 +933,7 @@ endif
+ # umpteen zillion filenames along with it (we use `...' instead)
+ # but we don't want this echoing done when the user has said
+ # he doesn't want to see commands echoed by using -s.
+-ifneq	"$(findstring s,$(MAKEFLAGS))" ""	# if -s
++ifeq ($(silent-make),yes)			# if -s
+ +cmdecho	:= echo >/dev/null
+ else						# not -s
+ +cmdecho	:= echo
+diff --git a/Makerules b/Makerules
+index d1e139d03c..09c0cf8357 100644
+--- a/Makerules
++++ b/Makerules
+@@ -794,7 +794,7 @@ endif
+ # Maximize efficiency by minimizing the number of rules.
+ .SUFFIXES:	# Clear the suffix list.  We don't use suffix rules.
+ # Don't define any builtin rules.
+-MAKEFLAGS := $(MAKEFLAGS)r
++MAKEFLAGS := $(MAKEFLAGS) -r
+ 
+ # Generic rule for making directories.
+ %/:
+@@ -811,7 +811,7 @@ MAKEFLAGS := $(MAKEFLAGS)r
+ .PRECIOUS: $(foreach l,$(libtypes),$(patsubst %,$(common-objpfx)$l,c))
+ 
+ # Use the verbose option of ar and tar when not running silently.
+-ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
++ifeq ($(silent-make),no)			# if not -s
+ verbose := v
+ else	   					# -s
+ verbose	:=
+diff --git a/elf/rtld-Rules b/elf/rtld-Rules
+index ca00dd1fe2..3c5e273f2b 100644
+--- a/elf/rtld-Rules
++++ b/elf/rtld-Rules
+@@ -52,7 +52,7 @@ $(objpfx)rtld-libc.a: $(foreach dir,$(rtld-subdirs),\
+ 	mv -f $@T $@
+ 
+ # Use the verbose option of ar and tar when not running silently.
+-ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
++ifeq ($(silent-make),no)			# if not -s
+ verbose := v
+ else						# -s
+ verbose	:=
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
