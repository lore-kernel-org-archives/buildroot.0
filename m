Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA8BC43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 19:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC27B81510;
	Wed,  8 Jul 2026 19:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saqrk9apHd2W; Wed,  8 Jul 2026 19:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A855B814D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783539586;
	bh=C9Z9uzQsVy90Hs0R0RKJ6ZZxcW03KVnK0l16fymCkis=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hIDF4IGTlqNQ3rBNNVHX/raaWeSvGYd0u8+3JrBi9HKe5VP3cBklZhTEZPt7xilUf
	 H2Nzh7Sa10qDDCaGWwYuWmRXn0IgZF/Ey5ImJbzFTXEhNKleOLYYYS7l0+nZ9WYvDr
	 218E5fwdiq/rmJwSqN+gfa5wMSElSmzGc21Az9H5qkbf0m1BC3p190XOlRg4sdPQEr
	 EiWSkt+b2du15qrUC24EHdJE5ZTy62+WHayywvJuBCuPJA/SIpE2XdjjCgnX+QZqJ4
	 VERPDgLcvzsNqXsYUqrP8VqNeOrj26zOFZdfEM6ZoSoaXzel0P5y59M94WUGaZNKXW
	 O/8W6TrIu7lOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A855B814D6;
	Wed,  8 Jul 2026 19:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ADF0315
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57BE40061
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc8_LzZNWlLt for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 19:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DAE640024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DAE640024
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DAE640024
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:39:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a01.dip0.t-ipconnect.de [91.58.10.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 849E0A4C2E64;
 Wed,  8 Jul 2026 21:39:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whY7Q-0000000038v-0NeE;
 Wed, 08 Jul 2026 19:39:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Jul 2026 21:39:38 +0200
Message-ID: <20260708193940.1578161-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783539580;
 bh=zYzeX/0kiV1ThE8mwxFO0/hKhOoIh6THNqT30ehsskU=;
 h=From:To:Cc:Subject:Date:From;
 b=bT/vsQifvcAxdNzJCo3/lMmsfi2iumV4KkqCak9HhI6UzqKtP4dtObRK6rW9TCIIQ
 aQFeSdC4fDQQc/GGYo1PYlxsXPKvB500xRBnve8uR1nKMD1nKQohuIsni5/dEzFqv4
 +oBLfU+MW2hGWtiBin1+jZcIrF+x8MP8Pnq652n95AR/aei34yvVWeX1Vm3nxP0iiZ
 4J9r/3DRfpcHyIOg3BdTIUdl86HGuvEj6facZ/UxTCHfhUlPHwZBuj/Txj2GiNY/0O
 2AH1VXybHlUDYIgvsuXjXYuOJyOztEDdNgqmBmJlsaINXFfyWWbhFYcJcSkU0EHbcE
 oyAL7Lo1EfRBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bT/vsQif
Subject: [Buildroot] [PATCH 1/3] package/tar: fix build with acl-2.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream commit to buildroot to fix build errors introduced by the
upcoming bump of acl to 2.4.0:

https://lists.nongnu.org/archive/html/acl-devel/2026-06/msg00000.html
"Compatibility Notes

  - libacl now exports the new functions acl_get_file_at(),
    acl_set_file_at(), acl_delete_def_file_at(), and acl_extended_file_at(),
    which are declared in <sys/acl.h>.  This may cause conflicts in programs
    that define functions of the same name and link against libacl.

    One such program is GNU tar which defines its own versions of functions
    like acl_get_file_at().  The fix is to rename those functions.  (In the
    case if GNU tar, a fix is already on the way.)"

This patch will also fix build errors seen on the autobuilders for
host-tar on hosts which already provide acl >= 2.4.0.

Fixes:
https://autobuild.buildroot.net/results/478/478a9781f481df7cf2eecda80a4c13f900a0dc80/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/e72a7b9a2d707b8ad8faacd2f882e39afefafabe

 ...0004-Avoid-acl_-prefix-for-functions.patch | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 package/tar/0004-Avoid-acl_-prefix-for-functions.patch

diff --git a/package/tar/0004-Avoid-acl_-prefix-for-functions.patch b/package/tar/0004-Avoid-acl_-prefix-for-functions.patch
new file mode 100644
index 0000000000..aebdc6b2d8
--- /dev/null
+++ b/package/tar/0004-Avoid-acl_-prefix-for-functions.patch
@@ -0,0 +1,104 @@
+From 08c3fc2e9337094aff01a511170fd35fdb8f1ee3 Mon Sep 17 00:00:00 2001
+From: Pavel Cahyna <pcahyna@redhat.com>
+Date: Wed, 24 Jun 2026 18:45:30 +0200
+Subject: [PATCH] Avoid acl_ prefix for functions
+
+The acl.h header from libacl uses acl_ prefix for its functions. Avoid
+defining functions with the same name in order to protect its namespace.
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=08c3fc2e9337094aff01a511170fd35fdb8f1ee3
+
+[Bernd: backported to version 1.35]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/xattrs.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/src/xattrs.c b/src/xattrs.c
+index 4f5872c1..f98e8e0f 100644
+--- a/src/xattrs.c
++++ b/src/xattrs.c
+@@ -139,13 +139,13 @@ static struct
+ #ifdef HAVE_POSIX_ACLS
+ 
+ /* acl-at wrappers, TODO: move to gnulib in future? */
+-static acl_t acl_get_file_at (int, const char *, acl_type_t);
+-static int acl_set_file_at (int, const char *, acl_type_t, acl_t);
++static acl_t tar_acl_get_file_at (int, const char *, acl_type_t);
++static int tar_acl_set_file_at (int, const char *, acl_type_t, acl_t);
+ static int file_has_acl_at (int, char const *, struct stat const *);
+-static int acl_delete_def_file_at (int, char const *);
++static int tar_acl_delete_def_file_at (int, char const *);
+ 
+-/* acl_get_file_at */
+-#define AT_FUNC_NAME acl_get_file_at
++/* tar_acl_get_file_at */
++#define AT_FUNC_NAME tar_acl_get_file_at
+ #define AT_FUNC_RESULT acl_t
+ #define AT_FUNC_FAIL (acl_t)NULL
+ #define AT_FUNC_F1 acl_get_file
+@@ -159,8 +159,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_set_file_at */
+-#define AT_FUNC_NAME acl_set_file_at
++/* tar_acl_set_file_at */
++#define AT_FUNC_NAME tar_acl_set_file_at
+ #define AT_FUNC_F1 acl_set_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS   , acl_type_t type, acl_t acl
+ #define AT_FUNC_POST_FILE_ARGS          , type, acl
+@@ -170,8 +170,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_delete_def_file_at */
+-#define AT_FUNC_NAME acl_delete_def_file_at
++/* tar_acl_delete_def_file_at */
++#define AT_FUNC_NAME tar_acl_delete_def_file_at
+ #define AT_FUNC_F1 acl_delete_def_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS
+ #define AT_FUNC_POST_FILE_ARGS
+@@ -299,10 +299,10 @@
+       /* No "default" IEEE 1003.1e ACL set for directory.  At this moment,
+          FILE_NAME may already have inherited default acls from parent
+          directory;  clean them up. */
+-      if (acl_delete_def_file_at (chdir_fd, file_name))
++      if (tar_acl_delete_def_file_at (chdir_fd, file_name))
+         WARNOPT (WARN_XATTR_WRITE,
+                 (0, errno,
+-                 _("acl_delete_def_file_at: Cannot drop default POSIX ACLs "
++                 _("tar_acl_delete_def_file_at: Cannot drop default POSIX ACLs "
+                    "for file '%s'"),
+                  file_name));
+       return;
+@@ -316,11 +316,11 @@
+       return;
+     }
+ 
+-  if (acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
++  if (tar_acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
+     /* warn even if filesystem does not support acls */
+     WARNOPT (WARN_XATTR_WRITE,
+ 	     (0, errno,
+-	      _ ("acl_set_file_at: Cannot set POSIX ACLs for file '%s'"),
++	      _ ("tar_acl_set_file_at: Cannot set POSIX ACLs for file '%s'"),
+ 	      file_name));
+ 
+   acl_free (acl);
+@@ -357,10 +357,10 @@ acls_get_text (int parentfd, const char *file_name, acl_type_t type,
+   char *val = NULL;
+   acl_t acl;
+ 
+-  if (!(acl = acl_get_file_at (parentfd, file_name, type)))
++  if (!(acl = tar_acl_get_file_at (parentfd, file_name, type)))
+     {
+       if (errno != ENOTSUP)
+-        call_arg_warn ("acl_get_file_at", file_name);
++        call_arg_warn ("tar_acl_get_file_at", file_name);
+       return;
+     }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
