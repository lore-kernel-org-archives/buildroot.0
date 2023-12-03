Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B0C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94AC44067F;
	Sun,  3 Dec 2023 16:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94AC44067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhBs6Hkyu9sY; Sun,  3 Dec 2023 16:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D446240629;
	Sun,  3 Dec 2023 16:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D446240629
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 859C61BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C39340900
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C39340900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xS2Km704BL9r for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4006740467
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4006740467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28EF18777D; Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:26:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eb79ff3b951fb756e17d8a06b5608b179ddbd60
X-Git-Newrev: f6a7050d7191b9a534d1d2789ceb72d69f25da83
X-Patchwork-Hint: ignore
Message-Id: <20231203163805.28EF18777D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6a7050d7191b9a534d1d2789ceb72d69f25da83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following NLS build failure raised since the addition of the
package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../src/common/.libs/libcommon.a(libcommon_la-i18n.o): undefined reference to symbol 'libintl_bindtextdomain'

Fixes:
 - http://autobuild.buildroot.org/results/8ab13cf474d732c95a1da65592d950b24b3d474b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speechd/speechd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index c68d466116..7d50f88c1d 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,8 +12,11 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_AUTOPOINT = YES
-SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
-SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
+SPEECHD_DEPENDENCIES = \
+	host-pkgconf dotconf libglib2 libsndfile $(TARGET_NLS_DEPENDENCIES)
+SPEECHD_CONF_ENV = \
+	ac_cv_prog_HELP2MAN="" \
+	LIBS=$(TARGET_NLS_LIBS)
 SPEECHD_CONF_OPTS = \
 	--disable-python \
 	--without-espeak \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
