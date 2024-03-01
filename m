Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E960DC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A980A41C96;
	Fri,  1 Mar 2024 18:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbNYWNl4VzAs; Fri,  1 Mar 2024 18:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8804341CBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8804341CBC;
	Fri,  1 Mar 2024 18:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4AE1BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1563A41C68
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2--FtmXXc-q for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22FCE400D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22FCE400D0
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08C6487EF6; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:06:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66a202325a98a48013bad70de29d88f733ce5903
X-Git-Newrev: d2c99d32bf4d0c4f77377d5a8fd4fb86f22e7caa
X-Patchwork-Hint: ignore
Message-Id: <20240301180911.08C6487EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rhash: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2c99d32bf4d0c4f77377d5a8fd4fb86f22e7caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following NLS build failure raised since bump to version 1.4.4
in commit f9b465c66c42e936a80292f7854f605d4c88564e:

./configure: line 879: -lintl: command not found

[...]

/home/buildroot/autobuild/run/instance-0/output-1/host/bin/xtensa-linux-gcc calc_sums.o hash_print.o common_func.o hash_update.o file.o file_mask.o file_set.o find_file.o hash_check.o output.o parse_cmdline.o rhash_main.o win_utils.o librhash/librhash.so.1.4.4   -o rhash
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: calc_sums.o:(.literal.rename_file_by_embeding_crc32+0x10): undefined reference to `libintl_gettext'

Fixes: f9b465c66c42e936a80292f7854f605d4c88564e
 - http://autobuild.buildroot.org/results/f8dd8ea6c0c9cd428355e3720e679a078b8e0f8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...correct-assigment-in-the-configure-script.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch b/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch
new file mode 100644
index 0000000000..4a9a81dbf5
--- /dev/null
+++ b/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch
@@ -0,0 +1,24 @@
+From c804982d1b24c6533118b3068d2cfdca685076f3 Mon Sep 17 00:00:00 2001
+From: Aleksey Kravchenko <rhash.admin@gmail.com>
+Date: Mon, 7 Aug 2023 01:00:37 +0300
+Subject: [PATCH] Fix #243: Incorrect assigment in the configure script
+
+Upstream: https://github.com/rhash/RHash/commit/c804982d1b24c6533118b3068d2cfdca685076f3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 39ef8c1..63cbd8d 100755
+--- a/configure
++++ b/configure
+@@ -877,7 +877,7 @@ if test "$OPT_STATIC" = "no"; then
+   RHASH_TEST_OPTIONS=--shared
+   test "$INSTALL_LIB_SHARED" = "auto" && INSTALL_LIB_SHARED=yes
+   test "$INSTALL_LIB_STATIC" = "yes"  && RHASH_BUILD_TARGETS="$RHASH_BUILD_TARGETS \$(LIBRHASH_STATIC)"
+-  RHASH_LDFLAGS=$RHASH_LDFLAGS $GETTEXT_LDFLAGS
++  RHASH_LDFLAGS=$(join_params $RHASH_LDFLAGS $GETTEXT_LDFLAGS)
+ else
+   LIBRHASH_TYPE=static
+   LIBRHASH_PATH="\$(LIBRHASH_STATIC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
