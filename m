Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF2CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C7C160FA7;
	Thu, 21 Apr 2022 21:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVuLvkFddrb8; Thu, 21 Apr 2022 21:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A0F60F89;
	Thu, 21 Apr 2022 21:02:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2391C1190
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A45419F0
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlAN_z1doV3C for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F1141700
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 534DA84105; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a441e4cf967094f2e2429a37dd2107bb91d2a81
X-Git-Newrev: a8e9b796c990d2aaaa17c711cefef2918b69bc9d
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.534DA84105@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aircrack-ng: fix sqlite3 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8e9b796c990d2aaaa17c711cefef2918b69bc9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.2 in
commit 242227dd86efaaec7c785b32a14e8133f2e86dec:

powerpc-buildroot-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
In file included from src/aircrack-ng/aircrack-ng.c:54:
/usr/include/math.h:476:21: error: '_Float128' is not supported on this target
  476 | # define _Mdouble_  _Float128
      |                     ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/83a114ce197fb6af53a26ed68184cf3bbb30c8a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/aircrack-ng/aircrack-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index ff87766d6f..95cda7c5a6 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -69,7 +69,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 AIRCRACK_NG_DEPENDENCIES += sqlite
-AIRCRACK_NG_CONF_OPTS += --with-sqlite3
+AIRCRACK_NG_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 else
 AIRCRACK_NG_CONF_OPTS += --without-sqlite3
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
