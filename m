Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F191C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4808160AD4;
	Wed,  9 Jul 2025 19:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyjS3gha1AjD; Wed,  9 Jul 2025 19:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BAF60AF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BAF60AF4;
	Wed,  9 Jul 2025 19:00:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE1A269
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB43740540
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKwQpTumT7HJ for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com;
 envelope-from=justin.m.basinger@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB71D4054A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB71D4054A
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB71D4054A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:00:07 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7d3f192a64eso20499085a.2
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 12:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752087606; x=1752692406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0shIw3+KVg32tzMondrU9ZlWqiGd/hyzU5m9S/FYbhk=;
 b=Q/nJRoWtUwlvyFSs2QAGAJG/MjemT7XPDNdco9ZdcnVxfut/thbvkBvo/i8AWg5myO
 e2cKzrPUn5W/94Uvl5OimXZjWBLWYv7uXV1j1zasga/66fEtev2DulDtRr7RQm5RJGOx
 CLb8DHXVQT+CkUP9MLo5lz4j6+pC1x8QC42tZTMErpuoi49Ep+Ou2Q2NN0PIP0u2/LJn
 E4vGBhZRiIgxRB1l9zrvCiR9kdhSEXLhPaPUBXNfditlI71yv2VIopqdHfzH/pyMAmjr
 nMBl1tVyB3L7g96dyTqRkC/ZZhFN5GP6XfNoS2hiDCOB5EoVkR/fwBQXZ8ZxabROeOMl
 FjcA==
X-Gm-Message-State: AOJu0YyR5DaGWisBE2WZj3DfwtETfTZUe2K5dlOcf24/9Fv3bTOXfaTR
 HK068M6zUmn8DH2Lbt5si95Oas9lrDRs/mjlYvR7rS9y3fQsrzQbjoPwNf4TgBRY
X-Gm-Gg: ASbGncu3mk8CFHrQ/WtvDumCElex7F1P9wEwf5XODSRX85Uu+XqcrqXzF4bH9hqpl5Y
 7EZZwBmvYq7hEnhDhWdpqU2qSEKW1dv7Hae3aBqKPf+3xBwEIGtc0SF/rlErf7sf5Q8LHXcR81M
 bZBpplGPeqwZu21VXHAyrQ46ZxfNQZfXZO9kQL5X3qHBbhpgVvb334FbcFwrvj8TGdHd9oySYmE
 7B1uqhK1WhhsLkG9tuFy9J5Ba/IgNQuvnKyAjX48lXxz+M7kQs+JtjWWrwdro0vfyF4SSa352Bq
 WbCHyhCGZCm6uUwx3kw5Rl0El4RhcELR4sFLTF2JI7H4NVpduSNHRGOeEnVB0g5PNaKzM7Ujcu4
 i2aa/N+eO9KeHaTMAF7Uz8l8RFOnxEAO8EVsGmxkRDPGxGRKqd5lNDHaFO/kZNRJRpq0=
X-Google-Smtp-Source: AGHT+IEcWMooGw7fB9rMJv8GhIJQmJwkriK7+Z+Xgv4wgOMGoQ6Fv4bLKFFmDhI0SHKNpOv8b+c1HA==
X-Received: by 2002:a05:6214:410f:b0:702:d6e0:8abb with SMTP id
 6a1803df08f44-7048b8d9bd8mr52335296d6.20.1752087606117; 
 Wed, 09 Jul 2025 12:00:06 -0700 (PDT)
Received: from 4309abbe4b05.ynsnsb35uh3ubhr4tvarlepncd.bx.internal.cloudapp.net
 ([172.191.151.55]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7047e1f58fcsm30807186d6.51.2025.07.09.12.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:00:05 -0700 (PDT)
From: Justin Basinger <justin.m.basinger@gmail.com>
To: buildroot@buildroot.org
Cc: Justin Basinger <justin.m.basinger@gmail.com>
Date: Wed,  9 Jul 2025 18:59:56 +0000
Message-ID: <20250709185956.889-1-justin.m.basinger@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752087606; x=1752692406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0shIw3+KVg32tzMondrU9ZlWqiGd/hyzU5m9S/FYbhk=;
 b=NBa3YbkAzbCrkYEH3coaq7GQ6AM6BCYPYc5P6E1S3f8Uj7q3vdNRQH4/W75965rbld
 ZmSmV7TejJAT+0tSSSB5EdSa8fdWcNMpx4139DXWllLcfRhcOxJ0xAh5gWULYD5vwxMk
 NaJgGTNmpKc0WLYkxR3Q8zjzBjmKS1SDADwK82r3nbPS5JgmRgCAB1/z+BP5hDZF78bp
 ckTNM7T3fC4NwqSY2KtpOg7kR1Orm6C+RG8BOglZBvTLxd3IpfjsaSIxxhnHqEBPRIfS
 xjAE6lTt13Mk2sKwpZEN0PeFDFsjSR2ry3k4lSkbfYqFxytpH+AmeMsptaxAH5xrV8an
 tiCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NBa3YbkA
Subject: [Buildroot] [PATCH] package/libsolv: Adding ability to add build
 option flags
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

Signed-off-by: Justin Basinger <justin.m.basinger@gmail.com>
---
 package/libsolv/Config.in  | 6 ++++++
 package/libsolv/libsolv.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/libsolv/Config.in b/package/libsolv/Config.in
index 1415d2bc2b..b680c9319c 100644
--- a/package/libsolv/Config.in
+++ b/package/libsolv/Config.in
@@ -7,3 +7,9 @@ config BR2_PACKAGE_LIBSOLV
 	  algorithm.
 
 	  https://github.com/openSUSE/libsolv
+
+config BR2_PACKAGE_LIBSOLV_CONF_OPTS
+	string "Libsolv option flags"
+	depends on BR2_PACKAGE_LIBSOLV
+	help
+	  Allow the user to add optional build flags in Libsolv
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 2317d3e663..94dc482205 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -24,4 +24,6 @@ else
 LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
 endif
 
+LIBSOLV_CONF_OPTS += $(patsubst "%",%,$(BR2_PACKAGE_LIBSOLV_CONF_OPTS))
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
