Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8155CC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 09:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8051A415C8;
	Sat, 30 Dec 2023 09:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8051A415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnCmALxPKVQi; Sat, 30 Dec 2023 09:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE41414FA;
	Sat, 30 Dec 2023 09:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE41414FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 234F41BF3B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 09:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD52813E3
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 09:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD52813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwkfmESwX1FI for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 09:50:58 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C74478293F
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 09:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74478293F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5b7b8adfso19382425e9.0
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 01:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703929855; x=1704534655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KDB1Snr2Uabl6xAJpt3xPORodwl8VuoBAW39+Biy0w=;
 b=NRYTZEtAfvtrAVjPSDV9lfm8dsdGn6fI6R/NvjaRZLzeaZrGtZGN7bdEkXbC9r1HeR
 Pk5TMfJ3gGWDcPVxBpfE6/pMOqC9c/5XlPfOit1HeOL8are2Ws3ahy3IT/Tj166HqVGd
 FxomNc2vs/bLK3UHrEF2F0abfrDnT5ut+vXK9ZyGxMoRQJhJdBeYDyso8xkD7CtP7ZoX
 TVT/B4LgcZhXbQJ2MvzBu9SvcAJDTEO6Q3QahH5eOsJ8xStUdxoE67mkysJeGf5IZP2H
 EUgnS3N4iqC0TmUv5u3uk9MCFTZV3CH+S8J+RSQf0LZ8IEyA56hXytTvdtDMyywaKL4m
 uEww==
X-Gm-Message-State: AOJu0Yyj7YQLeWn/wQ5gWEOB17p0r2eqPfyukOUR4BmYTTpoNy65MM0J
 D+rEvXy481+EEKLZaqX2t7IfISqzUdg=
X-Google-Smtp-Source: AGHT+IFlraD59x2bsXQQ4Wc+ijyj0ntqcFyI2aFP+eI41AlYddUMKPT24TM0IDqQUMj3evBoarYmdw==
X-Received: by 2002:a05:600c:190e:b0:40b:5e26:2379 with SMTP id
 j14-20020a05600c190e00b0040b5e262379mr6399751wmq.42.1703929854775; 
 Sat, 30 Dec 2023 01:50:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0040d4e1393dcsm26232218wmo.20.2023.12.30.01.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 01:50:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 10:50:51 +0100
Message-ID: <20231230095051.40929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703929855; x=1704534655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7KDB1Snr2Uabl6xAJpt3xPORodwl8VuoBAW39+Biy0w=;
 b=BT8ZcifRemF5P9Q0BltENGksNXMqVoG5LxToB2Tn0rUXw95NU9kVeQmutJs9zMv6+W
 VtbXMAwWORnfmP6jgneHDBp0GyUTDgGSn4homUdSNV1JDBqhNZw7PvGx1l4UsKCdUX90
 JXA/uVsZfgy0ZIAsqEXLRVu3TMRivO6FFCS9zAL1uGkZxfdSrrX6CeQAH5h2darvlzX7
 +vjMi6mCVejgyx0hTc5nfzKwT1XwKiBlgyUo0C8UNL6cCNAibYhiNQmQtxfYpkcy/qst
 eeo98dKeRHQCSoqKkIRedpQqXjIQxaeoSuTgyW7C9VUfWDud/IkOfEmatIWUfAarZqWr
 qzbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BT8ZcifR
Subject: [Buildroot] [PATCH 1/1] package/upx: bump to version 4.2.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/upx/upx/blob/v4.2.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 072bc0656e..545eb29af9 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0582f78b517ea87ba1caa6e8c111474f58edd167e5f01f074d7d9ca2f81d47d0  upx-4.1.0-src.tar.xz
+sha256  cc562ea7dbd8cec4505edea68736e04030ec5891c1e2a300e3c0d0eac6364479  upx-4.2.1-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 0a0e9086e5..d6c068fc3b 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPX_VERSION = 4.1.0
+UPX_VERSION = 4.2.1
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
