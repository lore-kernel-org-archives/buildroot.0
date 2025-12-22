Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DE2E6B25C
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131E7822CB;
	Mon, 22 Dec 2025 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5xw-Ccg3yZj; Mon, 22 Dec 2025 21:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399B1822CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440622;
	bh=QvJ0Iq/iSlPg/HSAh8E8LU+5eq31+GTqoORwuqscg2Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDelt0TCxaoTA/ToCCif7Q15Ayd5c3pLViwZwmPTSqFoEiF1F50qoFcunAj7D/fie
	 sGi4eAjVXpLOeDDwmM9b74XxyCUuhYRiPjG3Pt2qNBjCSe3WxQvDQ6UZZ9u71h3zsl
	 nF1bLXpE0QIEnPasYZd8ZgdQOzxPIm0sxWt9cZ67+n/8dal8WJ2++kvguSfubWjZVY
	 YJrmgg9B+00TVra/swY6+kp4wvxI+kMgMPDjT4Hw8CKRt5kZA492OKAsuw+x2LDGGn
	 UgM95qjzpScV72YMIQevF0RXvXCgKRy8qL0SUezwZjjdg1zn08uKO/Mf+hncC7m/Zo
	 FfyfefaFerRlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399B1822CD;
	Mon, 22 Dec 2025 21:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D34BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9D9822C2
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLON6HvRFaBp for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75B49822CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B49822CB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75B49822CB
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so24865835e9.3
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440616; x=1767045416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LUM77ZGnEvIjeujamzklivSSSOhSFCLb3hRonQf4L8=;
 b=F/R+3WnhBy/N3DqPe8lOfawDaAsQBeH1NmLeXyDQCMepVVcO50J0jHkUWhBPrtZCII
 7kkOl5CkJzfVr3SvFSpAf/sykGalbgvoi2g5Wi5uvLTpX/9aJQ3IOFqJcqg/jyM5GqPO
 wM2ooGzV+2n29fg75M1E66c+WBj9AI9PqHI98YWQRDpxwt/4WRSiN4bz7tdLBC6g1sGf
 pibu6FXI9f69lvkhxFZO00bbwyC7t644dDSGZxt2kaLQoGqndtohmhsu2sRGp8dfkUo3
 Zs0DA/6ylnNxBLkbVoADtskdOCxXZMHV6DHW4XRAhzCyMAv5l8aNyWZS1vmoXq1IgIaR
 q46w==
X-Gm-Message-State: AOJu0YwT/70rB48GfvsSkfvF026HkCU7hP6rV1ygMqIrTtMNEmOzX6ih
 lF6PiXfitKdKlBziHYWL3BPcYAYQomPYy1CVqut2JsNY2DD+CLl2+Alg4iqNvg==
X-Gm-Gg: AY/fxX6Bx5JXeAFGtLjAcT8kyKlxQH1cPKlISu3fkwJIN3Fr6aYICPAhN/98D+RV9/2
 EJonZt7WwnBTtcNYTe7YHRP27dDMabmMy0RJm9wLJTjpSUcUUQA+hp5K/pdJ8wgWRtqJO5EQtpm
 bZ/i5Oi1YLtZAWvOwXFeqyH4RvZ5Dtul52aLZKsLA/LCcqmEQgmgWYHBdin9ayIcqWGFBcwtZH1
 ON8VzCMRQyKjNrA1df09bjhWa6/L+ZSwePINBcQXvUsgWnVj2LbDeC5Ybk0kV+ueMfDLmZibtvb
 GQOyPkjTPz53F+NjPXYnGIvyhRwTa4UZ29JWN0ZttpXnRpNb5CX8vpmyGfZYxoD2YsX8Ao2zuS9
 sDvPG49UwbpERs6OCwWl8iLojzrTWY50znM0i0a4wlB9BD6Y6dzPP5pUdSPjNUYktteav0Goiz8
 WSf24=
X-Google-Smtp-Source: AGHT+IGWeCWQE6Bn3bEyhgGBUGoh4HGtfmWrKolO10Tue8VJ5aGabYgl68rAeZqAhJDpSJHhh2dRtQ==
X-Received: by 2002:a05:600c:4e8f:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-47d1959c74fmr123731845e9.36.1766440616254; 
 Mon, 22 Dec 2025 13:56:56 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:55 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:36 +0100
Message-ID: <20251222215636.975668-8-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440616; x=1767045416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LUM77ZGnEvIjeujamzklivSSSOhSFCLb3hRonQf4L8=;
 b=dW5Rhu7bgLw7+0Bv2mW2AvO4P5mWI1PD95gcvjH7yzZQ/2gyKzOe94ELpdLOahKAQZ
 y+wyoxZ0hFWpqS2zR05pYuFt+FJn2rlZGBUR2eapkmnkh7BFg+M+r+ODTChAEJyH1XN3
 /qnD0ODyiabAYMwQpu2x6vE6/9whyGIsf8RVdRftIiGYF7YBWkwMLO2keLAAHyAQ/POk
 4ZqAmVc1WAVydXvKNONDfQwaDISb15yRTu6+rxuF46W8g8N5gu1qJmORjv2MMKzSqJUR
 4YWtMdERG/0aE6Hbzbey+vSAxSJLW62AMrVZLqqji7WdPMVNaXE52waxprPpJ+/q646D
 GjLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dW5Rhu7b
Subject: [Buildroot] [PATCH 7/7] package/dpdk: add option to disable target
 installation
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

Introduce BR2_PACKAGE_DPDK_INSTALL_TARGET (default y) to control
whether DPDK is installed on the target. When disabled, DPDK is
kept in staging only for build-time use.

This is useful when DPDK is only needed to build applications and
is not required at runtime on the target, e.g. when an application
is linked statically against the DPDK libraries (such as grout).

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 13 +++++++++++++
 package/dpdk/dpdk.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 627683d283..c220b4d01a 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -37,11 +37,24 @@ config BR2_PACKAGE_DPDK
 
 if BR2_PACKAGE_DPDK
 
+config BR2_PACKAGE_DPDK_INSTALL_TARGET
+	bool "install DPDK on target"
+	default y
+	help
+	  Say y if you want DPDK libraries and tools installed on the
+	  target root filesystem (e.g. /usr/lib, /usr/bin).
+
+	  Say n if DPDK is only used as a build-time dependency from
+	  the staging directory (e.g. for static linking), and you do
+	  not want any DPDK files on the final image.
+
 config BR2_PACKAGE_DPDK_EXAMPLES
 	bool "Install examples"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	string "List of enabled drivers"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..2f744e519f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -74,6 +74,12 @@ ifneq ($(DPDK_APPS),)
   endif
 endif
 
+ifeq ($(BR2_PACKAGE_DPDK_INSTALL_TARGET),y)
+DPDK_INSTALL_TARGET = YES
+else
+DPDK_INSTALL_TARGET = NO
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
