Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B355C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D13384D58;
	Fri, 17 Dec 2021 19:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDq2ntbBhF2Y; Fri, 17 Dec 2021 19:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EFB84D5D;
	Fri, 17 Dec 2021 19:14:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC9CE1BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC4342136
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Af-hsL6Rd9Up for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9205E41E4F
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:14:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t26so5913195wrb.4
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JndNfFTz02JtQeU9kdzaxzPfNdUP/sHrNapdd7DhYc=;
 b=nD3fzI/NhkHl8D0pgEoQNMtb+5I+C6sdY6EoBlIZH2j6Uc4SHOy1m4qRZ7SVm69wCV
 qKFB8bvLLjHu8jjZzOwPWYaiJe54TwUDxLx3bR6XneP0mt+X275nl+x4C6D8WJZtswF+
 mTygg440wY7R10uWeEUmDyiKTCkqjRhovv4slCNeTPoWCSL9IR8GrvTSUNgtspKdv4+o
 kzIhm9YouKGf4YPc0yW5K4BN+jmCyKkBqLU0iveQNmGtWZLa9HUo/2BZIgeGrp5cDCrT
 NhbEsWc+rfAyTXowmQPAenf05nDmLZg5mmLcL7oXdJpubQvUUgXmO9KVx2afkNUWPEOR
 loCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JndNfFTz02JtQeU9kdzaxzPfNdUP/sHrNapdd7DhYc=;
 b=E72B2JdqN+XsXHxhZMwPdMEHAdOvisir+9C0m+OQQasEEV5QCkvdLpe/UIrRwa1yvt
 RKi6/w1glbnpCvwpCWj4QFd4TqXVqVb4j8c+XAjBhuxUyq8T+36FQhozzgBjcSZEUjIk
 9/oFf864sClRQAPFyjGnmTMg/W7k551F1uqconOnqxrhCwmNuOT3FqMXlSbKFednZd/J
 99sSgrBaHa/H7wRzAgWqb1vq4IDV7ctgPWdiYyFjc8NfNYIk/TXj+zmmcInxFDKO+6LE
 848UEV98eN+0n8Y7fkRmV4pmx5wKD9hI4asXpKEYXH0HXBVOATb/7nOOhs0KqHR+VWJK
 es4A==
X-Gm-Message-State: AOAM533brcr41X/2IqY+J7vKRszXTnrK9VRrrvyARCZs8waeEA8WDOiy
 wKVlQb34tEZ66wZPyQERY6u7EDm8egtVxA==
X-Google-Smtp-Source: ABdhPJypOW/Ilt7Ic5y/kfUzT/DwY3x/xAkKRy9RyUsG3vLtamVPMMt4196g2UdR5Kc1PXjlLdL2mA==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr3049995wrc.120.1639768446572; 
 Fri, 17 Dec 2021 11:14:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id e1sm6115409wrc.74.2021.12.17.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:14:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:13:40 +0100
Message-Id: <20211217191340.30275-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: add sqlite optional dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 3bd587a1cd..cc83016f9f 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -54,6 +54,13 @@ else
 FRR_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FRR_DEPENDENCIES += sqlite
+FRR_CONF_OPTS += --enable-config-rollbacks
+else
+FRR_CONF_OPTS += --disable-config-rollbacks
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 FRR_DEPENDENCIES += zeromq
 FRR_CONF_OPTS += --enable-zeromq
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
