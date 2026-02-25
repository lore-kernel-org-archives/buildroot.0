Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6062EEFD210
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 09:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1538E84676;
	Wed, 25 Feb 2026 09:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDBTmSXHLaD5; Wed, 25 Feb 2026 09:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF9C84671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772010613;
	bh=mW/E6qmftqb2xw+tL/SscN4IimFoO1zAadpK+FfHVxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rkgm9LgJ8no965AK8pYz8kTYeT8Uyifx69xjNLhe1+Yb2pgZf2Xe4XuSMN2XHXBiy
	 9uTRmMZhJKYcXnx7DLAZDJOW3qv7usdqj9sxb/R7+ifx2p+oV8lD7Fcp9rHVLBrMLW
	 YheC+Jpl2JoGFAsNl2h3q/1JZCcOZy5TVtmC4LBSBpXYD1nuBuNQv9Uq2oFbIazi4g
	 zGXpg6wWx+PGxtgi9b0Xk3qR7zop8b9xyZms2N5P8J80P6761LII6feFllJlDlLZio
	 i135kHtN1UWX0AF0j9EkJ9LdyFTk+HJslsEyedRQ39QKZaqzr/59pjb2MrVmeQB/lA
	 1mp8+e1HsiWzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF9C84671;
	Wed, 25 Feb 2026 09:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07AA2204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E966784671
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUyzt1oTTnp9 for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 09:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C6C084665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6C084665
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C6C084665
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:10:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43992e14638so91356f8f.0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 01:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772010608; x=1772615408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xB02o9p4k3vaYM7ny0W64ciWiloZ6O7/woI+/KoeeZk=;
 b=iNDuNRYLlLkaSnMh5OQF5GGSxl9XlZwobQc4hUCkaLnXlwKnQDElO+arTQyweXy+x/
 VTJuFOTASohKhziJnE8g8lsjjR8w1WfD8KxE94U9HC43zYmIC1fyhW9y3OlWboq3VgvO
 xvlIqX91iKy4qR9BVAN8mQTXlZyqZuU5qlDmqH2DJKGmr4L8GTHuSYTDg+tAio1PzOq7
 6Nq8bDfb7PR0xvbch/3cYQ9m9vXvmXgD7Qbhta2YeIubKHsllk5nOitthFYZ6MHn96Gr
 ZAa+8oUlJWQcaXVbrAWXAYNJKm0SudCslQunvIPfq+gRRIrbhGnrTIC4bvKiraEfnNma
 EOtw==
X-Gm-Message-State: AOJu0YyChh7AFvSV0PuKxj7XJlfVZQbOmPEal0LWbm2GoE9DCU5yWptq
 QxrUmw0UkH4CNGP0ahNaSQQZMvN6xi6m1MJ++L/o3zJ37szTunLLxnSJPmUuEYB5MMYea01rozK
 uO2ws
X-Gm-Gg: ATEYQzxNKJxFA3Y2M6CafI1B6KLJo4xXFFFP86QOvYWddw+Y/vyr4l10lCozqwNfC8X
 5SPtq3R9kaze3sMihfLuTfJn6KUvNskrfG+0fbQRqtQfTGLQNvOFyi1RpxyKdy+UUE/xeM2Ky1h
 qNSioMX4Kin5PbZZ5Qn/ZsHoPCN+vFzJP3ChIF60vUNOinRFdJS4z86Wt/geaKtM5dyr3XnXDx3
 xUoOY+3tDOoeeIqx+bByF04p+yd3T55E1oBStN9yo1G0MRM9cttA4FuY0pzgs734FAMQEAcTEWv
 nzj8IRWp6Awu0OSCo08CUUqbYBCAbR1iwI3d2W9QLnA1YSnShFnjbityqXdubIprcumD3uDYssX
 oEV1B3zsqwLNNIQ84tLE3TmVYDzPy2x+OuGEvV9u2ReDSxQbsL3qBQyrt4H+mJsszqa2gR/7x/a
 WXqhlApyGOuUg2XF0=
X-Received: by 2002:a05:6000:2f86:b0:436:187c:554c with SMTP id
 ffacd0b85a97d-4396f154caamr27893582f8f.1.1772010607497; 
 Wed, 25 Feb 2026 01:10:07 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43990c38516sm2465774f8f.30.2026.02.25.01.10.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:10:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:10:06 +0100
Message-ID: <20260225091006.238395-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772010608; x=1772615408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xB02o9p4k3vaYM7ny0W64ciWiloZ6O7/woI+/KoeeZk=;
 b=As0qbEPIgImqtMezOoxtoJc+Yf6M0u/K0yPc6EYEoFLAI3DpxNxy8ZNx8/UCdStlC3
 aVAz0iS5DEtAcsjtO3Y9DZETxUjUt/0QitGnSLsJDqlSS8SnvOp3719ScxUo9la8AdJ3
 LILEQxDC0tg5/jabCYWxyoAcjYrM8OQbK++TxO49ThVCRL0d64qGJwkDGSGbuZ6BN1f8
 lzMtchcayHbbfzPmJ681Z5Rs4WboFGi9yAJkvp1kmd+36mn6B6098q0jb0qBCfPDahB0
 cXABjZsEJMvvBsto1yLScXaV/tnYx7kMO4gKphkkTbiB687ubMipQNNHRjAuDWOwDG1O
 3qIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=As0qbEPI
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.13
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html

Fixes the following vulnerabilities:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-11626

- CVE-2025-13499:
    Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
    denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13499

- CVE-2025-13946:
    MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
    to 4.4.11 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13946

- CVE-2026-0959:
    IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0959

- CVE-2026-0960:
    HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0960

- CVE-2026-0961:
    BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0961

- CVE-2026-0962:
    SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0962

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 88eb7ef494..87d5781eed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
-sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
-sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
+sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
+sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9ccd8f9a9e..196ac63271 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.9
+WIRESHARK_VERSION = 4.4.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
