Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F778E7718B
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067ED404D7;
	Thu,  2 Jan 2025 10:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIrATgaV1_3h; Thu,  2 Jan 2025 10:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115A640576
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115A640576;
	Thu,  2 Jan 2025 10:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E9AE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E069260771
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxJbm4YczbAu for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB82660775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB82660775
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB82660775
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa6b7f3c6edso137178166b.1
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 02:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735812543; x=1736417343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jp7l1PeY36Y9/Dh53GBvXt8RiHCcKJbEA6oVDQbOz1s=;
 b=SLCCCki/mQ52V8i3uddE24D5jbwdsVHN1BsBpVBx9ZHsyMSyfSQi/ZABY/7cF2hE0/
 Po1fmH2rBhXF5tzOHp/99jDaQoJ3ozoV1X5rHF2PfCCeaFQlkV4aYuZ88mjRbkvwLJox
 XlBuQNWRXO0MP8VKM2c6Wrckd4hKRzmRP66XghMTvZQWkf7oO2UjTVDL6+mKq0NrW8Fg
 RA7aEkEQhqUtFWcbStnfqUJTxFELTur8uUIYp4dcq2DmPk0GHF5irJMRPcunTJUsj4o3
 5w77/4dFd+UvkhiII7/dJR+TsVW44Jun0CoXuoRNVDpjbVnH6LFy2sMujYUc7qKfmIrt
 L9Yg==
X-Gm-Message-State: AOJu0Yw2ErpKET7cEedA0fRMMiQo2T6bm7li7/kFFFFP2VcNd2NF7pX/
 aXGXFftRMbiqO2or6RmoIFue7nu/W1pcLsmEJZR63drf7U4ArHwxFHNzk2RASpDstYORi1AQNcU
 0BQw=
X-Gm-Gg: ASbGncu5OT6foZi7xqCjIcLzYaipZ5AKZ0/uUvrVq4gDuduadMgsKN+OE4F094j+XUu
 XTZkCX10nH4QcQkoZUWwG3a63LZdueit6Xm/Lt/oA0gPM/cGt7HiCXzdgSfMTh7lQMbCnIo0B2T
 OHTRqnr6zPeIiXz65//Gbt2dRZrekl3/GrXThnnXNQ+qMaz7+LaDSLFvrQKMrqHf3Dv5VVgQzLT
 sPvaBeRS3GyexFeq5Efhrj9a45L/jDabXyTXw43xtbqUs7G5W+WqMJulEodIDUlrF6cadGHVyWO
 odyu803UsPG6
X-Google-Smtp-Source: AGHT+IF8zReoRO6ZVeNQV64ozTJxpbISrq6sJBYsoHyjvokD5mknMJNtzduWdLQf5XmxnHqJex1oFA==
X-Received: by 2002:a17:907:7e92:b0:aa6:9631:9222 with SMTP id
 a640c23a62f3a-aac2874a950mr1418919466b.2.1735812541863; 
 Thu, 02 Jan 2025 02:09:01 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b10sm1759295866b.37.2025.01.02.02.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 02:09:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 11:08:50 +0100
Message-ID: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735812543; x=1736417343;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jp7l1PeY36Y9/Dh53GBvXt8RiHCcKJbEA6oVDQbOz1s=;
 b=iC7I1wI+Di+1H647TmnDcyLuJwz8X4B7TpfLhOYvEwFj4W63EGHDwBtMgJ3cYzAOBn
 ckE8txs+iU7Y1U4b0u6fnqUdWj1pe8r+IzYoh+bJHXv/e5/Bpe2dVpQTWvfvbhO5feAL
 3dT7QH+Q/r1S2L/AXqlcRze7A1tNzgl7e3y6k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iC7I1wI+
Subject: [Buildroot] [PATCH 1/5] package/depot-tools: bump to version
 58625e82c685426d441be5b422c9ad88e4867d20
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index d20c3ea336..9395b254cf 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57c82ce07695d439ed9ea6e4dd8a7321203eea45eb3e1ea1c3f461c630dd1460  depot-tools-1b58dc68659445b1d97d8341f8158be25eab4957-git4.tar.gz
+sha256  b4dfe43021f40b360e33a252fdb21b0bb31c9a25629b6000bff987e0e178dbc0  depot-tools-58625e82c685426d441be5b422c9ad88e4867d20-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 4bc9d7a470..3ae0055fd6 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 1b58dc68659445b1d97d8341f8158be25eab4957
+DEPOT_TOOLS_VERSION = 58625e82c685426d441be5b422c9ad88e4867d20
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
