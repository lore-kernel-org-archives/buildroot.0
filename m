Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2BBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E161281B60;
	Sun,  5 Dec 2021 00:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heGsPJ5nXF8t; Sun,  5 Dec 2021 00:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E22081B26;
	Sun,  5 Dec 2021 00:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93A3D1BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CBD40306
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33pX44k7twA6 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C62A04034D
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:22 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id t8so6595433ilu.8
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PKCA3RVFOCeinK0+54BPRlPKUT90ryS/yOVNB7rI48=;
 b=FZOHVPDB2DSSFpeMcrkyzOMx/lLlv1s1h6klGvKtFzUbRMUbqeFb5OLPnzAxhbMniT
 185cvj0RxB/KvYfG9T/6NBbLG1NvKBFNEh74JACr2teyY4YcwtaGTDeULqMe/NW5NYvX
 euLGJhxEuB06ew6zdLWrf9pqsKmFk9PMcaCUld7FBGqgptTtkiLnw4JobBX8jGfO0+qa
 m8xHIuBrj9P4DCZY50a+CmYvD+E42Dt6YjFIgU3rsCp2SosazxheqiBYOMqKCOKDF8AC
 h9IFBas5LptoZe1qfApPZNGodkf9ULSHgP3zKPzKKvBbO/eT/RM03DUF6rJ3KSZEolJO
 H62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PKCA3RVFOCeinK0+54BPRlPKUT90ryS/yOVNB7rI48=;
 b=zUeVluN0FoRwY7uCUFxXaA+s1Cx3VC49DAhE30b/F/e0JOKV0hWOwlo5LskkONfdoT
 mSQWxiuqh0RxsFpXzWZn8dOnKvvq43R3EfNfctDE09VFO0rd5wmriPumiehdjiQI3cvf
 N4bXHLzq6uSI0vPpKQsTaoIzQoC94FVHo2msx5ZMK2BY67BC91w+YpMJp+8mQ2QlBKrf
 rLKo6j5iA9MqN8Yhi0dj+j+c/wk4FYhntUKOQdESEpxsY9HIdP1rbeH54Oe9VFCTjlP3
 Cr4iaE+ABinZ2+UBuUbZoe2CnKb73e9JlrwVQ0Qj23IB6h2hAFR6KOy8ruMuz3KHer8n
 Dmww==
X-Gm-Message-State: AOAM532KNr/zvLGUhKgmUHRD7rJiKw+OCXx3PrWvMDEWj0lUF9GWedaa
 LRGEAYiD7V4qsrYKHTbdaOFsL7V3kYU=
X-Google-Smtp-Source: ABdhPJyA0ExshQNaceutOwUlxP9GRdLeeTRKAoPnZr0DSFjJPUZL1AbTZZxT2XwWox2Ru7ioKz2rBQ==
X-Received: by 2002:a92:2811:: with SMTP id l17mr24495875ilf.149.1638665661852; 
 Sat, 04 Dec 2021 16:54:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:12 -0700
Message-Id: <20211205005412.2888068-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 7/7] package/network-manager: add optional
 systemd support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 14bf0d4dd1..7a268d72c8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -112,6 +112,21 @@ else
 NETWORK_MANAGER_CONF_OPTS += --enable-polkit=no
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += systemd
+NETWORK_MANAGER_CONF_OPTS += \
+	--with-systemd-journal=yes \
+	--with-config-logging-backend-default=journal \
+	--with-session-tracking=systemd \
+	--with-suspend-resume=systemd
+else
+NETWORK_MANAGER_CONF_OPTS += \
+	--with-systemd-journal=no \
+	--with-config-logging-backend-default=syslog \
+	--with-session-tracking=no \
+	--with-suspend-resume=upower
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
