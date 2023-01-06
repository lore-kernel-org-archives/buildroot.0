Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B3CC61DB3
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD8681249;
	Fri,  6 Jan 2023 21:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD8681249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SblLzFrTaKmO; Fri,  6 Jan 2023 21:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B52D48136A;
	Fri,  6 Jan 2023 21:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B52D48136A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0145F1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEDD641C70
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEDD641C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbK08PNfDKsB for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:18:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2702C41C6E
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2702C41C6E
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:18:56 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e129so1390256iof.3
 for <buildroot@buildroot.org>; Fri, 06 Jan 2023 13:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMZYw63QhjR7PNqDFIsYQ5DftfFxqweoq7ukLr6AMUo=;
 b=mrp2udIRgszTh7WwXj3C5fcqimicgeDV7Ov7F3q1w/ibrNp+7dow9BoL0k7C5zAJLS
 vJ+j/G+2qzKX7/PZHNVcVUc3fdTBmYLtdF/e7V5IAvbv7vtm+QPVxdmu46LLhkbWhRmE
 mBV8ovhBE8fTID/+k3s7LSA7Y4pKreM999db9CJUxyDkyRXirVAE0NszpX1hUYC6E1n5
 cH7O3xScSZprgCJ0aQkeY1FrMJ9OEqjNkFf1buIMQL92P1Ic9nAZ0MguI6C/lfFpgQWT
 81ASWqd5BDYTPWzsdlegQPpsmRe9mHsgcSuL3jvdq4U2OdoRV6OxbQryq8LwhPhe03Ur
 qfZA==
X-Gm-Message-State: AFqh2krCXwl2j1wrJOd5hpb9sgcxcmGYCj0c/icIHDqyLG9fJPNXv5VP
 yWQkniX1e2L633oMZpEQRzxtS3wVHrGvOw==
X-Google-Smtp-Source: AMrXdXtX1B0VN9VXwq3mXfl5HfW6aPK4Ge6HQ4rqTITAzLmYXj3tBtlBob2L6oPNODvQpt8L5HwJHg==
X-Received: by 2002:a6b:7c46:0:b0:6e8:dbe1:149 with SMTP id
 b6-20020a6b7c46000000b006e8dbe10149mr33971581ioq.1.1673039934768; 
 Fri, 06 Jan 2023 13:18:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x3-20020a056602160300b006e302b99d00sm677316iow.20.2023.01.06.13.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 13:18:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 14:18:41 -0700
Message-Id: <20230106211841.4064916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMZYw63QhjR7PNqDFIsYQ5DftfFxqweoq7ukLr6AMUo=;
 b=D2tvMrkJ99+uwVAQcFkLVIzSF8i8R4l78yJxksK7FXEksZF2z9hPmj1SCH319gcj6Y
 iTdsJe4gPLEOWsnC7m37aLyR5gL6QNctOpdGfFDrnJPwSiZRqSxSCzCafLgLDLPqGDgg
 7163+DMYhfcrBZ66Fe3eodbwZEGcfTFTOIklCq1ADhX9FYT+/f4g7P26poI1IPcqRTLk
 eg/0iGXaogLfWjuJmFpLtK88p4+XwJ8AxBrBYmMWpRNZP/itLdTsgFiCRybXnzeulUeh
 aRFaEQSzOcaSlFT+FgMgr0+ovAvBPvGYt5jRfIQS68LTs9Pp5R3XII12JbZQmFrn9Yk4
 jLDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D2tvMrkJ
Subject: [Buildroot] [PATCH 1/1] package/{glibc, localedef}: bump to version
 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...KEFLAGS-assignment-for-upcoming-make.patch | 117 ------------------
 .../0002-x86-Fix-Os-build-BZ-29576.patch      |  48 -------
 package/glibc/glibc.hash                      |   2 +-
 package/glibc/glibc.mk                        |   2 +-
 package/localedef/localedef.mk                |   2 +-
 5 files changed, 3 insertions(+), 168 deletions(-)
 delete mode 100644 package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
 delete mode 100644 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch

diff --git a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
deleted file mode 100644
index 0c82d7abbe..0000000000
--- a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 2d7ed98add14f75041499ac189696c9bd3d757fe Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Tue, 13 Sep 2022 13:39:13 -0400
-Subject: [PATCH] Makerules: fix MAKEFLAGS assignment for upcoming make-4.4
- [BZ# 29564]
-
-make-4.4 will add long flags to MAKEFLAGS variable:
-
-    * WARNING: Backward-incompatibility!
-      Previously only simple (one-letter) options were added to the MAKEFLAGS
-      variable that was visible while parsing makefiles.  Now, all options
-      are available in MAKEFLAGS.
-
-This causes locale builds to fail when long options are used:
-
-    $ make --shuffle
-    ...
-    make  -C localedata install-locales
-    make: invalid shuffle mode: '1662724426r'
-
-The change fixes it by passing eash option via whitespace and dashes.
-That way option is appended to both single-word form and whitespace
-separated form.
-
-While at it fixed --silent mode detection in $(MAKEFLAGS) by filtering
-out --long-options. Otherwise options like --shuffle flag enable silent
-mode unintentionally. $(silent-make) variable consolidates the checks.
-
-Resolves: BZ# 29564
-
-CC: Paul Smith <psmith@gnu.org>
-CC: Siddhesh Poyarekar <siddhesh@gotplt.org>
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-2d7ed98add14f75041499ac189696c9bd3d757fe]
----
- Makeconfig     | 18 +++++++++++++++++-
- Makerules      |  4 ++--
- elf/rtld-Rules |  2 +-
- 3 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/Makeconfig b/Makeconfig
-index f8164a0025..842f49eb58 100644
---- a/Makeconfig
-+++ b/Makeconfig
-@@ -43,6 +43,22 @@ else
- $(error objdir must be defined by the build-directory Makefile)
- endif
- 
-+# Did we request 'make -s' run? "yes" or "no".
-+# Starting from make-4.4 MAKEFLAGS now contains long
-+# options like '--shuffle'. To detect presence of 's'
-+# we pick first word with short options. Long options
-+# are guaranteed to come after whitespace. We use '-'
-+# prefix to always have a word before long options
-+# even if no short options were passed.
-+# Typical MAKEFLAGS values to watch for:
-+#   "rs --shuffle=42" (silent)
-+#   " --shuffle" (not silent)
-+ifeq ($(findstring s, $(firstword -$(MAKEFLAGS))),)
-+silent-make := no
-+else
-+silent-make := yes
-+endif
-+
- # Root of the sysdeps tree.
- sysdep_dir := $(..)sysdeps
- export sysdep_dir := $(sysdep_dir)
-@@ -917,7 +933,7 @@ endif
- # umpteen zillion filenames along with it (we use `...' instead)
- # but we don't want this echoing done when the user has said
- # he doesn't want to see commands echoed by using -s.
--ifneq	"$(findstring s,$(MAKEFLAGS))" ""	# if -s
-+ifeq ($(silent-make),yes)			# if -s
- +cmdecho	:= echo >/dev/null
- else						# not -s
- +cmdecho	:= echo
-diff --git a/Makerules b/Makerules
-index d1e139d03c..09c0cf8357 100644
---- a/Makerules
-+++ b/Makerules
-@@ -794,7 +794,7 @@ endif
- # Maximize efficiency by minimizing the number of rules.
- .SUFFIXES:	# Clear the suffix list.  We don't use suffix rules.
- # Don't define any builtin rules.
--MAKEFLAGS := $(MAKEFLAGS)r
-+MAKEFLAGS := $(MAKEFLAGS) -r
- 
- # Generic rule for making directories.
- %/:
-@@ -811,7 +811,7 @@ MAKEFLAGS := $(MAKEFLAGS)r
- .PRECIOUS: $(foreach l,$(libtypes),$(patsubst %,$(common-objpfx)$l,c))
- 
- # Use the verbose option of ar and tar when not running silently.
--ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
-+ifeq ($(silent-make),no)			# if not -s
- verbose := v
- else	   					# -s
- verbose	:=
-diff --git a/elf/rtld-Rules b/elf/rtld-Rules
-index ca00dd1fe2..3c5e273f2b 100644
---- a/elf/rtld-Rules
-+++ b/elf/rtld-Rules
-@@ -52,7 +52,7 @@ $(objpfx)rtld-libc.a: $(foreach dir,$(rtld-subdirs),\
- 	mv -f $@T $@
- 
- # Use the verbose option of ar and tar when not running silently.
--ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
-+ifeq ($(silent-make),no)			# if not -s
- verbose := v
- else						# -s
- verbose	:=
--- 
-2.34.1
-
diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
deleted file mode 100644
index 4470324f1c..0000000000
--- a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
-Date: Wed, 21 Sep 2022 10:51:08 -0300
-Subject: [PATCH] x86: Fix -Os build (BZ #29576)
-
-The compiler might transform __stpcpy calls (which are routed to
-__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
-multiarch implementation does not build any working symbol due
-ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
-
-Checked on x86_64-linux-gnu.
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Tested-by: Carlos O'Donell <carlos@redhat.com>
-
-(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
- create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
-
-diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
-new file mode 100644
-index 0000000000..19439c553d
---- /dev/null
-+++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
-@@ -0,0 +1,18 @@
-+/* Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include "../strcpy.S"
--- 
-2.34.3
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 16290461ac..4ce4c6f6d1 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  51b946f6c8dddd2b0c9902f7792ecf594497da6b0cc8fb9246fa30f108cbb422  glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca.tar.gz
+sha256  666482e657c319f7e139121121a0d97d303c65207b9f9730f42a3ee83c79f686  glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index bb7c9e9a05..354f035d33 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
+GLIBC_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 05db7fa423..6699840854 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
+LOCALEDEF_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
