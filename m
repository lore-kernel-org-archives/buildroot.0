Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30065CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0754188A;
	Tue,  2 Sep 2025 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV9Rq_Tk4EYj; Tue,  2 Sep 2025 20:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0545341822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0545341822;
	Tue,  2 Sep 2025 20:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A95CD2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BDD28421F
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCRD8VjqpxL9 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 20:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6334984244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6334984244
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6334984244
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:59:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so7491242a12.0
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 13:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756846754; x=1757451554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5w65ljCez5KikPS/XhqlLH3oc6ZOqXuLqiyQPRsXzc=;
 b=poNbfpz9Jq+tTevbUk46nFSvrSIs2hJwCqHVJFze57YG7DXNAjZMHIvNzIHH/+XUjM
 hPLtc91PCBHHAI1FZ5STqgTGXWt+NZGJPmeyIj27+K8rR0CILrFoNLRiEMGgh7hX59t6
 gVyEG3Uf1/JLkqUaKppzuz7N5lOxhFbBhQB872/ZCG66OjyV2ZGZHANWk/4aMeyYaUCo
 AfY/tX4Hxd14akvDafSgYZHKM/sT6YcHKZDs2Bw3Su4sfvCb3l0irAUB+oSak6f9SsfD
 2EgSaHTSKzL1bk2Sb8vZNgLKTZ46k/rOUDs5ZSkF7FHVfh1gQLnf0RdHjPslBZd2KTAM
 AZ9g==
X-Gm-Message-State: AOJu0YzUZdO9+POca2odveDny69mAslZbmue4kCvIN6fv40iqCwWptvK
 05pLuRBJEwko8tYKAkUWw8HyNx+a1nq2+OnOv/g2v7bHAIZq4JPQlHj9CEUKjBmxn5OKHnK41Ts
 blasS
X-Gm-Gg: ASbGncu2l4ULSiwKYwz/UByUmqxEQ9o4KiHOn+1z0J809q8N0/9ye18KBOTmoAUyWFf
 +jV+mxSRo1XPZzO30r/JXf3NjhKCoDTjJG/r4PfQh4xbr8+Eli0KncvrzOvOzyZAxou8OguD4CX
 nbUKxbt143+CNP/FVi6pdaFDKpJwSqgWrWZ/3ci2lYCkShf7O/5EmI90YE3Idxq7VUfbIVPOjR4
 THxdLF2AZvne+DLT4wo4d8Dw8pbG7p0gjrakHWbUBQPPDB3pbO7otYfU3b4/wcpNqnChMnv7a4m
 GQ4cq7DuLpeL5BIKdZ4a6fBA0G7nUUvweBGQ+Z46cCjCBkh46ilPrfaz7RZskoSbLc5501gKCYl
 UzBbGX7Mqwe3TWD34XAtecn8w80W75bFyojU18tGsf7FzaF9OZqHNk6yCLRV0JA/JgVcaHzRYfL
 7xvj1Ox6MuByPCA03A3065VQZEa43mwNmjs49zhkkOZ2h4xRVP1LAH3rLOAiZYw5U2yyA3HA==
X-Google-Smtp-Source: AGHT+IGy/PYqw/JPTS7aET7HQGD/1uf/HCJPensjlTzIS7rGZzDvlA8wcQvWUUL4v9H303euOn+nfA==
X-Received: by 2002:a05:6402:5110:b0:61c:73f2:4b3a with SMTP id
 4fb4d7f45d1cf-61d26d78b9emr10340100a12.30.1756846754262; 
 Tue, 02 Sep 2025 13:59:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc07sm10763223a12.30.2025.09.02.13.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 13:59:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue,  2 Sep 2025 22:59:02 +0200
Message-ID: <20250902205902.668394-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756846754; x=1757451554;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H5w65ljCez5KikPS/XhqlLH3oc6ZOqXuLqiyQPRsXzc=;
 b=d3F9ItfR+YJOMbu4Ig2lVrpNosos/8VgK0H2FQChp5n9AaXBoOoF7GGslKnxchowid
 1gFpKBUiwNB7fWRwFvCVcQRAhPSBkiUAifpx+beir3ysuNs1CJRqnlZjX3xGPFfFnBb3
 xMSoSKwq6Ea+MX9rFrgBsrpywCGczXbaxKvZs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d3F9ItfR
Subject: [Buildroot] [next 1/1] package/uuu: bump to version 1.5.233
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

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.233

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 75e298e4a33a..b7d5c06f7e25 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  50bd2ce7e7fbc5fea38bcd138da46ca84aee3aaf723f674fa8546ce70c070c0f  uuu_source-uuu_1.5.222.tar.gz
+sha256  aadd7edb9494fe1768f7d2964aa470931da15bd83f82a1829d786f8ec80ca169  uuu_source-uuu_1.5.233.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 61f4e82ee36f..bdfd00581a9c 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.222
+UUU_VERSION = 1.5.233
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
