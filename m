Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C15CD8CA7
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5820D41082;
	Mon,  8 Jun 2026 22:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTcidwovQnVR; Mon,  8 Jun 2026 22:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23FB040F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780957590;
	bh=WZlQthHyXuxKn18E/K6U6pgUIqq1K3b+V2/p4E+HMQI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jxcgldacQWDbR/Z1iOvzLTAKrVS6Ev2NkegCzk38IienrwpCiBq4yBH4c72TJ5BN7
	 twNSbtVGsSSpAuSsPq65i3Am07EL7L2z6B7djtQ9ZRA670xLeZETdb73l6KNzeyNVy
	 p+1t+4uXoSiFE9wu8lBIB1UrCZov0ecBD5vyaanYf5KlC6mzaXYOVRU75pAPaAWSl1
	 UL1pEp6mMvR85/D1Z7pCfd9Ii8KDwfySByVP/W536uj+zfREhBROY+RtAnUyVE+iIg
	 pKyANihsANF6RlnJjbwproNjAhup4udlIMhBJ2F9fLSXttpfgw1o9//B13e3M3TGLg
	 bm4P0yEPRmSyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23FB040F75;
	Mon,  8 Jun 2026 22:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FAB7190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DC8E42482
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qj6JxEiExCRN for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CF034237C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF034237C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CF034237C
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:26:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso40918985e9.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780957585; x=1781562385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfOEc4D8ngYYBa6EAtZjENmJzQSuEhpvPsHV/Bq6y/o=;
 b=sd0e0Htv3rQcygeL1k4vmk+TQqZ+PUBflDU+o2UsqsFvTCpeql5iSoShsT5e8J6r9K
 CBg+JIdqFr3GtraNKaaQ1PNF8RoKsHFZQiZ4IsUpBids9Qdpmw+3gIfIxITg6ROyA+Mb
 RUJWQDrcJWeeeN08W5ToUQXzIJ6b36yJQGLz/Mkedl06G42hpO+3mn7iq0QAw+hONSRs
 lOBcDJU/GVzYCFLVojtTdWYZkK3nlYfnv+hjXWe+7+OtOF73oF97KAm5ybB22mzswgOZ
 A7HMCcfx5GcrnhOYl/hh2WlJtrmbFRJphBHCe0EvMsKUWJ/MjRUrh5Trqdh0m3vWG7nL
 LY4A==
X-Gm-Message-State: AOJu0YzzBUC5oO9QYNbg/oMRkJ/hNf+sXm1DlW/JS1kD+lNaSgNhDM1E
 GCdb4y9oShqW8svkxOaTrgQxBR82B2enqYojaIaBPfBFnGdxRbHaCRn4zqK+hqxCCA04RVBuMrF
 sCgt6
X-Gm-Gg: Acq92OE4fOzRfA+bDKh2olnWU6uhsAUV7BfkrRU/4jvRv34VaLwisQsgPvCjY4amxTK
 Ltb3PUTPlbdZCK5zBR+W2VELOfs7tWfQyuD4nitUbhDO8q3/jgfGT3YX2Qfu3EpfGm3LADQWmCy
 w1E21U9H68OrD//TXI89g4NEWGVZLPTjVBNDQShbMMKuZzQEkbEjV/gRQ4rlJciVljBPTk1ogh8
 knOqCO1W7T1nVNM+0sCKy6fBHoZKba6gUqa5o/6q8IdW7JjJUMaOoMomZ7okehFVRwft7W0vV5U
 +WjjBjSt320kqLBKa7eKgBi7VE2Z4/dMwkh1t3wyc0GH33Kbdec7LWTm0uOjPMtZDg6binxXyfF
 61fYhpcfcdSGWeMtkfZAssxnbJRhjmyL3PzF8ceT0REXloyLpiqJg+KRNf5ARmruJAIlxWYTTMW
 S9DSFxaRaNpLbt4uNS5M4H843fCa97e3vbdVhaOJ3lhGby49/ygYae0d33wQ==
X-Received: by 2002:a05:600c:45d1:b0:490:51e2:bc86 with SMTP id
 5b1f17b1804b1-490c260a60bmr268210185e9.23.1780957584504; 
 Mon, 08 Jun 2026 15:26:24 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcbe3sm52294021f8f.8.2026.06.08.15.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 15:26:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue,  9 Jun 2026 00:26:01 +0200
Message-ID: <20260608222601.941724-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780957585; x=1781562385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfOEc4D8ngYYBa6EAtZjENmJzQSuEhpvPsHV/Bq6y/o=;
 b=S0eZT8U53IRJgiMBVuWdgtYD6E0SbpZTFxPD0vPVd8/U4O9CWaNGBi+7E3xAQPvwWS
 HGumjN9ezigoPVIFtQ81taxsaPDmpTuJxKNNwI1FlXKgkdE80ZREoJh29yuhzuwCsT+Y
 LAxqYJQ+hHKsHEk2tur29RP0qv+5VIhkE8F0S6BcaF1IYkV9oD3VqGzEjKPHb1tTk7GU
 w2UF0YOw6idlgSwBb607mF9yP6PrjD5ttjG5eaqNMs1g/x/nLHexJ8quOyp8KWp9eWrI
 Wo5nK77lKDqXyPiz6r4kP30d73gsGgHoaL7uJFCIUT2EZBssgh52bmMhjCbN5My3lxcf
 iVOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S0eZT8U5
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.6.4
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

See the release notes:
https://github.com/redis/redis/blob/8.6.4/00-RELEASENOTES

This fixes the following vulnerabilities:
- CVE-2026-23479:
    Redis is an in-memory data structure store. In redis-server from 7.2.0
    until 8.6.3, the unblock client flow does not handle an error return
    from `processCommandAndResetClient` when re-executing a blocked
    command. If a blocked client is evicted during this flow, an
    authenticated attacker can trigger a use-after-free that may lead to
    remote code execution. This has been patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-23479

- CVE-2026-23631:
    Redis is an in-memory data structure store. In all versions of redis-
    server with Lua scripting, an authenticated attacker can exploit the
    master-replica synchronization mechanism to trigger a use-after-free
    on replicas where replica-read-only is disabled or can be disabled,
    which may lead to remote code execution. A workaround is to prevent
    users from executing Lua scripts or avoid using replicas where
    replica-read-only is disabled. This is patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-23631

- CVE-2026-25243:
    Redis is an in-memory data structure store. In versions of redis-
    server up to 8.6.3, the RESTORE command does not properly validate
    serialized values. An authenticated attacker with permission to
    execute RESTORE can supply a crafted serialized payload that triggers
    invalid memory access and may lead to remote code execution. A
    workaround is to restrict access to the RESTORE command with ACL
    rules. This is patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-25243

- CVE-2026-25588:
    RedisTimeSeries is a time-series module for Redis. In all versions
    before 1.12.14 of RedisTimeSeries, the module does not properly
    validate serialized values processed through the Redis RESTORE
    command. An authenticated attacker with permission to execute RESTORE
    on a server with the RedisTimeSeries module loaded can supply a
    crafted serialized payload that triggers invalid memory access and may
    lead to remote code execution. A workaround is to restrict access to
    the RESTORE command with ACL rules. This has been patched in version
    1.12.14.
    https://www.cve.org/CVERecord?id=CVE-2026-25588

- CVE-2026-25589:
    RedisBloom is a probabilistic data structures module for Redis. In all
    versions of RedisBloom before 2.8.20, the module does not properly
    validate serialized values processed through the Redis RESTORE
    command. An authenticated attacker with permission to execute RESTORE
    on a server with the RedisBloom module loaded can supply a crafted
    serialized payload that triggers invalid memory access and may lead to
    remote code execution. A workaround is to restrict access to the
    RESTORE command with ACL rules. This issue is fixed in version 2.8.20.
    https://www.cve.org/CVERecord?id=CVE-2026-25589

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 5e67e1a28c..2bbbc9e2a7 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cea46526594fe05f05b9ff733179eb1263deccf4269059cf081fdef222634c88  redis-8.6.2.tar.gz
+sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 9db7226675..ba41b3f922 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.2
+REDIS_VERSION = 8.6.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
