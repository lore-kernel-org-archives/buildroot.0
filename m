Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFB5C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0AA560FE7
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0AA560FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8811382F31;
	Thu, 26 Aug 2021 22:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArnAkx3NWdzp; Thu, 26 Aug 2021 22:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8D582F32;
	Thu, 26 Aug 2021 22:18:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0E61BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D77E4078A
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cuSSLdHDq4b for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F19B40791
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F134C8DC50; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:29:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93be993591d2f45bbcab7cb88271ff081dec9bac
X-Git-Newrev: 23bead3e3aa68d96be0b485e7b91c96eaab56b67
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.F134C8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/seatd: fix build with
 gcc < 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=23bead3e3aa68d96be0b485e7b91c96eaab56b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since its addition in commit daae31149017cbf8b03634cfc56da132f7e1ad83,
seatd fails to build with gcc < 7 because it unconditonally uses
-Wimplicit-fallthrough which is only available since gcc 7.1 and
https://github.com/gcc-mirror/gcc/commit/81fea426da8c4687bb32e6894dc26f00ae211822
resulting in the following build failure:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'

Fixes:
 - http://autobuild.buildroot.org/results/0ee6816a7cceebdafd07612677a594bdf68e0790

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-meson.build-fix-build-with-gcc-7.patch    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch b/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
new file mode 100644
index 0000000000..0e9f437cc3
--- /dev/null
+++ b/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
@@ -0,0 +1,48 @@
+From 0b32c33978fbe8772df6d185c9b9d646c442dc5d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Aug 2021 19:00:35 +0200
+Subject: [PATCH] meson.build: fix build with gcc < 7
+
+Test if -Wimplicit-fallthrough is available before using it as it has
+been added only since gcc 7.1 and
+https://github.com/gcc-mirror/gcc/commit/81fea426da8c4687bb32e6894dc26f00ae211822
+and so it will raise the following build failure with gcc < 7:
+
+arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0ee6816a7cceebdafd07612677a594bdf68e0790
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kennylevinsen/seatd/pull/1]
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1131b4b..c366a59 100644
+--- a/meson.build
++++ b/meson.build
+@@ -31,7 +31,6 @@ add_project_arguments(
+ 		'-Wold-style-definition', # nop
+ 		'-Wpointer-arith',
+ 		'-Wstrict-prototypes',
+-		'-Wimplicit-fallthrough',
+ 		'-Wmissing-prototypes',
+ 		'-Wno-unknown-warning-option',
+ 		'-Wno-unused-command-line-argument',
+@@ -45,6 +44,11 @@ add_project_arguments(
+ 	language: 'c',
+ )
+ 
++cc = meson.get_compiler('c')
++if cc.has_argument('-Wimplicit-fallthrough')
++	add_project_arguments('-Wimplicit-fallthrough' , language : 'c')
++endif
++
+ if ['debugoptimized', 'release', 'minsize'].contains(get_option('buildtype'))
+ 	add_project_arguments('-D_FORTIFY_SOURCE=2', language: 'c')
+ endif
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
