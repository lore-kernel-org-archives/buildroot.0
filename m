Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBA6C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BD740597;
	Sun, 16 Jun 2024 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vry5WHT86hT; Sun, 16 Jun 2024 14:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39B9F40575
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B9F40575;
	Sun, 16 Jun 2024 14:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 840121BF36E
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7123A60657
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju8ilzEYr4UR for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 14:32:04 +0000 (UTC)
X-Greylist: delayed 760 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 16 Jun 2024 14:32:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99B1360618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B1360618
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:128:8a00::1000:4ca; helo=mxd-1-4ca.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
Received: from mxd-1-4ca.seznam.cz (mxd-1-4ca.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:4ca])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99B1360618
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 14:32:02 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-545d6b795f-xc798
 (smtpc-mxd-545d6b795f-xc798 [2a02:598:128:8a00::1000:4ca])
 id 6f0e6310efe9098d6d7a5d7e; Sun, 16 Jun 2024 16:32:00 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-5b77f69495-g4m7t (szn-email-smtpd/2.0.19) with ESMTPA
 id a1900334-1689-46d0-b6c6-baae256bb545;
 Sun, 16 Jun 2024 16:19:18 +0200
Date: Sun, 16 Jun 2024 16:19:14 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <Zm70YkR_roWwY-ms@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1718548320;
 bh=btOn8XxdxkwhBQ+qfcFDyM+EFC5NEK54Fxa3vglddqA=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition;
 b=S7KPjto4I2+sYpWd8aBzJ9IoT5+bBoyr8tyzbfd/hbUB1+UOrZsHk9Bbvj1Ccfebx
 FWRB7Yse15LHi7+qVuUZWqHqxvIjziGVecKMxcXQh9A5ReUI+6C+mqGRATcOwDJ8Gx
 DNPDN1OBjYxRws3nqz7JuYKM8yPUzFGO+7ZU2N5sG1VOHCib0ZeK29M6sxGopGPXL/
 t5+vtkCq87RKEA4pRaSn36RoLWUK7CrYYbSFKfCtqE25A/EvxoAEL+uXN9A9iPh+2z
 bVxfp5/fK+MdnpPXiEKeBJKF4F0cL3K8JTl5uAE17IEi2ZGvJmVPPro5k1SygDqrXt
 +WJvxjOb3yXAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=S7KPjto4
Subject: [Buildroot] [PATCH 1/1] package/ubus: remove obsolete systemd option
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ENABLE_SYSTEMD option has been removed from ubus by commit:
96ab0b3032f5 ubusd: remove systemd socket activation support

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 package/ubus/ubus.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 1f9891411a..cc2ed81786 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -25,13 +25,6 @@ else
 UBUS_CONF_OPTS += -DBUILD_LUA=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-UBUS_DEPENDENCIES += systemd
-UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
-else
-UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_UBUS_EXAMPLES),y)
 UBUS_CONF_OPTS += -DBUILD_EXAMPLES=ON
 else
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
