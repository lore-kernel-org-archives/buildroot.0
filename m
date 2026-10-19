Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0BCCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D27E80F84;
	Mon, 19 Oct 2026 13:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmUJ4lhluY2Z; Mon, 19 Oct 2026 13:57:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D89180F9E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792418249;
	b=UrR/sMYW0sYEpwwCERiuVr4EZ6WBylS1IVvVVOtwVSt71YaSUkH0FDr6mX+pLenyt5lp
	 UF02uf3vw8mJ+EKGZfc/xIj5cqIX2Dr5IJyTUqO/b6mJ/Ik06nVZ/aQUfvzLml9Ax4dks
	 x9KskqykTMOYb8b8Hz2ikOIcUvP6kd1+ieRhCNFWv7GuIfaLN7NnpAdFLkML9CQyY8I0D
	 C8wGs8TLquYJoUQWdPuhJqQXIP29ltxtA0MFNKTjjMWLs0Y1YG6gYcse9/H28a6pzEF6u
	 Z2VeHff40d6I8hBoi+XeOB/xffmzW6Unh63AFGytLyBySThubv5xOVgIcoMo+tsZ2mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792418249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K+FIL/+FwlDRsoLw9BXOpdDXX/OUR/T9UmE49oeUZdQ=;
	b=NWnTMH91Tsu6fks8N2MJ4nC4wNJ36dVzjkMVXijMzJSyOliWaaVORuursdu1usLWQ5hl
	 wL4xv+zTxQQ1USssi0o4nzGH/ZppNhlXt/lbeCpNerytFZV0MSb81lOkheDA7KMnNzZQo
	 FQ0S8EnhasvfRuxyu2CkoeJLRNHoK6ZUUVRA7QuikR4MhfD4WMMRtvoGyWWHzVHeg+qwA
	 D9gnugtE7cDOdSoaZsRX6fOkbXZm2330jtiO+o34Aw148uBIxCwmsfVxmQvCODtZS1Q7J
	 0n621sGkAeE+39TZFbDwGLH/UOn3U/KLGFGiGOpo7FfZ2s0/QT4bMy1SC6eVZgQHKlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792418249;
	bh=K+FIL/+FwlDRsoLw9BXOpdDXX/OUR/T9UmE49oeUZdQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WbLu3hGYsZCRiO8aKnh4Geb4ggQm5u/Qs5aeJbr+9XxZLnhyP/crK5Wzrx6VSVvl5
	 yrUtFmbM6T7A4wG9MjA1/coAIv/ATOmZy+uve4/tC/ptkoy4tFqKdPEc9QXqHA8G2q
	 6MIGQ8e0F3VJsEkGMf7ekmXY2Yxb5QYCfVkLH0ebWmy1DGqH0zp580UBcYIyN2lrK+
	 Y5VOz023V8K8k8Z04v+/fa4pu8x/L/2vWE/ROpYOmy3K+5ahF47+Y4uFDipG0MJz93
	 c3AgRUjJ8InR6thBhEpQ916BdJBJVH8LiPmYpKjWo2KJG1EAjvLkTbXQXKdVzIN2TT
	 eyof2rbj3xlnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D89180F9E;
	Mon, 19 Oct 2026 13:57:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D33B81DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8FCB40621
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMxj7ZPXWsEE for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8ACBF40620
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792418246;
 b=Zx2Wydw5DFAKfyhsyH+F02nfKgvlqUBaHdKBP/WNLHHrUdkZrFY3gLvxso88+5Vd2xIk
 Mqkm4utH3xA3SdQrm5bW8DtiOr7sFR8Kl7e74uN/fBL5WQuBnZ6mMgQgeolniOXbmo8eK
 mQ1CK+vdTs98xKtrYfJDOSaQss7iZnHMeEGBwpsdHd3c0DjkRskGelcURJ1PbBy3ZQOch
 sj6XfqP0ikxJszUC4kRt9P8oww2zBJjni1lYZoMwwOTJe2z/vXkKAwXQ+QAvYkC9iuqer
 lP80wqDjQSdIsx7C3D+C2ZpbYTIsz+Tlyhr8G2DD+ruF6GkegnbR5eisbfJAb6xNhPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792418246;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=4qFltkTIxTGR/uzFHNcdtLk1qChwjDWr4UVq8LqTMhY=;
 b=nN064fAPDS5wF4j1yC5AvpzsestW2sZvQaZmVZq8a2mj5unLX2kkwINTsc3omfSFrcNg
 L9KxwqaDZ+Cs4FphSM1zMSdsO2Z39BW1JmzlyaRGHqSIwhcLfO3AQ8weNASU7NOUqikcU
 s3oX+sgzOR+jxlLNJT4LMQfUcuYkEYfDFE55DvmAee/P0zMs7nvrY8U9/Olr+D87gQxzd
 tNbILkhmtx40YNYCws4+zhwqm5F9eYLgl/invOJ5mS7CXTyjuzbOcAJ1r4f+I6Dsal1MJ
 ym6Hi6LHwjjTITVtW6r1xs8QItsjvLPB/eb7R7Qaxpfgg2BBQoreyualMYriaJD1SgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=S37hMx6p; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=S37hMx6p
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ACBF40620
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:57:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c38ac26cc5dso306326766b.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792418244; x=1793023044; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4qFltkTIxTGR/uzFHNcdtLk1qChwjDWr4UVq8LqTMhY=;
 b=S37hMx6prh3wsjz155bNOogVO2K7Dexj+UCTciG2Cu1VvMnONLo0od1Xa69Kj9u037
 HZtVbIVMA1Cz98cTieG7YaeTgvP/WvHejDO7qg3ZXvqpRSFkAPnU9l6GqX+0Hl8mSoJU
 kLbi7R3NllL/hBplj1lyQ+e2SWpK7gSrM3KgjsoSSTrLzT3QJRLmh7FzpSk3QN0CRzbp
 kZKW7GVsFXCrWXW0uHgzUzNoqe8YgK6hRDMnDbBZMJOFsMkk95I3bWjscI+H5piYhh25
 q0oNz5ljn6eVpQHPW15h4Ck2DwOPRHv53zQzLGrJrcl3DdXHSFdWqCPi6GncNMSERFtG
 LyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792418244; x=1793023044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4qFltkTIxTGR/uzFHNcdtLk1qChwjDWr4UVq8LqTMhY=;
 b=Iuv5+bP1/E1JRSpAlkTArUvdNPaPR+KCsMpyr2EILAp7P+3zaZWE94MN92MvgV2ywg
 K1onrLjxEOpG+nEQKcGUY+ZTwQrgiyeidPEVchluqZkAeeywbgu/E/+nM4e/jjnONHrf
 YKpY9hWfZCKXt4WlJWVohup4KqaENuqpQFcfEP3XAAmvI9vHcu6bviBDTenuSpBPyIlp
 jhMZeXhDsHTO6dOo+B9fF80c2waC3mDVC+aKWrc+yetwBSQWKPmzRo95I+pQR+6iHj2y
 NL1ifT4mncbNzM9iLRazZdcqbvA9talucP2ZHv0ihXGtS/d6TDIUuB3cvVz7fUGESjOR
 kSdQ==
X-Gm-Message-State: AFq9FYKsx5L80xOx9zE7nLjGV1p0hHnqaSZQaOzoA+7yV2spRDtvdSgv
 5k+5DapJEoQnYceHJp0JcwGRS3GC9ixkVPX4jSN/7NF8zSHaGJyxd8P2GpHPJw==
X-Gm-Gg: AYBFou2atwv5i0xzjZovW8bdPD7zUdm+sgXVRuZC+KTEvkfQaG4FfBD6HVezuKSyCy8
 QsobhMnHEapFqtoUqFsgvvHtakQ+4sx1TjP8r9z8oNKW2QnMSbxcdlraYcK7PHIn+yg0u000KSW
 NwGL9uTJxWuzrN2heS6bZX3NTlj3REk3yfPnM0+/Ni9VMCSujYgWdd6CHG/gZTEGUtH46Vf9rM7
 h12sTtffRJZK9h7UY0Oe8FJuFK+47Aztfw7n0sm1La6AUt7gQlnA5uJVDeKYXQt51TCbNpAZjUF
 mpSZJUxnhrNOCsCo9SatAkuH6MVqA3wztUD0IeXEoXkOnhZrzKCs9YAySbx0YYXNU2CJw5nsqWc
 AZkAPUULfhHIDaZnaewK/CTLZza+UrfL9O/ZZFbVC2h68qwgnMRQeXLHeV9cAgqJNHf0BZ62JJO
 9ztxBm+2GlMYzSzy9fWSxfmYMukEkOWi8SOXNeVdOUJ4b9/X7p6R1UNySS4foWvazyEMSDiQhXX
 dQDpOSXNQL6dfAusp7ZW5f1dioAbiaq/H/bLR+J27sxY1E=
X-Received: by 2002:a17:907:1c8f:b0:c29:f5d8:9c75 with SMTP id
 a640c23a62f3a-c419f7083d5mr498690666b.36.1792418243747; 
 Mon, 19 Oct 2026 06:57:23 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4090dcf335sm369765266b.29.2026.10.19.06.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:57:23 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:57:21 +0200
Message-Id: <20261019135721.1648298-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019123133.1631472-1-yegorslists@gmail.com>
References: <20261019123133.1631472-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/sysprof: fix build on 32-bit x86
 with AVX2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The bundled CRoaring code enables its x64 specific code paths as soon
as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
results in calls to 64-bit only intrinsics:

  roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]

Backport the upstream patch that defines DISABLE_X64 when building
for 32-bit x86, so that the portable implementation is used instead.

This issue has been present since commit 0d57555407 ("package/sysprof:
update to version 46.0"), which switched to the new sysprof code base
bundling CRoaring in contrib/eggbitset. It therefore affects 2024.08
and later.

Fixes:
https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - mention the commit that introduced the issue (suggested by Thomas)

 ...disable-x64-code-paths-on-32-bit-x86.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch

diff --git a/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
new file mode 100644
index 0000000000..2b2c6cb6cb
--- /dev/null
+++ b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
@@ -0,0 +1,53 @@
+From 22c10f0dbd3c357e96f83f430ebe05d24a25c536 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 17 Oct 2026 22:47:15 +0200
+Subject: [PATCH] contrib/eggbitset: disable x64 code paths on 32-bit x86
+
+roaring.h enables USEAVX (and thus IS_X64) whenever __AVX2__ is defined,
+and USESSE4 whenever __POPCNT__ and __SSE4_2__ are defined.  This also
+happens on 32-bit x86 targets such as i686 built with -march=haswell,
+where 64-bit only intrinsics like _mm_popcnt_u64() and
+_mm256_extract_epi64() are not available, so the build fails with:
+
+  roaring.h:260:18: error: implicit declaration of function
+    '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'?
+    [-Wimplicit-function-declaration]
+  roaring.h:1011:23: error: implicit declaration of function
+    '_mm256_extract_epi64'; did you mean '_mm256_extract_epi8'?
+    [-Wimplicit-function-declaration]
+
+Define DISABLE_X64 from the build system when building for 32-bit x86 so
+that the portable implementation is used instead. This keeps the bundled
+CRoaring sources unmodified, making future updates a plain copy.
+DISABLE_X64 is only set for x86, as it also guards the NEON detection
+used on ARM.
+
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/22c10f0dbd3c357e96f83f430ebe05d24a25c536
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ contrib/eggbitset/meson.build | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/contrib/eggbitset/meson.build b/contrib/eggbitset/meson.build
+index 82cd8a40..f2f81685 100644
+--- a/contrib/eggbitset/meson.build
++++ b/contrib/eggbitset/meson.build
+@@ -6,9 +6,18 @@ libeggbitset_deps = [
+   gio_dep,
+ ]
+ 
++libeggbitset_c_args = []
++
++# roaring.h enables its x64 code paths based on __AVX2__/__SSE4_2__ alone,
++# but they rely on intrinsics only available on 64-bit x86.
++if host_machine.cpu_family() == 'x86'
++  libeggbitset_c_args += ['-DDISABLE_X64']
++endif
++
+ libeggbitset_static = static_library('eggbitset', libeggbitset_sources,
+   gnu_symbol_visibility: 'hidden',
+            dependencies: libeggbitset_deps,
++                 c_args: libeggbitset_c_args,
+ )
+ 
+ libeggbitset_static_dep = declare_dependency(
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
