Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D589C54FA6
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EC444029B;
	Wed, 28 Aug 2024 12:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb2e6X6FZ4IH; Wed, 28 Aug 2024 12:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03ED7403CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03ED7403CC;
	Wed, 28 Aug 2024 12:31:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9485D1BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81ACF60A55
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW6lpPYcusos for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6631360845
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6631360845
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6631360845
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:31:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5bec254f773so974350a12.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 05:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848282; x=1725453082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPunoxYZ69k07zC1GKp3xz1IJ6MhisnQ9mPKf4Ko1/g=;
 b=ZZ+zKp4aibW5XrKzDyXewR6+ZifqCMHemdqOXu+WZ9J/VrIU9vNvO2WqnAdh5V9/f6
 5cH7G4Wn2IAuwCHdmVQIcJ4KbkYX6brt/t10qldlYMlVhWU3xWc854NrSeRVtJSP2sNp
 /1t9u6WE0GNDQIzt6/iRf36UnHb44R1EisdTF2hf2pkLNvulM3f/yyj832YFxbkodCC5
 aM0rHU/1fUoCzX0qH9G4aPmo1BtljlFEt1CaEv56Ux9FzM1g2S6rSJJ6yRgfv5jTYVU5
 WzXd5EyJElBimLmbbo61Rai63fK8C5OfDauKVK+0W/d4v46hcESX984aMWJ+um5gp+2F
 Dypw==
X-Gm-Message-State: AOJu0YwxILbp+zaEMUQJ+7AU/e1dhtHR5wMoLdV5w+D2JYLQcVJeNI5i
 lGoM9rQenpqo8kLu4854TDcWaZsPoN4Yp0gfBxgmqXNpFe0uON1xlvYpgDT6ZIQDW9S8Hv09Vgv
 D7hywKw==
X-Google-Smtp-Source: AGHT+IEncLmugE5ZgWuxatYYOldk023CJVm/dNE9jeTxqpRv1lJSt3oJ9cNkNc/nvAhKxU95Xps6PQ==
X-Received: by 2002:a17:907:7f2a:b0:a83:a86a:549a with SMTP id
 a640c23a62f3a-a86a5185ae4mr721634866b.1.1724848282018; 
 Wed, 28 Aug 2024 05:31:22 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-f0d0-88f0-0971-2ba5.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:f0d0:88f0:971:2ba5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54a014csm244011066b.90.2024.08.28.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:31:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 14:31:17 +0200
Message-ID: <20240828123118.62315-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
References: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724848282; x=1725453082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPunoxYZ69k07zC1GKp3xz1IJ6MhisnQ9mPKf4Ko1/g=;
 b=rocGSUQ+JwByvoQunZI4ciWe7E+k1i++i45ddQYlDRtw0dThs3xH9izgEcVRUoGN71
 pNPk+wwtMw3mo/xb3R472jCwudnJ7KHuCO2rEP058PUPJaq0lHys7l7j4w2p1Ve8fqDf
 E5IfiuVzp+9+QiwF6OKauPUeYxnnfdhIvMt2Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rocGSUQ+
Subject: [Buildroot] [PATCH 3/4] package/flutter-engine: bump version to
 3.24.1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 020fa2ee8a..1d66a6fc11 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.0
+FLUTTER_ENGINE_VERSION = 3.24.1
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
