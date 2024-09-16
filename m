Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35065C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACD581455;
	Mon, 16 Sep 2024 08:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SvnU2wkCgqe; Mon, 16 Sep 2024 08:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B8E813D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B8E813D7;
	Mon, 16 Sep 2024 08:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960581BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9127B4027A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiUVwwaXBTEn for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 230CD40274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 230CD40274
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 230CD40274
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:34 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8a91c8cdd5so50072066b.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 01:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726474353; x=1727079153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDuWIOBoQEf2MvHWL53+OCgEMp2v8KzBFnJuarlhBQI=;
 b=ToXc/72I5/VlY3qh/J1azfngw4RDXUJAVp+zAja6DRgC9ykVrsGBNuGZi2uYAf8dV4
 NsJcpITcHEKlQi33G9sLR4ljsLoKvcA7GRL81Bs0rpZW4Bx1Vmc4E1A29UjBD728xa53
 kwonuKRKcHPbKQNcDG1rHHuGq4c4Mf5NwPCoM9KzaoQjcqmz6HWjUwyvzLLo9mXoSAxk
 1qHCkn5GPslEGvDVT6k3K4HWGNBuR6FPL0Wsv/3X0ycZ8XW7kbL7rC2L9/7CKsDX2gIg
 9jowKIYnkWB8gRnAu+apNhq51QXZoE+ized0s1O9lk3isL7qKLorhx8QVijpwQllKxjO
 P56w==
X-Gm-Message-State: AOJu0YzYry1CXj2vCypXLvjk1zdmlw5kZbvbewpJNH6V6chqzkp6YvAg
 0cCL+M17nxJJHYebwYf9JDlhmGDbm1etOSjjGb1gtmprHrFJw/IhSdV49wMu9lsetyEgtmDMYl1
 lXPivpA==
X-Google-Smtp-Source: AGHT+IEi5hGuzxuT0QebdH8aM1rUXelkm0Vj2bRgWVL25D/HOqm4u1HNtZ6qH9UJNULIblZYKt5CBA==
X-Received: by 2002:a17:907:1b05:b0:a80:a294:f8a with SMTP id
 a640c23a62f3a-a90293fbcd3mr610353266b.1.1726474351593; 
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3a25sm275449866b.111.2024.09.16.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:12:27 +0200
Message-ID: <20240916081229.14823-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
References: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726474353; x=1727079153;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDuWIOBoQEf2MvHWL53+OCgEMp2v8KzBFnJuarlhBQI=;
 b=Scbo3FnDo8oPVeOcmon7dx07OO4p3LYjqzufVMyyzqM5k7BkQwc0UV5vGnGa1b+UbV
 xQA3H72rbq9QoMTg88nPHIkN02YDoek7vJjPFvoM4fD2HgXQEqNhEbo3TKhP7gqHJ6NO
 MOEYVjZkyu355WEbHK2Nv2WwxRCZUg1zEUmqs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Scbo3FnD
Subject: [Buildroot] [PATCH 2/4] package/flutter-sdk-bin: bump version to
 3.24.3
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
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 011056c3e6..3c5cad423f 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  143f77340401e7f147a380ba18112445ed017c1d187fb4d20e40bb6ea1f13aa5  flutter_linux_3.24.2-stable.tar.xz
+sha256  f4e2369afaf38a8e381c9243fad2ca04b8514194c40ec946825d1f4c5539a095  flutter_linux_3.24.3-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5f94c94ea0..48cbe5472e 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.24.2
+FLUTTER_SDK_BIN_VERSION = 3.24.3
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
