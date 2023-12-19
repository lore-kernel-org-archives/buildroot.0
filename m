Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B910C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C846D8329D;
	Tue, 19 Dec 2023 17:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C846D8329D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id us7LYWDxNHFK; Tue, 19 Dec 2023 17:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB1B8328E;
	Tue, 19 Dec 2023 17:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB1B8328E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0BE41BF390
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 793EF82BC4
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 793EF82BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLwgqnOszBPx for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5BFB82871
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5BFB82871
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d774533e73so2419421b3a.1
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703006694; x=1703611494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J3lmFCDLKGxheqnEsBTvI30LOak6MYOY/D9J10UXVKQ=;
 b=MHKpBnjJTO5I5ftoerV0q/hZl4pbS/PzQ784rnhX6FV+tTgbK0Jbz7wXYy5S5KnVA3
 8LYYF4gYs35v9Ap9wdrmbl/fl3vyYY4u18/F29yQLOgtO/E50OUcz+SWCRFIowgpNwIm
 hvIBIKBxHeQ7qeoigRnwnFQ7C33llW1YA9cP7oIduC1yrno1YfRujRdQ0LIWknrIbZEE
 VWVSNDfjoJ7a/X2iyMpUtpRTCPxoabiy0jicPYOETpfIy5cW81ejmaouPBzPgRp5wf9i
 bTQKxMxJu1tIpSPPLyNMUMo1A5k1fHVoeYZ1nR470wRTIvJvL3iqxEMQ1MWtQAY/C7qv
 PUzQ==
X-Gm-Message-State: AOJu0Yyset1ndB9WDcctCyP10bcLD9P+nrZ5rBY+fHyjD3Dr5yMhUHX6
 VnySgN02gC2Eu0IBfEDzJQ2SaZ01U15ATBAfNK0=
X-Google-Smtp-Source: AGHT+IG1zW0b0WNxLEHZEl0+GdHYT0W+Z6Ee9k9onF+0zr6ZAH2aNlOb3ULGYtelA2MYT7IVf2/eDA==
X-Received: by 2002:a05:6a00:1388:b0:6ce:fa73:a046 with SMTP id
 t8-20020a056a00138800b006cefa73a046mr23398548pfg.50.1703006693805; 
 Tue, 19 Dec 2023 09:24:53 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 g192-20020a636bc9000000b0058901200bbbsm19910829pgc.40.2023.12.19.09.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:24:53 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:24:45 -0700
Message-ID: <20231219172446.498409-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703006694; x=1703611494;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3lmFCDLKGxheqnEsBTvI30LOak6MYOY/D9J10UXVKQ=;
 b=CAQknYd9Q+8LXqvGrVro1uem53z4vk8OOmucBseHP17uDg4K1frIdYQsZ3TQuCKcvh
 crPh0zASwX2LoJIQs2+f9r3XY2S+7qvaZMmIUQEHJ24m6AB3H41Sm9f71DoPWx7ok18j
 s4dexazBMuqRb4G7v3VNnChwefsH3GTjZpcWQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CAQknYd9
Subject: [Buildroot] [PATCH v3 5/6] package/mender-connect: bump version to
 2.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uppdate LICENSE sha256sum due to year change

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/mender-connect.hash | 6 +++---
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index da4ec5fbbd..0712e38260 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,13 +1,13 @@
 # Locally computed:
-sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0.tar.gz
-sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
+sha256  397cc1dab70e6e33713c7c7e826b09312949299608f4c1d41f7acd29b9693e92  mender-connect-2.1.1.tar.gz
+sha256  ace94839998c417db1e61034b316f343a25272cbefeacb29b65735157ebe3d57  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 #
 # Apache-2.0
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
 sha256  3eb823230e5d112e1bd032ccc82ae765cf676d0d6d46a1a1daa2d658b3005b67  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 36ddd5f7db..52a4077ab8 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.1.0
+MENDER_CONNECT_VERSION = 2.1.1
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
