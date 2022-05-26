Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BB2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 604C7412F3;
	Fri, 27 May 2022 07:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkEYOBH343Zw; Fri, 27 May 2022 07:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1D541302;
	Fri, 27 May 2022 07:58:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A321D1BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91809843A3
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDtt989SFj_v for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED3E484367
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F69A865B7; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 23:21:56 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 02d193545d9b70330ef8bbdcb13bdb9af34cbea6
X-Git-Newrev: f3becd1c1730009078fc0ae51712dd59caed634d
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.1F69A865B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/clamav: doesn't
 build with zlib-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3becd1c1730009078fc0ae51712dd59caed634d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

clamav doesn't build with zlib-ng since bump to version 1.9.9-b1 in
commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of FAR:
https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

In file included from nsis/nsis_zlib.h:32,
                 from nsis/nulsft.c:38:
nsis/nsis_zutil.h:36:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
   36 | typedef uch FAR uchf;
      |                 ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/524ee31face8be6a813829b036c4d6134ee5ca98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7744aba7bcc7f4ad38ff4bba3d0c37969544fce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 990a818b5c..2857f9cbf4 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  ClamAV is an open source antivirus engine for detecting
 	  trojans, viruses, malware & other malicious threats.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
