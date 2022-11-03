Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DDDC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B0860FCC;
	Thu,  3 Nov 2022 16:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B0860FCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9IAARSt9M8a; Thu,  3 Nov 2022 16:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79061607CE;
	Thu,  3 Nov 2022 16:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79061607CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4081BF3ED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17E27607CE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 16:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E27607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_AerCPCLDqS for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 16:35:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137A36077D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 137A36077D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 16:35:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a14so3607457wru.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 09:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lV6GxWSE1k6IYaJNFwA7jJncsucIYdClXaj9SzcQY0A=;
 b=Bfl0EmeCFIS1WHYPt+/eRoqNyP4mhfqKvFWluhlOv6uAKTuO/FJiEXy4e/Z+TgIbtC
 /AtwkEvHZsE0mxBScds3dt6jKcQteDlH/KEe8c72OT3D349tVwWsGPCs1zrNmxJQAm8e
 hHLSyRgSU5nS74kr+z7uHstxslmsmHDqu0uDAA7X3ks0/on9XvIytzktzgBlH7E88aB0
 1DEFNRZkDK8uwNEb12PVIV6TeFb819bdEir9AjWps4uyYuqpqy8LdpqCZUIKgU8F9Gwb
 mThsb8QiLie4fPzwYmtrDDkKDS4rgVGAl/V7vA2R/DhrcjS6zkfwnI7sw7NcqvruPwkW
 rerg==
X-Gm-Message-State: ACrzQf2Se2vMrzmJS9j4scllLMIGwZefo+cCe2CfI4zRVHbl/YbGAV7k
 UC+D81KlugxHBCS8DF8x4QxGak+cNkE=
X-Google-Smtp-Source: AMsMyM5pHW2+NGZNIq5opfJv/hide7oFtmpCS9aYzG/jhdcNNK5T+dhmQMzcTzCbcg2x4bj7dBBRWg==
X-Received: by 2002:adf:eb0b:0:b0:236:bdb4:4e8 with SMTP id
 s11-20020adfeb0b000000b00236bdb404e8mr16791934wrn.667.1667493312746; 
 Thu, 03 Nov 2022 09:35:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg15-20020a05600c3c8f00b003cf894dbc4fsm444952wmb.25.2022.11.03.09.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:35:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 17:34:55 +0100
Message-Id: <20221103163456.1132806-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lV6GxWSE1k6IYaJNFwA7jJncsucIYdClXaj9SzcQY0A=;
 b=SoxzIiUI7TPHrMWJoH8ObCa+qPNhHNmkbNyuayiv08uwTqkZy+2+A551D7hr+FHNbZ
 3lE1FzPLBC1qWgAU+4c/cxSp6sa3uPYVD9Uc7iJeZoUIq9gcSknRTS3tdDv+jBwAafBc
 eBWqCCc8EBi+Jwi5Xg+reiBccMSbtS9c7/xuMagnU02sTzb1C7fQHp3L+hSkg7lcGqbH
 sj6mZ5e1OLV2BtPQPJPcDSrvxvhqBu1iOI0kq8Qu9j3L124WkySg8wot6CySVtzWLeHf
 I3J6ZFPt1HyT/TmQ/loJ9WtYXU1bXyo0qbHjWIwYPsAOu1Hulg8+/h5EfmjZXAKWDKj2
 X5xQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SoxzIiUI
Subject: [Buildroot] [PATCH 1/2] package/ipmitool: drop ncurses dependency
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ncurses is not a dependency since bump to version 1.8.19 in commit
8317065ecb4979fe43c466f7e5a7f6dc281bd10d and
https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmitool/Config.in   | 1 -
 package/ipmitool/ipmitool.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index f5c79c8403..dbd6483110 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -32,7 +32,6 @@ config BR2_PACKAGE_IPMITOOL_IPMIEVD
 
 config BR2_PACKAGE_IPMITOOL_IPMISHELL
 	bool "ipmishell"
-	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
 	  IPMI shell interface
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 06d50bb6b9..0b8befffcd 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -34,7 +34,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += ncurses readline
+IPMITOOL_DEPENDENCIES += readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
