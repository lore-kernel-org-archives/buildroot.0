Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A71CC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC55C606FF;
	Fri, 10 Jul 2026 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_cpMQ1ziRfG; Fri, 10 Jul 2026 16:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AF560693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701018;
	bh=RMhH4Q1+fmAaaq2VygITli3Se4DzXygBf/AqnPCujxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lcPPuqfOLKERPOlMdp+NwER6RZtpaeETKYvGodCXTjoekQ4Bfn3FB5d+xtoY81t4+
	 548F7k2T2/K26xtpW7QJyULoCt2j35xdTLw5vXmRHSEt5721dkjH27cQIA1XutK/hZ
	 PRQKYHKm9XT/bOT4dd22sh5I8LSyU+wxigsMDiW14do67PgaBjIv5r4nCdqs680C59
	 9ZIPjZOegEVRtxdWC61SbvpWDs7dCb8j125HAHoYaagejF4lkaMYHfUCXOWKVqWV+/
	 AElgd2uOsn8fddN7gHvahZQxn4/2VVwJRgkDOLkw6mfaT4zW/lqKkJG7zoThjggqc+
	 5EZ4F0clo6Ehw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AF560693;
	Fri, 10 Jul 2026 16:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77399320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6965240361
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3MCegdwCIji for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846D34033D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846D34033D
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 979C78869C; Fri, 10 Jul 2026 16:29:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:29:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce9ed75bbcc12dd8dc4dee2bdbaffe2f8bf240f8
X-Git-Newrev: e7a6967d280be1bd8461f9c924852d47635348ef
X-Patchwork-Hint: ignore
Message-Id: <20260710162943.979C78869C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: fix build with acl-2.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7a6967d280be1bd8461f9c924852d47635348ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../tar/0004-Avoid-acl_-prefix-for-functions.patch | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
