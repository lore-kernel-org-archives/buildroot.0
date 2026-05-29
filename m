Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD4CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AC18422C;
	Fri, 29 May 2026 16:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ghA_ha-QXbI; Fri, 29 May 2026 16:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE5D84227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071513;
	bh=LFwqFBmuQMxVV+8KDW8s8raRGVoliNOjUga5Ax0Om60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=egAiPVYYsfU7OWxE5sVyScsza6YlD3yQTyLHaP5M/q64ERm2bO7MJdGBQVyMbV4C+
	 7ALbkiXKhj+HuV/qtrRo7qEfCm9MSmsMg60SCNhC185jRiBXdXUeWLz8o50KZL4cU6
	 Kzn8wmSsF8HjJa3riKjsOaQlNu8GVHkFAF7jAyBUuayA44O2cUcFHhIwfLjfcUoF8I
	 vT6WfB+D2fJqNsJNT3L5DhtbW2gizZ1TEoZiZpDP3Vy1qGwg29SVu558wFVNbutouf
	 Z6GaiHyo0XTLgKXq09KfkAZcEs8mdayz6iXgmDJefl3EOtKeVpEz0NXBdUzjGOmoqx
	 RlV1laRfsA5/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE5D84227;
	Fri, 29 May 2026 16:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEBBF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D96E84228
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZSIC-OVTnXr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 582C884224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582C884224
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 582C884224
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so69941055e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071507; x=1780676307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drMQ3cBg1SuobdT7QywDNRW8zMJxwpaA28hPYyR+8pc=;
 b=sx2vQ9NGscjIGeKLPv6odwDuzgdp4CvClqlrYxihwrDtqrKkb3HRHXmigOVkx5+wOK
 4NYFROkSxavRIFLagglvPyPqsXrbGgAPHJdFW7Wh3kL2WUTImDZh7hfEZviUJg0gPqcW
 qlMfpUtkvSW4FBe/xbnV5XpEuObUNHQvhCrO5IwbpsiDZ+x0exZw4b2/dLQntZICVK1g
 wzu/uu5s5b42nvg3RLgmcvtVcCuKCpHJEv+jUNO88EzqhaPS3unFRKVtw6azymn+hrRs
 URBM35V2mtZgDAY4ned3Zj2q3TCY2SudIFkVb/DxA3zGln/FCwV+u0l0LpU74tK+/eJx
 RmPQ==
X-Gm-Message-State: AOJu0Yy0+loz7QDYkJ0UNnELJglFtkgAvb0uEPlbERZD2JPJFs8gYjGA
 Wghfjvu+FXPjoiXtHc8Id2KtHxANRaxw4msH9OZkSY+rfbMH786cgOLMTKpOrajh9Z+4kALNBdc
 phmG3
X-Gm-Gg: Acq92OGYJWxxeAABp0ToXqhBY2WU6pvFvh/ZzV3lK7lSv2vZf9+a6h1+E1ZG8JdTUc5
 rKmCDs8YyNzwUnHaCo0ss5KldHaprzDPcwi1if6HZd7geEBnSRXpD+itPdPcxmNAlDyDZJ/9I81
 P9njw0GaZ/sOu0BFEpcQ01Jw0LWsT1gxgJHLzv3zRMeLGfMulbyFlxJ4k51IcF6a2BhnMYkoGCh
 fOGn8yxAw74muxJuFKqWv6cjXcZ/hloXGHMJ3xn9TZTABJabf2fW6lpBDAiI+9bkcO/snSLAndK
 lVdXZl7scpPQpx7aAENoEjgFwjYWWRcqzNcaWyBNIzDKSFSaBtVW4f88ZbISltHXriQnK+oqNUW
 e1pBkJpjzNgFrI22CCQaq7WcFPVX1QN3dgzgrLzx0+vEyLXcQ2KlZqxIeepu9jihce64fFl+2ie
 8Hl4HVmcGE0ydCLyHIpNJpZIk47MEp9BQpvUmGhR+TT1/Lap21j1kcdqS4Vw==
X-Received: by 2002:a05:600c:6592:b0:490:a1dc:e542 with SMTP id
 5b1f17b1804b1-490a2904ab0mr6877725e9.6.1780071507313; 
 Fri, 29 May 2026 09:18:27 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm4810103f8f.0.2026.05.29.09.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:18:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:18:22 +0200
Message-ID: <20260529161826.517403-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071507; x=1780676307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=drMQ3cBg1SuobdT7QywDNRW8zMJxwpaA28hPYyR+8pc=;
 b=GDIiV/hj4JrjdyqjzRxdoc8kM/Lc3NbQguoW42+IG0mFBCv02fUIgsoB3w6Vc0t30a
 i7/IioP42o4mjOxvSRR2nRZwo3GOJ5DChM2PmASss7gqr/NfhSE1aA75+uIchUXrWJpe
 2ig47Pj7b8ZRO6AUirxX8wYs7k1a+RH7yurI/3MHzul8azy6dw21lMZKg3Z31VLcTpNP
 CH76uUdXG9HwnsIgaCbbIre1POwp8hDoRcx4SMN/Yoy8YnGyMzwW3nsFb/Z9Dh0h/WwI
 PLS2Kg7/swTJqPoAASTunn0zzqBV5BBKJgERc5dAD06wHyT0NvFPWC0c/DyXs7btY95i
 8HmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GDIiV/hj
Subject: [Buildroot] [PATCH 1/5] package/busybox: re-introduce IGNORE_CVES
 for CVE-2023-42366
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

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ebe169cdb9..7e0b3d5766 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale just wrong NVD entry.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
