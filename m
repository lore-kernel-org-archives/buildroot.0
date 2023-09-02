Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58336CA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 118BF40470;
	Sat,  2 Sep 2023 07:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118BF40470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idFnYGlgR3Ef; Sat,  2 Sep 2023 07:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3074E405DC;
	Sat,  2 Sep 2023 07:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3074E405DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0581BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 118B940347
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118B940347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzIDyOhaOJQq for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DFBD4018A
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFBD4018A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AAA9866FD; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:40:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf7926230c7d47dd809e59646a6ff4f7fe35b833
X-Git-Newrev: 7dd5233b5540a950bb25024d2d48de04f07995bc
X-Patchwork-Hint: ignore
Message-Id: <20230902074043.0AAA9866FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: fix another build issue
 with perl >= 5.38
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dd5233b5540a950bb25024d2d48de04f07995bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl 5.38 deprecated smartmatch (~~ and the given/when syntax).
Backport another upstream patch to drop uses of given.

Fixes:
- http://autobuild.buildroot.net/results/727/727aa831881af36394bafef9e13a0dcbd9d0db3a

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Remove-smartmatch-usage-from-gen-crypt-h.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch b/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
new file mode 100644
index 0000000000..444896b53f
--- /dev/null
+++ b/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
@@ -0,0 +1,61 @@
+From 95d6e03ae37f4ec948474d111105bbdd2938aba2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
+Date: Sun, 25 Jun 2023 01:35:08 +0200
+Subject: [PATCH] Remove smartmatch usage from gen-crypt-h
+
+Needed for Perl 5.38
+
+Upstream: https://github.com/besser82/libxcrypt/commit/95d6e03ae37f4ec948474d111105bbdd2938aba2
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ build-aux/scripts/gen-crypt-h | 31 ++++++++++++++-----------------
+ 1 file changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/build-aux/scripts/gen-crypt-h b/build-aux/scripts/gen-crypt-h
+index 12aecf6d..b113b791 100644
+--- a/build-aux/scripts/gen-crypt-h
++++ b/build-aux/scripts/gen-crypt-h
+@@ -12,7 +12,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:std :utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+
+@@ -37,22 +36,20 @@ sub process_config_h {
+     local $_;
+     while (<$fh>) {
+         chomp;
+-        # Yes, 'given $_' is really required here.
+-        given ($_) {
+-            when ('#define HAVE_SYS_CDEFS_H 1') {
+-                $have_sys_cdefs_h = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
+-                $have_sys_cdefs_begin_end_decls = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_THROW 1') {
+-                $have_sys_cdefs_throw = 1;
+-            }
+-            when (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
+-                $substs{XCRYPT_VERSION_STR}   = $1;
+-                $substs{XCRYPT_VERSION_MAJOR} = $2;
+-                $substs{XCRYPT_VERSION_MINOR} = $3;
+-            }
++
++        if ($_ eq '#define HAVE_SYS_CDEFS_H 1') {
++            $have_sys_cdefs_h = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
++            $have_sys_cdefs_begin_end_decls = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_THROW 1') {
++            $have_sys_cdefs_throw = 1;
++        }
++        elsif (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
++            $substs{XCRYPT_VERSION_STR}   = $1;
++            $substs{XCRYPT_VERSION_MAJOR} = $2;
++            $substs{XCRYPT_VERSION_MINOR} = $3;
+         }
+     }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
