Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F773C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF8F403A2;
	Sun, 19 Dec 2021 16:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdjfwryIwD7M; Sun, 19 Dec 2021 16:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E48340364;
	Sun, 19 Dec 2021 16:03:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E04E1BF3A3
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7686B60B65
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vd7nYNwwrWYM for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 16:03:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80EAD60B64
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 16:03:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so5051531wmd.5
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwo/Lv+tzB2BA7LZAVA8YRCwLqxGjiQv2wN03PM2/6E=;
 b=oiH3EV0p/RU6Vo1yeZBxMXVjxA/ZnL0qfPxDlc7R6me1eMIfNrioQ4N1epoye3UHoh
 57zkaK1PB5WzYJ+Pl1hDmec3lok+dYG/mKcZ7KDSZpx8hFkHvfltT1eTP1XPsqe5vkTG
 0srweMdUSw9RJDRgsuBL92UEuNFrYPwo3yf0LEFnuYe1SIuSlnW+5NA4XrbQEFX6YmSW
 3J48xRhHPKkTOT3+eAk1wHFl2sd0Z19ll/KCHY2dbRATZyS84XhQLAuGgmf9tFAbXg2d
 4cCs6Q3azB7K+fwyiwDwFqcoEdlDUcJtje/DrclcT2XgwQNj/eYtPRTY3vj/jRpJlx8y
 0xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwo/Lv+tzB2BA7LZAVA8YRCwLqxGjiQv2wN03PM2/6E=;
 b=3c+t2Q7kSWkXDmD8SOFKQz4MdXuUG5q10yKIvAZmqglGIvNtrbuK2z2XlIThYGFLwI
 stPbEQxRB5ATZ34HTKxU0eRDf5jQPGDleb+/p/iOg7GckFzV2EcPWB0QChfwUqq8225q
 GVfQmLyzc7P4Yo0bKhlIIR3JyiZ1J14qLKAoffJ+2HKJz+5QTgRwjKUbmhraswUmYe2E
 t7w+Gq3gJ3HW5ijYXM0kE1pSdnJhYYIVYhOrCAJ92MQIhiyPCNP6JkBvF9rxS2qysard
 F37edKQMo9aOHuAwMaysXw4vGG/i/QpkrOcQT9KB6P41enumsqFXaPltHe1LTRjBPfhq
 LE9w==
X-Gm-Message-State: AOAM530X0UQOogMdUmneG42+Ny4GoKJcvrMhX9d/bBsICf2TSjChGU46
 QArCTbxLUu/3cT71t+2DMyPJ7wDWJ2z9yQ==
X-Google-Smtp-Source: ABdhPJy3Ya5Rhq4g39oNN7sQoclWRGw3m7Pm7LQxxg/sIdtvbLsRO8xcueRj02C9mwCR6xn88pbHpg==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr10643812wms.192.1639929789539; 
 Sun, 19 Dec 2021 08:03:09 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n8sm13472219wri.47.2021.12.19.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 08:03:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 17:02:34 +0100
Message-Id: <20211219160234.1358835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pppd: fix build with kernel >= 5.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel >= 5.15:

sys-linux.c:148:10: fatal error: linux/ipx.h: No such file or directory
  148 | #include <linux/ipx.h>
      |          ^~~~~~~~~~~~~

This hook could be removed as soon as a new pppd version is released:
https://github.com/ppp-project/ppp/pull/326

Fixes:
 - http://autobuild.buildroot.org/results/5a7f89e5178735f4d3e3f3360f0feb263f6ac431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/pppd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 71bfceb607..19b6f3ccce 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -57,6 +57,13 @@ ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
 PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15),y)
+define PPPD_DROP_IPX
+	$(SED) 's/-DIPX_CHANGE//' $(PPPD_DIR)/pppd/Makefile.linux
+endef
+PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_IPX
+endif
+
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
