Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2D2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ABCB60C21;
	Sun, 14 Aug 2022 23:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ABCB60C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdgcrLIcYdL2; Sun, 14 Aug 2022 23:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE64060C09;
	Sun, 14 Aug 2022 23:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE64060C09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEC731BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CB481C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CB481C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ejY_mt3wnCV for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3703581BF5
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3703581BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:09 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q15so5876112vsr.0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O+jCd3wdB48lk7Uy/k1pnUmV2x4PfejeZeZ2eLINQfM=;
 b=bMDQgIreZJ3cXsjMk634AwHulO9yctH6ov+13rUWYzG7k7+xqz5o1GoJJEEGUCFbSi
 NQmi1yZbsyu+Kir4XJH1V/7bnHlR8aKa4IBK2GEZYkM0KckOgKq6+CyWS2Im3hpaLSX+
 54AOgZ+hLoxfM5KhAhN85RJF8xZzsqqtPQJ7USMIlDSpSpMchRKQ96vD5llypI6dDLug
 8psxBu2Syor9ATmDvT3AIFwZ9XIJNEeg0hU0/vrH2XuB2vO0YLnhQGaSEIi8dx74zDfe
 a6SsXa2uhgZkZgxWN7nzAIUiY6mVLxwfbeuFmXVKKuJ3Niitum4hjf4PPfmdlXBCCPsW
 +ZLQ==
X-Gm-Message-State: ACgBeo3F+/KciKVWJuAJh/sbOAZK+M9yysSBJXyRzrZOGrllpc5VYFh6
 /hGFYdWwfAsqkn7aunMFt+4B9FqahgA=
X-Google-Smtp-Source: AA6agR4JidWPEL6AHNLMt77K3Uqk/YPGD4EMSQCrG+qtJvJ/qz++uTinMpQlbWdi+2cihIioVrHiTQ==
X-Received: by 2002:a67:fe50:0:b0:388:6bc8:687e with SMTP id
 m16-20020a67fe50000000b003886bc8687emr5435107vsr.0.1660520407946; 
 Sun, 14 Aug 2022 16:40:07 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:06 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:32 -0300
Message-Id: <20220814233845.2247022-21-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O+jCd3wdB48lk7Uy/k1pnUmV2x4PfejeZeZ2eLINQfM=;
 b=VP3YwSQu7sNBeacE1/SNSiCK5LDWf9upMW8cMhJMzSvID5a90zWQ8Rat0hQR8g8WnF
 iMP0R7tW+ST2GhjJhnEMqWvNmoJN3pl/cC8z/3W1W3b3tJ8aO1YWqsGMjOnLX0Un8DoA
 zt9ko/XiB7O4JkJIRWk4/TbZjM1/WTv/ntCdvBi7VfltnpjtZd6ci2fl30wf0tdVx/Gq
 osrhuEIxY4SvMZvNGa2OiL5f72irQ+H13BhJ4wuWvSPk1tH95ymYmPNwQTvhULDtqqmG
 KF7NcAJm9GI4U5rybSBlTOESqPoxVwmiDJiPNfQc45puUiA5MC8U9bUVtiG4TPCmswGg
 kK8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VP3YwSQu
Subject: [Buildroot] [PATCH 20/33] package/busybox: fix typo on
 BR2_PACKAGE_NETCAT_OPENBSD
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added in 2018 by commit
'f3da9ffff0 package/busybox: invert dependency with netcat-openbsd'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3e49de0a84..920f55c7fc 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -48,7 +48,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
-	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
+	$(if $(BR2_PACKAGE_NETCAT_OPENBSD),netcat-openbsd) \
 	$(if $(BR2_PACKAGE_NMAP),nmap) \
 	$(if $(BR2_PACKAGE_NTP),ntp) \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
