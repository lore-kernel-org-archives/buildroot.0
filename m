Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843EFEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 15:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E77660B4C;
	Sat,  8 Jul 2023 15:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E77660B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jE37o_2VXLAo; Sat,  8 Jul 2023 15:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF1C60B30;
	Sat,  8 Jul 2023 15:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF1C60B30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8FAD1BF4E5
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 15:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A444281E1A
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 15:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A444281E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1H-QEY6feBa for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 15:42:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68AD81DFC
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 15:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68AD81DFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C26AF85EDB; Sat,  8 Jul 2023 15:42:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jul 2023 17:41:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7e4f557f5c5874c84d6ae2e28d752603e18ab3f
X-Git-Newrev: 40c7d10b2be015ef13557adb5841fa7d2795048b
X-Patchwork-Hint: ignore
Message-Id: <20230708154249.C26AF85EDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-programmer: link with -latomic
 if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=40c7d10b2be015ef13557adb5841fa7d2795048b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e2b/e2b813fdcbb3862366609affe88551c3036b21b8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dfu-programmer/dfu-programmer.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dfu-programmer/dfu-programmer.mk b/package/dfu-programmer/dfu-programmer.mk
index 3b1589125c..707e143eb3 100644
--- a/package/dfu-programmer/dfu-programmer.mk
+++ b/package/dfu-programmer/dfu-programmer.mk
@@ -18,4 +18,8 @@ endef
 
 DFU_PROGRAMMER_POST_PATCH_HOOKS == DFU_PROGRAMMER_ADD_MISSING_FILE
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DFU_PROGRAMMER_CONF_OPTS += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
