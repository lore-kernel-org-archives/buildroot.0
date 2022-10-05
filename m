Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 09:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA8D940CD0;
	Wed,  5 Oct 2022 09:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA8D940CD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVbXuHLpoLJa; Wed,  5 Oct 2022 09:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E40F740CD9;
	Wed,  5 Oct 2022 09:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E40F740CD9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09AFC1BF95D
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF8A740C58
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF8A740C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5WRLiZHT0Aw for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 09:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC58740C7B
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC58740C7B
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 09:11:14 +0000 (UTC)
Received: from iago.. (unknown [151.19.224.153])
 by serv15.avernis.de (Postfix) with ESMTPSA id 5462EBDE2FB0;
 Wed,  5 Oct 2022 11:11:11 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 11:10:29 +0200
Message-Id: <20221005091032.3014-2-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409160921.GA3547512@scaer>
References: <20220409160921.GA3547512@scaer>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 1/4] package/mpd: fix reversed logic in tcp
 disable
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - make this a separate patch 

 package/mpd/mpd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5c15953984..4d73e6de03 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -285,8 +285,9 @@ else
 MPD_CONF_OPTS += -Dsqlite=disabled
 endif
 
+# default setting is 'true'
 ifneq ($(BR2_PACKAGE_MPD_TCP),y)
-MPD_CONF_OPTS += -Dtcp=true
+MPD_CONF_OPTS += -Dtcp=false
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
