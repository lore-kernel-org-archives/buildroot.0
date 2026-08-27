Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29ABC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF2D40809;
	Thu, 27 Aug 2026 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERpMteCfz-nD; Thu, 27 Aug 2026 20:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787862851;
	bh=nV0MWSasLyeXeL01jIpeDKzKI6JNm1V7OmBxUrZNaP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hEkw2xhP9N40m3/Qclv+JM1cISo7vfDAnlzLoOmuc03ZDy4yDKV4z/k8h8BZrUZov
	 G6UmNOS5CIztHMw1eVS15P4giOW4NNXzPKy2k+lIj3JjnNwW02tRJTRjWhEtX5zLHw
	 geRYKmGn4EAB/YBVMh3eLeTwXJU7yCpgmeOA2oC1LOFDjhh6I9gO3mfp8g+hw9WeBe
	 RJRBSvyYMqt0iJ6mZqYLedmz21mSirMVU0wpg1AsQ3F68wC2BFn9cjm1bZ6IzGWSVm
	 Ff1S7kggSSiKrfl/bjAomh75RQVTGngAAUB1L9kIIQLPiJ2HLAWOkQJuokFpCzzidi
	 elvD6WdLfLsiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743AB407E7;
	Thu, 27 Aug 2026 20:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E662D334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7EA86070B
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES4xySfnc4jP for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 205FE606CC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 622CC920D9; Thu, 27 Aug 2026 20:33:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:29:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7538f675d7024ec1f83086e39a40469098e59955
X-Git-Newrev: d950fff290b1318fd72c7f09fedbd1b87b96155f
X-Patchwork-Hint: ignore
Message-Id: <20260827203312.622CC920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: fix build issue with musl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d950fff290b1318fd72c7f09fedbd1b87b96155f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

perl does not build with musl due to memrchr() being unavailable. This
is caused by a perl-cross bug, which does function availability
detection with _GNU_SOURCE defined, but then does the build without
_GNU_SOURCE defined. At least OpenEmbedded and NixOS have faced the
same issue, and worked it around in slightly different ways.

On our side, we create a patch, which was submitted upstream, to solve
the issue.

This issue has been introduced in perl-cross commit b40c560f5d5e,
which was first merged in perl-cross release 1.4.1. From a Buildroot
perspective, we bumped from perl-cross 1.4 to 1.4.1 in commit
8a289667f5dba6fffb3a21faa14517e9b49726a4, which was merged
2023.05. And indeed the build failure can be reproduced even on our
LTS 2025.02.x, so the fix needs to be backported there.

It should be noted that even if the patch is against perl-cross, we
add it to package/perl/ directly, as patches in perl are applied after
perl has been extracted *and* perl-cross has been extracted on top.

Fixes:

  https://autobuild.buildroot.net/results/3e47ade0963642988fd8e1be9a6e8042700619ec/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...configure-keep-_GNU_SOURCE-in-build-flags.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
new file mode 100644
index 0000000000..497e58c502
--- /dev/null
+++ b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
@@ -0,0 +1,55 @@
+From 6bdfdff24f4a7d17d3b7d9d02bca3eac11c235a4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 26 Aug 2026 19:34:39 +0200
+Subject: [PATCH] configure: keep _GNU_SOURCE in build flags
+
+The checkfunc() function probes available libc functions with _GNU_SOURCE
+defined. The generated config.sh did not retain that define in ccflags, so
+the actual cross build could use functions whose prototypes remain hidden by
+feature-test macros. This breaks musl builds, where memrchr is declared only
+with _GNU_SOURCE.
+
+To fix this, append _GNU_SOURCE to explicit -Dccflags values while parsing
+configure arguments. Such values are locked before configure_tool.sh can
+append flags. This keeps the function-availability checks and subsequent
+compilation in the same feature set, including when flags are supplied
+through CFLAGS.
+
+This fixes the regression introduced by b40c560f5d5e (configure_func.sh: Add
+_GNU_SOURCE define and function signatures).
+
+It fixes the following build issue with musl:
+
+    In file included from op.c:163:
+    op.c: In function 'Perl_newATTRSUB_x':
+    perl.h:2385:25: error: implicit declaration of function 'memrchr'; did
+    you mean 'memchr'? [-Wimplicit-function-declaration]
+     2385 | #    define my_memrchr  memrchr
+          |                         ^~~~~~~
+
+This issue is worked around in several build systems:
+
+- In OpenEmbedded:
+  https://github.com/openembedded/openembedded-core/commit/6422e62
+
+- In NixOS:
+  https://github.com/NixOS/nixpkgs/pull/441527
+
+Fixes: https://github.com/arsv/perl-cross/issues/158
+Upstream: https://github.com/arsv/perl-cross/pull/180
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+diff --git a/cnf/configure_args.sh b/cnf/configure_args.sh
+index 5bc4c6b..65ffc96 100644
+--- a/cnf/configure_args.sh
++++ b/cnf/configure_args.sh
+@@ -225,6 +225,9 @@ while [ $i -le $# -o -n "$n" ]; do
+ 		host|target|build) ;;
+ 		# original Configure options
+ 		D)
++			if [ "$k" = 'ccflags' ]; then
++				v="$v -D_GNU_SOURCE"
++			fi
+ 			setordefine "$k" "$x" "$v" 'define' 'true'
+ 			;;
+ 		U)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
