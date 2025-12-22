Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B7E6B25C
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2B760B6A;
	Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjDvIlW-h0TP; Mon, 22 Dec 2025 21:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AEB760B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440614;
	bh=QMGn3B4mTVkU4JEaFPIiNR1wWZmSF7vDCLRkOvscQF0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FsnABSgG/mOZIeXeWMhZrNGWa4DqKv3EErWuclwTlhl2JmnRkQ5AWcxSsGZi2qZUi
	 4g89jJosxk5i2VSIFEJ1ozgMXXszFamuHQHiSC82m4zWdRxwopEL7ISt8sdIUBZQxZ
	 GesFTKBp9MEU0wekxySIqLAGSmTXaJFAqWgHHynPBew+UBMM3CBWvNWfYM8LGhgHOB
	 41nKjR3lbAl+DuwF3Bz6PAUiDclgj1O/tiLolZ1xfE4rJUrfEX3nFK1ja0IW0Dqp12
	 BD5uQLJt9jalF1vk164KPevV/9g+41Godm9a0+m+IulbwoakX5tXDE4EG19ljOAJBN
	 5SvO2aPrU8EKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEB760B71;
	Mon, 22 Dec 2025 21:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC7ABC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DFF44049B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF-JKtylG4RT for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6839F4049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6839F4049A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6839F4049A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso37176895e9.3
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440610; x=1767045410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=F134+RPutx1Cvylr2tldNJZLnxXgdtzR8HPupaY+k4wJQ+jIOC/mNrjQFrP7GNIi0h
 3mz8D6Oj6Id9Qj2xgENCIfz5bw1ycTWBKJ3mT3WWqWmEaKNTDq7jNJyWTLv+qhcP5nxB
 5wF3seY1uW2XC2Jofv7qzZYRjvELuCVCWjKHPkBDTtAXaqkdPa2aDWSw9TSqlP6RNPDw
 8AD17+lQTCr65KECRSE2hA87s8nbtZFUivKI60gn1+tA+/hURsSwbeuUs2cDnH1HeHoy
 F+OM+/Di5dLu1DpVaj4iAWiRwYQRsD0vlwKo+6Cyv8lfTgd/uC4T1HZ6P9QV1IPJroSU
 kwZA==
X-Gm-Message-State: AOJu0YyExM1yFmCio1Q2ZzE2armzd/l/bCBVUqiHtMBE6z0KRpuymXQB
 7ifYjn0uvPeWJ8depeiC5/wZUXdzGPL8xJMmId1zUSHuV73n1CgLh+ja5LNEKA==
X-Gm-Gg: AY/fxX4oXoCFYAxtUdjqJCLFn2d8PGcuVAKE9JZgrVFAsm1eC3OqtsQm2BXRfhjNvqD
 Y0I6dBbftXv9WQEgYFD9xbMx80eWSU8LPd2LZE6QoI7gnZzwgwLnjx6dIyF1dOKNzqz2+XGL2cW
 WLLwujxhYKt+qaSgaTvt3cIGYDD28LbyIn379MQjFKg/6JcLHtiSzFau3jmbrepUt8bGwmvyFrP
 16bU1pcpjl1moCbfCHnCsOvu0uzyN39+mg/smgvj7RPX71yQ5RFUS4Daq/Ktw5JXzJHL47uTOpC
 hFLFulyAqgkVAm1Bm7Fx29+noaCg6moWxg6hK5gNjjm9oE4nzGrpBXJxP6fgWaZdvsoijYmlbIT
 fjypn2c5lRApoNQRjpQzQh3B2BU6xZIMnlw47gRMMHU+V/hROUbUtc4fyDdW0HAeL/edthbYM2z
 JZ+As=
X-Google-Smtp-Source: AGHT+IHTwVKtV6x9Lpgz5xNf6TPNXtDPFh63PAajF66S3KD/ciIetXr1SD8FSGjTVULUB9nK8696hw==
X-Received: by 2002:a05:600c:820d:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-47d1955b971mr111727545e9.7.1766440610154; 
 Mon, 22 Dec 2025 13:56:50 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:49 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:32 +0100
Message-ID: <20251222215636.975668-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440610; x=1767045410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=FZiZYws1LnPBWlvD167dqIPiaTunkuE6VZw2cPzB4+c4lgZM3Kt0uBycGde9sVeBFQ
 46MjS86E72hLFkRzixyLzBCGIhD1Gn1OaD0HYujmSXI9YVFctMATGEQXFocfDlLCFltC
 DLk2x3erF9SqqmiP6ptsTg4HyVwpnpyswN3wvprm90G1SFH3i1JldnD1rYiKXprQ7Ge+
 Dq+23XxWYPpBaZlggFH7GBmi37QIZYxazTr/yi3ggiv2Q7uwGZWNcVM+CyToi7lnBSDR
 UmdqdJkAadoianOE7e4q47D5WTgRQ0xhb2+CLAYFMi0hHu2qRYFysBgx9dOeQrTHTVqT
 UKtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FZiZYws1
Subject: [Buildroot] [PATCH 3/7] package/dpdk: make apps selectable
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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 200d151a7f..627683d283 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -85,6 +85,27 @@ config BR2_PACKAGE_DPDK_LIBS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_APPS_LIST
+	string "List of enabled applications"
+	help
+	  Controls which DPDK applications are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no apps
+	    list   : e.g. "test-cmdline,test-pmd"
+
+	  To list all applications found in the DPDK source tree:
+	    find app -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
+	  Note: providing manually a list of dpdk libraries to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index d0c7caaa48..080f924329 100644
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
