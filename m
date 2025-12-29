Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E389BE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC3B80BC9;
	Mon, 29 Dec 2025 09:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nW5Q2pub7Es; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B23A80BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999248;
	bh=R86D7i26p2usvLUXuYgxB0DJbH+lf3mABWEoWiMM/Ao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CkH/WFsgGQjAehJMwU17kCl5FQMqBMU82HstYjtfl0wcm4c550F9DEDfaebzwf+GM
	 55JO9hZKzJKwsiEqZfBLEmbT0zRn0kyh8cGABgDYlIFsvNC33Wcm2/7xz/PInTHzid
	 Y2F7MZqOX+Wau0nY5wDXli3kVTYuEyE8RUSNvJ20jlaZ1zchgD9XvCXEIwDr1ma67H
	 FL9+Blq385PP2OyDY+eBv151jotlykjkRNUrMdjZGvX5/FqG+KDfqtlM0a2/nZm7xI
	 s4o5xFQtdR4EBON7WpMkTwWtooWHhfnX1EFOVjJIDvRA2shJId7+WsyooJzMN9DsE6
	 uTuHprFex4blw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B23A80BDB;
	Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 082BCB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B584076A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vefgi8PmuyZz for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA63D40766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA63D40766
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA63D40766
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477632b0621so55087645e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999243; x=1767604043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrPj8JkChdNmioKhVOogt8PH106l7RV8dz52GmCawIE=;
 b=wDxY10so0Fc5Mt4memE+H79MmpRxUj0zRiKsawqi49mykdurEu+Qb1NUnyGDb/ML3c
 jiPQn3ul3CS4KZoOHG3l3ht/f7ZLOecWlq9fqaKFlgFdRLs92+iP3zF8R7lxjuUPplTZ
 qG8I+X1cjXxWZ521UKnrvFwhsF6VREBXFfH+wHcSfrPfmw5XMwQqGMjcjrbGXT6BM7Rn
 nxzX0dOhnR15eaWwLrgeJn3/MWLVkGYPp9AdjLl4SvkSzhKpVNGwOMt5jDJvTmVMaRpG
 KRqYiMNKj2A9RfGeUAbKg7kGh6GtaaKuKaNk5OLaUdqvkqgVdaWbxyQcOK0iJWyczv3B
 LquQ==
X-Gm-Message-State: AOJu0Yx1vTU5od0lqU0/hB1s20n2B82yOn+acVWYQrdTMdmCZnqONqDk
 0roBnUKG//0R+PGgDJZqQe0alO+tw+97BjESsmnE9TiQh3uxKuFuAKXllSzUEd2100/yxsbJh2J
 wVfLWbk4=
X-Gm-Gg: AY/fxX76wdKp4fQIXZlaYLF2aSA/fv8jfLhuXOABGfOWikqcYzLWf7qU+F89JfVlArR
 AefRxDgSIsGCgBEzsdu0Xip2VcThu05PmDOon1XhS+ksqaVkGhyspKStwGFnKbkuC2RjFiZXCbz
 ihh+nygrDWhEJkF0BbmC7vtVxSXl3jVGn58GLsawMXVpdJCZrnLSyX8s36oe1Il4m9R6hHuGLxz
 DNw4NWoSQRhY/dX+44pfSLyBm86NkwRuffov0rV92Pytge8LGwL6nzyCQzNIIDltCJ1er/CVGSE
 kw170itY96F44IdplWEfRDkfjd7ZmBuDZs8PA0DjtW1GsTUWniM+T8C9gALsJsUNQWwjhq/8aKb
 cYiHz4SbX+a+SlqfW4xhzJ9TUBhSdrH+JzQauXNVeQdvjD91p0ZsEQ1lOwPL0Hk4bhfBqOG/zj2
 FBsaICk0rpAIuluIhwNpPZJ+N9AaaWqMyyrGfDX7iHoi6GYfeM9liOaKIXNyxP7+xBZIPIUZ35C
 A==
X-Google-Smtp-Source: AGHT+IGq3UtbaJkLow+y0Zm/Vw8H8/3kOV0ZDjbeUKdGVADH8B49npqcNgNJ2/iC0CAnu3LDoO2PPQ==
X-Received: by 2002:a05:600c:4e46:b0:47d:3ffa:5f03 with SMTP id
 5b1f17b1804b1-47d3ffa6713mr208110885e9.21.1766999242990; 
 Mon, 29 Dec 2025 01:07:22 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:06 +0100
Message-ID: <20251229090719.13291-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999243; x=1767604043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HrPj8JkChdNmioKhVOogt8PH106l7RV8dz52GmCawIE=;
 b=EfXVzqJcVGmer8iRbvK60mMz0/o57DPuhKA6oNpy8GZPXoOTU9yLSsYP6aeUEdLKz7
 i5BbCeLsi31B0mBwbb085UgsnxOUDzu1jvTTDvhi+8IwqAOb/mLzFBlkwoq1Z9gmbDBS
 KLDueh8O+KZgfp99Le0RTRpVtbNIjcybQGoOBH7eycVBPItaGw32R8qZ4YbOHlFUi6iB
 IdMytGlgJh6hP9TVEnSndC/A8bnGeNtid0qRvplFsverr3xi/rjzQ3p0wM1iVo+nKYjD
 dvNFowFRxB6CGnwgcgOBPGNOGZEIYRRKqvk4Mm7m/FrycOr9boZqsqA45PTuoFiRc4c9
 WGKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EfXVzqJc
Subject: [Buildroot] [PATCH 01/14] package/sox: add CVE trailer in patches
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patches header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...voc-word-width-should-never-be-0-to-avoid-division-b.patch | 2 ++
 package/sox/0007-hcom-validate-dictsize.patch                 | 4 ++++
 package/sox/0008-phere-avoid-integer-underflow.patch          | 1 +
 ...formats-aiff-reject-implausibly-large-number-of-chan.patch | 2 ++
 package/sox/0010-formats-reject-implausible-rate.patch        | 1 +
 ...CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch | 1 +
 6 files changed, 11 insertions(+)

diff --git a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
index 94298b7ae5..2b516fa4c3 100644
--- a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
+++ b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
@@ -8,6 +8,8 @@ Bug-Debian: https://bugs.debian.org/1010374
 
 This patch fixes both CVE-2021-3643 and CVE-2021-23210.
 
+CVE: CVE-2021-3643
+CVE: CVE-2021-23210
 Upstream: https://sourceforge.net/p/sox/bugs/351/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0007-hcom-validate-dictsize.patch b/package/sox/0007-hcom-validate-dictsize.patch
index 722b64675b..c221f74c59 100644
--- a/package/sox/0007-hcom-validate-dictsize.patch
+++ b/package/sox/0007-hcom-validate-dictsize.patch
@@ -10,6 +10,10 @@ Bug-Debian: https://bugs.debian.org/1021134
 
 This patch fixes both CVE-2021-23159 and CVE-2021-23172.
 
+CVE: CVE-2021-23159
+CVE: CVE-2021-23172
+CVE: CVE-2023-34318
+CVE: CVE-2023-34432
 Upstream: https://sourceforge.net/p/sox/bugs/350/
 Upstream: https://sourceforge.net/p/sox/bugs/352/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
diff --git a/package/sox/0008-phere-avoid-integer-underflow.patch b/package/sox/0008-phere-avoid-integer-underflow.patch
index 7c59896660..cc3cc533e7 100644
--- a/package/sox/0008-phere-avoid-integer-underflow.patch
+++ b/package/sox/0008-phere-avoid-integer-underflow.patch
@@ -7,6 +7,7 @@ Link: https://talosintelligence.com/vulnerability_reports/TALOS-2021-1434
 Bug: https://sourceforge.net/p/sox/bugs/362/
 Bug-Debian: https://bugs.debian.org/1012138
 
+CVE: CVE-2021-40426
 Upstream: https://sourceforge.net/p/sox/bugs/362/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
index fd1d210da1..0489d82601 100644
--- a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
+++ b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] formats+aiff: reject implausibly large number of channels
 Bug: https://sourceforge.net/p/sox/bugs/360/
 Bug-Debian: https://bugs.debian.org/1012516
 
+CVE: CVE-2022-31650
+CVE: CVE-2023-26590
 Upstream: https://sourceforge.net/p/sox/bugs/360/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0010-formats-reject-implausible-rate.patch b/package/sox/0010-formats-reject-implausible-rate.patch
index 5e60b62011..0805c2f958 100644
--- a/package/sox/0010-formats-reject-implausible-rate.patch
+++ b/package/sox/0010-formats-reject-implausible-rate.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] formats: reject implausible rate
 Bug: https://sourceforge.net/p/sox/bugs/360/
 Bug-Debian: https://bugs.debian.org/1012516
 
+CVE: CVE-2022-31651
 Upstream: https://sourceforge.net/p/sox/bugs/360/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
index b67d23c12d..7abdf54feb 100644
--- a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
+++ b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
@@ -10,6 +10,7 @@ bug-redhat: https://bugzilla.redhat.com/show_bug.cgi?id=2212282
 bug-debian: https://bugs.debian.org/1041112
 bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2023-32627
 
+CVE: CVE-2023-32627
 Upstream: https://sourceforge.net/p/sox/bugs/369/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
