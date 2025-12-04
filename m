Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A1D20691
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD98846BC;
	Thu,  4 Dec 2025 13:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbxWIKz3WlJO; Thu,  4 Dec 2025 13:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C2D846DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856089;
	bh=QMGn3B4mTVkU4JEaFPIiNR1wWZmSF7vDCLRkOvscQF0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMyeQD4FR2nRdG82ztJ9ThuhjFz1zErHHTGQwfcFRyenj+BCgmE8zqmDP21OlVzTx
	 uSdykvULG2UhLNOD7Tjd8Vq7rA76S4WOHSyZNqhZyvr61kUTx44a4TKA2clgonR10U
	 iFKvX48pHzRrvnKhqs9p95TR37ge2iqb4O5MuKIZHdNUnQetxkPKuC6xUE5EaS7ev+
	 tuWGAhTNvcnQEmppV1j1LNEM/42WxcKyLV2J35iqN32dkgzH5ATWndrLa4WOWtnM6r
	 VAybhVa2fbDirotgKSLXRfcqzQ2X8Cqz3NYa1dE+owVp5PTK1OItO3hpQqWMY7Br9s
	 MPh3Q47vqB9Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C2D846DE;
	Thu,  4 Dec 2025 13:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D94D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14BC4089E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZReToQW63MC for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28C5540898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C5540898
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28C5540898
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so11180255e9.3
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856084; x=1765460884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=tUSI7niCbkCokzZ4ixj9woc6nuJbXot2XLlVebJc161fcwBznrV58T0Xm4w39DCO5e
 NOASEJ4Jdoerbu5EKHgK5lu94iR2f2Gga9tgcFrfpuYWVeOCzTtzOGl27cNwRDYL9ftv
 wKT4+ycRJdJYg7/n3i+G4ipwb/3yYZMf0SVOCmPf0rQLKsmVtVZlYtd8YhdgwblAOsZL
 ZQUkAL/QTk3EPLQvYF2xrfV8w8VPaCAKrtV1dDHHQacTzsSmCtxrIhp7Y1iIb23VDEMI
 8ZfzcrR7d3dQzlGZToO3b9sSsfkjVRcsWJLhA/l6vAi2wjxHry5Xb1DyudeRpsLPKKoB
 q6yw==
X-Gm-Message-State: AOJu0YzSt/w16FZQheCnKf35zneCjc5iDatoROULsK1/rST56g6EtqZJ
 dIqqoCXQBv/ULFLYgN9R7i0yeiwDVn/gqLixhH5mhZI3V+v5ncMxJcXrWpGEPQ==
X-Gm-Gg: ASbGncsqSTDVspNMRIwgYrZeyBWtTv6257JfD7IsgUv5YytqwPwbEznHBSgYee3x9HD
 asfVHSEKPtSB4FL1njQ4XFU7v/iPNlNcabXYFLujRNkDqXPX1uE2V9UaPPj+RVJXePjv6Q6bwQP
 w8iiV7k1ceBn0791vwDFvfv7J8cEtOKIt7MjINX81Yd+izaQdXoMBDd3IT0cFyBuB6ERpkTkyXo
 pe7FjMb/b00JKZNHF7o6ppEEuHuXAyVbHiIyTfRyI/hh3NgiNLNWVmN83yaW/teIAyp9ZPacsFo
 FLqp94KgpUdFoCzB04fCVDFeQVmP++VYlei19FaRiovscuwNwF0VPYcKgE/qmZclwS/iwVGaWBa
 jl3+JCKSzZFgShAQjbIzbHcf3r54GVVdssLd1HMvnrcFlV4JuJC+b+/5IC7tVapofWmJ1iJb5gW
 vPXNvs/3fs6ugLNK4P6ek6WpdU
X-Google-Smtp-Source: AGHT+IEWQhOfjxQ9i0K2Z6bAMvpKVmoZSvQyeMz3zbPDPw5dEaRrEhB6MMAu2Wvp2bDcoM1gzyGNYw==
X-Received: by 2002:a05:600c:3145:b0:477:832c:86ae with SMTP id
 5b1f17b1804b1-4792aee37a8mr70545235e9.12.1764856084029; 
 Thu, 04 Dec 2025 05:48:04 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:03 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:39 +0100
Message-ID: <20251204134742.406507-5-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856084; x=1765460884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDnVT8EFC9PZeGG6xQbOx7Yg6fkM2yJxcFNAmCR520g=;
 b=HqA2n2gsf97l06/mb3072XNT85VlZrzNCMk2pM+YA1CiRBhKf0tb40aiq243DSHKEV
 osyXDNEfbirEBj5Vye4vMr0vtNTR9lJvSXhHxs8AGXV60Uxr4yDLV0KZlFTj+mijH17p
 PDskGUyxQQVM5sGj+0pIHgzqORYbIJABTcfopJvIT38z3N5EoMXPlZ72ZHIGHxAqDtv1
 1ISlf4DUkE7Ffzhkr51l/5ou9Ykndq4fXt+DyKeVryBX4S5sO9hRTLRNiDvzuUnjDZsv
 QFPHAoRBPjaKozE0mj+3CI2AUPGV52JvH+8+poIic8iiGgg+YSM8OysVpASz95pmvJ+z
 ilqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HqA2n2gs
Subject: [Buildroot] [PATCH 4/7] package/dpdk: make apps selectable
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
