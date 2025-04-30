Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8DBC369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 14:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A0960FF8;
	Wed, 30 Apr 2025 14:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYlsT5xou7zw; Wed, 30 Apr 2025 14:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8648960E3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8648960E3C;
	Wed, 30 Apr 2025 14:33:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 181B3943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 14:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A89E4026A
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 14:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0CmaU9hzJI7 for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 14:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F17EE400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F17EE400CB
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F17EE400CB
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 14:33:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c14016868so7999937f8f.1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 07:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746023596; x=1746628396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uanaw2yJXFXwfGWoEza8nIVp5YhBG7UO3fC1ZQ26CZg=;
 b=SmKLCvM3yFYMR07tCTHJIZtp6frkddl/9cIBtJw/6pyfMT+xtCfthqSLQcPoL1lN1r
 llq0s9d94kKcoRXfBvMRLeiWduyfVZGicYTFX/ULQSN7WP061aTUJlPsz1HGYyz8T5by
 UifQFiP5o0u7snQmcmPC/cg3XUmD6g5hFhcfP4Zg9k/k5EcACNZKTcMErwKbsvgXZQ/4
 II/Z6SQ/LNfV2TVtVdcYvonhaq2X77CXtqgs+euDVVxl0IYjHP6jN+FNJ/q6CpDse2KX
 qodASm0sdokwvdMId3iXwjIiXOcHb4psqrXh4kuTdu3I35oysAPT7QHFHMpPUaep6ni/
 s8GQ==
X-Gm-Message-State: AOJu0YxJZ2XBhgKZfPi7iM0pfAdk/7WJadiGTQ96D3ptk3q+T3ZXTCMQ
 1aKAQ36n/g70Uq271VhqCeAJ6A0/LOiskjfPy3KPe3ZTNDqGnhhY/SJFWjuecm55pji42GHCVRx
 +fSM=
X-Gm-Gg: ASbGnctqxzVH2TVSBtpTRo7heKj+qqD3iZAJsBUSY+e+gcqwk/nSp4ImOfNCudgCgfg
 OqO+e5SW3T8vkewvuEpRLn0y3Nskd8hKYeVsjW9p/LgYNkGr0fdv7jq5RmyvAsY7chKMZTIrPhs
 DzcJaVE8TrhclM8p/yEAKUYopqI7sJb43gs3NnEuCaPHK1Quzt/yTA+woKTJwHqsnn1ahEtaz9l
 oKbN23a2nTva5zbLdeBbewWSWGDSZuYwaUdtu400NQx7f24o5VDLj5KHGIQZ/vqdQCVucUixVXH
 8Ii90IKgxU8YtduRwo9Nq6+0Y94+GjFnjKVfTRjTvZ7YNe4FwAqYYi8deZdOVIB7VlDYn4CvRPW
 ats2YBVRa3kKLmD/kkkJDKhsK3PGVj8B4/g==
X-Google-Smtp-Source: AGHT+IG2Lrt/2JinUJAFvivYdoH4awqwvL1bhoTyYJgkcrqnRD4aJfaJKbGamA47DEXMUjIhBMRhEw==
X-Received: by 2002:a05:6000:3107:b0:39e:cbd2:9129 with SMTP id
 ffacd0b85a97d-3a08f753922mr3768772f8f.10.1746023596115; 
 Wed, 30 Apr 2025 07:33:16 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a090ce1867sm1306870f8f.40.2025.04.30.07.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 07:33:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be
Date: Wed, 30 Apr 2025 16:33:03 +0200
Message-ID: <20250430143303.551581-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746023596; x=1746628396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uanaw2yJXFXwfGWoEza8nIVp5YhBG7UO3fC1ZQ26CZg=;
 b=IC3WtV2/FeuwyvV7etAcNUapFurdiY5CbpYAZEdjBkDEp5Ce+GONiZE23CGJMbHt+b
 y23VzSikctuu9G1w8Ha2/WjHkqQiZWYAr2+MoKB8wgR72al3HZTKPyBhde+Yvd30hElN
 BdtN6/ILLNTnDH64Lcv7cShiZ3/myPKcydBZm4yZGWJoThXGbsS1YBmto09hQdl4XHJg
 9GiDiD6oAvNjyRf9UGQz9u+XqgzgLlYtyVriZOvtfXbHSbr4W2fwLjytOEDS6nG3R43u
 O9XuETbVA5RKjb2OkwisU9pgfGJ9y+MQMLw7yMMXqD0z9FFMwqv4FemsREZWNfUwiUpe
 KbGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IC3WtV2/
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.2.11
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVE:

- CVE-2025-1492: The Bundle Protocol and CBOR dissectors could crash

    It may be possible to make Wireshark crash by injecting a malformed
    packet onto the wire or by convincing someone to read a malformed
    packet trace file.

See https://www.wireshark.org/security/wnpa-sec-2025-01

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 642bc5866d..8b3245551a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.9.txt
-sha1  d1abbe110451dab9e57c9ee1fe0892e0d6a7d515  wireshark-4.2.9.tar.xz
-sha256  62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3  wireshark-4.2.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.11.txt
+sha1  f4e908e73ab90982e7f712e0a9b5f4cce85ca058  wireshark-4.2.11.tar.xz
+sha256  dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18  wireshark-4.2.11.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bade68f258..72415448c4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.9
+WIRESHARK_VERSION = 4.2.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
