Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18041C3601A
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD8460A6C;
	Thu,  3 Apr 2025 15:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXe5VAD5ASGq; Thu,  3 Apr 2025 15:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F7160AEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F7160AEF;
	Thu,  3 Apr 2025 15:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E19119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E66E60AEF
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcD5pUnCCzrN for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C4D660A6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C4D660A6C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C4D660A6C
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:39:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so7355665e9.3
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 08:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743694794; x=1744299594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4R8OgYFek4QT1+Gebcj5g5wRywHVJk+E59nKRYuWL6o=;
 b=wWeFgeNDoxMTQN5O2E7PsUWjTdtaOvMpbE3nX+QdCwGve6GtMeDD+gzi/qC/GhkC8C
 Ks21n8nQ+DrvjlTebkbx8DE8c4bCY7Ehn3AQN6qAsN0AOBM+90pBWGVgEeNdJ4ymZUm8
 n0qhDIyIpSgO32AO2k/qLFHoHeQd2l8o/w82DHetWOhJjUGdFybKShmPA2CkLXLCty5I
 tyzXBijVd/cXYWzbkFilP1bN36LzhGr2U9jHcKjRvjEmcgrufU9qV/n41oevejv3Xk2Z
 JHh/QrTrZ8/GC+/XflnxhLgo9j4LIDRaoE91Oah8ry9JtvV8SoTEaaPuc6h6bXJeFleT
 cmzA==
X-Gm-Message-State: AOJu0YwsEX4RbrQX9LaTPx7H16uE/ZzhWXGqHhh17+9+y2nWOQVrmcKG
 axWigAyf4jIl/KhvwHD6rPvkFTp5pg2SQdCYaan41rFC+DQLTDyGfnMZC3dhcgQ=
X-Gm-Gg: ASbGnctDDKNRR/JwrmXdzLo6tM2duKtulfmMxo1/EqWkIkJz4HK5ugTnovojsoms+eh
 /1IuhV9yzqjSd+D38B5v4PVJnOHUGfwzhytq5cHxZ9N/kmjySiYcsgsv70kfJPxrzvD6W+JzOUj
 F8INiW8PPjBPGL++O8DQIe5CuLu+r7/xLhka55BG70AhI64VAU3zLazfWS9Oz1mzb5eO3XvjOf5
 gBzsmnx21QHDYwJ4EG94RatY5/6ODilHSuR2kMAHfjXT9aw2GiAgzspFPIGE4XdarB5efO067YH
 4doew5QlD6Wc5WoUAUHAVAxDuALLL/wltQ/u
X-Google-Smtp-Source: AGHT+IFn2Q6IkFWvUMjnhNLTbJl+A1ddhA/pkWB3BR52B78/hUp0I1nbP/9pU0vGUHeBN5xT/kbvsQ==
X-Received: by 2002:a05:600c:6c0a:b0:43c:fe90:1282 with SMTP id
 5b1f17b1804b1-43ec742e860mr17471575e9.7.1743694794041; 
 Thu, 03 Apr 2025 08:39:54 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:32bf:237b:9ae:9868])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bbd9csm21702215e9.20.2025.04.03.08.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 08:39:53 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Thu,  3 Apr 2025 17:39:47 +0200
Message-ID: <20250403153950.6407-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328084743.8759-1-maxime@leroys.fr>
References: <20250328084743.8759-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743694794; x=1744299594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4R8OgYFek4QT1+Gebcj5g5wRywHVJk+E59nKRYuWL6o=;
 b=JC47MGvPlyVqV0LcPvozjsJHJp8kCaF8orKEvRm7K40WuqO0E+FLpIB/KVkYpM2dUG
 8iuV/qI++62OG7RL7qmiqHMyY7Yt03eINYHMiuvUU/CBfm9wKamxM/lZkOGrjju3Kthp
 X0QNN5VkS8IirimIzNJtfK1Zb+O96MxZTX/JsZcKBBw9sfuhZNZGt0y+MMRiarJXWHpk
 QmD64lW2/7l6ImOKGP12JvZmlwUc16+pbKm48kqFQFgZdI9Jf/wqfxBhZjWVDM61jgim
 +5muyB+1pzj8ao7B4dux19iD5TumbMRzrJ5cgPB4z/VIpv5z9UO6SUDTdtsVUaNk58Pj
 /s/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JC47MGvP
Subject: [Buildroot] [PATCH v4 0/3] Add grout package
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

Changes v3 -> v4:
  - Bump grout version from 0.8.4 to 0.9
  - Update test_grout.py to support version 0.9 (e.g. adjust taskset usage,
    increase vCPUs from 4 to 6)
  - Add help text for BR2_PACKAGE_GROUT_TESTS
  - Use `BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE` via `BR2_PACKAGE_GROUT_TESTS`
    instead of setting a kernel fragment in the test script
  - Confirmed test_grout passes in CI [1]
Changes v2 -> v3:
  - Add runtime test
Changes v1 -> v2:
  - Add LICENSE hash

[1] https://gitlab.com/maxime-leroy/buildroot/-/jobs/9615201047

Maxime Leroy (3):
  package/libecoli: bump version to 0.5.0
  package/grout: new package
  RFC: support/testing: add grout runtime test

 DEVELOPERS                                  |  4 ++
 package/Config.in                           |  1 +
 package/grout/Config.in                     | 37 ++++++++++++++++
 package/grout/grout.hash                    |  3 ++
 package/grout/grout.mk                      | 39 +++++++++++++++++
 package/libecoli/libecoli.hash              |  2 +-
 package/libecoli/libecoli.mk                |  2 +-
 support/testing/tests/package/test_grout.py | 47 +++++++++++++++++++++
 8 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk
 create mode 100644 support/testing/tests/package/test_grout.py

-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
