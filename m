Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFA4C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4D424179A;
	Thu, 26 Oct 2023 09:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D424179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AnGyHrgeSrY; Thu, 26 Oct 2023 09:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98DD417F9;
	Thu, 26 Oct 2023 09:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98DD417F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA4C91BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F2A842109
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2A842109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FYf_Jtg3TnU for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:31 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8ADC41F77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ADC41F77
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso110840966b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312449; x=1698917249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICJPL4xb3DOOOk2Z/tpoop5BvkOkuy+kraWTEFUindk=;
 b=bFCUiE8zSn3f8/OfbhUHEGknFBGhCTM/lVvl79l67ZmAOlei4ktELCeqcYlfGjNkRw
 CQmN803i6+VU7HhlLqkrVJd45zAt3rbE0EgNpGbHTALB2EjTyK87yTsIoOE+XHIwKfoD
 2tAw5GjBHLCrnHWUcUbc9UsAsSxIkJ1ze4ICZCFA9r0jNZI8q4ilC0zB+TiXp8QDKMhk
 JzXZJCOdrciIL5b8VQqcfsGr3ZQrgbjbeGcsmp5AlKKhYcIXeg70/ZHNPrn1fPUbDdTo
 tUD9PR/0zgoPLWEL21pkspuS5yiwCEz4YlBddOjfuHvZAam7iY99KGaBGPoESvrce00E
 jqKw==
X-Gm-Message-State: AOJu0Ywy5DVVp3Q/uN2BVhI+khzVMT/MNCr6KKVpCfT1KzFAsj3vpfp6
 rEoPeW8XgQnHVHn3ElvziM1sTjrs5CF3oqZlloRziWBeUaQuUMau
X-Google-Smtp-Source: AGHT+IGcpMEq8TYixW/nqnWv+UZK5rmQpmCfvNXorg3BuVU1+mfRTWwgsisy2fZz90TMY1EqgItCvQ==
X-Received: by 2002:a17:907:a0c9:b0:9c5:cfa3:d030 with SMTP id
 hw9-20020a170907a0c900b009c5cfa3d030mr13955283ejc.54.1698312449624; 
 Thu, 26 Oct 2023 02:27:29 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:56 +0200
Message-ID: <20231026092701.12345-26-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312449; x=1698917249;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICJPL4xb3DOOOk2Z/tpoop5BvkOkuy+kraWTEFUindk=;
 b=gndzfNy8vinTxzDKjdvRb5PcbbXF4ulHDCREhh3LyPH6emimjJ5EgnWTYRAA1MXx/U
 U2HJd5jwSv8y4vPQjb4wMblcyb2Jl8yiyrFZ0b//BXEOvGaMMn+QWS0YfJ+OYwY2A5QD
 VY9SufqvpWUODxcJK3q3lLHhYao/YtKtVVJ+Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gndzfNy8
Subject: [Buildroot] [PATCH 25/30] package/python-iptables: use
 sysconfig.get_path instead of get_python_lib
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils is removed in Python 3.12.0. Switch to using sysconfig.get_path to
facilitate the migration.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...g-get_path-instead-of-get_python_lib.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch

diff --git a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
new file mode 100644
index 0000000000..2a4de3daf2
--- /dev/null
+++ b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
@@ -0,0 +1,40 @@
+From fd415a3613fad872062fb7cb4e271ac1476402ef Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 24 Oct 2023 08:47:12 +0200
+Subject: [PATCH] use sysconfig.get_path instead of get_python_lib
+
+Distutils has been removed from python 3.12.0. Use sysconfig.get_path instead
+of get_python_lib.
+
+Upstream: https://github.com/ldx/python-iptables/pull/340
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ iptc/util.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/iptc/util.py b/iptc/util.py
+index 04fe905..94befc5 100644
+--- a/iptc/util.py
++++ b/iptc/util.py
+@@ -3,7 +3,7 @@ import os
+ import sys
+ import ctypes
+ import ctypes.util
+-from distutils.sysconfig import get_python_lib
++import sysconfig
+ from itertools import product
+ from subprocess import Popen, PIPE
+ from sys import version_info
+@@ -64,7 +64,7 @@ def _do_find_library(name):
+ 
+     # probably we have been installed in a virtualenv
+     try:
+-        lib = ctypes.CDLL(os.path.join(get_python_lib(), name),
++        lib = ctypes.CDLL(os.path.join(sysconfig.get_path("purelib"), name),
+                           mode=ctypes.RTLD_GLOBAL)
+         return lib
+     except:
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
