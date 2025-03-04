Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC83C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 04:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEAE606E9;
	Tue,  4 Mar 2025 04:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2TKrj4ThZBk; Tue,  4 Mar 2025 04:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993A5607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993A5607A8;
	Tue,  4 Mar 2025 04:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C760CD2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A24DF8156B
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lq7ypa2fLKOc for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 04:01:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09A4281569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A4281569
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09A4281569
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:01:14 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-219f8263ae0so95179415ad.0
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 20:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741060874; x=1741665674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfVU1uSSQuh+wn6l4mdxFDQZH8dHFzZg3TJnE9fBRYA=;
 b=nAGUo99pxEkMVC3oFkQ7E7UzdmfVZZyZSoAECEJv8006VrXNXXPo8vIJpuULILXC9U
 OX8AaLbVorOil4F2Wt7CzKlwYdzSdCypVG9jGlGWumY9JiRz892eBZLwHyPY1ANeftat
 U/8LR1N6+/B4hKFOlcAsobUQ/yTL4pyGRkxn/2kkhTNM+sDA4Y8epb82XGXqArdILiJF
 Gg0hC4etLlg6cG4TczHMZStXYDk9ts8PYeSWEtFNQnqx/sW+hTp2j1VPNkW3fGXug8Qp
 8Ty+knYfY4JgM1sxC2WzMF5738CSapmUMJSw7NUhtQn3IpxDQGtW2e/PTGcVXl/nsOAG
 o2Wg==
X-Gm-Message-State: AOJu0YyFU3NibKlTshtaBxI0+oU394PdLctTM/dsn0h7PU3r5lfVhIvy
 VElGRenqwlOqkwbnik89+uMAKLmAlTUkFY06YCzOofwlIepFqamvlkOkgKueohMzeJOgxKLDYB+
 ogAM=
X-Gm-Gg: ASbGncv4SDMOcfZkCxtbvPl2ggDguvo+vGw/krAuC9DXK8GZJPH3DxQwTtyXXI4YEuK
 12smFJzCkm8YsN7et6SkE0UMOckM7YwyoHMHMq0UR1zfoPpUZwCj4P9VgNs5h8ya0KLoOA0PvvE
 mlQaf4e2UPZq/+Prochkhq1mxWV/4cKqPDXmoOBACIX3X6o9kGC4VSYRzucZ7ZyElfE5LQHDSeX
 eEqnVZNaToeoYXqp2H1uJnEMqrX6+Pu5ctbRRLXm0wXgAr/Gg01RWgm1klxlFyOD/jDngU4dWj3
 nkvZKTCpVhgLfvfIfCsb+1zKGqUHZkBPoAT4yj3DmvokoWmZozz68SuLSicFcSZpW8ohMxk=
X-Google-Smtp-Source: AGHT+IHPJijJ9obv2p3VCLD5xZHBZo4QqhHXFNX0Q0fc96Lmj3ClFGcWmjiMgkIKnsziXDN5ddi7ig==
X-Received: by 2002:a17:902:ec82:b0:221:7b4a:4773 with SMTP id
 d9443c01a7336-22369244a5dmr210171725ad.51.1741060874152; 
 Mon, 03 Mar 2025 20:01:14 -0800 (PST)
Received: from localhost.localdomain ([185.211.32.216])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501d2610sm85410415ad.14.2025.03.03.20.01.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Mar 2025 20:01:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 20:01:00 -0800
Message-ID: <20250304040100.92269-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1741060874; x=1741665674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfVU1uSSQuh+wn6l4mdxFDQZH8dHFzZg3TJnE9fBRYA=;
 b=FYbCqDLSp0oOH0TfBWrf8Q+nuY59V6XOVtCjQQwOJh4sn71RYlg/DRbYpi9dzIbI3b
 biOL5AxNYupCWg/QVhKa/I6mxCHOrnrDfdeWffYPN/tyf22JVZ0WgDxBdrPZHwKLQ8nL
 kMMzcqctK2qI4G7l5B+KuJa+ebGIjPgv6w0qUp9HEhkH2uS2FsYOSau9YF/OriDVHMWD
 yzzOKZp9wgBMiT+UzJDFP+SSkI41mmg/60W1OrbRMFSiAumA/K8K0TZY5W0IgBcDXsm+
 u9HshvbGUxpolqlaz/nry0xuUlbtr24sRSj50T1neN6FRI03qr6iYaMq0eOJv356v8G2
 G/Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=FYbCqDLS
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: bump to
 version 2025-03-03 on branch v5.6.4.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds support up to Linux version 6.13.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ea5ca3c56b..d6da50a694 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
+sha256  56b43fa608c0b8587a03076f9beb21833e3259682f01c63df5855b3c82a61ee9  rtl8812au-aircrack-ng-80d4ba5a672f69a4a8b2c4b4dacfe804844e6952.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 3a7c56a3fc..afb8d25ac8 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
+RTL8812AU_AIRCRACK_NG_VERSION = 80d4ba5a672f69a4a8b2c4b4dacfe804844e6952
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
