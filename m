Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A7CEBF61
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0110483D6C;
	Mon, 17 Nov 2025 17:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c543aDzswfkm; Mon, 17 Nov 2025 17:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBA483D4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBA483D4C;
	Mon, 17 Nov 2025 17:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DF7B2D2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FD2E40612
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VEdbY7sfs3D for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 17:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7ED77405E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED77405E9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ED77405E9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so2626346f8f.3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 09:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399833; x=1764004633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XrEipKpjM8itzRVrlQD6OVNxwZh6n33eTcXwMlDFtWo=;
 b=nuUCqFRXT37iad4GA8w+YFFYMMtdNMJ+zyzvMAL5nth+NZqR2B+lWUOO8HKsOK2orG
 GMmhTG5ILqxq6UWbsSzZpPVofjaUjjoSP8NzpQNM/NtRJ1bAiWAFQ+fUbTEdLPXSFYws
 b1kHufsHlBUqm66i86DjzP30LM/L9rRUUJKD/xudJ+CMMXfEI5k0EuS0BgoMVMMUbTrC
 0hfbIQpG+7lMz6f+HY9hh/OCvkI2FKc3+94sy4kxogfTLvyrbrJBONcRTNApVpmM45xe
 vNTWMjKY+qxuSZ7aVHLI/YIzmMeTgm1On5NfeJlMA/nib5ZT5NsEEGRRFzq2DIQCc7g4
 wbrw==
X-Gm-Message-State: AOJu0YxOXk4R38/5P0TTAsTWMxqrEST2//WilwG7WotVX9dS+sn+fRST
 PGBNjoya9PL6q5DeFdhu4Xt49uzinFDVz0D6ZkFMM4qQQE9eMyA0C7KugEt6ElhoCdhmokqsj4a
 mnWpt
X-Gm-Gg: ASbGncutV6pkYinfvrcWYJhNYblovzD9Hw/cWTyIPHYTOz6eoDDX3JrEDkWEwdiKu0h
 +IyedhIq6N7DYoUTUZgSrVcyG6tIuEKP5amd8bmmHYYxsFebfpZaaHzHuQpWxzOm0bQnjLb5FyV
 COKuOOxzwiP7wC99m9D4WJUY9TPnrsYpbnuxd0qtr/YkVIa6hevi7aE5qxeRaaUYyeZMpkmmZou
 vAjSPwakeb9+nik8ImZoqY2NIaYFzKry0ntw7NylgYK2J7gWS6bHKNOdp5OvmrbHMiv4HN2gY63
 XcmbbaGDXE450Sfh0h1f8+cwsfpqPY2HkrQ3c1wCwBHxUP/oHrB/Wx9h9mVGIbPBzO9pfcFfb1j
 2kJO2ESarjKYuntClb0QuoLPhr4RrKFkCtDBl/41/oJQJ7eCxpMU0lZkcRkOwYwDL8FKrdnjO1b
 lhwJyvPw7kCOBZuIC0WQ5MXRxF1cF+K9Ub+UQ=
X-Google-Smtp-Source: AGHT+IG8JYsaw+hl7J1i1gLZzMh5xFwiFEPoWKzEN9s7YkFn11Tg9dVFhVlYoBk50qV41vfxE2lKbw==
X-Received: by 2002:a05:6000:24c6:b0:42b:3131:542f with SMTP id
 ffacd0b85a97d-42b593395b6mr12016392f8f.24.1763399833403; 
 Mon, 17 Nov 2025 09:17:13 -0800 (PST)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b5ce849ddsm20760971f8f.14.2025.11.17.09.17.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:17:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 18:16:55 +0100
Message-ID: <20251117171656.260404-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117171656.260404-1-titouan.christophe@mind.be>
References: <20251117171656.260404-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763399833; x=1764004633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrEipKpjM8itzRVrlQD6OVNxwZh6n33eTcXwMlDFtWo=;
 b=QhHhdgDCuFJso0VNWjeChMPekPzekh23/cWlmFJCSaeZCcDiTiaQCYh86ruh8N4CbL
 oNRISsG74kHkv9CrbA6iulazrr8GsfRAaxf9cwKG0+TW1hzIjckEoioqPi0ITf+MTkaz
 8gLOfFkC7rMgL9p4WXB34PVdhu7e6IOS6g+9I2htMCUvqCCiitxdbgDc8hHrTb0+DTVq
 Uld66gNaNFgMox6aW5WXPqq9SAhdYA6UNxeBlFqeWzB2C0R60fO+ACDVnjqcQ89z0WXt
 4k9mDH2dm/YqcaKU+8ePghYoy1FYAnu3iAVePwEL2+MbIf8JK4QLjvmj7nnVq5qizxus
 CeuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QhHhdgDC
Subject: [Buildroot] [PATCH for 2025.08.x] package/redis: bump to v8.0.5
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

See the release notes: https://github.com/redis/redis/releases/tag/8.0.5

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e9a495d633..cad5517181 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  7e185265d455ea8deb6bb7e071352ea691ca4d7b5105fc172fa524af59917b89  redis-8.0.4.tar.gz
+sha256  012bca956fc7151abc2281950e69768ee9c53ce4b36588772041675bc95fd313  redis-8.0.5.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b954190546..cefca5f915 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.4
+REDIS_VERSION = 8.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
