Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1979DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82EDE81E42;
	Wed,  2 Nov 2022 18:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82EDE81E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JB-dMFSyepz2; Wed,  2 Nov 2022 18:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B80C81E3B;
	Wed,  2 Nov 2022 18:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B80C81E3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E94C51BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D24B660BE5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24B660BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxmLT8hBshC0 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9018660B88
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9018660B88
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:18:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id t1so7485204wmi.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rXOeWzf7g4siWmPDj2ZCy7wm2H7I6y18GJnKT3a2d7k=;
 b=1YY73P4HmF0f2byFBWAiTpdckHMRiFrp9iXCvhIpuM5KaEE+dLoH8AHPepVUWsSmpL
 vXkvxuGCkYQGlGyNlGdzFij6RVCw3bvnaeHlAyZNWJG4ZQPJdIPX8k6YRSChdXpj5c6C
 tUgsdi60+z19ix+bO5Pi1iGzpGkPuQCta9Wf274z3CepsSwfn6i1iHvSTY95O2m6kv+y
 DWV/vJ7iYktHcRupgabs4zBIZOe+AexO61TX0FuTzFJ44l4Y4cka6iYeJTczo9qk1Dcn
 3PScdo1loV6ZlizGdbIZB7dhBjgckhBkIoPogXZv+8UddBXgeteoYPPInqdSUXEYJ0Yb
 mFQg==
X-Gm-Message-State: ACrzQf19m9KrsIP2aa83dqhBR5yKqyk8Oz1bUZFrTXzyRwv9JobAKhCJ
 1bJcaPl1S/9klN5wVFdeGjWXAkCgDfA=
X-Google-Smtp-Source: AMsMyM7L0267AxT4LzzloYiYjSzjwK3RpNi8sUBDfAKpEkpCHm3q63V5cQtidDmCtt04AR2blzHSWQ==
X-Received: by 2002:a05:600c:418b:b0:3cf:4733:e0b6 with SMTP id
 p11-20020a05600c418b00b003cf4733e0b6mr17120261wmh.186.1667413088209; 
 Wed, 02 Nov 2022 11:18:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b003a5f3f5883dsm3057324wmq.17.2022.11.02.11.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:18:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 19:18:03 +0100
Message-Id: <20221102181803.104116-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rXOeWzf7g4siWmPDj2ZCy7wm2H7I6y18GJnKT3a2d7k=;
 b=RlRpJg6q7exACqWFLbs2607NVg0jOefs4UCHa9lEXchMdKhzakhUnQvOE3daqMS6aB
 zz8uvrvLRRUM3RQhXKVIuswtbo0El4u+PuI3szVjVTMWUZwhH/pzGZbIbj8eLb1WOVEj
 Q8cQCLWx6WkC9jr6KIPka64DhP1/vDmz9gDwfJAbkOqBjFLYKWEBduXEBhReqf+KF5S5
 g7bzWiCWljcpNiESpeF+k9SM54R2hbroluWeeTcxhRaDqeFncnc3cpNJ68Qflo5MGhtC
 rtwhBQ1EHQaEB20gi5MxoweVvYxNHPBNMJDwsU+HGfcaEJTRRGv0kNdlOgvVymiSSLAa
 8wyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RlRpJg6q
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: fix build without makeinfo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable documentation to avoid the following build failure without
makeinfo raised at least since bump to version 1.6.10 in commit
f0faa3b71c585cb70bcd6fa4bafb756b98130bd5 (and probably since the
addition of the package in commit
663f39c88c01593855c18355a4decdceeffd884b):

/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
WARNING: 'makeinfo' is missing on your system.
         You should only need it if you modified a '.texi' file, or
         any other file indirectly affecting the aspect of the manual.
         You might want to install the Texinfo package:
         <https://www.gnu.org/software/texinfo/>
         The spurious makeinfo call might also be the consequence of
         using a buggy 'make' (AIX, DU, IRIX), in which case you might
         want to install GNU make:
         <https://www.gnu.org/software/make/>
Makefile:442: recipe for target 'freeipmi-faq.info' failed

Fixes:
 - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeipmi/0001-add-disable-doc.patch | 72 +++++++++++++++++++++
 package/freeipmi/freeipmi.mk                |  2 +
 2 files changed, 74 insertions(+)
 create mode 100644 package/freeipmi/0001-add-disable-doc.patch

diff --git a/package/freeipmi/0001-add-disable-doc.patch b/package/freeipmi/0001-add-disable-doc.patch
new file mode 100644
index 0000000000..e410d2b52f
--- /dev/null
+++ b/package/freeipmi/0001-add-disable-doc.patch
@@ -0,0 +1,72 @@
+From 5324c88632c021a87251370b03067d857e9a9892 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 19:02:42 +0100
+Subject: [PATCH] add --disable-doc
+
+Allow the user to disable documentation through --disable-doc to avoid
+the following build failure without makeinfo:
+
+/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+Makefile:442: recipe for target 'freeipmi-faq.info' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/61]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 4 ++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cf757f634..d74952e30 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,6 @@
+ ACLOCAL_AMFLAGS = -I config
+ 
+ SUBDIRS = \
+-	doc \
+ 	etc \
+ 	common \
+ 	libfreeipmi \
+@@ -33,6 +32,11 @@ SUBDIRS = \
+ 	rmcpping \
+ 	contrib
+ 
++if ENABLE_DOC
++SUBDIRS += \
++	doc
++endif
++
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ 
+diff --git a/configure.ac b/configure.ac
+index 54fdf6367..7a94b958b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -341,6 +341,10 @@ else
+ fi
+ AC_SUBST(WITH_DEBUG)
+ 
++AC_ARG_ENABLE(doc,
++              AC_HELP_STRING([--disable-doc], [turn off documentation]))
++AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
++
+ dnl Allow advanced developers to compile with raw dumping
+ AC_ARG_ENABLE(rawdumps,
+    AC_HELP_STRING([--enable-rawdumps], [output raw packet dumps when debugging]))
+-- 
+2.35.1
+
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 916f2eb68a..3e0ac0ffa9 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -12,6 +12,8 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
 	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
 	COPYING.sunbmc COPYING.ZRESEARCH
+# We're patching configure.ac
+FREEIPMI_AUTORECONF = YES
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
