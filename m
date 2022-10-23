Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB0ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 16:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199D04081F;
	Sun, 23 Oct 2022 16:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 199D04081F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTAksSseblu2; Sun, 23 Oct 2022 16:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECFA4085B;
	Sun, 23 Oct 2022 16:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECFA4085B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 836281BF4D5
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C8C64085B
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8C64085B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAe5bZELK8Ij for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 16:50:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839DC4081F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 839DC4081F
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 16:50:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v1so12168601wrt.11
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 09:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1rtFoAqrbkireQfPcd6jpaanRRtNYEv703ncCX0DQ0=;
 b=GaRm2BqKa1zpsc6ZvH+y8wuzadH8HkQ4DAPd75T05PvzZOhHQi8F3IdOKBf7eorGd/
 VzkM6L5A8qcwysPJXw9DrmXdemlDML09+GnUcFJSw/aQ40aVcXhk5mD+zZ0FxFmFI+y6
 JeUxKfoCPZGkRQDH6yQWqY7LxNAG3E530upa42/YVeIBfmeSdq+9hSV8di4XVlHFjce0
 TLtvcScs+lWPe+SfSgI30PMHeXu4FsCvqTXVzIFmEvncRyPVyqT0eVzVmNmWXP3P5aQW
 +H8uSPqK+Ec85dvTDY7Xck5+nnGaSR8OgQum9Omm98E8VgyKV7XAYUA+Wucu3QQgOONC
 oJJw==
X-Gm-Message-State: ACrzQf3Ic4ftAPh3svAHKQB4tR/nPl1B14e2zUvNCR2rNF1qczlrIgOd
 BWjFIpRpiTaD0PkMkjtVODYV57ewpyY=
X-Google-Smtp-Source: AMsMyM66etbOiyQUaiwdaKsavZpv2hrWNHYZ1mLPBsaHdlafgkvhi7AluuTbdq2BQ+EyFT8HXFeOfw==
X-Received: by 2002:a5d:5149:0:b0:22e:8b85:3d7d with SMTP id
 u9-20020a5d5149000000b0022e8b853d7dmr19060430wrt.55.1666543834120; 
 Sun, 23 Oct 2022 09:50:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f22-20020a05600c491600b003b492753826sm8468826wmp.43.2022.10.23.09.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 09:50:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 18:50:26 +0200
Message-Id: <20221023165026.13707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A1rtFoAqrbkireQfPcd6jpaanRRtNYEv703ncCX0DQ0=;
 b=WFb2SDIT++vscL9PwpANs/qv47pteS6kVOuW2q9RrUo4mpRkUWx42kaGLrLdh93bs/
 jILJJI/RGhOJtHeAwHVtmrK+2YImAc+t/asrRBb5SYAXhDjM4GJ/4FWMs6DngB4ytMfx
 uXS3+6SbCjOBuez2d9fQCQXi9w0ghQBb5R6Ptobr3VtQdXL+nAIExeGLUxGkd0jAcP1c
 AIS6i4Cg+h4uMSK5dRmRSCedzwr8z316D1OCNRv+NtZeilEs8NFZsox9VnIY8/1sHNvB
 hLJB0IXW5gb/sxW7E3WjNge6KEG18kIE90E68Ei8dry82PKPBlGZNLYMKKwxdLpTuSUG
 zBgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WFb2SDIT
Subject: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.2.13
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

- Drop all patches (already in version)
- Replace README by LICENSE file added with
  https://github.com/madler/zlib/commit/352cb28d12baf02863ff5d4d96be0587ced419a1

https://github.com/madler/zlib/releases/tag/v1.2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...hat-discarded-provided-CC-definition.patch | 28 ---------------
 package/libzlib/0002-fix-CVE-2022-37434.patch | 35 -------------------
 .../0003-fix-CVE-2022-37434-regression.patch  | 32 -----------------
 package/libzlib/libzlib.hash                  |  4 +--
 package/libzlib/libzlib.mk                    |  7 ++--
 5 files changed, 4 insertions(+), 102 deletions(-)
 delete mode 100644 package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
 delete mode 100644 package/libzlib/0002-fix-CVE-2022-37434.patch
 delete mode 100644 package/libzlib/0003-fix-CVE-2022-37434-regression.patch

diff --git a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
deleted file mode 100644
index 398e1c9481..0000000000
--- a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Mon, 28 Mar 2022 18:34:10 -0700
-Subject: [PATCH] Fix configure issue that discarded provided CC definition.
-
-Downloaded from upstream commit:
-https://github.com/madler/zlib/commit/05796d3d8d5546cf1b4dfe2cd72ab746afae505d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index 52ff4a04e..3fa3e8618 100755
---- a/configure
-+++ b/configure
-@@ -174,7 +174,10 @@ if test -z "$CC"; then
-   else
-     cc=${CROSS_PREFIX}cc
-   fi
-+else
-+  cc=${CC}
- fi
-+
- cflags=${CFLAGS-"-O3"}
- # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
- case "$cc" in
diff --git a/package/libzlib/0002-fix-CVE-2022-37434.patch b/package/libzlib/0002-fix-CVE-2022-37434.patch
deleted file mode 100644
index a61be48536..0000000000
--- a/package/libzlib/0002-fix-CVE-2022-37434.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Sat, 30 Jul 2022 15:51:11 -0700
-Subject: [PATCH] Fix a bug when getting a gzip header extra field with
- inflate().
-
-If the extra field was larger than the space the user provided with
-inflateGetHeader(), and if multiple calls of inflate() delivered
-the extra header data, then there could be a buffer overflow of the
-provided space. This commit assures that provided space is not
-exceeded.
-
-Backported from: eff308af425b67093bab25f80f1ae950166bece1
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- inflate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7be8c6366..7a7289749 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,9 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
-+                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
--                        state->head->extra != Z_NULL) {
--                        len = state->head->extra_len - state->length;
-+                        state->head->extra != Z_NULL &&
-+                        len < state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
deleted file mode 100644
index 46a58710d2..0000000000
--- a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Mon, 8 Aug 2022 10:50:09 -0700
-Subject: [PATCH] Fix extra field processing bug that dereferences NULL
- state->head.
-
-The recent commit to fix a gzip header extra field processing bug
-introduced the new bug fixed here.
-
-Backported from: 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- inflate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7a7289749..2a3c4fe98 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,10 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
--                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
-                         state->head->extra != Z_NULL &&
--                        len < state->head->extra_max) {
-+                        (len = state->head->extra_len - state->length) <
-+                            state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index e6ca974e2f..df5e8d723a 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
+sha256  d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98  zlib-1.2.13.tar.xz
 # License files, locally calculated
-sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
+sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index f75502326b..e344cc7ad9 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,19 +4,16 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.2.12
+LIBZLIB_VERSION = 1.2.13
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = http://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-LIBZLIB_LICENSE_FILES = README
+LIBZLIB_LICENSE_FILES = LICENSE
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
-# 0002-fix-CVE-2022-37434.patch
-LIBZLIB_IGNORE_CVES = CVE-2022-37434
-
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
