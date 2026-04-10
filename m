Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB619F36BB8
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 06:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A206B40C32;
	Fri, 10 Apr 2026 06:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fcQFAd-dzQM; Fri, 10 Apr 2026 06:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9B340C4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775802255;
	bh=nrFFtPYLmZSqwezlf0rHGInV1gJsyyW7el+cM2kVriA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cI49258Qzn7VYHvo8ASZUjJVXq4hKteL+X6qd2n7O/mSQOqWc9/7pk7oFB1IT1VDC
	 3MDpuYby7gips/SLgpCanTNk1VbckUwHLBIn2UEz9F0/DblfH9JmIXWLUL7BkwLT4F
	 HhJwE77I3A956tIMo+zlabbZ785TzBdNDAHu7HIG7cMgBJh0rvpI1WXrdFGC4FeFQv
	 +7fBtbeafNBgSnDt8/2eT2VYoeyPs+BdRaNskmHMkbNqtC8gvuriS/jL3yL6tDs7Wt
	 WyVfGIWAyZf/J/9H4khhwSUSOLY6yqE/j0jyUUOr4tKeE8GMwxLZwgz2RsK8xFA4c7
	 apHM8pYvPxOnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9B340C4C;
	Fri, 10 Apr 2026 06:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B29237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C45640C4C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hiNDf1p3Uqc for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 06:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FCE740C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCE740C32
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FCE740C32
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:24:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43b983bb07eso991755f8f.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 23:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775802251; x=1776407051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQ3WRMrsJRHNuNWmq9xRtHVv4wZc8egXAyRxnpvKR3Y=;
 b=PXxc0aGhgz00s2sAjcZ5eGQ0sBhkX3TgLf4+o+IzHF9k7k4L/oUASFcrcXeE+qU+Hg
 o8SgQ2MOhdRpbu1P4lF9eMKotcbiP5elFQWF+wfJerv7wcGlDN7vuLXseoNLrRFDQE6Y
 /Ah1Qgf3xh1H2l0Mk2MvK+aGLw8ofwiI7iXIVrGicnS54sUF5GAabwd5QfHw0Z+daN9Z
 RL3THzfCVlRxe8PAtePu8PNn/Q49dSpsvqLWefqET3wAjkkeL1Ho7qPs24YL/xWv4mMx
 MaHtocyxxN93z7kgLI2MLkjSKWOi7yferywGrCOy2NmnaT5YaqMg1Ukx3WiDR9phgABa
 xhnQ==
X-Gm-Message-State: AOJu0YyIBb45yKG4qR2gN9CVomq0P9iOaHF9v6DVQdzqZ1mpimJZ497h
 OThGs3uJM6/zhbYtORFodi1EZHU/FCQZ+jR17Q1iHyVPgIWAGeuY1KbXWvrBtUgaFdOU5Cxv00H
 ogxOw
X-Gm-Gg: AeBDievR1jFjRlj6kWtLmrOjIedJaOppc1MVzXbduSmTiNzu8MGWOmr51gozBU9W1Bl
 3TJmQgR3IYP5AcHunWMLVaa7HGg8FYsegzjAfGgaXUSwyM9OI9ApZkFvALgHaGphap9rUdugfpc
 FEbh44PGFujOyam5MfGKEebewD3Lkq8aTRiy+4f9INp+AQWvNCX0Aih+TRn/FZ1eYltBUWSVI/3
 ea1dcFJKu4pGnwlLjBD3lAbQiZpR0NtPs5MpFiSATflAQiAIvXvTfMJbe9TV4JJ4P2/HUNiSAhy
 ikFL+SSGDpVmATSTiQIg1uuHLotn0cyHU2/V8RBYiNv7W4KIR2fil0lpYqgd//FWYgncyS72FLZ
 kPGmJMzkkDkFq1ACFuDeNGrTavnGyVNvSZPIX6ToqEO4gIS2KTL/AvjH2G+VJna6/R5cey8oXFV
 f/taqAtoZ25QV8Rajj3XSEDtpyKBE4P0dAEDY+Nzh+ooqXHbhiRqeIXwjcKtNhJqOQ4F9jIQA=
X-Received: by 2002:a5d:5d83:0:b0:43b:40ef:5d1a with SMTP id
 ffacd0b85a97d-43d642552e7mr2303286f8f.5.1775802250887; 
 Thu, 09 Apr 2026 23:24:10 -0700 (PDT)
Received: from dragon (ptr-94-109-198-162.dyn.orange.be. [94.109.198.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e4f16bsm5133505f8f.26.2026.04.09.23.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 23:24:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
	thomas.perale@mind.be
Date: Fri, 10 Apr 2026 08:24:05 +0200
Message-ID: <20260410062405.1762326-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775802251; x=1776407051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vQ3WRMrsJRHNuNWmq9xRtHVv4wZc8egXAyRxnpvKR3Y=;
 b=N3eL170/hlLoA5WrOFxp4PvT0inTizF0FmD09V7PT91dfj+Z8BXvJ8RJ9YywPUGHEx
 mPOAHBmcc0xR5PgLsfEzfFT96rF3baO5U1zuAVYqagmJTozvpuyou4i4jxYaqk+iFLcz
 TGlfnNpXihiRGBT3LeeACxLDthc2mQpV3By/qBDYyHN/KMgSL/QHtUX4Vsto4uQCIM6d
 sjZ5hx87VGtvRyGuRj9hasfgKk5MLWLzRcdyXOUIDQRvOjkr0FD6CbGk4yv6S9b+xFu9
 CvuEBhWz8RW8aefocazS+8/DCZKm/fAXTHznPBqBYo+y8SD2enkckovUSqnmfhahiJLC
 dNKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N3eL170/
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.13
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

From the release notes:
https://github.com/redis/redis/blob/7.2.13/00-RELEASENOTES

================================================================================
Redis 7.2.13    Released Mon 23 Feb 2026 10:00:00 IST
================================================================================

SECURITY: There is a security fix in the release

* A user can manipulate data read by a connection by injecting \r\n sequences
  into a Redis error reply

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 7677642ed1..9e5be53969 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc  redis-7.2.12.tar.gz
+sha256  b3eeef15ea90a41c568f1f97a78d3370400baad55566869bbbf1af9f9106d85c  redis-7.2.13.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index e6175b69b5..ce39305176 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.12
+REDIS_VERSION = 7.2.13
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
