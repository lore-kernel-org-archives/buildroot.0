Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95863C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1CB83EE0;
	Tue, 24 May 2022 13:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXfoL8rIkkH3; Tue, 24 May 2022 13:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79BCD82FA2;
	Tue, 24 May 2022 13:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCE91BF983
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41CF381B70
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUxgYAgpNU5j for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:01:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CE0C81975
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D949A86430; Tue, 24 May 2022 12:50:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 14:53:51 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9388b29dd6df5db5085df4fb2a5c5f0eb9b5e26d
X-Git-Newrev: 5c739b156b40b4b8298d0db6ab3405e34b277906
X-Patchwork-Hint: ignore
Message-Id: <20220524125009.D949A86430@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/aircrack-ng: fix
 sqlite3 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c739b156b40b4b8298d0db6ab3405e34b277906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit a8e9b796c990d2aaaa17c711cefef2918b69bc9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
