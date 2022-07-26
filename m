Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EA0C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41044832D0;
	Tue, 26 Jul 2022 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41044832D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9RrnGs81xat; Tue, 26 Jul 2022 06:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59221831D5;
	Tue, 26 Jul 2022 06:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59221831D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFA181BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9059E415F4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9059E415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJceOtrSsyLM for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:34:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E854441583
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E854441583
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:34:05 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id 1so6813979ill.11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 23:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwxr7vCW2ZQVVqVkZSpo/ufRfX1gjHJEaJhn3+yklcU=;
 b=214zMUorR+X6cHgA6D/QB1dNhW2Xy+zg0JUT88sBCTXBRHE/s957s2gt97blknc4y+
 QWYdoMwKs53PrZpFLLL/g/iC2r3fahOHaDF3SaznxKMcrPksfVRSBvRVXs1pAJxeI3zr
 FLZ2o6MjilMBcY5Nk0T54iOiNGNl82YFU6m0o0PuDb7w9fvdsA0BDTd5l9sGzWj8F3JJ
 djboy9UE8gNdYj0c+PLlONzewhHwRJCjAFRErd5vXhAZB4FF21Hr/uh5VaGJUV3YM9Qj
 8njbO3Mcxmk2xFvdd/RT2/nlavJz31KHSRl9DMSW8sjv69BAY7Zw4YkXklvMwAMA0bpB
 i60g==
X-Gm-Message-State: AJIora+DyhJM+gMB2waYMxOSiC3oWrqjW1WpLq1fz3+anE6tFwUMud7k
 gWmaxGGe/en5Oi3ynuIG7v/YRef14pQ4Qg==
X-Google-Smtp-Source: AGRyM1uc8qqqDSsu6jV5S8Pvvs7poE4T2zRT1o82QsxzIUJKhrU4qlk9jOSa2O9tD+nsBAWoPfRaRw==
X-Received: by 2002:a92:c8c8:0:b0:2d7:620f:250 with SMTP id
 c8-20020a92c8c8000000b002d7620f0250mr6149631ilq.103.1658817244607; 
 Mon, 25 Jul 2022 23:34:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 i2-20020a6bb802000000b0067bcb28e036sm6852367iof.49.2022.07.25.23.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 23:34:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:34:00 -0600
Message-Id: <20220726063400.2321251-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwxr7vCW2ZQVVqVkZSpo/ufRfX1gjHJEaJhn3+yklcU=;
 b=NY80JdnAvvlpp6d3s3UfbekD3bYh36TonsJC7rFtTVlPCpEHR2Yh0CiG0wTcFBNArR
 gqd9W4B7hHHnp8+7lFZI7zHBshJ5EpmfbJnt8YNddSMgpfqi6UOIaTw59fPp0KsnnkJX
 KvboYt2j2IyTrOIcV7MtMkL/hThYZOVvdN1YiMtxbN16yY5CJ9b5qAs22M0phMmoZRA9
 S3MBW1xJL+pSkTqcU8xW2bZcRfO0R2DvP1Vk4foan2wzvKs719B71Kujo2yAzBleZ2yX
 g7antlaoUGgOzG54espPOjS7pAWjKuw58jAzwzJL5Re3euCN5QOp4sIQH8morsyl93aG
 oK+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NY80JdnA
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: set cpp_rtti option
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
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.

Fixes:
 - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 96520e2efd..652b5168d2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -94,6 +94,12 @@ else
 MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
+
 # Drivers
 
 #Gallium Drivers
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
