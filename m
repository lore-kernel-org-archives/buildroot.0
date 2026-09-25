Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB7C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769B9811ED;
	Fri, 25 Sep 2026 13:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TFC2D5jGohI; Fri, 25 Sep 2026 13:35:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 86FF681294
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790343349;
	b=aYYZ0CKWuZx+XqRXG6z/Am6s8eCwc333SeDeqFcoQYT+i4iIG+Ew7EyQWstDQjh5MqAC
	 8vWThHHNhBXtB2qmkguRDPZ/vH02daQikArZCTCKOTVbbNtcwSsOA/J5UW/c0yOeHYn79
	 yJIsy9X6SFmJTNSyT2pg7LYkJoZdc/GKm7LSQ2j221feqTBl2tIqcWVkvXQ0qh17kqPpb
	 ZwZ33ijd18DBAHRsR0JlKVQlFtOf+uw14nl5ozsrP0545zr6F+XGEDyuZFgilWZC0TgB5
	 HvUOhOMhfcth53G91mO1X6lK/6O3/tTPuBTboVgbXaL+U0KduTewENb7HSiCxMGF1hQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790343349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FNMuVF2h+1n1sEIdkBmvqDNyrA68spU3OEgs2ZKAB+w=;
	b=r1GzZMnKO5H5TrrGgzZNyu/Bv1XWsD22EkgbDXyDsqtSE9Oo1pqEkxmHP/DcbZvLeiSr
	 cqiMxvKS82fYDB89pv7dEQYTR2gODePGveDP4Fj9MT/5Ib0HJs8VO2zHvQVElxQTS1wp/
	 2DGkCJmPR9sublCDTCRVvvASRID9j37oJqKLiAC4W5OxPNQfZc7LaN4QQnKuQeM5Rv/+A
	 7+9uYb7KIwjx26UwGULIFLj3tnbblHuJxyC2GYOTkPX7jMyjSYe/aLruIvscvHab2hILj
	 Y3g7uzbEqxmfv6KEzRl4fqf0k4DzOWgA0iylQp7YJ8tWtL8l8RPKjWt2E4jw7hXJ1uA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790343349;
	bh=FNMuVF2h+1n1sEIdkBmvqDNyrA68spU3OEgs2ZKAB+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kIXF3ap2GoNmnmzOMJkx0V2GbYBti/Rmm+XUycgc02mudCrOFTDwkmgyw3S6U/Ibj
	 qV1jz8p/2/TYdhaeGccFSXTyO/mRPs1V+JastnY3+7YGShEQJvO7cqx+JBBNqn57+R
	 JrF/0LnaBiP889lL9pC+BGJBqXwvFArYefZ5Bxok10+2hJr9jHFOSPSZ4x41QwO84Y
	 A8Og3DeV5Gk22fYf91h+xLDtot6De55AesZ5xXAypiYGA7H0oU9Iy/7CcSSAYoc3lz
	 Z42NqSLWq7xb33iwHgEv6YjiMEJ7wlHdUbw+JZqYFFN2uOmOFlmn9ViVTXgMRIRAWb
	 0SvgKAyiNWyWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86FF681294;
	Fri, 25 Sep 2026 13:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 365FF32F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D99740179
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvBnU_IYc01L for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 13:35:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 572E140042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790343346;
 b=P4AOMz/CYRhYzDqw+zRT2MtMEwHT09v63cvhRnMaow194JrHK10rnf7WGxoiN8H5+92H
 DtIE1IYc48biahElScFTyILZOiUWFinETu7f8PCWaAnchS1ZwTpJWb4NfeKjDhKIhdc69
 VN4zqg918w324znfBJlRDdUL5Rn3mlCeuTq+2RWVvuc0d8Z0g4rppRuSQzPhKmirGR5t0
 QyoHNp0oLCNNB41F7hLqlBjpNUqAXZQBatqKGrZSFT2P8qeDsHal7mhs5hYjhPTiWps38
 JV5ICfXf7yweB/Xxeghrtnxng26zN7GWXPXORVjq/YizE5CWnOzE+VWfYhqZJoPkshA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790343346;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=jib77hCIa7TybMm5THIzhEnXirPpd9SIYySys+s+//A=;
 b=kPVAAkmXLcPIF85Oastbe3dXtsXZ/4HKKyah4gtTQGqcO8qv11FxNE7nwHptWb/Kdvhd
 3EKARf7u2+9Wcq2hMyeUEra8yI+ToDLtZiy8WEUOLV3N66Y9jX3y4twoYEeRwF1Tvfewz
 FEbTnvginH5EKJap4edmaeoJOCbS8j0lBpRyz98w6QDmgkXTDLB84vXIzif9sJGGbFp3P
 eLMP+bh/Vslk8RYP6V4mB4lsKcNAWn9ZiRIoZBSGtucUmR1bAJMGbIf7nfVgKc4jNZ/bY
 a3gKM5YoqSfssflw1fmiZ8e6PYUI5z0IxwPudFLKdthC78rEx7ed3AgPSPzxiNK7POA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=KhUBCUBn; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::f;
 helo=mail-ej2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com
 [IPv6:2a00:1450:4864:34::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 572E140042
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:35:45 +0000 (UTC)
Received: by mail-ej2-x0f.google.com with SMTP id
 a640c23a62f3a-c2af7721e4aso36385266b.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790343343; x=1790948143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jib77hCIa7TybMm5THIzhEnXirPpd9SIYySys+s+//A=;
 b=DnwAkegBniEHorwyJ73tiW7Bf6EQKuAv1rDvyZ98SL44gnCGuC7dx6UxulxCyuDZts
 +QQKwEAMpNgO583Tc/i49RcK6zFcdn19Bi9bSAphVJxd2i0k4Ttv9x0XFiIGRh930Etm
 dERkM2F1VBEHCTJGfueYKDBnoE10b9hTbkNFs0UG/iz+LzRJ5r2+MdQ9dZv/WYMkIufj
 EZZTiPBdjf1TrM+eEZ4hVcx2cT5+g1M7ysbO3zTPK+BPNm8Ffpxshk+sw2uRlxJjXcIw
 8PdLyC8Zv/gtU+NNhiE3ll94HTkgeVjlIrYFDLX0NtKtVT78afFaf5yVoTSI2JhRFb6j
 lhsw==
X-Gm-Message-State: AFuF++maVIkAxQxRECjOmoNJbqsPrFv9MxXjkkWBJzWR1AkjvANKfqLL
 A3WBkdkqW2biHcpohXpAURWNiKCRFKl85wVE/leNUGmLT4bwUgRGdIKLlxlfmA==
X-Gm-Gg: AYBFou1VSbIZElaxNmwlPygdJPy84cSorApeqbu1K/oYRuAorwza3lkHNbV5FSL8RAB
 teGehAVWpGL2ok5rrE1M3QkdY71wKrtkldodqOStlL/anpmZNoKBlEe4BT4kMTpu1TFoG4EIZAe
 LQ8HeT998Mr/BON5tPm/gOm9O4sYO8mmJXm0HVQ3eKu4mkR9gq7HT6XSu5VG+OAsI4k512Y6PLq
 H9UchG6HBgSuZUmyHi/rqBROMMBBUdH8SMOA8IaL8o+G7japwa4ibL5aKhuE5jXuKwf4M3PY4x1
 DxNWwD3ltmDiaAgHo7lApBvZWCaSzlcylsfgT5Zzv9Tp1LfGkTKmUniceX1AjMRKfXx7m9BBu7i
 5g4pgujxLoX4Jvmz45dI5yxci5/CantbHwYvcd8TlnGZDNZ8vAnCIsIv3WOkG4i6QocHiqvzATP
 /orXoFUCPQvNPrH56mopFtubHG2jXb341oEyWPlZ9NTfpTa+WDGcKhH/JLdXbPQmY26lrwLo5wS
 w07uU+aoe0+tObxDSlk3w/0OFk/39WRuucd97rietiw2nhaOo5radx/Ag==
X-Received: by 2002:a17:907:7b8b:b0:c29:4553:b27 with SMTP id
 a640c23a62f3a-c2ac266a1admr577993566b.42.1790343343162; 
 Fri, 25 Sep 2026 06:35:43 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2ae757b9c1sm115580866b.33.2026.09.25.06.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 06:35:42 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 15:35:36 +0200
Message-Id: <20260925133536.2642828-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libabseil-cpp: fix build on x86 32-bit
 with AES
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since the bump to version 20260817.0, the AES-based hash for long
strings is used whenever __SSE4_2__ and __AES__ are defined. It relies
on _mm_cvtsi128_si64() and _mm_extract_epi64(), which are only
available on x86_64, so the build fails on 32-bit x86 for CPUs that
support SSE4.2 and AES:

  hash.cc:115:32: error: '_mm_cvtsi128_si64' was not declared in this scope

Add a patch from a pending upstream pull request restricting this code
path to x86_64.

Fixes:
https://autobuild.buildroot.org/results/48198506ef76c6ebad0a802cb1fdd5270494eae1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...0002-Fix-32-bit-x86-build-of-hash.cc.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch

diff --git a/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch b/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch
new file mode 100644
index 0000000000..1a289fe115
--- /dev/null
+++ b/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch
@@ -0,0 +1,33 @@
+From 66cd3bf8a9c19f03c5b0bf58031ab8176fb5608a Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 24 Sep 2026 14:59:26 +0000
+Subject: [PATCH] Fix 32-bit x86 build of hash.cc
+
+The x86 AES SIMD path in absl/hash/internal/hash.cc uses the 64-bit-only
+_mm_cvtsi128_si64 and _mm_extract_epi64 intrinsics but is gated only on
+__SSE4_2__ && __AES__, so 32-bit x86 builds fail to compile.
+
+Require __x86_64__/_M_X64 for that path, matching the existing guard in
+absl/crc/internal/crc32_x86_arm_combined_simd.h.
+
+Fixes: https://github.com/abseil/abseil-cpp/issues/2176
+Upstream: https://github.com/abseil/abseil-cpp/pull/2177
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ absl/hash/internal/hash.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/absl/hash/internal/hash.cc b/absl/hash/internal/hash.cc
+index 43cb561..ef85625 100644
+--- a/absl/hash/internal/hash.cc
++++ b/absl/hash/internal/hash.cc
+@@ -28,7 +28,8 @@
+ 
+ #ifdef ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #error ABSL_AES_INTERNAL_HAVE_X86_SIMD cannot be directly set
+-#elif defined(__SSE4_2__) && defined(__AES__)
++#elif defined(__SSE4_2__) && defined(__AES__) && \
++    (defined(__x86_64__) || defined(_M_X64))
+ #define ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #endif
+ 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
