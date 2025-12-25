Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D3DE7AD41
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 04:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7398D40A7F;
	Thu, 25 Dec 2025 04:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQ3Tr3nGxWPe; Thu, 25 Dec 2025 04:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8591540A85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766638656;
	bh=5M5Lkjc7mWZEtbZZOuYGtDOeVq4Fa38OWZXVSYXL150=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g1wpFPZ9oOh2FEQ+GbR8OhlDrku9KQZLy67PL23DXVZW+Eyoc5uEQWl7Pfm0A4Ipo
	 wJFPP/soXZtJY2CFiMOLoK1bRhrj/kfgjiR2UKvQREJ7/VGAwc4P/Qz51j0UyVg874
	 RKBCmnBw6LPTxiiu6w4PH+Aef8l/OuMgV0r8nHQdnPBjjfA0mx64tm3/BVTumVBCcS
	 k/TpFjmBD924at63fEThm2PJrTHmO7FDsmJxLPWaRiJ/41EE268Qb/an5Fi4P1Zqz9
	 5vhllhET5jE0fXa+wKLqm9JuPaUsKDdIvA7MN3HWr6JOxVDf59KA2+F0FclZixuydS
	 db01l4UHdWAIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8591540A85;
	Thu, 25 Dec 2025 04:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC76119
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 04:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B4082254
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 04:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts-4_T9zomVy for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 04:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B366E8224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B366E8224A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B366E8224A
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 04:57:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so39739245e9.1
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766638652; x=1767243452;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrjNjW3fLopMVnH2Kn27heetTqTtzj6NLr8zz5o51zk=;
 b=wIKgy7mHlr2vClAyEwl+B1FoqH/QmJg511LiTfy64A8879FhL6c5cLIgTfq0zVNyff
 Z1ND91jEqaRHTBfXeLbohDMp+TMOvS5HS+mtB2rOWCrQPf4ZIhTlJMOQnCR/N/pqg6fN
 c5CXuX0I2TVstK8EgHYzEVrHaLLJyuf8k+8/4063Azm9x68kvpxkHr81v81bb2ngazjo
 WC9SNMCzlSVipkbGSnk/TKiGSXkSvVKusdsPgW3ORzPA3S9G+1/o0HC+NBv6CG3lH0Zz
 Bp9HeKFv8YhM1oPB7E+583k/8HDDl5lQ9Zawh+SDZNI50PhdylkiiUrY7HQ2PG7DHYVm
 55Tw==
X-Gm-Message-State: AOJu0Yz1XGfE0vPDf6QTT+adCvwhHn5VqiRNLwEK7xZiV0CYKETnLM4K
 Z2yzIIRlWgqujqXmfYU6zfeY4j0DFP5ipZuMaZxtiXF5Wj7RqhdAtSNMgkGrYKie
X-Gm-Gg: AY/fxX7JoM63SdBoTgsJGoMqMl7gYkMoW9+ZHRIHbPAUsnaHzhURcj7OpyEikwcwXMn
 Nk0Yl3McPLSJ15sgeHkxPaYIBsXj3mMd8IsV+bchGbDYtjDL96qG/20wGmo+Bmxkh+qe0WIes1+
 fEUi6dCVoJvgTrH0IlsnxY4l/D/Ipslj6+iFxw6DyEB/fflbMfBknxqqpiEMyoOAFCrytshjXLQ
 hDDkvlPHmIXAM/qXjg/ySmsliWoAJLTjuMtOZCkg+RYLVOZ8wUE7EMRr22sVvgrOnMzOLDZsK6T
 m+zL+iJet2ny085KHozyt6KuT4IJrAl/+cC2e4E8TKHyU1bwkjU7OK/nVsxpH6XpuG4XeHm04os
 BrnoLs7iWWliaKjdQ/N/TDMj1M5GKih7f7qKdNkL9v9N4ybkG7PedBpUsqB+WrrWbJ/dDeKa9yc
 dAbOKnzl0WCv11OFJf7w4Bl5u+uWUUaZAmegA6tWzTRegkLNakE/i3Dw18cqwR
X-Google-Smtp-Source: AGHT+IGKsst8LNTTsUlDUr3yaTAEE6PU+xd3qPPULsKizw1cy81TCdumG3qEoELz2GJKvFpIYtylkw==
X-Received: by 2002:a05:600c:c493:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-47d18ba7befmr177225085e9.8.1766638652220; 
 Wed, 24 Dec 2025 20:57:32 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3bbe1c8sm150298965e9.11.2025.12.24.20.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 20:57:31 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Thu, 25 Dec 2025 04:57:28 +0000
MIME-Version: 1.0
Message-Id: <20251225-wip-obbardc-add-package-dtui-v3-1-b3c0dc8e3e17@gmail.com>
X-B4-Tracking: v=1; b=H4sIADfETGkC/43NTQ6CMBCG4auQrq2hI9DiynsYF6U/MFEoabFqC
 He3sGKny/fL5JmZBOPRBHLOZuJNxIBuSHE6ZER1cmgNRZ2aQA4lA1bQF47UNY30WlGpNR2lust
 0pqcnUguyVAJ4bTSQRIzeWHxv/PWWusMwOf/ZvkW2rn/CkVFGhdAGLBcCdHVpe4mPo3I9WeEIe
 6z+gUHCeFFYXlV5oUqzx5Zl+QIXPG6MFQEAAA==
X-Change-ID: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3595; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=spTAhHwpUjK2t3+cJJgUf5zzzRnFFgCSpPY3T70jp6M=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpTMQ6QJI+ilU7SS0fV2m1oV0ouIgXMOPG+DY4Z
 +99ow4npn6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaUzEOgAKCRBjTcTwaHBG
 +BIDD/929wQJAXq7KpSiYoiDrfHeA16NMhkJzgqKzx6wzoYLN49VtKmSPaKxl8yp49bU8tThQHm
 A4zP6fD+tlw9+mYoTHSQC0wWpLD58uiU03c3cIlOLV1F8OqCZdKQYbHm6CbynlRT/luZXbM6T15
 dN0fBo+AN0nObALYqspc1fL2xRPV2tbU70lTUgGja4mo5J6MjOjCNIpu2GcmFDiPF3QPlo0ACQN
 z3rXzYVAkwhgdoiP0PzzbVwPwdlJqETa365tsDnewfU0fEbjpa4JdygmONcjr1Ev9ctnIbHSdCZ
 59+wlVGVrwOLd9mh7GshynKx5t2qbzHnBUNYf5uLbGsHs0aHLttb9ibjjBBL7X3ZDMFw8xXtz0u
 OzVNEeORkXQL5JXFd4n7zKcckmwM4G/iL4MuF1M5O4bG//YTeVvL+Gbj6tjfmrxAPA18SFQ18e3
 mBWaCtYNNVPzfZUyLHg04tYTwbnRXPgzOaKUB2mZi6ejeayTKYZfaMuCeDo4ShuApKdFpRv1xCr
 fpodc80MQ1EyWxUeIWCnnMRaNOIJS/hgVRqfJxELtQweD2oYd8flIOZMmnPlTeDlv4mZRT9nBAQ
 hogiKz3JtZQp79rT+83/+fo0IrmJpkeb7CGs2m0CxBLyMnyPyGq3KmKV+xRiCnQYeIJ8I73fKf4
 SzsEuW+gUj6fySg==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766638652; x=1767243452; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrjNjW3fLopMVnH2Kn27heetTqTtzj6NLr8zz5o51zk=;
 b=N+v0m03SnAJBstsqnD02XYYWxSsxb9uI6jdHvBD5P1N7B9iPnx1quwfu/w6VjYbxV2
 W31hPEKp+7B+G6N4/INATEcoVBQBPLFAaiQXoJOHX1IUC3/tPKvSM+hSkV9l8QoQOJ+Q
 7Pw467hOVApEI+NTMaPOVq32r3sFSHdtUKFW9A/2voNl0i7uqBqrNaqPFGy7bEaR0iYZ
 ECdZN1hmiOhESFVsjqoYb+Kpw7v/HxCHXsSVNy8sYfXgUA/7XX1gpFBxm2G+wrELUGAI
 LdLhnek/6s1/upeUsK0m0Av1deDZFNnoXW+fCAQzTCDR47RKPqyRXR0jcuLLWhxVN3hZ
 FBxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N+v0m03S
Subject: [Buildroot] [PATCH v3] package/dtui: new package
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
Changes in v3:
- Add prefix "package/" to patch title.
- Chnage upstream version to v3.0.0 (v3.0.1 is unreleased on crates.io).
- Link to v2: https://lore.kernel.org/r/20251219-wip-obbardc-add-package-dtui-v2-1-744f76604c5e@gmail.com

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
index 0000000000..18ed484f44
--- /dev/null
+++ b/package/dtui/dtui.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8ccdf97b0b9e949cff11abf0ed505a409bd04f52161a782707ab15b94f622efb  dtui-3.0.0-cargo4.tar.gz
+sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
new file mode 100644
index 0000000000..fad5f818b4
--- /dev/null
+++ b/package/dtui/dtui.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# dtui
+#
+################################################################################
+
+DTUI_VERSION = 3.0.0
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
