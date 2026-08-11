Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F4FC5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 12:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EDCC607BD;
	Tue, 11 Aug 2026 12:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xHA4AqSiT00; Tue, 11 Aug 2026 12:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5232D6065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786449938;
	bh=xzgHLy3/BEGQrPv2pFQ+WxlAX5MjsTqfyiv5B1nUoYg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hXFXSci++GNEAV0Fk4zo6mzOsb7R/LJpgHUEt0txbdcrz63EKKv+R2MtbR5eX219z
	 6SiRpn0jUJU970XqeSQvY7FPpeUOLlLU5K0iot6D4XAuVtZ69E9BEW7GtNbvNFzNSs
	 PBw8xkaugbBh9ilLvxHyN8xpTJ1c0slDJANFxDTQ5/+fMUlr2ugbmo5ny1hu9sSYrx
	 rvTk/U62RPsgRiWktyDNP8ZIlxn2CNl+NHweE2RL01/vMkoHtlX2vaV2RhV54nZvkj
	 ymweQRJ5CxgeIM6SnBLqXBPv/agtbec5HDqFjrRMM81uA9PhNFwAfaZJASwLKFa7qa
	 S0cY0GqwKdiKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5232D6065A;
	Tue, 11 Aug 2026 12:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3CFE4E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A67716065A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZUthnKWmSBM for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A346605FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A346605FD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A346605FD
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso33907355e9.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786449931; x=1787054731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K+wFQfRi2k1f2cZSeQvSF/ta6kwHU96iNneWve6FL/I=;
 b=WjYvFleadyiBXF66Bk1L3F/mGLmYR5ALr+4HwEZhmXZbmVjqgc/lWZHWP5OPFe+Rca
 YAqPm9lAbvJWfv7tzK6zgy4mdDaCL1hCOcIXEKlwCg4O8NwnTO51ZJ1BxN0AdM4j8LC8
 +qtEw81VKbXN+PCK/W0rbNxb5RegaVd7cnpBTX9qA1Bw949nCTXHajltaAAH3SsxcEXN
 cSrpbaRhnoQLJTtOTKMC7vb+xfd42hRgji5samEVcyZoXQUW2rbBgT7C353XQI2x0/o/
 XVmxOUQgjp54Dc/jp4kHrsubEW2O+WQ/OAcPfdhWV0fnxZ1J7lG/e+ygIj/U24/CgU8B
 x24w==
X-Gm-Message-State: AOJu0YyjFGNf+xSSdsEuKDKZ5Lg1OOUujjrCUmuD6j4z7FWM73SRoSLm
 tAT7HWVt3N47IyDEGnAkS3f6N3vcB5Xup6wg9rAV0pNndc6p1+C7qzEHeSzKktM+OAhQB3ZDAuJ
 d9iVx
X-Gm-Gg: AR+sD13hF3z58/ThYU1sNL8i63sdMzh81E89ZFBuFEAM5vpeGI3fmtB4Bzo3uN3uQJT
 gRnINsBpt69R7YyStrmWMTzs3ElVJlJJCbBwNxcyyfSaug8MnO+3ELbEkKA0AA5Ro6m1D2bjcst
 84nt0vsqkSf/GVS76nIibPSB5rzREoMzQ36o4QuaCZI9jknVQ/PRJNIYkEQLj9AswjEh5QWX82X
 w5wG/DmRXY19YBKbf2G3VEf2PNhu9CQavmfUlN6XtuSn/Gt29kSKEyKUutgnnlHxb64EC5+a48F
 DHm0Hmrj94xKl8KeZidvhK5nh3O8oYVIvzcj9A81OCxbwR5WE8J02fv4WcNPiknR/MHFfs7rOR1
 DIX8nqTKtdErzn3njStou9+N/oJHMhEsk9c77hqxT1U+itfTnZOjMwz8epZwcgYWu4rJMXGCDaB
 NogIekgqssgmP5YEYA+QkUETUPFxbwCHl/qnGVymU2ufeKyVdtZzp5JA==
X-Received: by 2002:a05:600c:3e8e:b0:496:bbce:f3 with SMTP id
 5b1f17b1804b1-499784398b3mr55763895e9.6.1786449931086; 
 Tue, 11 Aug 2026 05:05:31 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740c5e0esm57011745e9.6.2026.08.11.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 05:05:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Tue, 11 Aug 2026 14:05:29 +0200
Message-ID: <20260811120530.130487-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786449931; x=1787054731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K+wFQfRi2k1f2cZSeQvSF/ta6kwHU96iNneWve6FL/I=;
 b=SZnILw3wGvyTzFcEo51f/rqjvV1hgUw72Y2h9Os+3JggDJFHujbDFvWsFyN73UoHzh
 qCL03bfIoZNfnY3mYIukTNlZXgTq61fkP3CjZEwr3LAVt8VrSd7AthlFNJ8nIl9clN1y
 f+Aef5JsCZiFkwunV1uXzG5EG7lNxdXui8YkAgw8ZxOUYIxKd5BZYPVNJMhoGJwo55P5
 j3ba/CK4Kb6CQYraW0xaBDBSG84yUx/n3YrQXhCNp497hMqJZJm0NdqvaLJfY/GNvJ/h
 XLp3xGty5zIOd/GkxnWuZlP7nnVqRfwIuW8z2PhZ9EyKSV+a/VXU0xJIHb96JEA5gzWU
 vdcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SZnILw3w
Subject: [Buildroot] [PATCH v3] docs/manual: update 'releases' to reflect
 LTS changes
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

With the release of 2025.02, LTS releases are now made every two years
with a 3-year support.

This reflect the table showed at https://lts.buildroot.org/#releases.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 --> v2: Took the suggestion from https://lore.kernel.org/r/<a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
v2 --> v3: Took the suggestion from https://lore.kernel.org/r/<393511ee-1b43-4e3c-bc64-e71c1d900c0a@gmx.de> . All the releases are stable and divided in two categories: LTS & non-LTS. Also updated the lts website page to reflect those changes.
---
 docs/manual/release-engineering.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
index 0cf38183f9..cbd310d682 100644
--- a/docs/manual/release-engineering.adoc
+++ b/docs/manual/release-engineering.adoc
@@ -5,19 +5,21 @@
 == Release Engineering
 === Releases
 
-The Buildroot project makes quarterly releases with monthly bugfix
-releases.  The first release of each year is a long term support
-release, LTS.
+The Buildroot project makes quarterly stable releases with monthly bugfix
+releases. Starting with 2025.02, the first release of every odd-numbered year
+is a long-term support (LTS) release supported for three years.
 
- - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
- - Bugfix releases: 2020.02.1, 2020.02.2, ...
- - LTS releases: 2020.02, 2021.02, ...
+ - LTS releases: 2025.02, 2027.02, 2029.02 ...
+ - Non-LTS releases: 2025.05, 2025.08, 2025.11, 2026.02, ...
+ - Bugfix releases: 2025.02.1, 2025.02.2, ...
 
-Releases are supported until the first bugfix release of the next
-release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
+LTS releases are supported for three years, with a one-year overlap with the
+next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
 
-LTS releases are supported until the first bugfix release of the next
-LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
+Non-LTS releases are supported until the next release, e.g., 2025.05.x is EOL
+when 2025.08 is released.
+
+See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
 
 === Development
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
