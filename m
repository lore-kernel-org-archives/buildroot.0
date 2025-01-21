Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233BEC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3998406C3;
	Tue, 21 Jan 2025 22:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vODYmAjBbBWQ; Tue, 21 Jan 2025 22:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F9B40724
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F9B40724;
	Tue, 21 Jan 2025 22:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B55B3959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E24740724
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2PFMIdSc79K for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 771BC406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771BC406C3
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 771BC406C3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:22:29 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e161a8b4so186777039f.0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737498148; x=1738102948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqjPl7s1EqdZeJkrlFiqB8h8n5/XsyuRU7W0VwpKfH8=;
 b=KmHz4Mxq2OrWf6FlxXVGBxrSDvrsK8vdhM7jzIyAfHCSYV38vQJ29785jc4Ub4UTOI
 wLN1jT/bEdoGfo2cQsYEamAVydtHrMS3vdUX5bMTlo/SjBookJF/lLNqZ6pcgwDXlYoJ
 h9IWgEZYIUb9OFgq4QxysZC3VrqT3v9JVQWYGphJlvsGq4kWmYtdJhO7rd1z2ZeoqgAq
 JUcQVEpzOgAaT3Jkc7Bxl008IXaWeFwkl+GsvNe+3tYXw48vTeEpfZ83ZYihueuA/SIF
 gDcSg4+DNmRfTS/1oRYZPlmfby8Lpi2KN3PKvXNDV5IkEN4YneWsiG1QhMU+8meV88g7
 6viA==
X-Gm-Message-State: AOJu0YyiBkcJ/VgEr3rd+zNiDW5dPEPbcdX3zHipSfJQ4ZIuFsqQooGA
 o1e7fdH886jMZ4hUBOu6BHldS/V+H3jxTzHDFW4NE1tcbqwRNMvaIRx/2LbE
X-Gm-Gg: ASbGnctXs0NCCjMo+5IA6BHkMiP4oLnyzbSR/ZEyzn7+0d1afVdYchRrL+XdbQ942Kn
 7gI8WSUpLUdwj9DE4miTFmwOILm3SNskl3Prt+C1m1qdUfNtAx3YXVrS7dFVMRYycv8BVJLFK99
 o/fNiRol99u1FzvbixudJq/lZZkKWVide4UW8HF105cmuJh7aCNBV+ATj439QexZZYuFezCw7yG
 dmfWAwbAT3e1RT0voGQW5PNrmR6ufBD32dmWDTivJanwAQJTZAYdBfAEk0qjd226Y276wgYrwaK
 y8Wg8viFsQUFCuVBV49Ejc1CCsWQku1Oamy+wUDfArCV
X-Google-Smtp-Source: AGHT+IFZ16XGgeaIukp1a31bSNXEEmcUgiUkL9ORyguMoYqmzqrxmk8ODcT7SkiGIc/r7l9EHrrElg==
X-Received: by 2002:a05:6602:6c11:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-851b6522d65mr1355650839f.14.1737498148277; 
 Tue, 21 Jan 2025 14:22:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea756493e4sm3668262173.96.2025.01.21.14.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 14:22:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 15:22:26 -0700
Message-Id: <20250121222226.3132314-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737498148; x=1738102948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FqjPl7s1EqdZeJkrlFiqB8h8n5/XsyuRU7W0VwpKfH8=;
 b=NR8sC1brTTvIROF0AowHvyXlU8l9f9bg/lt0kmpdS7caOI5hEkizL/IRRml0ijgwIy
 EPuIPhiEFoP6N27vLeyIG+4NgimL1C5Ux+238YzS0vz2ZPRLtAZlZv8j1WlqHetFRso7
 8meORAsODvF0SwBU4LrkN/NLyKH8ZbAuPiLf5DKp6As7FTesb1bmqShKv8DwItqBhImS
 QerNT6AGeJasBaPh1Zk3llCQAduF/u6rIB0ZI4wOPH7wKd1ajj/QxshAriF3qEeP6j1j
 t9LpW95ruGVxFFNffKXqNyup5ONIDJsgw/YmZ0AWgMkk1KFGNm0VXeQ4Q8RLT1lBZCqK
 ayiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NR8sC1br
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.30.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 21cb8d4087..f3d2c95a74 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  accfe9ff41ee7b1a8c9a67ebd5db6a55  dbus_fast-2.28.0.tar.gz
-sha256  ed2612392a7df775256c67bfad8727607e8862541b3984585b016e464b020b23  dbus_fast-2.28.0.tar.gz
+md5  6473b4bf7e12412692d464482337b58d  dbus_fast-2.30.2.tar.gz
+sha256  87296315f4a2f2416d495f48cca019ba901d046989e94df2adda84c3170da7b3  dbus_fast-2.30.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 73d559f6e0..92e5b661a3 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.28.0
+PYTHON_DBUS_FAST_VERSION = 2.30.2
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/fb/a1/b7bd68329a6f3afc833d5a3d8eeed5f0557cd80e065f3cfbfd5df7193da2
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/69/4a/c5dbb4eccb97d3dd0ec49e04e17b7e93dfae517881ad439141fa6179cb53
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
