Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B0EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 00:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5D482A28;
	Mon, 10 Oct 2022 00:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5D482A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52Xw4K6oZUyl; Mon, 10 Oct 2022 00:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7ECC82B93;
	Mon, 10 Oct 2022 00:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7ECC82B93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB971BF995
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 00:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F8EB82B93
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 00:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8EB82B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZItSuem5OBE for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 00:35:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9865827D2
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9865827D2
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 00:35:31 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q196so1151672iod.8
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 17:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8ACfU3ugw7q/ECZDw9ytsV3RNmvxrtaGgi4PqaVvmU=;
 b=jW2yH+MTxmZrC1l65uIaNi4YsJqujmHC/RCNJCSbFRqs1kbNtmXMz/DUYC1RXeb7fO
 XmOQ9naKnef7b+aEgUQQXHTrt+7muM3Ku07rGV/9Yd5d//XescBSzh1okgrndS44k2Ad
 WPdJWxMfOK6+AnYBQHOdHdGnOzTxOa8VJJMhqb182EW4LOeX0UjVdu5Y2MI6mA/XZbuy
 PypbjFeHVXjG80Ce24ZHH8gWa1nvwBi+4d/GNNInn7eeVNHiRPjyktQvs6kV4/l1pl/i
 XwVtC4dzIsP+oXF0FFxK3U5nkZ5xWGcZ3bps/J0J9qu7OoLaS49GQyvm8n2ED5v5I5Cm
 neJA==
X-Gm-Message-State: ACrzQf02InJqsWOvN/IFsmQiiqWOpWCAEGPr0SmyROZGb+Oxeel8j1OQ
 3AUtFhGMqSEdDkOeSOKZSKAV7BnNWqiiPQ==
X-Google-Smtp-Source: AMsMyM50UP0t1fBjFS9YvpWqdquJ4qdCY8ss0WGStosUPGi4moD4yZw0dOgzHPgAMthNWbnQGoZDng==
X-Received: by 2002:a05:6602:1601:b0:6a1:d963:4fc with SMTP id
 x1-20020a056602160100b006a1d96304fcmr7220319iow.67.1665362130429; 
 Sun, 09 Oct 2022 17:35:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056602150700b0067ba7abc4cesm3707567iow.50.2022.10.09.17.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 17:35:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 18:35:15 -0600
Message-Id: <20221010003515.796446-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z8ACfU3ugw7q/ECZDw9ytsV3RNmvxrtaGgi4PqaVvmU=;
 b=ibAZs3VXStp+A+BInEmeXVe1nqcWCu09p+V05zzxCHWw8aX6vWyZmtHrwZriiJpIlK
 mHaFPSUbOo5hH44A440kuI11OF02dzUkn8w2NGVbOJEb7uPSY2eBfWQnULWdaR9mY3HN
 wB8sT0Y5DIByWJkPtEqm1+3shrlDSnYWMyWo1mhdtDBB+WLDz0NNkS50OJ0UOQb0x2iR
 szNGc1iLoTGNGtpyyHzS3LjKEd2GubgUEaH4JL+avvWzsUzJFmw37DprXiRw6gJK8Kxt
 3QQVvTUz4M/xguddknQUcnIIIoqY/iNGJOXAitkLvD6gYD6zc6hO9wcr26mHrLrwfCp9
 FajQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ibAZs3VX
Subject: [Buildroot] [PATCH 1/1] package/glibc: fix make-4.4 compatibility
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch fixing compatibility with upcoming make 4.4.

Fixes:
 - http://autobuild.buildroot.net/results/5a3/5a3f6414d75fbc8a272258bf3bdb6f4fe7e6da34
 - http://autobuild.buildroot.net/results/481/481c4617813da031beddaf00b97440071f646809
 - http://autobuild.buildroot.net/results/cf1/cf152e7a95bec3b6ebd0209dd716cbec56f9d477

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...KEFLAGS-assignment-for-upcoming-make.patch | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
