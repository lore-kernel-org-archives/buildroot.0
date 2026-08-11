Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4AEC5B572
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29EED6081F;
	Tue, 11 Aug 2026 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vwIDPINroaj; Tue, 11 Aug 2026 14:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 357FE60802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786458728;
	bh=YANAnfyWIWNXIyqXQHtnpB5tgt9DF69xOtTwWXFYnuM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L5ql/okvd1PEjMRQW+tKNavDStBFPgOxvEpixlcLIfT5YceShOsy9Qrldke4VKwHl
	 2yEyuTN+cmEM/16l9la8yBbOZ1cFmtoa/RY7Uitpe9e23VlGh7rhLx2sv1B8r/DlyM
	 1H4jbm0hkj7Snreb47RmGovqzbkX+fnFmepQkP0+0DaWzvKO0FWSTJaueNX5shs8n6
	 DGHG+YcNlVhfMg46Qge7UtMHvj20FNqodI1P3WSwclYNL6ghMGpAgDMIjBUaS4xWr8
	 efbHDo/nlAtlTDSxxZW5UnLXcHhvNgGRjE6KRwXJSxDYI3sl1jNx1zxC57KNUI4Alp
	 3BhIZAlwEZc3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357FE60802;
	Tue, 11 Aug 2026 14:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B93449B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 024D68105B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MON2mp-HXfo for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A7C08104F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A7C08104F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A7C08104F
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so34537805e9.2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 07:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458723; x=1787063523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1yD0WZEPQScer61IP22W6EUrYhY0zXCVbX6cQS8N8k8=;
 b=pXxlprJtxnqnz7g0ITdTcld/d0b5kmcEgomQrDAtGD2qpkPc8gAscKu42m9cRTFOSN
 +Icn1RdoZ3YjHUVyUclWNIXheWg/yqnk7oyzmBaw0yzjk/IFnb2MMGKyKvhz4udthv4Q
 d2CcIfZBDaZYRQTNHkan9ewfJMRo30FoMbzNJx7spZaWQQOl4hC0o4CK8bPuDZQdS5Iu
 kDq2YVh8SP+zeB8pCaubz8GPkqINyA4xyr3SHbSVKEKpas3Vii5f4IWR2PD6D6EIL5O6
 tgMnJQ3SKyIGiXXRTxXmQEi4kd/duuJ8bJ0dDe4cJG40zqlbuNZhCVFfSlVyzqj1DzXB
 6STg==
X-Gm-Message-State: AOJu0YyP34HmoOUZkUcN+8J9xoJFJ2VG+8yer6iiGR1cxjjEtq5nnTv/
 uxe+eoW4MArNUIYVWaBo7WYG3bd4gGbCG4ySwSRXzaptVJX0wJjbCNbFbGruq332nFXapJ3n2nK
 9NPzm
X-Gm-Gg: AR+sD13diYkrd/REZxzUdTR3ZNS3H1moMQ2Puk+8jqd+XTZVhKFIJ3NfcZwRXYIrjfr
 SdOxSQu1hwvbs/bRlrjxIWA3n1Y5zOyPVmsRG5U7HoCCx+AHJxk4OUfBnB9xIxfSR1nPjl4iT0V
 U/s1R0pzLP7YjvQislgRS5WbXfaTl+Uz/ID33GZ8THGIkCABLekCsg0sI0px4Y/NyMvVueFU7vw
 P56KqRnQHpBNdVAd4uox+ksj4xumF25e2axdq4PtJfpDY+neOC4Bx3CWf5aZCZ2lgMPpASI4I5s
 ssQPY3oPDTIt9uFK2VzFFDHOwXmLOKYOlzSrTQN2cSPC5p8hwiNjfXosbBextmNIvGLPCI86AQz
 rVQFFl+8oMJduEbUMcNfnDbPZ8tfY255nJEX/jWfsNevMoLWvatd5wQvGuO9QKVJHnEu5/nDN6a
 9fq+G4Jpb/m2bIe030Y++n2JLVjg0vvdE7uKYfsCj1uwt5WY2EEyjMVcdGMK9Cvv1rIAYqiTrj/
 SnwpiXjir3+G+KBKdaolelO74mvO7o=
X-Received: by 2002:a05:600c:c172:b0:495:4689:1e98 with SMTP id
 5b1f17b1804b1-49978463c3bmr66475635e9.10.1786458722942; 
 Tue, 11 Aug 2026 07:32:02 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a7095a0sm4835199f8f.17.2026.08.11.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 07:32:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Tue, 11 Aug 2026 16:32:00 +0200
Message-ID: <20260811143200.276275-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811143200.276275-1-titouan.christophe@mind.be>
References: <20260811143200.276275-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786458723; x=1787063523; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1yD0WZEPQScer61IP22W6EUrYhY0zXCVbX6cQS8N8k8=;
 b=ZpXKXZGn1h4qL/eZsQ12vKvPxignsqNZuz77CFMgHqHiyFbNtbZofQc6sRgJ1L11p1
 QsMxXMIZQ9b2gZYaQfQ0WZBKYEpXnUsz9jTJShejgsGTUjEycyRDS9pTa3Gn4vG3pvvs
 ZkT7WqJ9GkWaRbjl6U/oAWSLf+rE58hboiroGW9XZopyCSXnEm9Oy/ZzHmKy+IMPGVxR
 f6Pm1xxsZxblKC+LM5OdgNZKMfpt+qndUKcVc9UIN78LRUfns+f94NycZu9DV4A/Un95
 ttgIhSulDC1tdeEz3jDK5SZK9GjB0UvtANt1Ks3KzH5rKyfdysItoUSufwmiQYLRzSvX
 jZoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZpXKXZGn
Subject: [Buildroot] [PATCH 2/2] package/redis: bump to v8.10.0
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

[1] https://github.com/redis/redis/commit/4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 0105f2b77c..ac4aa93670 100644
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
@@ -49,7 +49,7 @@ REDIS_BUILDOPTS += BUILD_TLS=no
 endif
 
 define REDIS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) build redis
 endef
 
 define REDIS_INSTALL_TARGET_CMDS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
