Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD7AC369BD
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 11:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE636F68B;
	Wed, 16 Apr 2025 11:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW5yMiTVDHAB; Wed, 16 Apr 2025 11:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0EF6FC1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F0EF6FC1C;
	Wed, 16 Apr 2025 11:46:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC889DE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 11:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBF7846EC
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 11:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZF4khjxq4cN for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 11:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 421C381990
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 421C381990
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 421C381990
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 11:46:31 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6fead015247so61367997b3.2
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 04:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744803989; x=1745408789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MgMdAW/Ah1FW3FHgnaWdqEU/qbbIrat7VwujDFNBC4g=;
 b=EzcXGVuuSqNfOeBQ6ubvMfLSqDQ7roRUe7DQ1Chfig8YoFsx39hhLDWjUyVzL7HsmA
 +rF6+NrZSRdTCHoJojQ7Pq+AfS35mtP0/Qv2uwR9sbldY8XFDgjyTudrtF0C1WfZG+iV
 zg08A34svrrLd43HGzMeghOLq5gnEG1x7b7/6dafo2Q4FltlQK1Kd8oUOOuCFhLsyULE
 2m4jJYvuoQG8RbID02jOJsTY2oP1N9d/kMOI7/FwUwlmu6soGdB/dBpyWrcAL5ehLJOy
 hHedTOTmyI1ueLzsqTT+eHvo0fQ1BVE8wIheaYhnOC92383mgDfo5pttu8MfVLslvq4D
 5DdQ==
X-Gm-Message-State: AOJu0Yw1EStBUkohxrBLNqf0JeZ14D+ix82aLMcNmK8Xsn2djlrJb457
 Vlaqpg5v8kwFvu71BcLhFdlFvbvv6hlR8lI3x2IfVrNdA1p5BAU0RVkQxw==
X-Gm-Gg: ASbGncuETnLd3y3ziyJWnKXaDgzuA1qhcH2AOZlrvlqqJPOJgaQzN/aNbToE7JdBK2Q
 jLPKRKF/dl9ee+EV1dB+aq5KGdW9+1/w6OysFqFurPtkFdgLbaDsm4Lyri65Qy7bXj1s+ZF5Br2
 9JxUEl7+zhDC4IaeHIClUk1CiXjenyUNt+//6+beSKNYUjbpBkNEY6pxWpuP7ZVyxTVGBu8Hi8r
 9oUZVxMUR1lTB/gQTGPOvxObk14+zae5B9ZpkTv+yZwmZpw+KJ22tKgtP2cymCPlWdkLunLBkJr
 P83iMmd6l9D5fUvA9REBZCJ4Ykk5iFXuLFm03g==
X-Google-Smtp-Source: AGHT+IHVoYaP+bs51KiQtgCqp58YFJ3Bg3RKK3PmG5GhVvdYODCphmI7RUDlTJmYBOoWhBjGtU/E8w==
X-Received: by 2002:a05:690c:a84:b0:6fb:b4e7:1471 with SMTP id
 00721157ae682-706b3255c7amr18121327b3.7.1744803989495; 
 Wed, 16 Apr 2025 04:46:29 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-706b57ae640sm1276047b3.105.2025.04.16.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:46:28 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 16 Apr 2025 19:46:18 +0800
Message-ID: <20250416114620.140463-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744803989; x=1745408789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MgMdAW/Ah1FW3FHgnaWdqEU/qbbIrat7VwujDFNBC4g=;
 b=hjFJDB/Mty4HnALcXkEMz5qYWUZr4ErjhQ25ifINhdONXkhcMWOoIf6toAJx1d6VbG
 Eo9SJcu5nHLzPEoRAT+2OyXqIR1W0sLkChB5e9lCUB3E820vw1ZI/KQikGgAuqgTPC8j
 6UiMgIicMXasuACuvHaYCcDonNnTVREQ9fYyLv5TyDujkLC8oSW5+WauPBPwLFqybf7w
 h18mx8k5VcuGQWp74IcZ/CN/JgVu3SElHoIE/DWT8XMxXMGBqHMkpkRVQ5gthGAgcdAj
 E+xz6G0A72RMcVuloMMduPML2PJs3xlCI9wm94WorP+6oLNHctDpqiKfI1X/1Nzz3lJG
 GTpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hjFJDB/M
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.3
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

Release notes: https://github.com/timescale/timescaledb/blob/2.19.3/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index bfef2757fa..3318d4614f 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  727e15da6dba48cdcc22df8af23ccc2c3a8e7def9e4575e478d03031f8f637ba  timescaledb-2.19.2.tar.gz
+sha256  ef2c9019f3e292f77e274a95386e550cb8c358ec0e053f6b7097565f61381e01  timescaledb-2.19.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 4be3508a5b..024a72d4f4 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.19.2
+TIMESCALEDB_VERSION = 2.19.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
