Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C5C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B4060ACD;
	Thu, 28 Jul 2022 19:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B4060ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSENdkG7e3PQ; Thu, 28 Jul 2022 19:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F5160AB5;
	Thu, 28 Jul 2022 19:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F5160AB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E68811BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF96E402F9
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF96E402F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oOalafh3fc0 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:37:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4441F402E7
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4441F402E7
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:37:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id w5so3384181edd.13
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwT52TGUZYZVx2jTkzOJ4MkGG0SYq1DcCP/CHEDUPJ0=;
 b=Qu371qycWqAKZw/2+d3EERcc+AY0w/TfWiekkx+ao8Ni2QqSZsGZ8YcP4HmvVlKJ9y
 MyBTT1Llmz0xtxczyHeK7qJi9WYVc0lzHW396JZxryYphaTEJCFZ4Z44CzjcNjC3uGMg
 3jeFn9cHqMbrOMvqYagbFMGs3TwZXaizF1VDn+O7Exp0J2fspBaR66cuAabEUTq65QUN
 Xr9tQcmSfuzWto+yl/23/rkeBkP7IgOd3K/N1VnLumCrQ54IOCAbyG0/+k5Vyb5UXtW4
 nMNGjAveoyNGg4q8utKbizPLXuJGkiZFpISrac6jynaySUXDRW7Oim8IOdWTCx60h6zJ
 EG3w==
X-Gm-Message-State: AJIora9W8RvUzGhudkMcYok003omq+yiGlAlPXiOkkrIu05CRQ84ta04
 VSCXkT0N8T8uTaDdEFVUkmbGliocRdBVAPbI
X-Google-Smtp-Source: AGRyM1u7QHztaFcal9KbMFfH0wkQbF0Nh76XvMnkb05OXPhZ6t1/B3wmhgev8ylXPGqmlRlddGgiMw==
X-Received: by 2002:a05:6402:2816:b0:434:ed38:16f3 with SMTP id
 h22-20020a056402281600b00434ed3816f3mr491016ede.116.1659037050042; 
 Thu, 28 Jul 2022 12:37:30 -0700 (PDT)
Received: from arnoutx1.. (ip-185-104-137-32.ptr.icomera.net. [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a50d74c000000b0043ba1ecb0dfsm1218291edj.75.2022.07.28.12.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 12:37:29 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:37:25 +0200
Message-Id: <20220728193726.1465662-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwT52TGUZYZVx2jTkzOJ4MkGG0SYq1DcCP/CHEDUPJ0=;
 b=f4h9aTp7ZPaU2IvfPdLW0MR0tW/DpwxlwDwD21dRPMkQlu6KFPCMA5Rq/TNLKFhlHj
 DZNq/LfZ2P8RRCbfgOp1ynmGsjWXEuUUiMjGYz0IQ4nwxatg4vsrFA1ddhgfKf+mrHWV
 GvHuoG8PMUrzk5ppr+OW0nK/Qc7ixgg0ObCnqoMQdrmV49tNOz2bHpP2Xxz3OH9KzMqf
 M2k7G/+dlkBMyzCJd8c4rSpnloUdUVsCvL/y8SsZ4kHBaOkYpqSw3+aplFD7N9f4A/D+
 qwc5idwPqAieGj1iVfyoZIpFY2PzPdmGccZoWWw7FgOkln8CF7C4UJk2hZNloavS4N2u
 D9IQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f4h9aTp7
Subject: [Buildroot] [PATCH 1/2] package/eudev: remove HOST_EUDEV_SYSCONFDIR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The HOST_EUDEV_SYSCONFDIR is a leftover from before eudev, when udev was
still built from systemd sources. Now that we have a separate file for
eudev and systemd, there's no need any more to have a condition there.
In addition, its usage in systemd.mk has been removed.

Remove the HOST_EUDEV_SYSCONFDIR variable and instead use /etc directly
in eudev.mk.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/eudev/eudev.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 705370689d..f050563feb 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -57,13 +57,12 @@ endef
 
 HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 
-HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
 HOST_EUDEV_CONF_OPTS = \
 	--prefix=/usr \
 	--sbindir=/sbin \
 	--libexecdir=/lib \
 	--with-rootlibdir=/lib \
-	--sysconfdir=$(HOST_EUDEV_SYSCONFDIR) \
+	--sysconfdir=/etc \
 	--disable-blkid \
 	--disable-introspection \
 	--disable-kmod \
@@ -86,7 +85,7 @@ HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 # of tharget/, not the real one, so the files are still available on
 # re-builds (foo-rebuild, etc...)
 define HOST_EUDEV_RM_HWDB_SRC
-	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
+	rm -rf $(TARGET_DIR)/etc/udev/hwdb.d/
 endef
 HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
 
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
