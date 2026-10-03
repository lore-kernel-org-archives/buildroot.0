Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321C6CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF096410B3;
	Sat,  3 Oct 2026 08:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aw4Ny9oLWwtj; Sat,  3 Oct 2026 08:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E8DC41068
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017165;
	b=HBfKvC853JHMVMeHtRUPafT6Fr8Qqpzc1/x5cGgBxoK7XLKvVGWjocfIYPbknCib+bcW
	 AIh+mpXpLJ6tJGdiBtiRij3dm1H9hyc4Zw8r8lNszsMgrzAwrk0a147MYhktcB2QkKTzC
	 bz9hfJlz8uoU6kPV9x2ehvro6tlA9mmVSFAXxKilLyqDuXXgX5tK9zkKmlh3DPUW6YQrM
	 SPY1GBLNCZDgJBlhZIPdWiaGXc/kdQOBbIqFF2glLtcN39ToFyqIT1NREKzYJkwa0djSe
	 pDeqENRl6tCvE8QGCIzqufl+OuRwcoBuUYWYl9JcYV/ubMpUuIYgNo1QkIqXx7i//zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YUaTknPR78EIbG/UZqCzGw0GekYs0QHiQHTW5Tv8OJ4=;
	b=SNA+OYtTFjrP9G35x1x1MJSJrPKOJxPXMKwBe69ZCXh2i5dU3gAjYQ8s8aDHHJlBqbfC
	 Vn/UrxTwqUg5schgjPYCDNvs5cNp0oBc4W3KYUkYOWN46ec+EbBhim92nK6oWdO7+fdwh
	 XhEQROnYFDLg3io9kdjOF3KjWQSdKI40OVq4xaQ3w7oh73iGGDmVcHJsOauF0wg5hmJAE
	 9eeekFUbIES/8A7Ul7ZWcxJfYaavZM45F3XrzVY2WdphzRJ2jtCO9syLpiko5VZL/LWqB
	 IzOf+gnWY8nqPP7pO5LuldiYIJDHgMLKmkCiCZsCpB11+2vcTedh5V5EvMLuphLqxfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017165;
	bh=YUaTknPR78EIbG/UZqCzGw0GekYs0QHiQHTW5Tv8OJ4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FuPX/G0BIczvybpz1omsyW9cIBtPimjBezQF+IiQs9cPDOFIJb+IYH3VvEdbHsQVV
	 mDsME4E1EaXOPAYHFHjv+Z7IvU9P1rerrs95y4O6Pi5ZuFuWZrlUUckvB9y0eM5MCD
	 kRfEUymi5+oqdiOSXWge1Sb9NevfxQTQsK9aQ498M1W/XhdkYo5T8mso0nn7vVovRd
	 DbK1C/ZDkgb+EoJQUjn3LLhba8LB4QRE/9LxjFALPZwrpui9/pX6s9VfBPSucrkZ63
	 7FBlnM9iDMm42ld8TfycUXKBl574eRdcbwCmv1Uo9QAtOCIKOSaUS92+ZnTu1Gsg/h
	 v9PVQFL3ByW8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8DC41068;
	Sat,  3 Oct 2026 08:46:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BFF42E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E62AD81322
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOk8rq82vfly for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1307181222
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017162;
 b=idTD3GHMejBQ9p+b1bPf7QxaMzGd0bcsBjqyRCZh6wB8Hf85jyL4kX7j+nW+cD8GBqKt
 eiS/g9Rx7/VSO13UgISQo3Bn+fguvokk+LYbv1d+RTkWADrLjVmuvwAoVav6AzUekYtRn
 /OJ0fSct4d8a7OwiBO35cTvpPU9ESkszvbXbI4qynb2JwG4tey4rLwqto0RScYYujHcNG
 0kIRnukb0jmZHS7OJepsixGHDtZFa/MMgNo7puCx7lWWj3nUCTFcPQopcKkruWvzeapq6
 jNBG1OXFNTUeitMbEtwSAEaxRooMoMuwy6Ej74OnwhUwGOLGs9IBVr4uKQbFbZ8jCBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017162;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=P6WYNihDCynnHbM7wk587+bk7OXkliD0C/Q1DtQYYr0=;
 b=MMIyJbn7y37Wex6/6AVzP0oIWJuSddIRwPUhNS2oIRBLDxdFkwuXemRPadR8vvvXVwRo
 FRiRdE+hvHy6Xo5TvCzXX20Yghv/rvvuvO7HeAl9l3CwBcWYvdbNH3yADhEgdKhkGC8iG
 L7gbhG0tWXvUU/jsq0Hw79mHM0yPx0ZqoJYxaR4A/V+Ew5Vb6ikFVCjfEbjIcgmHb6+pH
 Ir4FabNUVl6BL70CWFOjRtr/8QymAKvhBqtqgKRVKHGfmIERAZ+QNqajJarbxnzvvGWKw
 KirRtv0EtDP0rcilPwIOQNo+VFL61WLprLb9s1WUx+LKI3kiBhDns40Hu+/KE9bPmdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pqNKHvQm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pqNKHvQm
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1307181222
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:02 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487623a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017161; x=1791621961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P6WYNihDCynnHbM7wk587+bk7OXkliD0C/Q1DtQYYr0=;
 b=pqNKHvQmFBSGWgi8n7y3qo5F2A+OzEX9U5pyTJ2hzeSW0oVI+UYrvibaD1Lau2dDt9
 KE4PuXLE99MGhCKuPKlFRVTio9q3E2Vt5wf4u3PwHeAYpXSisWU3IcmVtExn91acmTw9
 O7yDbAxO01XDNiDK8VPrXcPfYs91NQqIPb8kOpZejimA8AI+BbFSwS/t7Ggku21A4l5k
 pjq+1BvnB51mP++lEo9R973ncKVuhyz0DvVCgIsds4BX+9T0mZTspEOF63xZhmak9DE2
 M2xYdRGOtp4rqNF4HqCOZBNWiHaw4I7yqw1AyJWkQJqy6A11qFEMXVqYcFhd3Ck8ROTV
 o6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017161; x=1791621961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P6WYNihDCynnHbM7wk587+bk7OXkliD0C/Q1DtQYYr0=;
 b=zzXIvzct7bW/GKnKh0JjjqNd13pjB2bIK6UwVjpmmw7491WHVStkMxRhVw06zboy/g
 uCMvxjV7t6MM24IlLJQ/Kt9UCgp/zDjMX/+BIPtthRKA+M1FikE2wVfdqbc4AYBOmOPC
 q+W9N3opJxsGsQewXRPWfaVfPVIN3kgTZwXRZAK7BULCQkHvBnMxeNn2m4BBpERKnmlf
 nRyuWhhbI+Lr+BYCvRZbQU32Fq/ota1IB+4N3vrrez1L/U57cI1zMDf7fJA8AN/CgbBi
 RXx+pWoDiifmUFNdc0LEGZ7DCqCxwzQUKsTmq/uwoEbXr4qeIIwoXBFGMoQkgmAM+BwQ
 cQzQ==
X-Gm-Message-State: AFuF++l7zy7MgQX5qwVHqSCFaCzblZzFS3iR/Je3e9O10JhiXkD0IoFO
 5uC/pInKvt/5hQCwyz4Dm5ZaLsScOQtMwfRTYNa+f07T1vcjiMeSWjXI6T50LQ==
X-Gm-Gg: AYBFou2NBJfADtORlJRIZrlA9pRF9VsJj3a/yc5LjjMdNcmmUI7eNoVGWULsyLUXOXG
 xtqMXc4HJs90/EX/FXmz28fmIZxmOP6TmiUFaXIfqNuts5QKMSDYPE1/UdXoQROA8uTyv1kJu8b
 vIF+rZ0x5/QMB12Rah+5y/HDxZI+bX6+NgHgE+tvay+dBMCQtHfmv/MSqNDiz+PYKzS4tDvRfXt
 LG+aztPwwbQhmhgt7vbXxsS7lRhrqzQrTeYyzbCfkQ/6MCtu2Xjpw3wswreL2tNBae55VLqsze6
 KYJjD6+C7JFqEb/ap3AyfXZGgJ4N7ZUWqNdkSSRNyZetwnHfbRlbvTFKfhjITG26Sdiw5O1cBJT
 oALqvjhPXqEiM5NA4wU6uM6J9vS9+4hDC8FcpGpWy4KK7eLqKdzIGfkEHJl4MXTFndYs+wQUDF2
 UhxfcxFHcr1orwz0Dc1rV5T2CkmfSzqHIw4kP5VpaO04KD7IVN6bp6BAS6z1qV3MKlO3BG5sUn6
 pMRTRbrzTv4rywI1fR4V/cqvskkzxybht/ANXqJH9DFlqyr5Sba2a5dpf/2jtJMllZyM8GrE+XB
 yrt//eswikJZGM52tXTOEnSI6Bux03iJJlYKq468dS4mbiq+F1BlKTYqQHaLKikzEZCes9rPUAK
 n4yyNm/xsQwJfCua37zxygrkqHJrM0KaVt8k4HdVWnVc=
X-Received: by 2002:a05:6830:f81:b0:81c:37e2:2008 with SMTP id
 46e09a7af769-82284c5763cmr5118590a34.14.1791017161144; 
 Sat, 03 Oct 2026 01:46:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:46:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:19 -0600
Message-ID: <20261003084453.545653-34-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 2.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/GrahamDumpleton/wrapt/commit/9740b74522161056058696dd3b9981886eda3be0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 3fc809d9c0..f384c7a016 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  43c737f84345bc317bbb028d9de1b4e4  wrapt-2.0.1.tar.gz
-sha256  9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f  wrapt-2.0.1.tar.gz
+md5  62a3f2bb129e77c859aaacff584c53a6  wrapt-2.5.0.tar.gz
+sha256  c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345  wrapt-2.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9abc41aa6b8690c07ede9b44b7c6233d014290ed1e3b5ccc37e292295b5d058f  LICENSE
+sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 86454371b2..7c3f4152a1 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.0.1
+PYTHON_WRAPT_VERSION = 2.5.0
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/2a/6de8a50cb435b7f42c46126cf1a54b2aab81784e74c8595c8e025e8f36d3
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/3e/d2/a254a26d8ceaea87e0eee2e89fcfe53ddc1858418647493bb2937549ab6f
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
