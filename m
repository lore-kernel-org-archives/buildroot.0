Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92DCCCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 10:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF3E4196C;
	Mon, 20 Oct 2025 10:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P58xEiJwREM5; Mon, 20 Oct 2025 10:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7460419CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7460419CC;
	Mon, 20 Oct 2025 10:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B8A1CD
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 10:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A53A419CC
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 10:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c50ISRK0j0dB for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 10:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3E4441959
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E4441959
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E4441959
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 10:47:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso7781869a12.0
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 03:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760957223; x=1761562023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgeWkzgYjoTQ4wTjFHP/ljY3oydDwWY0hHLth/csov0=;
 b=UrpakIQu7bFDvPI/W3FP8LtSVgC81chzhGJnYkQdsJhO/gerLsIFLZTn/apukhLz8u
 qlJItCBoiAWsHuezKevtQqNI68PhOM4w61kev7tskNbL2Vxg/9rmnDWFbL7WTC5aOfRj
 LV1pwX+P415OvRCs501bYD0Wcln0Lo/uDHUUpS6lOcK7LBS+vaK27UdMmY4i2yBZQsdM
 SGTXlF6WEpg9zISksOyTSQhDFZTjq5qPxCrUJI17SGd3xJyd0BFaafWcTxG3blyYfgqp
 RPb86DIZKlJk86qNC8bMeHBCteCgcjntD7fJl4UF85OEfADdjsr12c/yg6iSkBjXalp4
 R/vg==
X-Gm-Message-State: AOJu0YysX6tHABz9uZmsDe5o7G/zHpvUmIIWOkCEz/+ilvVmGENU/4sJ
 YaIgxDc5vpIgcFOGH15y11bMFneGqnQGs06v77pYHKIfe63/QXrQ2FF1K+gTpr1E7FR+B5t4lkQ
 Bdhwb
X-Gm-Gg: ASbGncvSMCeBYO92NPDjA+mYFIu77D33NsyDW1VUSJeeELmNmMEEGJl+uPs0eK8qGVg
 zwuX5xY12fjKGCLdUwEqGTzAxv44uD0uHAkGnVegmFFgVTND0b4KXj77t7b8AW9y5apaMS34l3e
 o+S4lXa0jsfCXka6db5BapcDMDOHlN11OZZNCz4UuSd0V4EqVor8lPwl10+FwrMh+pl+aIHdBkW
 ySeRBDZEvN3ah7ltjxWs1Mec92PxMDJlqLbLazSDqfnGa1W9ojvRBsLq5ZhyyZCbqRH9RGB0BzW
 0ohuzvrL35O+RIm9wCrQpZC8oqoU8JfCyH1DSeDz9QcbqetBorH4hg+ZzLV3Gn8YX9slpvgaTGK
 kYApP1HW2KXYZGiUb+UoJECmumvgdShlsy2dkwzvA2qtG96O5roqjv+z1D/th+VtbAwPxZAelc4
 O3LzXkViy48YI89w==
X-Google-Smtp-Source: AGHT+IFM988B90PTAnfFr4qGxdwQuSt3+koRPyfulOzQSomg5qjg9LRZbmwHGxiZ1f0cIpL+/ZJQRA==
X-Received: by 2002:a17:907:d06:b0:b3b:d167:944a with SMTP id
 a640c23a62f3a-b647551012fmr1482924466b.57.1760957223338; 
 Mon, 20 Oct 2025 03:47:03 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da33d1sm756810466b.7.2025.10.20.03.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 03:47:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 20 Oct 2025 12:46:54 +0200
Message-ID: <20251020104654.141781-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760957223; x=1761562023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgeWkzgYjoTQ4wTjFHP/ljY3oydDwWY0hHLth/csov0=;
 b=CdKq9Adk1xXmi83GYTNUGJe6azhG8lvOMvxbj9+QZqmzSeC3S7Pu3UAP6cmyxv7mD9
 zEwIf1alwljFvGzZ1mfatHOveK2IEEStXvm7kZfhC9tS6NzDQjORhKm4QNwwUDomiFjo
 y4wi6jxdIoOrZP32troWqlzJoZWZbEP7LIa3PvCURcYsTHaHwYQmgQSMaScoxbqgxpOJ
 FEtCydVXGQbgji6cWc+40Ax2AGALSdsUKXBjrogt+6KZfHbq7iLf4y0fIPOw2q3OcWXB
 cQi2/3Z09GBQqr79QTWlLwaJ9Ltq2gZ/mXtlqTh8y5AjLhacuSIXFxwB5GqJSuRYvEW3
 CbNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CdKq9Adk
Subject: [Buildroot] [PATCH for 2025.02.x] package/samba4: security bump to
 v4.21.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in the announcement:
https://www.samba.org/samba/history/samba-4.21.9.html

This fixes the following vulnerabilities:
- CVE-2025-9640:  Uninitialized memory disclosure via vfs_streams_xattr.
                  https://www.samba.org/samba/security/CVE-2025-9640.html

- CVE-2025-10230: Command injection via WINS server hook script.
                  https://www.samba.org/samba/security/CVE-2025-10230.html

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9fff75bcb4..ae37e497cc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
-sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.9.tar.asc
+sha256  9d60206efb450c08700a85504ec2b63257be7c6e1c393627da54e047b4e9ea75  samba-4.21.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7895ec4a4c..c2886d9ea7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.8
+SAMBA4_VERSION = 4.21.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
