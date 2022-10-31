Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A274FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 23:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64D760C14;
	Mon, 31 Oct 2022 23:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64D760C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ysgCIvPwrH0; Mon, 31 Oct 2022 23:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B8C60B6E;
	Mon, 31 Oct 2022 23:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B8C60B6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9520D1BF297
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70E99813D1
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E99813D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uN-pVhjTBrF9 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 23:28:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA8B813CD
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FA8B813CD
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 23:28:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso17289920pjz.4
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5xCJS148exwQX+yynLgHQx9FsvxRZgULGwXMtUi9gI=;
 b=IgswF7UIhvtaeqLhjMiGuvqyp5g54DeCsrvNZ4Jfy9ERZbykJ9osLRY2QydV857t5J
 QooOOiLfudp6prk6//h7BYhfaDpXZ1WuDzXALLCurtGww+Onl7FLSSti/xlxQh8danla
 nXAtBPWKGYKhD4LYttLugAOR7yrS/UVxdW7a5ayoXDoNkK1dYZ7C30zkqpz2GfQYNRY6
 ybMH2z73ADMIHqoNq0/OSOmwI/tExxUdehqycKyWx30FOd7l8lc7vQcssCW8BtZSqPTo
 JZdopEW2hidp9s6JSQHkygjX1KJKs29JCwVHTisFfz+svsZTh2406fdOPfCQap/HHLb8
 HkkA==
X-Gm-Message-State: ACrzQf3HPjoJsQcusOLTV6Ln01+lmd48KZmFl1aVXyUHUa7oxdJYPP+3
 jhBrHGL0KErtwZvLnTXSbIrJ1y4tmZPEYw==
X-Google-Smtp-Source: AMsMyM7Pq1Wb9xMhNsST6kh764co2iM9Fgf0g1GSdq4ov3MEVKeWojVNyCqGRtWydIJ26tCVaeyI7w==
X-Received: by 2002:a17:903:248:b0:172:7520:db07 with SMTP id
 j8-20020a170903024800b001727520db07mr16639449plh.76.1667258887404; 
 Mon, 31 Oct 2022 16:28:07 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b00186a1b243basm4932590plc.226.2022.10.31.16.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 16:28:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 16:27:52 -0700
Message-Id: <20221031232752.626154-4-christian@paral.in>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031232752.626154-1-christian@paral.in>
References: <20221031232752.626154-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4]
 support/testing/tests/package/test_docker-compose: update kernel to
 4.19.262
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/testing/tests/package/test_docker_compose.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index a833c68233..38b669fc6d 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -15,7 +15,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.262"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
         BR2_PACKAGE_CA_CERTIFICATES=y
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
