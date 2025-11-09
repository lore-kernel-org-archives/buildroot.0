Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98994CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 10:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342C8405DB;
	Sun,  9 Nov 2025 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmYXmM4Pp5-o; Sun,  9 Nov 2025 10:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56033405DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56033405DF;
	Sun,  9 Nov 2025 10:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E4F1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4233680705
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1FfdvluszEr for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 10:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DF198061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF198061A
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF198061A
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:44:34 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63b9da57cecso3384592a12.0
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 02:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762685073; x=1763289873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8ip9nIa3EWblddTmLuM9QIF0jGa/heot9w3ArF24vg=;
 b=HgVTHcvdkiErkAguKYS4IQJusjHCt+3mTKXW7rNyfPq7N4k4JJUuziEMTGNZDrzpgD
 PX+2wrY0mGYPIIPUqZ7iTeyQRcJvcZBw98y5Zeyibn5W1ySTgjZSN/FA5qe14eevGEHe
 rM/f5+Rh3z64JQBeEWHFv+1giuMGhn4x7pVqoReIJMVQuRMyCfQdDPUy/jpu5rDuxJuc
 TVs610R7yu2q5xnU+H9ZJucDf6VJNuzWxu9NDTqruS5WoorMj4QHyBpcSZqAJthkGN75
 uPonG5zsFmrLb/tn7CoF6trtyZadkNDhcVLWn50fUTb+K61IPKZzP7c1pFhBGHCkRSIk
 ZiNQ==
X-Gm-Message-State: AOJu0YwzUtFjeJuIvj2NRxrraGZfCBT+1oiul8yU12xpyBw6JeJ7Zvsr
 kNnpTa1/74RiDbOjtqcwCXvd1UN6aWmR2vlF4vdLrO5DH0HdF6y++691hWDtT4spHs7HJR3aNFk
 HBcCg
X-Gm-Gg: ASbGncuo2wBWDzDi9S5dfKRN0Bf9nqJR1nDjaQHLFtoeqL4tOKJqERwaLOUAW3Mie3P
 6VlxoyGDpDR/WQUtlRtwLkcJx3a0da/0H8s58WuLe22y4Z4oKvPlCWZV84DSxZV6VxFb7Y/Nb5k
 +GeQoFtN7FXds32IKRF6uStFW6jCTKavUFzNJ9H0z4TlvmAjiNowJpfT130u6uATh5VsarOZP3t
 McWjGBZjkBnemkKEd8u1qNqkiBL9iZphda5ZwbSY9EYe3RliR4dHldiGJdnnWGtX9p9S8juT0Z9
 u26kWfTozHeHfyha/GhtMomJwM9ssm91nFUPrdnCn2iLXW0GQlMArJw4AWj+YWfp38APzkVlblO
 f5OMCgDYEUkHOx88wZpm5vYOzkJ0IhcpNL3NaBT4hCVpjlQJRb4MwhBY3FmsUuNpsAPiqTpZTZD
 we8n2Ft5X41iwXS6xfAHZ0PpoDaEDGagVKDT5wGBmHkGkwtStvlb5TsWyyxwMyDyDu+PBHLcR6g
 pGoRHCdp8AuVUICZ5B22JjvcxO3joqgseWQNFUW+KXDGrIJQB41
X-Google-Smtp-Source: AGHT+IExa/AqUlJrOsHBJO2/kph2MluMzGtxz97heWscw0Ki4RyoncYMLNLdcVKkVQ0k5xSCKrWAxA==
X-Received: by 2002:a05:6402:2187:b0:640:f8a7:aa3f with SMTP id
 4fb4d7f45d1cf-6415e7fd2d4mr3528109a12.25.1762685072821; 
 Sun, 09 Nov 2025 02:44:32 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-92-181.retail.telecomitalia.it. [87.0.92.181])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813bedsm8541948a12.10.2025.11.09.02.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:44:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 11:44:29 +0100
Message-ID: <20251109104429.587721-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762685073; x=1763289873;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p8ip9nIa3EWblddTmLuM9QIF0jGa/heot9w3ArF24vg=;
 b=TsV9oqx65+Zxl1Wl/sy/HF4oj0wrg3QqrmweGvQa+lXcVVLg6Y5huZ4q1VTimx8jgM
 8VFcrYKZiXnPKu3nrsb+3o7faIqIU2Y94SKxr8lzPOGD1QLuzmgXb4yKikvLuS2OXvax
 fPrz1yxnhIuQGIP/iBqNhJ4UVea8fTiIoUU3w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TsV9oqx6
Subject: [Buildroot] [PATCH 1/1] package/cracklib: bump to version 2.10.3
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

https://github.com/cracklib/cracklib/blob/v2.10.3/src/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cracklib/cracklib.hash | 4 ++--
 package/cracklib/cracklib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index a97818cbddde..b74fc5e935ee 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2c83a91dd21d035eab98bded764eb4579b73fd837b683e1a447b11ef604ee130  cracklib-2.9.11.tar.xz
-sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.9.11.xz
+sha256  1d1b83676b5673051b9373e1ca0db81c1fa88faf9a195a3c1af984fd9c250d66  cracklib-2.10.3.tar.xz
+sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.10.3.xz
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 9f5f32c87aa1..28949082539a 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.11
+CRACKLIB_VERSION = 2.10.3
 CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.xz
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
