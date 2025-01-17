Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABB6C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F4E041A2F;
	Fri, 17 Jan 2025 10:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Gp-eTy7T5pP; Fri, 17 Jan 2025 10:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BFB41A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BFB41A4F;
	Fri, 17 Jan 2025 10:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BADB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 732376FB49
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4uZ3N5FHXCl for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 374C76FB50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374C76FB50
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 374C76FB50
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:58 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso2182510e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110996; x=1737715796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yZFYBzLkh8qcfpvT5BIuhjQUp1/hRK9N7gVAuLmFiQ=;
 b=FgUbMjFPQ9WUEG6jx7kQySIhenHNp+lAcoOZpMcEGUWqIjvjPkG2y9wiiUuC0Nvq9d
 dTkSBsPh5oNcKhCvNrV178Dfv555v32DQAMckD/D6jLALzmCtc0C0LvaD+E8z1MsjpOy
 4pxbdmt6RMPecyq/p8amvOCFsjm2Kv/TwgXStGatcy9lK/6YCRI8yvtPPjxpg3lV4tQn
 AuZTgIksXM7GhgrnQFv0lIj3zqHX6UWMXh+n86VgJQozA1/lmpEqS3xaC+VmPazcX9hC
 4ZLUNv8QlGgIYltjFV3FNRSb37h25Vh4vE/7wFcls271wsRWPliRXInbd5LRRr9FdCys
 eKSw==
X-Gm-Message-State: AOJu0YwhnWhs1xkhdQGl9yXRV3/92gnRrxLBM9R+8Bf20iRj3sx+yFY2
 WZj/+KM/NxEsoif/BuljfNE+l1bMw+F2XnMtBEFcbLUiux7kd70S6dbQ9A==
X-Gm-Gg: ASbGnctCau7NRa+F1iGcXy1KUR/YOwHQJAFtXyGrbaiozwVFi9ve252UxdRKpUOVSgV
 tmtaQ430sSsnPmSjnXilY/BVJBqzdLmqzHGXMRcDQl8scekudz3nPyXoppHfH4vLUvS3Q1IoHnw
 iyVJBvPv7TUPYZ2FUVGbkgPMQie4TNIWKTC6UNjYMgFbkiRPMYHokk8yI1mGktfmtHbBnU4x1SO
 tP2wwC+jJqXVehOnceojts97aGKqMxTXhnBVS4m4PGwx/i01qq7muevC+C5aMxy3SkOqXteDJTx
 F1+yvArx7kM=
X-Google-Smtp-Source: AGHT+IGOnHr4A5C69jpJjmLqMTO1lKxkFsVRLsF2m4vMJbVmvqHZDrwIJU1lW+LBxXww0ztnzXKkBQ==
X-Received: by 2002:ac2:4105:0:b0:542:2999:2f56 with SMTP id
 2adb3069b0e04-5439c21f28emr422645e87.1.1737110995800; 
 Fri, 17 Jan 2025 02:49:55 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:54 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:49 +0100
Message-ID: <20250117104911.613221-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110996; x=1737715796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yZFYBzLkh8qcfpvT5BIuhjQUp1/hRK9N7gVAuLmFiQ=;
 b=YyKA1opdQzFqqMbW2HFqGmDcFz2SvFpCMo1bKkBwnAtzImdQu7suaOwr4ofuG4spsZ
 DWw6jT4amlG9jvd90Uat5IuNHJMFy5NO/phoBnQ1V/9vas1didclL+cYQm+RL8/qZHqC
 iuQgNzsBuU0yea+rwJIk3NODcM4hDRzJ21fhPXoDHy2Aodkb/AHrHqPEi3Z398Vht0tq
 EaD7pqP9x56tYaNCyZGoBehGme8tELmcqwzoahSPS1bnBeAWbgFUekRFZtNXoKQUj3ek
 AYEa7BNTHwAdPuBL21AIgcNloKXPU3rHb10eyHjmDf0euYyc5otyhLTFAluxOwGddpxX
 ozDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YyKA1opd
Subject: [Buildroot] [PATCH 09/19] package/qt6/qt6multimedia: set
 BUILD_WITH_PCH=OFF
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To follow the same pattern as in the other Qt6 packages.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 919b6990cb..60eac8c785 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -35,6 +35,7 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
