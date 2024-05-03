Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCF2C10F16
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6402C41D7A;
	Fri,  3 May 2024 18:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWffHeXzmXNt; Fri,  3 May 2024 18:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDBFC40586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDBFC40586;
	Fri,  3 May 2024 18:50:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5B031BF311
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 18:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB7683B2A
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 18:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9N_3R2Rmcvj for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 18:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7575683B18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7575683B18
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7575683B18
 for <buildroot@buildroot.org>; Fri,  3 May 2024 18:50:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso267635e9.3
 for <buildroot@buildroot.org>; Fri, 03 May 2024 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714762214; x=1715367014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VuQor3hwd1jD1hpoaaUA9s2HeBIEt/0QA/qmhlbnZOk=;
 b=TjqmOQbF8XQgzUDB6acYAWu00So/tcn4MhiB314tciKy7IE3v2qFyoj0qqxUFbd6Oc
 MpODP8WsFpkbQtA38FkFbMFBxmJjR2TnYiVMG7S3IJSqNUdtY/7JesPSOy+/Dopz3ZT+
 GGNVOMTY9Van/nqo7EdfnOwNsbM3IrMagtFPMVBBfEhqg8sc+wyrgkAeCbvgs75eyXkg
 DjbJaSFAVDT43tYycQNk9BHuFHHYX8xhRGAUPAUOeWcbED+3UWCyBtNT4G72YURNiyce
 LbfKO5+2yOeEAcKKRhy6AW++8qlSdveYqBnjx9KneVhd1YaXkUHhkrCYNhyH8Pz8l2fP
 JrIg==
X-Gm-Message-State: AOJu0YwWZtUanfvpGnYLvtlIq354Z70kx6c8SBBYHuIU5KFvVttlc0ZO
 N5Na/5dtmP1ScjAiH71W4QawIZmAl4URs9Dk7LMbrJQVDmzupNfy2xo35g==
X-Google-Smtp-Source: AGHT+IGfzSg5xQO+Mvh3XKUsCiUpNFkqiX3NsPpImHDkcstPDgt+b6BK837KuEBWxY32FVa2F2cURA==
X-Received: by 2002:a05:600c:1f94:b0:419:f911:680a with SMTP id
 je20-20020a05600c1f9400b00419f911680amr3524417wmb.1.1714762213659; 
 Fri, 03 May 2024 11:50:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0041c7ac6b0ffsm10362470wmb.37.2024.05.03.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 11:50:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 20:50:08 +0200
Message-ID: <20240503185008.930881-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714762214; x=1715367014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VuQor3hwd1jD1hpoaaUA9s2HeBIEt/0QA/qmhlbnZOk=;
 b=WbWLj4AM3vH0ufzoaM7ofK9wtGcFTu4PDF/CNrz9M0GSQxNWHuZLcMUgyNw9YqnCdk
 FifgI4nscTA3OVkymbOhnjSNnJTfkdWgpUGuovZLx4Zyoub4QXYoSxQeozH0EnUypcrU
 HrfN2t6P88CnjcyXmCBuaFBPMhFlIwUF9lDEIKkFFo2FppSDrsIB/6CAct6EQEcYbOcj
 w0NEY8zjgAQo6jqox93Xu9txiEk+k5Tpo9Vu++WOoqbx/3opcGUnwzTr4UFAeqpkpoan
 YXl9A6PoPohPgUgX868CbVQ6Af+6MioqOd2DTyQ6VMBM/VGX44YseQF47lVicTMVQOwJ
 Fx2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WbWLj4AM
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: bump to version 1.0.10
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second to fourth patches (already in version)

https://sourceforge.net/p/gptfdisk/code/ci/53ac725a88a616b9f3395500d6e520aa04742fa5/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...h-of-sgdisk-when-compiled-with-lates.patch | 60 -------------------
 ...ence-when-duplicating-string-argumen.patch | 44 --------------
 ...to-deal-with-minor-change-in-libuuid.patch | 41 -------------
 package/gptfdisk/gptfdisk.hash                |  6 +-
 package/gptfdisk/gptfdisk.mk                  |  2 +-
 6 files changed, 4 insertions(+), 150 deletions(-)
 delete mode 100644 package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
 delete mode 100644 package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
 delete mode 100644 package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index c600978cf2..d809f3396b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -765,7 +765,6 @@ package/gpm/0005-fix-building-w-newer-glibc.patch lib_patch.Upstream
 package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
-package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
 package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch lib_patch.Upstream
 package/grpc/0003-host-grpc-only-cpp-plugin.patch lib_patch.Upstream
diff --git a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
deleted file mode 100644
index bdeedd95cc..0000000000
--- a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Fri, 15 Apr 2022 18:10:14 -0400
-Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest
- popt (commit 740; presumably eventually release 1.19)
-
-[Retrieved from:
-https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- NEWS      | 8 ++++++++
- gptcl.cc  | 2 +-
- support.h | 2 +-
- 3 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index c7add56..9e153fd 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,11 @@
-+1.0.10 (?/??/2022):
-+-------------------
-+
-+- Fixed problem that caused sgdisk to crash with errors about being unable
-+  to read the disk's partition table when compiled with the latest popt
-+  (commit 740, which is pre-release as I type; presumably version 1.19 and
-+  later once released).
-+
- 1.0.9 (4/14/2022):
- ------------------
- 
-diff --git a/gptcl.cc b/gptcl.cc
-index 34c9421..0d578eb 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = (char*) poptGetArg(poptCon);
-+   device = strdup((char*) poptGetArg(poptCon));
-    poptResetContext(poptCon);
- 
-    if (device != NULL) {
-diff --git a/support.h b/support.h
-index 8ba9ad1..f91f1bc 100644
---- a/support.h
-+++ b/support.h
-@@ -8,7 +8,7 @@
- #include <stdlib.h>
- #include <string>
- 
--#define GPTFDISK_VERSION "1.0.9"
-+#define GPTFDISK_VERSION "1.0.9.1"
- 
- #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
- // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
--- 
-2.35.1
-
diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
deleted file mode 100644
index 250c071582..0000000000
--- a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
-Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
-From: Damian Kurek <starfire24680@gmail.com>
-Date: Thu, 7 Jul 2022 03:39:16 +0000
-Subject: [PATCH] Fix NULL dereference when duplicating string argument
-
-poptGetArg can return NULL if there are no additional arguments, which
-makes strdup dereference NULL on strlen
-
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-Upstream: https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9
----
- gptcl.cc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gptcl.cc b/gptcl.cc
-index 0d578eb..ab95239 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = strdup((char*) poptGetArg(poptCon));
--   poptResetContext(poptCon);
-+   device = (char*) poptGetArg(poptCon);
- 
-    if (device != NULL) {
-+      device = strdup(device);
-+      poptResetContext(poptCon);
-       JustLooking(); // reset as necessary
-       BeQuiet(); // Tell called functions to be less verbose & interactive
-       if (LoadPartitions((string) device)) {
-@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-          cerr << "Error encountered; not saving changes.\n";
-          retval = 4;
-       } // if
-+      free(device);
-    } // if (device != NULL)
-    poptFreeContext(poptCon);
-    return retval;
--- 
-2.40.0
-
diff --git a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
deleted file mode 100644
index 22c34ced6f..0000000000
--- a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6a8416cbd12d55f882bb751993b94f72d338d96f Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Sat, 16 Apr 2022 09:32:04 -0400
-Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
-
-Upstream: https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
-Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
----
- NEWS    | 2 ++
- guid.cc | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index 9e153fd..9ec7e63 100644
---- a/NEWS
-+++ b/NEWS
-@@ -6,6 +6,8 @@
-   (commit 740, which is pre-release as I type; presumably version 1.19 and
-   later once released).
- 
-+- Updated guid.cc to deal with minor change in libuuid.
-+
- 1.0.9 (4/14/2022):
- ------------------
- 
-diff --git a/guid.cc b/guid.cc
-index 1e73ab7..d3e4fd5 100644
---- a/guid.cc
-+++ b/guid.cc
-@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
- void GUIDData::Randomize(void) {
-    int i, uuidGenerated = 0;
- 
--#ifdef _UUID_UUID_H
-+#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
-    uuid_generate(uuidData);
-    ReverseBytes(&uuidData[0], 4);
-    ReverseBytes(&uuidData[4], 2);
--- 
-2.42.0
-
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 0b98677afb..14a8d59a08 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.9/
-sha1  284bd000edaf7874b472bd01719c6a71a8030e13  gptfdisk-1.0.9.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.10/
+sha1  70c0bfe4290c2893fc957ef7f6156c5e74e469fc  gptfdisk-1.0.10.tar.gz
 # Locally computed
-sha256  dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2  gptfdisk-1.0.9.tar.gz
+sha256  2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5a9209b2ad693a282  gptfdisk-1.0.10.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 393ea9469a..b35899bf9b 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.9
+GPTFDISK_VERSION = 1.0.10
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
