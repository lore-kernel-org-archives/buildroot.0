Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CF1E66882
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 18:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1304540F59;
	Fri, 19 Dec 2025 18:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvK6D1aaoNOC; Fri, 19 Dec 2025 18:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DB94128D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766168628;
	bh=LVIM1OxX0nk9AELignKgvpUoDTzzbykaGz5p/W+pliY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WXfnX2H4jUjQ+ydXlIiwqD8j7X70WIpR4jMMpFy7CYswCBmPVNxGaQ5A3mU8OxDj+
	 hTheIH/eH420m9mbWcfO0js4PFSiqtPr4D+3GsGC0Qn1KmDcH8HNURuESuuoQaf8oj
	 bjj3KV8XhEW8ZxdY+pkb0OK562dUjj15JP9IgFy98V/UjDsgysmU8fdlvmHcOMSI/V
	 Ak5LzlE4eopk3nAfH7VFd9juWiVuwxMTAes8UOheUxwdLiNUvp5HKuuzUTtnXxFZEf
	 QKfH4t+xcHC9nTg8fhbkMkCQRu4gBD16IKTBe7NeyKDvlJVO84zOIceUK966MV8HT8
	 vAUkOrFSNBDig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11DB94128D;
	Fri, 19 Dec 2025 18:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F0C2119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857EB83F81
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awoJMPqrpwtQ for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 18:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6825380C75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6825380C75
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6825380C75
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:23:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so12281655e9.3
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 10:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766168623; x=1766773423;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpvb5kxx7SZ17xmNuAbhtXscbXnxj+/py1S95azDCOg=;
 b=pp3eBqa+UNab9NUF0N9YcL0H3GKcOYpTtP2SbF5P20uDV7EWpWzMkNn3CcTdxvJZnM
 Qvp1ZDEZ3ggKpiBhcDkVMDKK0cERIJ5NFvra1S+Dx5yjZXzLnMdMHg3m56Fz7GGloRLM
 d72euIENQRZ2A+jpn1HdbQ6FjPnYotOeMaPQBqcmRBJ8HDE6kVLog0wmPjygAcjnRO2N
 9WkspI8b/04uddnXcmoqDVATEgRn1rrXOGsJ6Z7lNrvSIJtu9L6qncJlucPKK8NGir1F
 TijybCvF9ZA3cGqn2wsJ/64dS3QVGlN7NywXZX7rj1Ufi1SbmGfP2bNKhn7DH/6gHpqj
 Qv3w==
X-Gm-Message-State: AOJu0YzgZOJ/1225ME0AwK/hgnYS4IsmjUZ6Sk2IUWJQexlrRJDfMW5Z
 l/HMx4O8dgs2GM4DWHL6UbpKparUKraXZUkYVZaJBZDyOpIiZUiQ5UFuukkrf/sC
X-Gm-Gg: AY/fxX53W8Q5kMYseCg2UB5ilVVZB0AjXjfpDTcrUKymD6O7X0yj5ZgDONr25mVMwFW
 n6Ghuu7nsbeG+KIKaXwvwJVHL4XYfbXVVavH9SbZu5upPYVkif1hUJD2Gf12gsUOIRb8YAlmyF+
 pqWJGArd6IIXudbAt/05T29C4a3F30nAKoUXXQK9XuYkNW+CLUXt847EKepUD4ql2I+63PEQfTS
 5cCO/EhtEBa8rqoNY+HEqcY0PG7QdItwODxvnpAJcx1gwTOhTPt962T959r8itiwiQQAHkjU+9g
 vQQznLC/mDVbzOxnFasR33PLuNoXoLgvHGvXiXWVXev2LiUPxizrBo06nMKv2vwSqtR3OOJT7QE
 g1JmCKoVsZxW2HCMaSXM+U7ytbtqsEw31d8HaaSp/hd/nD0U3F+X/0RGBcqXfOnLb8YLZgypk9b
 ZVPFPxjjPs8Mtovq0JZAAIhY8cxayAhm3aMHtFQ3YoMAhz+TpcZoFTSqzzkXLa
X-Google-Smtp-Source: AGHT+IH+qhytnUU33rnE/ZeyadTN8PbGYUVhshOsxT9FqT8gwhDQMg2c5c2l7tHlokrIdtQI7qudGw==
X-Received: by 2002:a05:600c:310b:b0:471:1716:11c4 with SMTP id
 5b1f17b1804b1-47d1959783amr35326215e9.34.1766168623091; 
 Fri, 19 Dec 2025 10:23:43 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm53052155e9.4.2025.12.19.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 10:23:42 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Fri, 19 Dec 2025 18:23:18 +0000
MIME-Version: 1.0
Message-Id: <20251219-wip-obbardc-add-package-dtui-v2-1-744f76604c5e@gmail.com>
X-B4-Tracking: v=1; b=H4sIABWYRWkC/42NQQ6CMBBFr0Jm7Rg7EamuvIdhUToFJgptWkQN4
 e5WTuDyvfy8v0ByUVyCS7FAdLMk8WMG2hVgezN2DoUzAx2oVKSO+JKAvmlMZIuGGYOxd5NnPD0
 FWzKl1VSdHRPkRIiulfeWv9WZe0mTj5/tbVY/+2d4VqhQa3bUVloTn67dYOSxt36Ael3XL3Nfk
 /rIAAAA
X-Change-ID: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=2SBGX0boAFQ9XumY6lAZ+++zTcwPA5arLK6R/ya/C44=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpRZgbgw2Sn7uLvt+2FaQwAoXRUIQTv9YOEVJb2
 raCOdkigjiJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaUWYGwAKCRBjTcTwaHBG
 +Kg8D/0fMR9s714lQ2ghxjCy9ho+AdikDiWOAOyoESR1ERP7stC2Ub+c5NwrVppnEwMSyKO4T15
 g2CXX/y3dh3D6lI9qbdLFsVjeqaguhB30xnbrSqxVr7Scl7uN8fVVvyrjCsgB2sEOZqGKomgsEo
 oU8bgMLb4Fq1VW4U/R6HhBSPti8yBpQxxAy7CmdCSJEuTmMxhpwYqNhnnvXPE5wOUXld1FHsjF4
 3mZ+pn8hy04GP3dstssgpXV40C5i5lPjxU463H+1mEO3z3gUjouw2CJldIDPeq0D2JK0EnyFeSY
 75nxZ7ewAF0Anavglq3eAkmjykK+0ZtZIeG5+AKnActCIGRY7yujJCXPmnhXkVEVUMVfru4HBW+
 DYxeA04vXPQx2SkIaamgvxK3fisuOyouf7JAtpYJP2dblen1BxS/FAm3o7tQvlO6M4gcucfQZh+
 7CBaEbtVcNELNfWd16hyqS10D9p3Fr+z5+CFd91ozjOfd81/rLdQfjittUGZHiRcfH5/8oQZ/9X
 K4Mwd3dL3qkGWzmNhusRYQ7qd63hpNPb1OimGiPw+Lqe1pX5l1a7cLUkKGhGHYTaSekbH0cZ+vu
 DKaXQpdwZBwfSiX9lznxo42Us9z54Qmh/1FTbbmmGVShC8Vcy7vbDk7UP+Nx0csCc6cI2vi2a8X
 v/8VsU4m5r6bQpA==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766168623; x=1766773423; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tpvb5kxx7SZ17xmNuAbhtXscbXnxj+/py1S95azDCOg=;
 b=KyWyo+V/GiGswwaGpugRcmJ8SytoDo6WYPyDWLlaOYek6r9+8qJ4Sw2EsT9cuMbWjL
 8BrANFn9gYRYMfxvn2zW/B21QH55fUqK1XwVxj/KXEWaL0cIYEpxCrSYfDuI0ei0KKL4
 45uH81f8h8d+jncn29emcq0EsiFnl4X8HJAfHrUNr8Vf79FLrsCVii6N/IMVrQgNCuod
 Z/woM4t+JUD2ilAqPWGAt/K60y3lzn90E87T64uimYQh3PPSa+PUJQktyW88yp3wzbYa
 kifXrqWDTN8ve0ytz66It1ZN2FkLizWB9mBArYP8EfgQymDWpthYkwT3AU4Wt0QZq0xK
 fXYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KyWyo+V/
Subject: [Buildroot] [PATCH v2] dtui: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DTUI is a small TUI for introspecting the state of the system/session
D-Bus. It shows current services and lets you introspect objects and
their interfaces.

This package is built with Rust/Cargo.

Upstream: https://github.com/Troels51/dtui
License: MIT
Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Changes in v2:
- Rebase on latest buildroot master.
- Add entry to DEVELOPERS.
- Remove useless variable DTUI_CARGO_BIN.
- Change upstream tarball filename from dtui-3.0.1.tar.gz to dtui-3.0.1-cargo4.tar.gz.
- Link to v1: https://lore.kernel.org/r/20251214-wip-obbardc-add-package-dtui-v1-1-88de2f7882d6@gmail.com
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/dtui/Config.in | 10 ++++++++++
 package/dtui/dtui.hash |  3 +++
 package/dtui/dtui.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..dc94526abe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -689,6 +689,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	package/dtui/
+
 N:	Clayton Shotwell <clayton.shotwell@collins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..2b5d2fdf20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2841,6 +2841,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/dtui/Config.in b/package/dtui/Config.in
new file mode 100644
index 0000000000..fc02927709
--- /dev/null
+++ b/package/dtui/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DTUI
+	bool "dtui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Small TUI for introspecting the state of the system/session
+	  D-Bus. It shows current services and lets you introspect
+	  objects and their interfaces.
+
+	  https://github.com/Troels51/dtui
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
new file mode 100644
index 0000000000..1e51c29d0b
--- /dev/null
+++ b/package/dtui/dtui.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  581935f8f7763dd5de548583d5eb261983ee3f57c693c034856a0ac9bce2bbd8  dtui-3.0.1-cargo4.tar.gz
+sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
new file mode 100644
index 0000000000..13e24d6360
--- /dev/null
+++ b/package/dtui/dtui.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# dtui
+#
+################################################################################
+
+DTUI_VERSION = 3.0.1
+DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
+
+DTUI_LICENSE = MIT
+DTUI_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))

---
base-commit: 11d6d10debc81a64de901ec0217b8103c0f366b0
change-id: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
