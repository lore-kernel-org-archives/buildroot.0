Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B1CDB46B
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 08:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7406F87B;
	Mon, 22 Jun 2026 08:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAFU65MXtugf; Mon, 22 Jun 2026 08:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F1486FB04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782118228;
	bh=8rbyRQuQO9v3MfCsrU/bM3HEgPoKIz2wWvxc+Qe5cY8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGtSYlici8nNQxzKQNf1v3AXTfc+Xzi5dZN3WPzrD6qF+5l85xKoEU9SpFQNxyDE+
	 U5UFtA7Xy8c3qXMqgdJzYygvVYp0F3sLZL3mF9pZzRjWHTFlp2I2BDPZMSLHbvie1G
	 L7c3j+kKED8Cgy+Uik7ZosQV+gywkq0prZ8tkh5Hxc4/ImN/+dOlOqB66YclG+ZRP/
	 /BEa7I9QCC9FKtYYNxja2Yhqi5EYkTYtDC69lOglEtk9uC0uUTdu9va8ZTlIXZXPYu
	 eQ/sZu11tCBZwqZx9kSEWsqd47zxmDb2ZniH2SnyuctJgaQR/OoKBN3jlvYaPDMp1M
	 vjC0OreMx4WBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F1486FB04;
	Mon, 22 Jun 2026 08:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 250C5F4
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B39684FDC
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q711Zou05yZ0 for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 08:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=thi.zirnstein@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A6AB84FC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6AB84FC0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A6AB84FC0
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:26 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-c0b97e268f3so332509366b.1
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 01:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782118224; x=1782723024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4nv0lx+QKKNSbvwy8C9oQ2pPy4+2khsaVstZi4ChEvs=;
 b=S+697gfBFbAGi/fA8KsxqAAoLztdrHkMimSPQWCn543j2zORCoZc3eSH5Qxk2xPc5Y
 IqBKrfmdgZstruqhvT5wF6a8jLuqT9Dzk6OFlGguTbyv4PrgZcuMwW6n9/9PwqNPavUH
 xT61OtPsur+wquQUVyGQw2DbKuLtDzlPMfLWPccOk2an/dr4J/Sxl6BLkP37GfsoJoT5
 37WsxifMB5UoPfE8W2kqd4VuCaqzr0ikjoL02BoaygcSzXH6L1jaDDcrUjdXXyLtgi38
 SLfcnoqs8GlVyQAVE+C+AyhAhGkO0KlBn+BEGvFKxYcKGaOAYrFdoDU8yc9NsNQy0dXw
 IOiQ==
X-Gm-Message-State: AOJu0YzItN7ojYl2A4UO7AfO0Z0bjdG1GBVBUBjIicqEG0GXPWIqi8V4
 rF/uscnnc2TYpZi+b7V5IWHRc2uNcQV324KM6JXBzSt/sQdWMp7jOEkGrvo3si4i
X-Gm-Gg: AfdE7cl7Q1JHnoHhKQYqXm9C6vwrjXhdmwn75YnZJwFD6Wq5P6m1DAR7D8pgzGpKO6G
 fK2Grx+GsRfUjHtQTcdgoD9Uj6FJGStzeReld5tbEPM/TxQgtg1kihyedA3oswN4y9Xq26x4qRW
 u9hWTq5Od/7Mq/Kh6i2ddxOeCZwgdTik2BC9kEd4xTSM+SuCAXJrZwDhSILXdebB6nzbisT++kI
 Ycfq20YaYZTlVto/8w8DhiYvm/hjimw2XKM8699NCLcRZr6bATxoiXiuTcf2n9F2P6Ax++gBFxg
 6b1q2RTeDKCwq8w+BQdR9dbUah6MdtjcOCA1y9pUXCnGEq+N0si7vBuCtKS5sVTODMNgqFoufSr
 tUuH65KFrDag5RaUlEak5YpPIyN8cVcjxjK/kNRSxC2xEydq5SdqAgrs+2Ds44isc4uZgX7Y2C9
 IcFGk/eJeA5/XsHQ8XdMvq/nM4awZ7bIqOhvPP3V0iFGoVN6eZr6Mj5leikuKBHHBEwEfbos9p5
 YENOWuAWn8Qkw==
X-Received: by 2002:a17:906:ef0a:b0:bfe:ed35:e85d with SMTP id
 a640c23a62f3a-c098f33f303mr618911166b.53.1782118223984; 
 Mon, 22 Jun 2026 01:50:23 -0700 (PDT)
Received: from thi-server.fritz.box
 (dslb-002-204-230-174.002.204.pools.vodafone-ip.de. [2.204.230.174])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c5e998decsm317374266b.22.2026.06.22.01.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 01:50:23 -0700 (PDT)
From: thilo zirnstein <thi.zirnstein@gmail.com>
To: buildroot@buildroot.org
Cc: thilo zirnstein <thi.zirnstein@gmail.com>
Date: Mon, 22 Jun 2026 10:50:12 +0200
Message-ID: <20260622085013.802927-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622085013.802927-1-thi.zirnstein@gmail.com>
References: <20260622085013.802927-1-thi.zirnstein@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782118224; x=1782723024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nv0lx+QKKNSbvwy8C9oQ2pPy4+2khsaVstZi4ChEvs=;
 b=ZCbHmaEFBbsFqZqNOv6HWbajNnDcI/TddmdKH4JYzNRFQwecDd/VXhHGP5ajfa2V2l
 wZBCnozDczOStFBXdK9e3WNwpbz4HFIxIFZ+bif+ZnzgDqoOBcX2dS3FPc3a9Mn4FWyD
 L9oMVkRXOV/gkG3gzck1lZ6H05A8e8t6ymAXBg9ALw4hmkOMYRfPYDGq8D7yhonlDmlb
 eL/cUEfdplYs4jWmvUCxrL1AQAUl4zZJDK7eR1co63lc7xVHD8zv36C/ilgxC+VlHbbq
 ri8C5Au6xorqWcabYu4Jjd0G13ndwYcMVSfxp2iRVIcldnJSvtdj301Kn/z6GH9F5NAw
 grNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZCbHmaEF
Subject: [Buildroot] [PATCH 1/1] linux: pass host-pahole to make
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

Signed-off-by: thilo zirnstein <thi.zirnstein@gmail.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e790daff66..1c9d3fcdf8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,6 +166,10 @@ LINUX_MAKE_FLAGS = \
 	REGENERATE_PARSERS=1 \
 	DEPMOD=true
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_MAKE_FLAGS += PAHOLE=$(HOST_DIR)/bin/pahole
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
