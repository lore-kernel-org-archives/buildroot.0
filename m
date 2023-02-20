Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69EFC677F1
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8466F822E3;
	Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8466F822E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osTFth17gan4; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D617B822DD;
	Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D617B822DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4C91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A5E461040
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5E461040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biTBO9qR_Eoa for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3001B6100B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3001B6100B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 207EA8648F; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:51:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff7c37e57419aeb2fb63ebc21bad9696aaaba2b4
X-Git-Newrev: 06af305874abc1eb4bb98dbd8aabe071fa5d77bc
X-Patchwork-Hint: ignore
Message-Id: <20230220205145.207EA8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: disable pcre
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06af305874abc1eb4bb98dbd8aabe071fa5d77bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable pcre to avoid the following build failure if pcre-config is
found on host raised since bump to version 2.9.7 in commit
42e34cf10f9eb037aa8c48a4fb9e8f521901b983:

/home/thomas/autobuild/instance-0/output-1/per-package/modsecurity2/host/bin/../lib/gcc/mips64el-buildroot-linux-gnu/11.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: cannot find -lpcre: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/f4864f8cc1d07e357f6e5f8302c19ae94e9cf3af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modsecurity2/modsecurity2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index c251291e64..88bbf3bb29 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -21,6 +21,7 @@ MODSECURITY2_CONF_OPTS = \
 	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
 	--without-curl \
 	--without-lua \
+	--without-pcre \
 	--without-yajl \
 	--without-ssdeep
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
