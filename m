Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C15C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 12:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D86607F6;
	Sun, 13 Feb 2022 12:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtMUGvWxP4Gb; Sun, 13 Feb 2022 12:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC32160B9D;
	Sun, 13 Feb 2022 12:08:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3021BF46D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495504011C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YysIyyUR_MQ for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 537D440119
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3042A82868; Sun, 13 Feb 2022 11:57:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 13:05:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9eca021594470341bec2876edc0a27251f3f9b2
X-Git-Newrev: 683e8387d05cb506c30592ab43a3e7534d7cf56e
X-Patchwork-Hint: ignore
Message-Id: <20220213115753.3042A82868@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: fix build failure with
 Microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=683e8387d05cb506c30592ab43a3e7534d7cf56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream[1] to fix the build failure after my
suggestion[2] to imitate what I've done with libfuse[3].

[1]: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/275?commit_id=5f71b3d63181aa88a68f7f71eab8801f2d8d2cde
[2]: https://gitlab.com/cryptsetup/cryptsetup/-/issues/709
[3]: https://github.com/libfuse/libfuse/pull/620/commits/3aba09a5c56e017746c5c1652dbc845f4db7374a

Fixes:
http://autobuild.buildroot.net/results/bad/bad4d01fde3191e4d481a8e9dae18df3b1a94537/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...01-Add-check-program-for-symver-attribute.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch b/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
new file mode 100644
index 0000000000..04f59a2050
--- /dev/null
+++ b/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
@@ -0,0 +1,56 @@
+From 7c6ec620de3f99d4212f4a54aa576df1b97020ab Mon Sep 17 00:00:00 2001
+From: Ondrej Kozina <okozina@redhat.com>
+Date: Wed, 2 Feb 2022 11:34:57 +0100
+Subject: [PATCH] Add check program for symver attribute.
+
+Fixes: #709.
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ configure.ac               | 11 +++++++++++
+ lib/libcryptsetup_symver.h |  8 +++-----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a0e5990d..b052f8cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -554,6 +554,17 @@ if test "x$enable_static_cryptsetup" = "xyes"; then
+ 	PKG_CONFIG=$saved_PKG_CONFIG
+ fi
+ 
++dnl Check compiler support for symver function attribute
++saved_CFLAGS=$CFLAGS
++CFLAGS="-O0 -Werror"
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
++	void _test_sym(void);
++	__attribute__((__symver__("sym@VERSION_4.2"))) void _test_sym(void) {}
++]],
++[[ _test_sym() ]]
++)],[ AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 to use __attribute__((symver))])])
++CFLAGS=$saved_CFLAGS
++
+ AC_MSG_CHECKING([for systemd tmpfiles config directory])
+ PKG_CHECK_VAR([systemd_tmpfilesdir], [systemd], [tmpfilesdir], [], [systemd_tmpfilesdir=no])
+ AC_MSG_RESULT([$systemd_tmpfilesdir])
+diff --git a/lib/libcryptsetup_symver.h b/lib/libcryptsetup_symver.h
+index 2a804b6a..3558310d 100644
+--- a/lib/libcryptsetup_symver.h
++++ b/lib/libcryptsetup_symver.h
+@@ -67,11 +67,9 @@
+  *   under CRYPT_SYMBOL_EXPORT_OLD(int, crypt_func_X, ...) macro
+  */
+ 
+-#ifdef __has_attribute
+-#  if __has_attribute(symver)
+-#    define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
+-       __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
+-#  endif
++#if HAVE_ATTRIBUTE_SYMVER
++#  define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
++     __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
+ #endif
+ 
+ #if !defined(_CRYPT_SYMVER) && defined(__GNUC__)
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
