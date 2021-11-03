Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAE5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EFD860EBC
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EFD860EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36D460AF5;
	Wed,  3 Nov 2021 19:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nY_jSCzy1NOW; Wed,  3 Nov 2021 19:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C76A60AD8;
	Wed,  3 Nov 2021 19:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E77E81BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D52A8401C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wRXCffv_QLX for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C9F840146
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:55:26 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id 8so2036517qty.10
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0CuWMIs3yX/p4Aae6oz1Vk0UaUCYR3bDfkC5PyIgdw=;
 b=KxkOSKueccp1EjDXd/57cQ7O3sKE0F7A7xCSz1ErMax++gNBm+VZiyMvAWzrgdtE80
 gjtnMQWBCEiiihwZ9PQa2UbriCqMCxzHqhJNOKFySm3ATwz6JHy5k4TjpfPe70owA1sz
 2wu7ADmImkO3xUEd/FhEJmb0+BTwDsckRWNzHnIRqdCJ2AmlIZiC4mNg80nhosYx0lZH
 JBCKLXw+bRGHVCSDOBhpHHGQrmdhdjKINvBAFkxGtw4rPdB8EMdwueEY6MApM6vT1Png
 6Wn724yWaQ1+wnmli0pIeR+hLMcDd9bYHaoIg3DVZ9JEHZr+EYdqStAhdwvx4o5XNo8a
 FpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0CuWMIs3yX/p4Aae6oz1Vk0UaUCYR3bDfkC5PyIgdw=;
 b=DI4zA0xYghgNsk8+QjgJRa5d9LqyBBgQRp0ONuAt2cBSsBlQ4Ls5Mq9BJBkiERVfc4
 TgjbLkPzT1/X8XPUl6CFw72/5rJ5wNhBw0zm4fLRN8+t9RpjlGretsgGAdT1K1LQQ8Pp
 leI7qKzhDtjbtPo6hqC/xbrvx+hQGMC5EV7NRyfJJVZ3dz8TIb48Dju7DvuKsnodFP8z
 ++k77EPwBLAW0GQPgEhAXnpkbRd+DC5J7P1mFVnRDlxpWcXjhQMwbCD+k62n3saNRVr7
 l3eW7+9HB7/jDL+4x7jnuhsK3IRlk8CJhXGlUWRQ6WYtTHei3HLydsNSYDipL2ZRrszC
 VqBA==
X-Gm-Message-State: AOAM530OL0uwReAhJHOTzQfGKAeSV958+vX+2TJlsgnKT4QLev08sV/L
 xQNq9KDpNSUUK052GTqfwFYmL85vHsY=
X-Google-Smtp-Source: ABdhPJxTaLiZJ8IOtHS5WNL+hmMTwdq34xuLHJs2UGaiqX4tjb5qMPe5c4M3ZUt+0d3oa/FMLlNTUw==
X-Received: by 2002:ac8:5706:: with SMTP id 6mr48107059qtw.95.1635969324825;
 Wed, 03 Nov 2021 12:55:24 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e14sm2449335qty.59.2021.11.03.12.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:55:24 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 12:55:17 -0700
Message-Id: <20211103195520.147558-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103195520.147558-1-aduskett@gmail.com>
References: <20211103195520.147558-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender: install
 io.mender.UpdateManager.conf dbus file
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
Cc: Mirza Krak <mirza.krak@northern.tech>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This file adds a DBus endpoint for the UpdateControlMap, which allows a user
to set the ID and Priority of a given update process

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ec48a716ed..f1366a9deb 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -92,6 +92,9 @@ MENDER_DEPENDENCIES += libglib2
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
 		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
+
+	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.UpdateManager.conf \
+		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
 endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
