Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD92C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 718D060B9F;
	Sun, 24 Apr 2022 15:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4oYYIu7myYy; Sun, 24 Apr 2022 15:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6054160B77;
	Sun, 24 Apr 2022 15:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E578C1BF383
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7E5400E2
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZTXky7Klup1 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B96FE40158
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 31E988421E; Sun, 24 Apr 2022 15:43:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 16:53:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdfe7d17b395813f66e231ed183a7b75afb14b8f
X-Git-Newrev: f7744aba7bcc7f4ad38ff4bba3d0c37969544fce
X-Patchwork-Hint: ignore
Message-Id: <20220424154321.31E988421E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: doesn't build with zlib-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7744aba7bcc7f4ad38ff4bba3d0c37969544fce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
