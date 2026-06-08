Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F82CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F7842B64;
	Mon,  8 Jun 2026 22:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdneWAcAxDqz; Mon,  8 Jun 2026 22:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E9D42B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780958305;
	bh=xmC3vJ1oP+HziGJgAbVrXEkAC5YmcK98aLBF1xyEkV8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KecS09HK969O0vzkDwwjujC43sxUgWiA+/GNB89Dh5ROWAkjSckr7+GiWqcl7Ztit
	 ROAUkgXQ2zObXr38Y1KDpU5+66/fO3SEQO/0ipj0GVw6pV/C3Jow1yHqA69ejIN2HE
	 bTENApnjG+sUkT9P/E4c18hB1zQLeO/K9eyspcRNdONNY+RJuEzl9viKF7HKJhMxWm
	 hQyhlvFrG0Qbin5LiX9I9cVIQgSzLX5Hki+MneJHkttWTPgd+fHqm6f30m8HjQStFM
	 GTgQzV9wrGP0y56bAU5a6tZ6xDJDtY3LJGOdo9vB+qAYSLyW3SmEDA4UVyOL/DC0aC
	 dtCLkzRN0hx7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E9D42B65;
	Mon,  8 Jun 2026 22:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1589A2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF0F884E63
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NN4h6APySVYY for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D64DA84E61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64DA84E61
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D64DA84E61
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:38:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so44638325e9.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780958300; x=1781563100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYGlGIoKhfNcZhXlz8HfI4MknkaaSw5tjng2o0A7xDE=;
 b=X0/apYCes/r5M+tiCc8WpHqo2fzQdbH1BfwE7gODFunEv2tJl/SBnPOvV6B/DwJpXu
 B/7x1v+uHYAQ51aIB16hhYYWkVsBQ191W6BUjgW2KtA9RaPTOyJtDiWESAEKVLqq08Uq
 AN/DsCkN+gFaVlR97P5OFvTRW7LYYitjHUZa2yK5ByGTOgQCf5gBxYuvY0GJhfPFdOie
 KYnYyBLlnZE1gtWHmEouSnLOjThcz78t1vl2NQIb1ZihX/GL0oqRAE9baXdx/bbaaYnv
 XVSkVu10uRYaH5ja6rRwGEUbBOiqP+eyoiTG7AoviRfYaJWOSfMH88T/7KFtoPggRIEz
 T3Og==
X-Gm-Message-State: AOJu0YwPMZl59U4cyR3vV1Cv1FdXpqYjp9tGrqs5iaFge/9MWiEWVQ4E
 GulW1XtglnETwiIYwWSFF0yCo6GIG5uzTxxFYHLADRPT+Uc8OJtRH8k3fDsFPSQ2Pt056oA9/TW
 CNTYM
X-Gm-Gg: Acq92OGm4Rc+O9aQ7dU8DupGZJcnjAiamABYGuZ24vzspLuhmldj0LwtYbP4u8FpLA1
 5HzGtR2mPsZlvRyuUFf9K1o7wWEMSMXY9iBKRzwsi0K5qmxIQfB8FcDacyDw7IofnH7I5A8QFwf
 0AXyX7ED4kMm6GNU5E+F+E9iLQ9rzuMBpu0T1RhomlgxHOXxChUSGAhCp14RVXbRvzJ+Ce5K5s8
 HoUR4I+1nSO+SfGBSeSno7HToLYx6soZkbTq75H9/7OGOkNK/OaUNp65HzCEE+5DqL1hkb6sS6m
 88B4Qmcz7OD8Ow/dsLYHUedWYZV4nnPo2ABWrvpB4UWGFeiSMnCaM5lUfW3514l0zBbJdzZ4Pc0
 jFyA5qQIe1gI3g4bvaw0zrcfUFoo6DlUr2EzSme08IZTyLMSt9RCjkDBKw32w3I4w6C94pHJ+1L
 a6RcEAfFl0iLfL8Wjee36OM1yYDMmwGmXZc7TiDK8m6StU07qJdrx0MI8Bng==
X-Received: by 2002:a05:600c:46ca:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-490c25a7f8amr293852805e9.8.1780958300580; 
 Mon, 08 Jun 2026 15:38:20 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm412548135e9.13.2026.06.08.15.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 15:38:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, thomas.perale@mind.be
Date: Tue,  9 Jun 2026 00:38:10 +0200
Message-ID: <20260608223810.957196-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780958300; x=1781563100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYGlGIoKhfNcZhXlz8HfI4MknkaaSw5tjng2o0A7xDE=;
 b=DP+nVAjavJiqD4jgLy8/ZQriF2E940/l8ZiIyfvRWfkWxRAL45i33Eh4nTHtPcphmt
 3yawnID/H0PUp4Pu9GcWtttpLpLIte2Ps2xJKhiHXyWVINd1eVSp5zYbp0zc/JCJu1Ph
 a3Dq/g6yyjunkpeE4iBXiUVBrGsCqdvC6X2znQsoGrbPlqaBezinGwvVO4NJMgPOMK4U
 3SE8TXGQo/tRzJnuvP1zPC9jdP3YiWHwblrnU46boguasyqzHZcJexJDsFW/nPFZV1NY
 x9Ho74hPxewEIVtzsP4a88a3HSKKTsBi7cxDz6cLalvvXUGLlb1vWKM7SItS+G99O5fX
 ODxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DP+nVAja
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.14
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
https://github.com/redis/redis/blob/7.2.14/00-RELEASENOTES

This fixes the following vulnerabilites:
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9e5be53969..055276a270 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  b3eeef15ea90a41c568f1f97a78d3370400baad55566869bbbf1af9f9106d85c  redis-7.2.13.tar.gz
+sha256  21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025  redis-7.2.14.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b9702eb6e0..62f70b352b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.13
+REDIS_VERSION = 7.2.14
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
