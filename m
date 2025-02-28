Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDD9C19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68178471F;
	Fri, 28 Feb 2025 14:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMo9t-tsohLJ; Fri, 28 Feb 2025 14:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E957084719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E957084719;
	Fri, 28 Feb 2025 14:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04F2268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBBA360B20
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTIbtTQgxEum for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 14:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAC8060817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC8060817
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAC8060817
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dc191ca8baso407925a12.1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740754105; x=1741358905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=na2PMPLLlcv0Bvh6WRnPVtBcFYKlXUaMiUoKOynwKPM=;
 b=QjLpd36Cn2grKCyu2IVdAHLBl31baB7l7Uj77uzCpFGbWtZunlAuiAOgvthR8u3FHR
 mHPh1k26NbrCdYTfpsN+cL/AVLPc/SQX3uO4DbgkkVNmA92rxRUH65um9bzYBCiP7Aks
 jYvfhe4xXKueg+4q+UNGtCrAqa50TK/y8G6YbWhB6AE4X3yox118weWiSqND6LZWjME4
 pP9T/v/YkW2LFMky176k+yWbmPnMCY3hhXWVCFzbQpTyXd2A+qEKoXlbzDiTiaf8ap5D
 vhIIwQYIE0oiee7K+6sjwsPq/ahPHeblbeKGRoYwWG2wdChgDcdu/OgpQfbV3reWPDh2
 Z1uw==
X-Gm-Message-State: AOJu0YzHFXKCarg86UUrodF6Y6WYaoK3BBU9T1RQK6Y6zAkPmBX3Yafb
 J0EMNQmXAF4o0DC2msWSDoEF+c+WfEQkwjyfwBQAfLq987Jm2LaPhQKoDqnKlNXrSCW3s2MC8OP
 K
X-Gm-Gg: ASbGnct4fUDrOrPZI2M7GSrT5R+FRAQHCSes4r3guv+TcBKX0E0AQcVk/75eYHfqHki
 SPoP84j+/wKYOhmobwXUWGdQ92v37syZVZC6gaI2nRR26jfcbvk7O/nglEzV8wUH463po6sTiTA
 +I+uDVQ0wlKdlYoojjWKr+IVDCMS/oSA2bepso31gqTpfzrZ95pziZHY1rhK5zYEtX/2HC2BErq
 uLLvCLOOXqOsQ/k07Niy59NcwNGrHRmCvVxMbp6EuToO1XdpwGNnEx3WGR89f8jDOaH/Xz0HBCl
 bflCv3FDIb50JyjaXVUfQcETZFU16fi7j//GXJmc2BMoelhWEdbJxKBMvQU9TdqU4VbvMfd6U2N
 nmw3OeZV2cfVc
X-Google-Smtp-Source: AGHT+IGtz0m1lnk7tWfaun4obq2+R4LDu1ZZaEPs64bq5oT47ikzpcf/URW21No6j3y1Lz4dkpsEIQ==
X-Received: by 2002:a17:907:2ce2:b0:aa6:6f12:aa45 with SMTP id
 a640c23a62f3a-abf273b35d2mr40837966b.7.1740754105507; 
 Fri, 28 Feb 2025 06:48:25 -0800 (PST)
Received: from fedora.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4b3sm293663566b.112.2025.02.28.06.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:48:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 28 Feb 2025 15:48:19 +0100
Message-ID: <20250228144822.860085-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
References: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740754105; x=1741358905;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=na2PMPLLlcv0Bvh6WRnPVtBcFYKlXUaMiUoKOynwKPM=;
 b=p6zRe3TmIcnURvGQSk/3V3dned7xNgqXXC0G5DXbaPOwqBgw7JqcHfEGuafgj8wVa3
 LyeE6y/geHQNhrEj+NCNcW/lc9DQtxmmxLeQG8usGeN1/mxUmay2oILKcJbbFjYmGZRp
 2D1kXsfYJi0dK9bM/5aRRFIDZOqTXTZIUtBkE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p6zRe3Tm
Subject: [Buildroot] [PATCH 2/5] package/depot-tools: bump to version
 c4e7c8717cbd057339731e8b629c2e29fcba9c42
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
index 9395b254cf..7fad1741f2 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4dfe43021f40b360e33a252fdb21b0bb31c9a25629b6000bff987e0e178dbc0  depot-tools-58625e82c685426d441be5b422c9ad88e4867d20-git4.tar.gz
+sha256  356685b02a530d80563e838b7491ed9b0f5e82b968a3fbeed088b808398c43e6  depot-tools-c4e7c8717cbd057339731e8b629c2e29fcba9c42-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 3ae0055fd6..71becb3a00 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 58625e82c685426d441be5b422c9ad88e4867d20
+DEPOT_TOOLS_VERSION = c4e7c8717cbd057339731e8b629c2e29fcba9c42
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
