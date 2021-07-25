Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE248C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8128060E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8128060E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C0F40295;
	Sun, 25 Jul 2021 21:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsONvoyQPWMA; Sun, 25 Jul 2021 21:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940FF4028B;
	Sun, 25 Jul 2021 21:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF561BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1B84028B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvucSH5CYPMw for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD98940288
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:34:24 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id o7so5846253ilh.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrcvpJ/QQoIEwbklqkPBX8se9YW/2a7Nj7MKOGgpUOI=;
 b=qXDbR49EHCZR8T0v0t6rKy4AVtzHyxeVcJRtYv3H4G7DWCvQi+tBXMUcyl2f34eu+e
 B1YILbpLZurJbF8j2ed2pI0YYq7u8gHKf3ZN1O2F/Kz8UDK0RFWHtsCFkvfwaDudPU6d
 LPDcyKpEgYT6RIItvWfZH7Ug3YYo9oRsTqQ17rpasGm4OcawIiYWF0JHblvhlNL9V4Id
 6ZVKsp4nPAaNyLLPwusXAW4rPA2Z9fBUAXT0JqIdN+7VyARIpuhOFVNQknspMmK9XtOJ
 X6px/ZiGaArBJNs0AyPkWFFWIg2L73ENGPxi20DTBOBTBXMTPhGFDAU1MONmVMIGOCTn
 VjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrcvpJ/QQoIEwbklqkPBX8se9YW/2a7Nj7MKOGgpUOI=;
 b=bAPVZLY4g1jsMNMhIGxpqTJ8iAnSHrdNjYMga3oO91sjyvaALfpdaOIc8M73gopdSe
 kDx2hjaPzzJjItr1RRDdrmv/EGOUL+V2ls1VGXb/seDmJfMZTwJDDngfZYyf3KDoJdSF
 t/0NQuu65+7Flbfd78TlYAOmSRXuLyewMamgmQHX5k2qC18QLBH61TRkOEhVjxUtcL0c
 TKjFco/2MbLcReooiqpSAZe5OgFqzCA4OAIps+ueVIyj91VuaDQTLbRkUGNWW94si7nR
 4jC8XD4r7sGqSMo83oasxWclxu6MUeOA/n3rkB5qxiQ1uUm5QDBVugoE3nvhOZJ394wC
 kl8A==
X-Gm-Message-State: AOAM532dzr9xmC29myWqgtpnaWvTlDhahBhr2ge38i2K8LARvRuvyv4G
 SAgcBTe+iIsqbkVtNKwqYN/mLMc5xzU=
X-Google-Smtp-Source: ABdhPJxW3n3kk0h8GNxkNvg74dhQ9d21fxFbqxogXQy/Zw9n5TtRj3H8RJSJMdH7XxTRfhbJctrnJg==
X-Received: by 2002:a92:dad0:: with SMTP id o16mr10739406ilq.65.1627248863731; 
 Sun, 25 Jul 2021 14:34:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id a9sm16110386ila.23.2021.07.25.14.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:34:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:34:22 -0600
Message-Id: <20210725213422.1622027-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add comment requiring dynamic libraries
---
 package/libtirpc/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 1899edefbf..31f1636ef5 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
+	depends on !BR2_STATIC_LIBS # libkrb5
 	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
@@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS
 
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libtirpc gss support needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBTIRPC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
