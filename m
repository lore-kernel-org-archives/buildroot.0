Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C1C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 08:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C80381E0F;
	Mon,  7 Jul 2025 08:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2CpJLyYCXza; Mon,  7 Jul 2025 08:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3529D81E06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3529D81E06;
	Mon,  7 Jul 2025 08:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C32B15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6B9D40446
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYMf3rYByhPt for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 08:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDF61400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF61400AA
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDF61400AA
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:11:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so5199934a12.0
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875876; x=1752480676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzkLZ+e0wUgeCKzMWtZGrHya0xjH8rwMLoKHO7VYfr8=;
 b=gzlK4VdShXeupuFP/BMH5+lWAO7V+jbNjk2htbeAjxwEG2KhIP9p5SXplGeF+zyUVy
 JN2exne1Q066LtqjjD5whnO+kNFzVOGZbWBvQziF4B8Op6Gcp9nVrnnzfnhjBYGc7zxl
 mC2N4asNpf59hhAblIZhy8vPy5RsHNVJWsru71MbIGXJKfSDgKZV3r4ru8rHtxEO0Wsq
 y3ja8LiJwfm8gw/THUT0+7O+aM8U99LMZnHPpBGSwOAhxyI+NWDjwizQON1s9u5/Rzqv
 sfJzD6ZAOgEgYYlG2EqRjQdKiyAiAzQRvJiQjclrBcqz5OII9m5klOfI4/46YkeRCnut
 xZKA==
X-Gm-Message-State: AOJu0Yzx+08bN+er/tbpalgjqPjWOmC7TQ9iBw41DAOI0tRMG5F5GcTR
 kin8H0Qak8aAiltfACo8+R9ACfp0J5F4SsPm2nPYPZA0u7NZRx7V3zzha0A44DGMQxU4DLDnpAA
 0vzYA
X-Gm-Gg: ASbGnctngU4fuz7WNctYVxZlsq/IixJkLr2zXYzOovNNB8J6iOtC24gRlUFH8od9Dws
 7UGf0JvwmzfxuxUiu6ro92+mLm+J/VizVL4K0+VJtMQVB0dmHzkzgIBV9BtqsTX5mZpOAG9O0GH
 9Hx6fqTQ29vy5VSWHgmgYp7ZfRBBXzb2UzLtZ3SvQ2cN3wfbk54UNT2ZNGLdcNRn+sCaZFAWyZK
 QI1ndVlumt6WrnJqeLhIW7OCReD1xSF1x4DAzVsMpB/AMpkCF7dPaXqC7ySynTpEAeeRE6fpN95
 s+/eSEQtlVRuoDw6xqtEIDqYmDu0D6tmX+VbFYGcw5PCCc8vGeT9WC6XyMlpCWWqFuvDsoPhUFX
 VkoweCZTOlylXEl3330X7PiGTByuX
X-Google-Smtp-Source: AGHT+IGWwhXjJF3EfmigM+Hl7BRg+1OfaNQ/3oWwrOTAZOTPf4FW6oIvPHXGVOR2p3JuAMSB46eSoA==
X-Received: by 2002:a17:907:d0b:b0:ade:9b52:4da0 with SMTP id
 a640c23a62f3a-ae3fe791341mr989536966b.60.1751875875525; 
 Mon, 07 Jul 2025 01:11:15 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e6f72sm658442566b.30.2025.07.07.01.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 01:11:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be
Date: Mon,  7 Jul 2025 10:11:13 +0200
Message-ID: <20250707081113.1996451-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751875876; x=1752480676; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pzkLZ+e0wUgeCKzMWtZGrHya0xjH8rwMLoKHO7VYfr8=;
 b=I4br2Wxk1/77dY8foGD2MOCVdrjW2FJrvNJJGHOLFRrJW5cLHYa5Fl1v+3zZRgjAI/
 5cBM9Tz7gFgEs+kIhLLtXZzW8D37EZktNPcPHXU1t2cXw/9cEoOl6ZhpduJTKaL4Yj+e
 a2PqZnLYfVm4wdcl/yzgPMKwPYrNFg6ouiEp9KlGOpd8zglmfPCdrZeWGkKGrfL/fW+c
 24gP0bm5u8n37uWJi758aOE9tF3YO8uBYZ302Xo+py06oVeZ522Ojstfu7pHZTkJd4IU
 gvg7YgmS4sogSzaMiN/2RauGNMuYL8xbxWnUtDFhYVl/eTj2PnbDqrTSUOYbslBPEO3X
 6QMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I4br2Wxk
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.10
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

This fixes the following vulnerabilities:

- CVE-2025-32023:
    An authenticated user may use a specially crafted string to trigger a
    stack/heap out of bounds write on hyperloglog operations, potentially
    leading to remote code execution.
    https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43

- CVE-2025-48367:
    An unauthenticated connection can cause repeated IP protocol errors,
    leading to client starvation and, ultimately, a denial of service.
    https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 158931bb89..630f6b6d76 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  2343cc49db3beb9d2925a44e13032805a608821a58f25bd874c84881115a20b7  redis-7.2.9.tar.gz
+sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7c847690a9..a2d4fbe138 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.9
+REDIS_VERSION = 7.2.10
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
