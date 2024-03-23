Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E8C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 16:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF2B82B94;
	Sat, 23 Mar 2024 16:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhja3xyVo9bD; Sat, 23 Mar 2024 16:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928C1828E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 928C1828E3;
	Sat, 23 Mar 2024 16:01:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 527971BF3A4
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA5840640
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKsC6mNbA-mX for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 16:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A27FD405D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A27FD405D3
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A27FD405D3
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 16:01:44 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dfff641d10so20795935ad.2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711209703; x=1711814503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXd/S+AXBXC/1WLI64R/rxtE+EKMbpwGppSavDzBB3s=;
 b=DdlGpvV4VjXp/CY7RcTPlw6FrQ6lQzBQMtp5qJ+CI/ZejUu4dFTc2Enzj4KWnCS110
 YvgSqKPOiLSBgcWhAu1EA5PCWYsSdoBoADS2CiPTM7QR+QpOe2dVetuEwkHXSEIZO3Hn
 niRYBwWa0+GUFJtSpOnbl2psZdwk75UnvVaUBLS6HYDTwztqCBCrucB9Ub3J2EX406S4
 SyxS7q6xdp2PbllKlGgu59MIWUETvrjsbtnSspA1+5Sjg3mshoz3X+vGq5G96e/bSWYV
 xgrLHCkDqS1KCTIcv7Xx45hOXXOh8xaIIWIhK8q9jK7tFKv2+Uddun/IpbFc1n4NfxBy
 T+cA==
X-Gm-Message-State: AOJu0Yz3AL1Djwo6bpdzhQOj9IF1IrcuV5AUrRVS/ula++YVKfydGmtb
 mY2TJUTRJs0VV2FhB1jFov3Rk69OnVQwrzENbXFrZ/q0lxfMgLrxfnNPSQbM
X-Google-Smtp-Source: AGHT+IGlQmCtBRRQfBZAJb5AJEVKlVhzRG7q8qXt9tYfyQF4Hm5K7JBgbNE9jWUpc9ZXJU+cWuiKgw==
X-Received: by 2002:a17:902:d2cf:b0:1de:fe74:af6b with SMTP id
 n15-20020a170902d2cf00b001defe74af6bmr3158183plc.46.1711209702788; 
 Sat, 23 Mar 2024 09:01:42 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 n1-20020a170902e54100b001dcfc68e7desm1718551plf.75.2024.03.23.09.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 09:01:42 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 00:01:19 +0800
Message-Id: <20240323160120.1276293-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240323160120.1276293-1-fancp2007@gmail.com>
References: <20240323160120.1276293-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711209703; x=1711814503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXd/S+AXBXC/1WLI64R/rxtE+EKMbpwGppSavDzBB3s=;
 b=cr5bIU0LgYB3PPoiQ5ybeE4j2gGk7oqwPcxDOzPA5jhwH+Y5RBO3VsiJwKB1umktWm
 kMYXlzTDg1ghigHv6cwkVM43sZsOqkqLk8/kHkAJHMdp19Euh6cPz6YAAEyHKtZJdpGv
 n+gBhLS8QXlQ2kOaAWBJJ7lk6Z4e6RL5YE+REcZMeXhfb5826Pkp035z6GPx230S69q2
 okFtzruI5kKGNWxS6UxXXCq+bAKO6r442MAlPZyfHfu8ga9Dab3odVHlWgQphccjgKJu
 rEghF/F7ozAZaNv4OkK31zUdDgNg/EqMqWoNGyue+EcFw70cfnbMssRkpJhciA3OOD+X
 VBQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cr5bIU0L
Subject: [Buildroot] [PATCH 2/2] package/owfs: add missing slash after the
 OWFS_PKGDIR variable
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
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/owfs/owfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 986dca921a..6b22282486 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -28,7 +28,7 @@ OWFS_CONF_OPTS += \
 	--with-fuseinclude=$(STAGING_DIR)/usr/include \
 	--with-fuselib=$(STAGING_DIR)/usr/lib
 define OWFS_INSTALL_FUSE_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S60owfs \
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S60owfs \
 		$(TARGET_DIR)/etc/init.d/S60owfs
 endef
 define OWFS_CREATE_MOUNTPOINT
@@ -78,7 +78,7 @@ endif
 OWFS_MAKE = $(MAKE) $(OWFS_EXTRA_MAKE_OPTS)
 
 define OWFS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S55owserver \
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S55owserver \
 		$(TARGET_DIR)/etc/init.d/S55owserver
 	$(OWFS_INSTALL_FUSE_INIT_SYSV)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
