Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D538C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669E2404F7;
	Wed,  2 Feb 2022 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gATqjcNKal_9; Wed,  2 Feb 2022 20:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85AAF40339;
	Wed,  2 Feb 2022 20:37:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF871BF346
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8522240590
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J88EjYj4yekg for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 20:37:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FFD400D3
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 20:37:27 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FMNZntAcD0FuyFMNZn4WZ6; Wed, 02 Feb 2022 21:37:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643834246; bh=vU9/a8RoD7fYI0QXpp97S3r0RGhz11y0cekNowvhNsc=;
 h=From:To:Subject:Date:MIME-Version;
 b=PfG12BVH6aHnuIMmITlQT4IW8ZlFxxtGEtkbIT0IlSx0PG0foiL2JaiZ8Wwqgrp1F
 W7DhhEUlPEjD4ZY8U98+07cObgiQVY4x6hgke+TOYMwHjLL9q8X8hGCCZbzOtvP9+h
 qp59J8rUVXHiMUGlZcyisFg8QfVJDV3pCJbLp+gQB7/Dck+KOfcVyFETvtSPut2fIM
 P5A+jfsflFgngzbFhQcyNaLKhdEUgRZhT2Px+j8GtZwxAwBkmkUy2mYMmq1nk6l1xr
 9ZZV/YMxaLRbGihOS//ijs8ehaTkmWSsSm18C/ipqaIV7q4lSBEmbUaSgzvExm3tpN
 wsexkFcFN86Ag==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 21:37:25 +0100
Message-Id: <20220202203725.2115889-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDZALvRZJ8p6OB3r4m3oYMw74CRiHV0Li12H3mj57sZqQzEQy5kBECkdnEPcJz8QcwFjtLNiGNWAiORslVDTmNvhSjI3UByXsHCu57xPlafqbGfUumJ6
 P+F4l3W2odjEgOgO6ImeVNSg3rIKlxPzxqBqjdRvxoao3z2M+lHrTpg9z2VFG77lNdWc5CxHWrEjT8AdL7kMxF2HkllgriyTs5ZP9d50ObweV2oOEU49Ussj
 EhGJ764aJ7YT8xnfn+pl9WBYoygUk193KCr567rQG9M=
Subject: [Buildroot] [PATCH] package/cryptsetup: fix build failure with
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream[1] to fix the build failure after my
suggestion[2] to imitate what I've done with libfuse[3].

[1]: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/275?commit_id=5f71b3d63181aa88a68f7f71eab8801f2d8d2cde
[2]: https://gitlab.com/cryptsetup/cryptsetup/-/issues/709
[3]: https://github.com/libfuse/libfuse/pull/620/commits/3aba09a5c56e017746c5c1652dbc845f4db7374a

Fixes:
http://autobuild.buildroot.net/results/bad/bad4d01fde3191e4d481a8e9dae18df3b1a94537/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...d-check-program-for-symver-attribute.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
