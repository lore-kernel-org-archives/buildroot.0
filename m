Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A01C5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 08:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7F040848;
	Wed, 12 Aug 2026 08:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HtRJR4NJUz4; Wed, 12 Aug 2026 08:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BD24084E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786524840;
	bh=kaeCl+NuYShAipQHbjNuXYvt99eZAolVBi0fFZ+5Jms=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fcbE3PvcE8L1Z89KochsR1qokvEZa8vrH9Ma+ySj6Oh8RboqmFs8TZlAgTe8rJCv/
	 Rf5UeZm97skcP88nPTgmg6cErzPGzZXrcQli2lsBw1eNjqz2ElJvC64K/72/kTIOPA
	 DI2SCTdgEufBcRGE+LIRO7ceev9RQ+qcULvZUux6zom4madwB+sdgDEG0VzsZoAdsE
	 57/WVlWf/2zRphNK3XrozQwWIN06FNG4vB9p22lZ/e9TL51nhTZg+9c9dV0N4+ejPa
	 oHGIxieJ+J3CYjDtMwT+10OVnm43Rpz557NFoeQf2ekzDQC7jvtPst/gEroYfc3QK9
	 DRkgnCOOcKmTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4BD24084E;
	Wed, 12 Aug 2026 08:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D26AAEC
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C433D40109
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEDecHGxy4I0 for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 08:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 194E74007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 194E74007E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 194E74007E
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:53:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47fde295992so528660f8f.0
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 01:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786524835; x=1787129635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w+M4ia8SV+h6xSF+4bh4OJiqEVRy8XokxPFqQDK9qnk=;
 b=fh3b9MMKdQ5JDAzY5v9E/9NAMq88xcbd/YHgngc8YrTiukBUbD9+uHNvWK3OKcCV3K
 LnvkNPRnQGMvs6boOaIy/9wTc+BemkV2BEcd0SZyLoZk37skoR5GGe10Gq630+YhsIq4
 NjFgPbeC3OWBaZ4M115RTX7mvfOY6X545lnli14MThffznG6umeDXbMcDuVTszF/mzLm
 DfFs+qdfpkBhzcw55/HLqpQ19P+IgNSdagHaMWTr2WQCZyqnyBHtKnx6D/UElOBn/PxB
 BlF3lhC3X0QksIdYYDPUccfwPaSBbvB1b/gfIgy7roDdQlOcf5QQTASxH4Pupc3qtOgt
 CgmQ==
X-Gm-Message-State: AOJu0YwZhICc3D76y6HsiGI4OorMtznOrmi3qM0lpbmA8AVneTaoebT1
 zGM1rosdwlS0rv1ibiOXvqhQqhYlmJQ0KeEUAqO5GRh+9Ohr3K3P5lfBlHAbsQ2WemAdmXI1GV7
 xTTfc
X-Gm-Gg: AR+sD13Bf70zw1aAwy4xrPoUZe/OMpQo6QXtxmNjNAO36n0eBMtCw4AAlBe6Q1EvcNd
 fokoYZFWAl2XHeVAMzNCaJ1/B/2jpNNw0pOX/2nS8fPhG4B3qGkt6GbrWN0BVuMWVPc2m0iXVuX
 e7+nshfZdRoWCOknf5wFd4tu2OhUOVRDReQiyBvm0jHPstEz+SVCQeWtHJB8xQimWzcBZSUz8RM
 5HnOyubcw742lmkPypxOmGKEkAGBGHEbmZTmA72KRSvNRMmfdejWwJICZCgW5FOa/EwVvv89W42
 KYxY2mScHSe01dPunfIf3+6VwWJnblSQ29MywSZaySdE06sJbSkKxbdhVrcj/XnFhuem/60ymil
 ObfcQ9GCe5nnKbqwehu8Z08XgW7GOR5FWT6FdsZyCSOUKk+eU9tT7Hm8r9Gc7w3OmQvbhcCpG2l
 xg39T0+BERJWidocL3wmCMc45oY9XjPasvxY/C1EpWCc0hPvRgRMUaubG8tdtFaPce3DQCtapdu
 8vUT9d/JFxI/HoXxSxwmy462Xshtu3O0Is5QZF3xWSSwBewTl9V
X-Received: by 2002:a05:6000:29cd:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-4814fedcd8fmr6432517f8f.7.1786524835478; 
 Wed, 12 Aug 2026 01:53:55 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e260sm5575158f8f.17.2026.08.12.01.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 01:53:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
	ju.o@free.fr
Date: Wed, 12 Aug 2026 10:53:53 +0200
Message-ID: <20260812085353.419485-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786524835; x=1787129635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w+M4ia8SV+h6xSF+4bh4OJiqEVRy8XokxPFqQDK9qnk=;
 b=gsme3v16ss0apqRJnLgb7FsetyPSIxahMN3mnha7tQdbXeYv8V2vfvTP2YjaqxfClO
 It16NbIfqQHqONp8xTzBXa5GMYmPwqBSjzylgNXOpWfs0toKpOCMbxT9R4hhsTXfNjMX
 UZwFYzbmRHHVg7VYf8aeO3D+6EswNthlbeH30Zw6UGkA0zVU/3HSXxEgwBzpMH8wfbrN
 hffr3FhdZU3xToJO82Swq6cDThaphgmGRWoO+rlLCxul0qu2GPhXj2aBaKsRDi93QCxp
 Y69mtXHgClUGgx0e8lADCDZvswbXlNkTGtto4AurhrnBWOoLuYbTDvLYHCidJFgfEwiw
 WlyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gsme3v16
Subject: [Buildroot] [PATCH v2] package/redis: bump to v8.10.0
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

Redis 8.10 is a new feature release, see the changes:
https://github.com/redis/redis/blob/8.10.0/00-RELEASENOTES

Since upstream commit 4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad [1],
Redis must now be built with `make build redis` to avoid building extra
modules, which are distributed within the source code archive since 8.10.0

Moreover, because the default upstream configuration now includes those
modules, attempting to launch redis-server with this would fail, because
it cannot load the missing modules. Therefore, we use the provided
`make sync-redis-conf` to regenerate a full redis configuration that
take the absence of modules into account, and we install that config
file instead of the default one.

[1] https://github.com/redis/redis/commit/4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Regenerate config file before installing to the target.
  Thank you Julien Olivain for reporting the issue
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e6ba97290b..db03ded5e4 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477  redis-8.8.1.tar.gz
+sha256  f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c  redis-8.10.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 0105f2b77c..13cc7b687a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.8.1
+REDIS_VERSION = 8.10.0
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
@@ -49,13 +49,15 @@ REDIS_BUILDOPTS += BUILD_TLS=no
 endif
 
 define REDIS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) build redis
 endef
 
 define REDIS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
 		LDCONFIG=true install
-	$(INSTALL) -D -m 0644 $(@D)/redis.conf \
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
+		sync-redis-conf
+	$(INSTALL) -D -m 0644 $(@D)/redis-full.conf \
 		$(TARGET_DIR)/etc/redis.conf
 endef
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
