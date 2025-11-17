Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4B3CEBF92
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 17:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1977740714;
	Mon, 17 Nov 2025 17:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzI1BJfmglka; Mon, 17 Nov 2025 17:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335AB406BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335AB406BF;
	Mon, 17 Nov 2025 17:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8152D3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 410E583D25
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agObnKBCyUhV for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 17:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FE4683B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE4683B54
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE4683B54
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b427cda88so3263014f8f.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 09:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399834; x=1764004634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FFpAm82rmvQP3SLfcl1EqUX+dbHPA9FiHeHkhLPCIUQ=;
 b=f66SMlFFTTBTUi8rgcXm2abVShVWRUh855gQgTTwTi4hQvAGZZFZf3wtMrKnkHDqKi
 qaB9W9Nbh/iH6nkE/RAslIZJxNehxBMxuiVmte3jWgqdwEc7OxbcoeIjDjrnClizLKZt
 mqhukv7P2YujvTo22KCM6Yo3dK/ijmvQ7hYkQnYA7ouL+UGiPMZ9msT37iFPPPpiigPz
 DH98YUlLwK8MdC1fVkRO33j0eWCCSbqjweu3iHe7r08625KWtcMbY0vunwhdZMgyAXkY
 6iDTbHd/RHVOirXDlwjkhJjcOPuGdO7Qom5UKCOZeprwqJesJlYGEAOwXv2Hh47sFxoC
 Wnyw==
X-Gm-Message-State: AOJu0YwGBWuyw666ty/lZDaVtrjuMxEfdoiQhdasgrWR53OhVkDWshAE
 oiJa9DEYHhVR0g8JAYY0UoVdTaqXDts9wZDb2UAQXKHzUCJH3MgOEo7Du2MVZVYBATecML5nEyq
 s9Ntp
X-Gm-Gg: ASbGncvEZ30/dIJQmFFWrzlvgFBggDdHGnGkSPZLIYxetWvGFXOE3mFGmxhOpWYJUdD
 DwzYoQKXswJLP+Jq4Nkck1C46N+N5U/waTkwZIe/26G/r18vLJSnqwbZ2asqRgPOdqpknwIRaFr
 aMYQH/2TDsvzQHRSvqInnEirLTET0n0QuSrTWsJ3Wq7PUAPod+VSWfzM2Mnq7eNV2WcjUEt1p6G
 reqn+dMkEIeKLOfQ5XpkWaSXqmGSDLGEwGqAyOouc58RR7PY2CmpuC24aI/11Xk+u/sxXZD2hZu
 0aQ5vKeKBy4S9+OieoOa2vH3I4mISo8mu5j6lFm1RwsI09qPXU0aM53yT2xYlusw1RC0OsP6FSS
 bctB1XGSvqDTE9L6M1x+s1YquMWqON6XpBV0K1LpF/ZFZRNfu17kCrrircFnKqm5negjlCU79dq
 LcXfGohQPn6dQgNXoIREf4J2Nb
X-Google-Smtp-Source: AGHT+IHvWHWAr4rAVJrzsmfB7IcmB/b6XitIYqF7KHuBj4bodRwU/KqNpxiEMquVczy8KHSsb3j2XQ==
X-Received: by 2002:a05:6000:26c8:b0:42b:3ee9:4773 with SMTP id
 ffacd0b85a97d-42b59323452mr13044394f8f.7.1763399833832; 
 Mon, 17 Nov 2025 09:17:13 -0800 (PST)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b5ce849ddsm20760971f8f.14.2025.11.17.09.17.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:17:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 18:16:56 +0100
Message-ID: <20251117171656.260404-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117171656.260404-1-titouan.christophe@mind.be>
References: <20251117171656.260404-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763399834; x=1764004634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFpAm82rmvQP3SLfcl1EqUX+dbHPA9FiHeHkhLPCIUQ=;
 b=CX8YKK7vohunKb9tYszS+1qlYcw6J1SRcZ4ODeSJeZ1f+GcT8afWzUkoPXuXQEh+VP
 HGONG/KP0k4/CVKfSLav+sSoof+4n/Ji/abU48QpR+jJV5a9OHMSXX8uW50ZITQII6p7
 I6c0bWXyCtAbU2YirkdZbNL6S/U7UUMA2VP3sHOmvVDGQiXbto68I8yG4zHM6AxLYYIA
 YNtG7aNvsUi0ztjkVDzcRW1hvr4l5mqIM+AwZoqctUi3jHQUkqMLZkuWgBBFQNQI3JJL
 N0TCYbXH3DqxztMQ1XRSQ2Vc4IWJd9YR182tHA7MogAkBP+w7Lj08rdwnauQpkXuX8T5
 alSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CX8YKK7v
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.2.3
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

See the release notes: https://github.com/redis/redis/releases/tag/8.2.3

This fixes the following vulnerability:
- CVE-2025-62507:
    Redis is an open source, in-memory database that persists on disk. In
    versions 8.2.0 and above, a user can run the XACKDEL command with
    multiple ID's and trigger a stack buffer overflow, which may
    potentially lead to remote code execution. This issue is fixed in
    version 8.2.3. To workaround this issue without patching the redis-
    server executable is to prevent users from executing XACKDEL
    operation. This can be done using ACL to restrict XACKDEL command.
    https://www.cve.org/CVERecord?id=CVE-2025-62507

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index beda6bc48c..f9c70c469f 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  4e340e8e822a82114b6fb0f7ca581b749fa876e31e36e9fbcb75416bec9d0608  redis-8.2.2.tar.gz
+sha256  d88f2361fdf3a3a8668fe5753e29915566109dca07b4cb036427ea6dc7783671  redis-8.2.3.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fbad637aff..c8073407b9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.2
+REDIS_VERSION = 8.2.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
