Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489B2C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC7AA410C7;
	Fri, 28 Oct 2022 06:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7AA410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rUxA3Guy89n; Fri, 28 Oct 2022 06:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE60410C8;
	Fri, 28 Oct 2022 06:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE60410C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 424FA1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B1A360A91
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1A360A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7XweHXIyvdL for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5294960A8D
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5294960A8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42ACF8739C; Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:45:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 400b63432ed0b0c2dee889cf4f2fed88c56a0eb5
X-Git-Newrev: ce2e91bdc53a1daed8ec6845a0fdb1888de87408
X-Patchwork-Hint: ignore
Message-Id: <20221028064624.42ACF8739C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tzdata: install leap-seconds.list
 into results
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce2e91bdc53a1daed8ec6845a0fdb1888de87408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add leap-seconds.list to installed files so it can be used by other packages

specifically, ntpd's ntp.conf can now include:
leapfile /usr/share/zoneinfo/leap-seconds.list

Signed-off-by: David Johnson <dave-git@centerclick.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tzdata/tzdata.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 21ea94ecad..7a1a77fcd9 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -59,7 +59,7 @@ endef
 
 define HOST_TZDATA_INSTALL_CMDS
 	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/zoneinfo
-	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(@D)/leap-seconds.list $(HOST_DIR)/share/zoneinfo
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
