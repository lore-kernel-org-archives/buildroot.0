Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37170C5CFEB
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 23:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E11A8833C9;
	Fri, 20 Feb 2026 23:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYYYAUwEB-z2; Fri, 20 Feb 2026 23:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D084E83294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771629702;
	bh=w9htYe/vB2M9aXJvcgtN0L9JHsLL2Wksfb2VmZ/ICeA=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jyePtmCT6sVLCy/NPYBr5BRPPBQfVKv9y7zXMoDeNCtGHOrjT+jr5prYgubqqWt+l
	 J2B6JngZ4g0vcjjUSvxDqCeiGEdwsHSVNPYcZKY1IOWJBkyQkRpclnKZ0C7NHK4lqO
	 HVKRohqSnDmEPAJZ/ivHmxG3ly3+iV7n/HpX1vyQUoID2o+61071mhh4kqzqB+bMPR
	 y5lwviGM0/M4mMktB4RdRLNK4WiQu/u46grU5Uok4DI4vyGhtjxxKVoSEzmDu9+xQj
	 j0dfoYBySzDr8W1NimprBWO5pfa2rBKWcKyQ8dv1fKX8v1AePme8bVk8GZYeAJhyD+
	 h8VCz/LAAJ0WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D084E83294;
	Fri, 20 Feb 2026 23:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1C31CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 23:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E76BF608B7
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 23:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfDmsX6pa5NU for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 23:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF81F6059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF81F6059D
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF81F6059D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 23:21:39 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2a963f49234so10417325ad.1
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 15:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771629699; x=1772234499;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOlikldMTV3B2xf5Myc4BQHCm59CS2fFAZh///rneEc=;
 b=fZmyg4VIo6/kvlyyPd4gMNn9ICNj6gZK8sfXJICyCYIjrzp4BtBHmPyhLOeIBMGCsN
 ub7zXQA0MdBNq2PXD+B/UoSi9iXSuouvO12KQClh+eJcoF6itsZHM70SD+LdMlR5y/mQ
 2D6DEuCIayheFW91tXNYjGJrOR8pvsyd89++e11UJqGzv4Kc9UOWaM8cO9jblyiXeTaO
 rJ65fRJTLsb6dYOwqksL+zWBzpmxUdDpgfX1JGvpJdzdISylUYCQgBuegKg+pE4pxV+C
 +qABH0Tdz4KwGdL+7WluBHAn9h+UI6KOx3JeJzhHOIHb7mKerxu0q6mWkzZjnSZ8umrb
 zAgQ==
X-Gm-Message-State: AOJu0Yxg9AduQ8KlCgbbXNTdSLlSsJBh8OCeJv1EZgbIv62L7HAtPyFh
 y11CJNstJyOpHkq2bv8Yoa6HK/QswyvT9SChVrJeyjYp2/ipZlYRApIN
X-Gm-Gg: AZuq6aJcoBC5wPU3scPPAXk7b/rrBOCDV1vSY+0PBMIb5STEt6QZ1he0WsOAV8qdTTv
 luTgJGrLn5DfpWlqDbZysaI/9K6dDXRjB0TfjfJRoONHLs6a5r8YCWBXP5+gcNBjEH/9Nw+28Fk
 yUkT/32Qro2QOeb7iOJ62mkOWvX+G/LCn2TOuJWG6WcqprYEw1WYfHMkpnbuA9fQJirT5KGtWGY
 evkFi0e33lcQ5txsA7mdnPrW+KpOAAA4KMbLRcKfR7i55k37E2ALB8Ezgs6finFwoSlGXZPal9t
 OmBqEDiB+5QUKXTnBnrcz1mfw2mxxTlTdM5bjC3hun1THcfbN8KR1N3L8rVqGj03BreB2sa23lC
 5XAqbIgMdK41uT4GED3bIMHxPVJ1tDA3WctScXB/O8CsD6od/sAfN07wnta4QqolNmtmDNk8za2
 5GvUdXi6HEptNBZ/IaUeb+QH2BVw==
X-Received: by 2002:a17:902:f645:b0:2ab:2459:a33b with SMTP id
 d9443c01a7336-2ad7449e53amr11468695ad.24.1771629699070; 
 Fri, 20 Feb 2026 15:21:39 -0800 (PST)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e1d6sm4223605ad.58.2026.02.20.15.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 15:21:38 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 20 Feb 2026 15:01:31 -0800
MIME-Version: 1.0
Message-Id: <20260220-llama-cpp-b8117-v1-1-20e68ea57055@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDMBBA4avIrDuQTPCnvUrpYhJHHbBpSIoI4
 t1Nu/wW7x1QJKsUeDQHZNm06CdW2FsDYeE4C+pYDWSoM0QG15XfjCEl9IO1PQq5se3u5LxroVY
 py6T7//h8VXsugj5zDMvvE2X/wnle6pa7rngAAAA=
X-Change-ID: 20260220-llama-cpp-b8117-e23d56923b35
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771629698; l=1451;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=UxpoWUe8uFVxjvK0Jm/FhdnArtOIbKN+4edlE6C/hKY=;
 b=CPdAx27vp0JSWluSW/WcM5VtSl+KAbE8Axtih3oSts3wRByZiC7oUYQWNC5sQOw3IOgSVeMzt
 gZ/sxrzmcUsCpdde9RsuCekezPaIvespL59HGXoc4KQGxT8c02CFrph
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771629699; x=1772234499; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MOlikldMTV3B2xf5Myc4BQHCm59CS2fFAZh///rneEc=;
 b=ZdnsCIuxA4wJiO4lNBT7tqlckLmvK5ja2wQd72eyzKJAgnKjanTucwlef89gGRPrJI
 vAoW9wLrpVPT1vydYv4W/xJvXf3UCkvVV4Qg8ky/OrGX81OztQUBDQjLnMaIkFy4A/QX
 fx45GyGjS0+s+NbLk15o6Mn65MaGxqwQTTsH4rN6IiEnnvPF+XHRuhrO0mL+i1IxC6+d
 aghBq7j0/LH+8f7q12kWUqLQra72PJVJk3L7y3WJT+16ipy5TwYZrd23d6mtDww1xZbB
 iOWOdlLLSnISoP7XT0DaI6UW1rks5l7rj0/LCEyEXWH0J62ikLCTV4OIkcgzlYlmX1Wm
 WWFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZdnsCIux
Subject: [Buildroot] [PATCH] package/llama.cpp: bump to version b8117
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

Release notes: https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 765025f180..d929d40ed9 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
+sha256  4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  b8117.tar.gz
 # License
 sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 5112022656..f104766403 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b7271
+LLAMA_CPP_VERSION = b8117
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT

---
base-commit: 6c83a0b8e5658b901dd35ae23217075f035af998
change-id: 20260220-llama-cpp-b8117-e23d56923b35

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
