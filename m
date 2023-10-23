Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0502C001E0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 13:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 096A66116F;
	Mon, 23 Oct 2023 13:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 096A66116F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8n-D2GvArqW; Mon, 23 Oct 2023 13:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE1A61187;
	Mon, 23 Oct 2023 13:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE1A61187
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32AFE1BF36B
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 13:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE08416F3
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 13:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE08416F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAk6i9xkVniv for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 13:53:17 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3998416F1
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 13:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3998416F1
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so43534291fa.3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 06:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698069194; x=1698673994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hBXEPZuBLt/ogvihZpB5ex1C+WAA6YLmF7nVGFZu9qE=;
 b=ApmbeBooe2uzOFYaYXfK9pye47MR/cbRckmdvwUMoEzYGMMxRwRAG+kmOn8NoCPPQD
 cCY472dR1p3akglZ3nf+IkdB0sE/NzGOjfJknSGjtfGsAeCO2hC+jQGf0vPP/7hxGYwZ
 f0eNO8OUCn+o9k4APElq5mW2Q1Q+/vPwWckTCZaOhIdEHn/J/9ImyndAaBPSAVnc4wt9
 XX0LkOeku2rZrtMUClXkeuPi11vFlZmdOhUKfRMXWU5nYdYNi00ct8xlWSVSQW4VnUl0
 DIvKDh7Jwy2bN2/eeiiToz5W6bn+foKVkrGsKOSDW9fGRlQPtGPkJP8gUrn1udt/slB9
 zpPA==
X-Gm-Message-State: AOJu0YxjI94qc01cUFaNpI8F/AZdB053B+MxXDnJEOfvnpUmvX5ZuX4x
 uRLwW45Ps7wy9eq/s6dNLozvWtdpVir3IQ==
X-Google-Smtp-Source: AGHT+IElozP14cpOOPJ7aEKUoFxqa9DUD66+7+48qhvYv/mh7zeStVlRlQpOsKJkgFTIdpva9ojfxA==
X-Received: by 2002:a2e:8698:0:b0:2c4:feef:852 with SMTP id
 l24-20020a2e8698000000b002c4feef0852mr6181955lji.32.1698069194505; 
 Mon, 23 Oct 2023 06:53:14 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:58f2:6635:fd54:243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b00403b63e87f2sm9634113wmq.32.2023.10.23.06.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:53:14 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 15:52:51 +0200
Message-ID: <20231023135251.63644-2-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023135251.63644-1-titouanchristophe@gmail.com>
References: <20231023135251.63644-1-titouanchristophe@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698069194; x=1698673994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBXEPZuBLt/ogvihZpB5ex1C+WAA6YLmF7nVGFZu9qE=;
 b=ZLNiAom5FZPVKp1NuCBu1VR4V8uqSmyoZyj6ofGBFV0EoamYNJnPoeQH97kuma61cB
 bzY3b84lJb6+sp2iB4pIULYRINOFwS7EFQ5vYhRS5xSN+x7B8hQJKUm/4t/tMgZaSKoY
 hR26hCd67tJ+DL9LCieQCCCcWOZ0G6YFyLK7MNLMrGPBZr+iKJjxyP6mrtlAklGbOXnC
 GC9J/8u1AAf70zAvE3240Ty4ukN4XGnPlXlgslNqyWak/u4mFPhz3S3a2AllieDMNEa9
 aw0mjNkjkQ5nG/nV16mzuhW8b9L9th8SLUel+VsK/w0iUwZUyed220bMPca3qNX4rpDv
 44sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZLNiAom5
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes CVE-2023-45145, see the release notes:
https://raw.githubusercontent.com/redis/redis/7.2.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index b73df17790..d1874d026a 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4  redis-7.2.1.tar.gz
+sha256  ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08  redis-7.2.2.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 04f4697e7d..a6b58148d2 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.1
+REDIS_VERSION = 7.2.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
