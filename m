Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86887C369CB
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 07:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241A941863;
	Sat, 26 Apr 2025 07:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxRzapsP4bWb; Sat, 26 Apr 2025 07:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFA340B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFA340B7D;
	Sat, 26 Apr 2025 07:34:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A5431
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6787740176
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNq3AaMIq0Sr for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 07:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 532CC40172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 532CC40172
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 532CC40172
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:33:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso16731085e9.3
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 00:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745652837; x=1746257637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/0QkeLyu8j+bfdyioEVbHTCU2o/j3m8GJvkhxl6QHs=;
 b=LV42pb8l9kmrVI9pCczu1+M/vNQGgz+KfZkbzuOi6ggl5umgCk6TNWays0ADTTl7mW
 K2y7xE8cVbebqXbWUlwyct67GwHgDJUU+hadrB2Ym/QRFrDkJ0QNMJ/1y+yxMzysO211
 H/U1GtGGxsoy+cmLOfhE2P101HrnMk6E3vLanuQuZ50zFxrB92iicHvR85AX14JCSa8z
 A42caPNQzizJKI/sT1hc2n/e7FtHU6MAuArM7f0K9iHI+RRT1YNox2mJbI/KGAhs+nDt
 QRw8A/vPIHsUxh0CxhO4k6d7wvB2aGcIB9cQWwW20KHP50c7uA7zatY1EDt3fo/5hW7E
 SBKA==
X-Gm-Message-State: AOJu0YybpgqRNn1+fI3SfjWY9uZyCbJ1R5MTXhPSKB7zsOVhcNZ9HVKE
 zvtRjK+QHovfdf97B4R1H2G8VVQbB4NudflGF/64s0LcCxJl/f/qH2/HgtfhxCC/JfVnvxX9X/b
 gC6NI3Q==
X-Gm-Gg: ASbGncvXFZrcRrWMRcVliKgYjaVxlxfS/7twcFbcETaad/IOH9/55niupO4b+kca/D8
 Q3+4jPXR8T95t68MaFL8Q7aQ9o/cg8GQIG8N9smBn9wMdR3+lrY1vCgH+H3y2cH0igdhPwrcz7Y
 5HXMZTQzFj/h8+t/ajKmHlernp6oTYbIHCyMMtmmjGNkBk9hr5471G+mkNwWjhSC8Zvw14pUNI+
 zKbzoCwl4mqeecimtSBueEPWIizwWWg2FPnF60iipKS4caYnaJWJ7yu2WGn0dCvQmYh3aKsy6bh
 PK0+7Gvf979ADk2ZFdrM3o1PmigQldRq5UBqT2uSC3VadTIjtHZDT1lzob/fiPhu+g==
X-Google-Smtp-Source: AGHT+IFh0BhwzgzvLH9XhiX7YceZS5pvUDj6sh9fsNmP5+QSv2/riRk20APk3BmMClABDF4BKtsa7w==
X-Received: by 2002:a05:600c:870b:b0:43d:209:21fd with SMTP id
 5b1f17b1804b1-440a66b7d39mr50034385e9.30.1745652837199; 
 Sat, 26 Apr 2025 00:33:57 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5311403sm48672645e9.23.2025.04.26.00.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 00:33:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Apr 2025 09:33:05 +0200
Message-ID: <20250426073305.1189443-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745652837; x=1746257637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J/0QkeLyu8j+bfdyioEVbHTCU2o/j3m8GJvkhxl6QHs=;
 b=FOfEtHrajfqJRy1lKqdOSOo1bGo1VbnvSzbrK2I8W+tRloVbdLjN9j0uPMAq2DoMf4
 q8CyGuQxAQrdZ2S4RKRoKSv6iRHSiB1A5vZ8nvoY//kourq3vG+/B3/7lO6ogRTw6PIj
 +nLyI3bicDuJtp/MKfPs6HaPJ+B2L3op7zYAOeK0Q+vRCDbJqwgIB5aJAWvJ4A1dPiQ8
 YiERFeCM7IMhMqC5xPY7PIwZk6fB39j6chB++lgMGWyhojMCZeluhp8xPSZxL/yLEC7i
 8iRjQjsVkLgX//DPsrytBXfP7OMmbhGxcpAlrC1ryZxvkw6xAW88ajBRd6cFPIziZx2r
 5B2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FOfEtHra
Subject: [Buildroot] [PATCH 1/1] package/nodejs: make target nodejs package
 virtual
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1], the host-nodejs package was turned into a virtual
package. However, the target nodejs package was intentionally not
turned into a virtual package and became an empty package.
The reason for this is:

  - No alternatives providers were introduced for the target nodejs
    package.
  - The Config.in remained unchaged for the target package.

As a result, running `make show-info` with a config that includes the
target nodejs package, outputs an entry for the empty package:

```
"nodejs": {
    "type": "target",
    "name": "nodejs",
    "virtual": false,
    "version": "",
    ...
    "cpe-id": "cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*"
},
```

This can be an issue because the CPE ID of the empty nodejs package
is the following `cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*`.
Reporting such a CPE ID can be an issue for certain software that consume
the SBOM and could be interpreted as CPE that matches with every versions
of the package.

This patch converts the target nodejs package into a virtual package to
prevents the empty package from being included in the SBOM.

[1] 4cbc2af604 package/nodejs: rename to nodejs-src and convert to virtual package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nodejs/Config.in                | 4 ++++
 package/nodejs/nodejs-src/nodejs-src.mk | 1 +
 package/nodejs/nodejs.mk                | 3 +--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 50d1360715..2a0074b5a4 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -87,4 +87,8 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 
 endif
 
+config BR2_PACKAGE_PROVIDES_NODEJS
+	string
+	default "nodejs-src"
+
 source "package/nodejs/nodejs-src/Config.in"
diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 8f934202b0..30e72743a1 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -14,6 +14,7 @@ NODEJS_SRC_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
 NODEJS_SRC_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
 NODEJS_SRC_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
 
+NODEJS_SRC_PROVIDES = nodejs
 HOST_NODEJS_SRC_PROVIDES = host-nodejs
 
 NODEJS_SRC_DEPENDENCIES = \
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6dc0e501b4..752971c4a6 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -32,8 +32,7 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
 YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
 endif
 
-NODEJS_DEPENDENCIES = nodejs-src
-$(eval $(generic-package))
+$(eval $(virtual-package))
 $(eval $(host-virtual-package))
 
 include $(sort $(wildcard package/nodejs/*/*.mk))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
