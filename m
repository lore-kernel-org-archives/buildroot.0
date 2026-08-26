Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DEEC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12390404F4;
	Wed, 26 Aug 2026 20:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFtLQqpQopNt; Wed, 26 Aug 2026 20:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787776398;
	bh=HwzRKE+6JUnGh613One9VbV3Z5nbj1gNmUYtdfbgUk0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rQWg0EifPlDei7aJRMkOiLJDADe+0++G027AxCjNJifXHF1Yxb+KwA7AbRxur1KKT
	 r/wt6FB+8Y8b6Dnhq6b+ktIB6nsA1N4RnAlt8a2ygdlXtOsEaQUsIfzfvYsuTxtbru
	 8Lb9qgUDB7Lc19oQ9i8PHq270EKATIOox74ruEK7Ef4La44oqVKgAEHToSwJhiUbW1
	 pcIj6nV9Wzp5xS5C2s15fddnJzV/e3B7k5TGhLaj0g3cV2zcaNCALnVn6luqZXqnJw
	 8k5Lizn+9P6/kIkFbR2S5hMKbAOSSrBe5VVvhO2RXkP+HaaMKo01dYs0VIgJo9NyIe
	 PnS/tKtjvSGwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C99406DF;
	Wed, 26 Aug 2026 20:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 129BE3AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4F67605EE
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Foz72YfLUM1F for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:33:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E283F605E6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 72C0F1A1852;
 Wed, 26 Aug 2026 20:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33FC2604EC;
 Wed, 26 Aug 2026 20:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B58A11C78051; 
 Wed, 26 Aug 2026 22:33:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Wed, 26 Aug 2026 22:33:02 +0200
Message-ID: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/perl: fix build issue with musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...gure-keep-_GNU_SOURCE-in-build-flags.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
