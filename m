Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1CCCD1AA
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 060B260AB6;
	Tue, 21 Oct 2025 12:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSI3pDECgBT9; Tue, 21 Oct 2025 12:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F13A260A97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F13A260A97;
	Tue, 21 Oct 2025 12:04:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F2770A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB3BA60A8C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsBSDRo6yA7Q for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1F1760AA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F1760AA4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1F1760AA4
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso58524695e9.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048245; x=1761653045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JTdoNCFFOC+LwTNESUKV64HLtKopKPIiyUv5xRP26WE=;
 b=KFH5BAkjf+gInI2E7DUB8CzJZ3PNS1YCxhEMsH+WhPNUJAOwE2EYmWOn7ctrkvmVKF
 9uUzLrBt+0IDzoDR4t6vS4ivoQgvIgNUda/qIebIs/DjYtS7yw4M6mqteCGVcN/Qt9dn
 jq5BRQjlk/mmVS7nzueqKNAdi7CYg/R9mTIciuhjHXBeCquOGeZB+5892pNX8ayB52C+
 gR+EoGY1MPiiZmg5/3tIl1kxV/9fWEibohgJ6lyPfQaJ4D9xMgSzcEQiuujbwKZJALni
 Mh/SDXJYbPA3kQUyi5snGuNd6tCtIizCqp2SXPOiLA23HqugAWvkeKCiNO0BaNH2Aa10
 4jqA==
X-Gm-Message-State: AOJu0YwZ3W7Oo6QEAsMOqXm6IaDplz4M2ooxo2zn00yJZlMnUQ/TUIaM
 8lgQhguyI9UI0fWunlIEXr/h3JHV2hxuBO3Xdw+No66DQeNt5fvYNmJkpl5cvQ==
X-Gm-Gg: ASbGncsJBsNmeSf1/zK5wQUJSKTGRFR7o69k1SFb54qdy7WEe+TnNMKRsyoRoxThF+u
 T8pv5CYJWEu6TyU1lwKe62/lbIup850zqZumqNE6TfK9EQ9zEM3kSgjU1EB5KlokGSa3PF/DkHH
 iSTqBPi0jMkAlZK6/9EmZIeGTJpgh5RSU5KD+ERtdLDZc6Qc1Ty8AmDM+aXTwiKg6S8T5qkcs9q
 oHAFuW9sSOLedfuCWoAhw6DJG6eZbp5bLOBK25xOUQfDy1RZSQzjg+gNWIl9S8HIqacMAY1hsdT
 gA20DAn4Mq3YCNPjnJkv78i1nDCc2dFtOSC2ZUI+lpnLhDwRx9Qg0AcOMBHIbiLI8BCivieAEVb
 ln2nRkq4vaiMxmeFOOCQIiUmLMc1tLB8GId+yO1KbLE+Y5PiIdD5MgMDwfQv7KPPFq+p+K28Fjz
 jEZQ==
X-Google-Smtp-Source: AGHT+IFjTJhcNLZTd4melG1oZSmJSnBwmrxkYV6c1imi7DE93mB6aurHsubmfUkSCDP1uQr6G7wgFg==
X-Received: by 2002:a05:600c:3b03:b0:46e:330a:1762 with SMTP id
 5b1f17b1804b1-471179079dfmr135252415e9.22.1761048244675; 
 Tue, 21 Oct 2025 05:04:04 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:04:04 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:42 +0200
Message-ID: <20251021120342.483933-6-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048245; x=1761653045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTdoNCFFOC+LwTNESUKV64HLtKopKPIiyUv5xRP26WE=;
 b=jswiZ8Vd+OhV1KjKmcsKXQApLG92XKJtdqHUNR+ThvdOancYg0JZLYzIK3qmBBjPAu
 ikwssF1wv4Y0PtZ9fE9wQOdLGf4rQG7v7dKl/ACT358FSe/aMzjgI13lbhTJv+LBW9RN
 wd1nNNaEGzQMJ677oSgIhrWUOn3GKa1ADVa3zs0gGV7L97RUdijF3E3cKBaOaPHWj2Ar
 6DzWWlhylBrH1k8/n/QJTZRPvUFetPQIYrcpZCuFlhVzbd3a1FMCzZKGVqJ73iqWlzx9
 Zspdc73D+wCAXFbOcQxm2TfaRYO8kHFC2Gk5l4A+LC1sOXqs3eHUWC43TNanXV8xvkyP
 lbxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jswiZ8Vd
Subject: [Buildroot] [PATCH 5/5] package/dpdk: make apps selectable
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

Add BR2_PACKAGE_DPDK_APPS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all apps (-Ddisable_apps='*')
  - list  : pass to -Denable_apps= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 14 ++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index e311611548..feea71a4c3 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -78,6 +78,20 @@ config BR2_PACKAGE_DPDK_LIBS_LIST
 	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
 	      -printf '%h\n' | xargs -n1 basename | sort -u
 
+config BR2_PACKAGE_DPDK_APPS_LIST
+	string "Comma-separated applications (e.g. pdump,dumpcap)"
+	help
+	  Controls which DPDK applications are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no apps
+	    list   : e.g. "pdump,dumpcap"
+
+	  To list all applications found in the DPDK source tree:
+	    find app -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index e54668ca2d..8bef616cb3 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -65,6 +65,15 @@ ifneq ($(DPDK_LIBS),)
   endif
 endif
 
+DPDK_APPS := $(call qstrip,$(BR2_PACKAGE_DPDK_APPS_LIST))
+ifneq ($(DPDK_APPS),)
+  ifeq ($(DPDK_APPS),none)
+    DPDK_CONF_OPTS += -Ddisable_apps='*'
+  else
+    DPDK_CONF_OPTS += -Denable_apps='$(DPDK_APPS)'
+  endif
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
