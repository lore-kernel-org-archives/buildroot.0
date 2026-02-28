Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E94FEE4FE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD2860882;
	Sat, 28 Feb 2026 20:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7TgdNiNj4Gy; Sat, 28 Feb 2026 20:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5259E60F97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772310537;
	bh=hgZtq1x7YMM9sOCk+q2ApdpYU7x1lnEMTzlYl5696iY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VNV0HYsupDr1x4rSTGYqv7tB09zLyjcuF3vrZTzOnBhscmQbtg4QUVxGpvt/6hUW9
	 103MdH/0nrUh9LWzWPsZPyMROpb+uYq6Ehguy8rGp0o77p7T8K/7xFg8Y3MzoJ/PEs
	 zEz3fFS49Eowdnj+8V8LMbdyzV0p9pH6/Hfm1JtreNK5Nds8nViMyYQrr6xgxHE1Ak
	 Y5BKI5V0U7zjiH/TMWWG/RmHhSBW4fOxGiCVH2cywzmnahvyvF7JmkUsFHqU5QhOTO
	 VpdXVrd3c0N4ia7pEs1X5XsMBFxiU+sbq4MT65Q9ia9NWxi6zoWo1j6jiWoBLWpuJt
	 qfXYj3BUZbaxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5259E60F97;
	Sat, 28 Feb 2026 20:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA3A21EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBB3419D1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pYAc6KaJ3oa for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 20:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7CAB419CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CAB419CC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7CAB419CC
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:28:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439af00d33cso208769f8f.1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772310529; x=1772915329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPo/rpr29In/4QmFFCqV/1xArML6/vrd/RD5QwR9E8Y=;
 b=nQ2yZhh/De1PKOJaBfiI2dsa3WXgeayQio7bi0BBxm8xDcQCgutm0+yBEOhw5+Jis9
 nE/kV9oJ9TgLN3gDoiJCHAbFTgy8ut1kdIoPYUugtzcrv3rJzRVGnU9wcB12LVm5NOeL
 fPEgkJydkTb8V4+OOwY50OZs2DFE5MkquG5GSIMTeEkOaz701YA5GQEaU5Zx3EPLR1T7
 uvm2NvEjmr5lujMEqMXifvee2mkWDNIGfEHs47SMomaMy2QaPLRAUqnMkkxTH7LO1WR/
 4ViVt64WiYlbp7C0e+ho0WmlqafC4ZkcMs/drfGy2ueOWqNIc2oGCYfxKcQwm929Id/C
 4jWA==
X-Gm-Message-State: AOJu0Yy/mgPKUUo24GTYs8X6UcsWnrnO3vfQqB0Z7LSTrBeM3VAaNX++
 bdt9TYrP1RNBzYgAKgjplbIti2JVFGnmp6IOq33tLq0NHwUalQ8HvaEY9YC3pW19RHiCpq6VUVs
 zATJ4
X-Gm-Gg: ATEYQzx1GfJ5Huph9VNmA2hcKFpFMZSlA2mz4ovkkc3nOYfVy9o8AMJZPSszT3S6PEy
 czIClG3nwmr3hv5dzE2LhMFmR4k1ogFYPo6CsLGc6u8j3JkT9a+coN1IHTImVYjyjguQjzuubY6
 jVS5k45WEUHUlF1/70zJ9iufJZekBOj9EvnbPdWzXUxZYgOaF+EVHDB5n/wkbJIQ7yjJfkiEf+V
 FItVKeZcJuDcCo9nY59twZlJBPSAvC2yjvpJFkamNXwNcgExUciLc9kFXKnTDD6x/0nJSE4X8/6
 k+3zemviskQt103jMJH7O4HvgBkewJZEx5ZEHwOQ0EXCFbeJIgIZPccIEoIUgcmLDlWTzIUfhzj
 tTiCqZGOoKlB5aEB+7J9cGRroUurt5IDgvt/wVO/E1B4ndjZA3pRZ5Oy/CoRGVA6T8XRlQXW3iK
 zLWQ+5xQS2JxuMOMk=
X-Received: by 2002:a05:6000:2892:b0:439:ae2f:83ee with SMTP id
 ffacd0b85a97d-439ae2f84f5mr2303139f8f.45.1772310529228; 
 Sat, 28 Feb 2026 12:28:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm4845840f8f.5.2026.02.28.12.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 12:28:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Feb 2026 21:28:47 +0100
Message-ID: <20260228202847.96486-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772310529; x=1772915329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PPo/rpr29In/4QmFFCqV/1xArML6/vrd/RD5QwR9E8Y=;
 b=DuXjQv+Zehb+PFtiCD9hx1xklk3LSs12Xx9PAUFNyI37RYiVH9eQsbB89nXA5kinOv
 6EvgucSxuMD7H2lEbbzQHpJS2TNMLYJ+MRKJurv6ejhe2jSD6JaNlNIYw6LAdLMiQQhL
 rUetXyTuUu+pFxJn7MAQOdkpWTw3fHcR2dF7OEINHFSryOwX2+ptKMsTes7ZKJeJbuTC
 WDcb6kKfiHgpJUajobv/IO0XsYVzOMBkaHAoLmif37giCN4W0mqL54osplj5rttaJYK6
 T56Ti4ntiLQp0MnO81j4Xh0CqsAZ3wP7YyXuc0VdcA++/BYZJgq8cqm8djQl6Hy/3quj
 cG8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DuXjQv+Z
Subject: [Buildroot] [PATCH] package/rtl_433: add patch for CVE-2025-34450
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

- CVE-2025-34450:
    merbanan/rtl_433 versions up to and including 25.02 and prior to
    commit 25e47f8 contain a stack-based buffer overflow vulnerability in
    the function parse_rfraw() located in src/rfraw.c. When processing
    crafted or excessively large raw RF input data, the application may
    write beyond the bounds of a stack buffer, resulting in memory
    corruption or a crash. This vulnerability can be exploited to cause a
    denial of service and, under certain conditions, may be leveraged for
    further exploitation depending on the execution environment and
    available mitigations.

For mroe information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-34450
  - https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-overflow-in-rfraw-test-data-parsing.patch | 31 +++++++++++++++++++
 package/rtl_433/rtl_433.mk                    |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch

diff --git a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
new file mode 100644
index 0000000000..6446fea0ab
--- /dev/null
+++ b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
@@ -0,0 +1,31 @@
+From 25e47f8932f0401392ef1d3c8cc9ed5595bc894a Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Wed, 8 Oct 2025 10:11:15 +0200
+Subject: [PATCH] Fix overflow in rfraw test data parsing (closes #3375)
+
+CVE: CVE-2025-34450
+Upstream: https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/rfraw.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rfraw.c b/src/rfraw.c
+index 9f4c9780c..71a1c365d 100644
+--- a/src/rfraw.c
++++ b/src/rfraw.c
+@@ -159,9 +159,14 @@ static bool parse_rfraw(pulse_data_t *data, char const **p)
+             data->num_pulses++;
+             pulse_needed = true;
+         }
++        // abort reading if the pulse data array is full
++        if (data->num_pulses >= PD_MAX_PULSES) {
++            break;
++        }
+     }
+     //data->gap[data->num_pulses - 1] = 3000; // TODO: extend last gap?
+ 
++    // expand reapeats as long as the pulse data array has enough space
+     unsigned pkt_pulses = data->num_pulses - prev_pulses;
+     for (int i = 1; i < repeats && data->num_pulses + pkt_pulses <= PD_MAX_PULSES; ++i) {
+         memcpy(&data->pulse[data->num_pulses], &data->pulse[prev_pulses], pkt_pulses * sizeof (*data->pulse));
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 08735be850..fc6c2bece2 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -10,6 +10,9 @@ RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 RTL_433_CPE_ID_VALID = YES
 
+# 0002-Fix-overflow-in-rfraw-test-data-parsing.patch
+RTL_433_IGNORE_CVES += CVE-2025-34450
+
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
