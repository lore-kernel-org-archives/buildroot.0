Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D5C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 17:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D66A41714;
	Fri,  3 Nov 2023 17:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D66A41714
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIg5EYl2f8NC; Fri,  3 Nov 2023 17:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C2741755;
	Fri,  3 Nov 2023 17:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C2741755
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89E241BF21A
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 17:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E76A4012E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 17:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E76A4012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXIrd9BZYWRY for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 17:36:53 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4629E40124
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 17:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4629E40124
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so33315671fa.0
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 10:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699033010; x=1699637810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyrfL40C7omcve4cKdMIHZAkV5c7fL6pG/SLUnsHTw4=;
 b=GxluZaEssvXAbDEUJMFJLTqvgQQuHlLQne/dIA9ofl8SK9QrAobGlkwVYaED4x4Viy
 PNgOod0/4M8OaOU5pbbK484HkvZO3Fw8czyAGAz7CcnfarFTIXtSoowv2p5MGBhglevT
 tfRGAHoOVW1bKjo8yC5Zz38dP/FFQhEEJUUTaVoDX//UE5GjwByviHeZ7klApmfEemBy
 yBTnbX1ivHioOOpyru++G8OQOIbRl/DOsAXfU3bN/JMeaQv9xIXw1BkbTT8WeaL4uD91
 oXa+rnTm9/VcU5xrwDph6BnN2/mxdn1ADeJP0NYC47aNFuIUcVnilhEHvWfPgEJoTb12
 1ucw==
X-Gm-Message-State: AOJu0YxjH76T93xWzfAbtX5qRZ/EwaXYPBXtnKyYyTf1aM6KBPCR9czj
 fbwz1Y2Q0u+BB5t+CTphwFPPnk8VXzE=
X-Google-Smtp-Source: AGHT+IE+agBdLB2haiiBzm8OOVx0J+ZwLRPTS+bQcae29PtxejKJjyRj0FO1s1Zt9frhodaAg6RcKQ==
X-Received: by 2002:a2e:a98c:0:b0:2c5:4a5:9560 with SMTP id
 x12-20020a2ea98c000000b002c504a59560mr22862682ljq.41.1699033010036; 
 Fri, 03 Nov 2023 10:36:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c35d600b003fee567235bsm3192526wmq.1.2023.11.03.10.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 10:36:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 18:36:45 +0100
Message-ID: <20231103173645.2069295-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699033010; x=1699637810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zyrfL40C7omcve4cKdMIHZAkV5c7fL6pG/SLUnsHTw4=;
 b=YBcnjpfSGGYA+vvrTkjsfiUE5JDfG4BMLhItZVixD06nMFaJvC3w0jZkHovr8wovL4
 qZ4IcDRWl2p0IK3i2sfhBUM5x+aIxOCpA9AfJo5nGAvFH44f1VWQNiwGdqh6VpcQBjby
 73wYmSUtv/Fx2/YSxtWCFzrkV8gx1UUO4q3oT/tsYnn7Pg9DTzwpmeFlYLn8WRYLUwT3
 ocppVCv7Uk4wL9JzNIgP2bdk9dASFC/omJ1R8LIO0YofTw5MF2Bhm1PdzJLdnVKzhAds
 DAyR0B0fJTJt74gcbadxb5XW/S0fPdGN4YOqV/JWoxEejRpVTO9qjdg3rEESySO7dSeF
 AMFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YBcnjpfS
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk: fix static build
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable provisioning client when building statically to avoid the
following build failure raised since bump to version LTS_01_2022_Ref01
in commit 06bb3640c13191f7515f2140c2207f5b7a2cb7ab and
https://github.com/Azure/azure-iot-sdk-c/commit/1de399fd4875d16eb78e8193778238b9762ed44f
which enabled provisioning client by default:

/home/buildroot/autobuild/instance-3/output-1/build/azure-iot-sdk-c-LTS_01_2023_Ref02/provisioning_client/deps/utpm/src/tpm_comm_linux.c:13:10: fatal error: dlfcn.h: No such file or directory
   13 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/894188649f66d9917e1ed94989ebe307102ab28c
 - http://autobuild.buildroot.org/results/735b96c842796f309c33a0545eeb2e8f8d1f75ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index b6cd0e623a..a6cb968d65 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -15,4 +15,10 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
 AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
+ifeq ($(BR2_STATIC_LIBS),y)
+AZURE_IOT_SDK_C_CONF_OPTS += -Duse_prov_client=OFF
+else
+AZURE_IOT_SDK_C_CONF_OPTS += -Duse_prov_client=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
