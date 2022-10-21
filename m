Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410DDC38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C7260E55;
	Fri, 21 Oct 2022 18:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C7260E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpDFnwdSf54D; Fri, 21 Oct 2022 18:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2021860A77;
	Fri, 21 Oct 2022 18:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2021860A77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2B001BF863
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAC0F40982
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC0F40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PYMs5rr8sKO for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:58:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E42CA40223
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E42CA40223
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC94886F52; Fri, 21 Oct 2022 18:58:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72e8471b5cf4a011cd87692719bd4f69d9cc526c
X-Git-Newrev: b3b962c93579f02775fbf057f317bcd58772131e
X-Patchwork-Hint: ignore
Message-Id: <20221021185834.CC94886F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: drop legacy cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3b962c93579f02775fbf057f317bcd58772131e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gpsd-3.22, the systemd service files no longer contain hard-coded
paths to /usr/local/, but use @SBINDIR@ which is replaced appropriately
at build time, and contains the correct path.

Drop the legacy fixup now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gpsd/gpsd.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0c7018f26d..b8526c0260 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -213,14 +213,6 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-# systemd unit files are installed automatically, but need to update the
-# /usr/local path references in the provided files to /usr.
-define GPSD_INSTALL_INIT_SYSTEMD
-	$(SED) 's%/usr/local%/usr%' \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl@.service
-endef
-
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
