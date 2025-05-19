Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A7AC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 00:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEA840BC0;
	Mon, 19 May 2025 00:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdXr-f5_dyBn; Mon, 19 May 2025 00:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7DB40BBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7DB40BBE;
	Mon, 19 May 2025 00:09:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 185F6193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 00:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F17E0409D6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 00:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAWsYjpOG1Cs for <buildroot@buildroot.org>;
 Mon, 19 May 2025 00:09:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE308409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE308409B1
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE308409B1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 00:09:14 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-73972a54919so3550941b3a.3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747613353; x=1748218153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q2NCodsH1n5NkDr6a9vhRpLX+UeoGb9Dpmrt1rYRVhA=;
 b=OpEbgqiyDL5du2lxLvhlt0GiOlcftvxSqlmkMevh3fhyhTKHp3l8aAx5oKgXH8F9/f
 8R7kVZ89BN2d7O+fJF3ud9tR3A1vXm859gcKzRbQRxf6ye92xjFSDmJDiWr7AT7TMvtl
 RNJpRs/DCZHntjv4o5qAFEasUTGCjrsoqgD2FBHkHNdnyBdt2e0qPRgqG6BjvSMYmsGK
 ZoxC98vrYJwwrIWWi/rlcET3jYUEaGByDGgy9KUOF0V4KZ+RGoyISyZOh0C9aZIcpCbX
 c17MRs9sUEDTKKY1jdgS8SnX7fGNdYqKmKy7GVFUv5wtGgdMbPpxPSurC6bivsnfIvU9
 bYFw==
X-Gm-Message-State: AOJu0YzdiSE9PQyDWW5Gsa5G1KBi+6sb0SrjUm8S7lK5/gyLfGmjprhB
 RblMOZCX7gth6MOIQ/M7hYG1fYRSafdEUDnpDZtFUs0q+ng29PyZTwKtNcDYtXHB
X-Gm-Gg: ASbGncu/IjmhxsDZhfAEKWNm5HDmilLr6vziq6mZjsPMi27KctuY+qe9Gv5uH4Z7M8x
 Mx7bND0EhljkS7UwwlTUwMFMSpKHEjsUHieZSx7JdAF7PMJUmqXGZUkpkmYKfmQ+afAhXNNC1DG
 +roNprfX9vnpeO7BITU2r7WebLQxSIN/LmUMbVgceEneEMVkDhqA+LZQmZBgAFmucRQc+pHP3K+
 F7Mm5ByN39lGHTlzNFWKfGWDYVyHNYK6esvSVbVbvS1m1GqjV08wJmCFGFwaVAoE8bCdDiw7qgK
 7Abj+udpe94RMg+Zs4E6ZGyT/3mk6ql242JtfOnFnffQ7T1jYjlvmTrChNEzaRLyoS85mZw8Iew
 FDwAMB+Wtc4nT9JU01iE9VjgSzwB7siAe4c3b1w==
X-Google-Smtp-Source: AGHT+IFFWZzookdhJDADVpdnOf4tcZH62E2Q88lfTEGO9nBXobd+PXILF9FLZcaq7aPJUawZ4Z0ekQ==
X-Received: by 2002:a05:6a20:72a6:b0:1f5:95a7:8159 with SMTP id
 adf61e73a8af0-216218c643fmr14874980637.10.1747613353031; 
 Sun, 18 May 2025 17:09:13 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a985faf3sm5003994b3a.125.2025.05.18.17.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 17:09:12 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 17:09:09 -0700
Message-Id: <20250519000909.226437-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747613353; x=1748218153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2NCodsH1n5NkDr6a9vhRpLX+UeoGb9Dpmrt1rYRVhA=;
 b=MHTTHOpb54hMavNaHWMWioGQ411D705+lZn6NzI8MbCOn/LhvvegYr8kU281Gky2pX
 gOj+qgf5jsvQBDC3huFJVTUeoxYcXw/ryWiI58KtLlMqHSzFHV8UlYcnP8sm8okGWxjX
 EdG1whg1pNlhozbRF57QazI5fQvdhw7VLJBNGYdFXsMsgimoB5UVE1AexlWP0rZk1xIy
 jDViqpV5vLphfHeijaD80EPfk37uGHSrrIgvNCcwpJ5pztMVBOsyRI+tAfs4IQ6l3Rfd
 LOU6GA9C2Wi/3a4cDcXMmXfA5w0cqssD13tZ9hZRPQVCK3SQ/dP1lXFan3sOs8LZXdQg
 Id0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MHTTHOpb
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump version to 10.2.3
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
Cc: John Stile <johns@msli.com>, Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update.
https://github.com/NetworkConfiguration/dhcpcd/commit/e143ee18f4e2312e0254002dd27bf1da8bd95f27

Release notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.2
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.1
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 34f6419bf7..d820f5e47a 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
-sha256  abc307c63853da3199baa5c1e15fd5ede9d68d068b2a59ca14c5a6768e9cc3b7  dhcpcd-10.1.0.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
+sha256  4137a382d1a203bffdf8e757bbdfd0032433d06e5c69a3785b88b83251f89616  dhcpcd-10.2.3.tar.xz
 # Locally calculated
-sha256  224b37cd1ef1365bd2ac9eaec9f32fee94e85dd40f95461ebcb21e758357ac1f  LICENSE
+sha256  3aeab006b01c1573b42d4440d7edad0adfe61ad05848ca82e02e745424a2b4fa  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 3a4b0e10d7..10707158d9 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.1.0
+DHCPCD_VERSION = 10.2.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
