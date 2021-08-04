Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77E0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:26:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265C660F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 265C660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD59F403B3;
	Wed,  4 Aug 2021 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-jm0hdVqw0h; Wed,  4 Aug 2021 21:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B0640387;
	Wed,  4 Aug 2021 21:26:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6579C1BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D27605BB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZC4_KJ9bH6fF for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B609600C4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 57C0C8B7C5; Wed,  4 Aug 2021 21:26:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:26:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a01212089e44731a4f8f5577f5c0d1df4b5942
X-Git-Newrev: 602ff66bf7e85a5962025b6640ced7421b539fb2
X-Patchwork-Hint: ignore
Message-Id: <20210804212635.57C0C8B7C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: fix static build
 with libsndfile
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=602ff66bf7e85a5962025b6640ced7421b539fb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with libsndfile raise since
commit dbc6e9e9f385995eb10bbfb0bb08e7674100ce66:

/tmp/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'

Fixes:
 - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...figure.ac-find-sndfile-through-pkg-config.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
new file mode 100644
index 0000000000..bd97ec0c3d
--- /dev/null
+++ b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
@@ -0,0 +1,43 @@
+From 900b1827c55cc6020b3242640075174c2e6b12a5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 22:16:40 +0200
+Subject: [PATCH] configure.ac: find sndfile through pkg-config
+
+Find sndfile through pkg-config to retrieve sndfile dependencies such as
+flac and avoid the following static build failure:
+
+/tmp/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
+flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1263]
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f77087c5..9b982c51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -304,7 +304,14 @@ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP
+ if test "x$with_convolution" = "xyes" ; then
+   AM_INIT_AUTOMAKE([subdir-objects])
+   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
+-  AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  if  test "x${with_pkg_config}" = xyes ; then
++    PKG_CHECK_MODULES(
++      [sndfile], [sndfile],
++      [CFLAGS="${sndfile_CFLAGS} ${CFLAGS}"
++      LIBS="${sndfile_LIBS} ${LIBS}"], AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  else
++    AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  fi
+ fi
+ AM_CONDITIONAL([USE_CONVOLUTION], [test "x$with_convolution" = "xyes"])
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
