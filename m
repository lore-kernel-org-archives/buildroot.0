Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA0DD41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8BF409B2;
	Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnCNaA7fsa-b; Mon, 15 Dec 2025 11:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1288440944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799006;
	bh=w8FoQlNniJVYqHd62x3evrbxh10RzW5WLzUPqgyCViY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YO5gNvcv7nMLHES91DWbWPxa5v+hP1ngC8ixiZ80aaP33pq7cCQoYcm+Yx+nP30fe
	 nn7eTJWeJdV/JOAubjeFUtAfyauGZKwq2qGId4VNR/5zkqi51pykn/LWYtt0PD3z/f
	 hFJ7RcQqED9sylhXjSbjOB1fEi0xHXnmnvq5GWBLBydyN4/gXCBnAxOZMs1YRt/7Sj
	 rFgqmh9oVz5W1GzMzCRAMrEug1XqI7zACy93t5hToh2ATghzpVtjRwI2atz5WS2wsG
	 0ItUjthW69NO0BUE4spSVFdSWcB7XS536gdX1C0SkV+FxWqfJJf3x0PZti8PmRMr5r
	 SHkJJmtwpW2+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1288440944;
	Mon, 15 Dec 2025 11:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23828118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09A7B4077D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L71oze39Hcgy for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27E6F406C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E6F406C6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E6F406C6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477770019e4so33398535e9.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798999; x=1766403799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=r+PwLpkkoCrcGlcQMOBsgMybqQag9M4f7lfz6B4htnMU4UZYWIisV7wgTlcEdPZ/to
 1dMODO3ONI4zN+ulzZsarCFsybjmxlTV93OijP2KWkAd39K69gzSEp4YWQIft6YAB2aE
 18FHlg0xr930MzN8V8J6CiCKlD62I3c6/wjDV8IjefeQ6NWkpOOtNhZahnf32U7O92ms
 R2JCd1ia7hyekCxQOKpRNi74Oy/463q1lMriFdt3AE+mWe/wKpM4jcOS5i7maW4ZCURH
 CE2Ee7BgQ//4yp7s3TjjEBmOncA5Wr9nUogo8LGmuhtooVpMh7MPcjKvRhig9i44Gy9u
 Ncog==
X-Gm-Message-State: AOJu0YwYaktTz+zASY1lv78USuZlc1MOmkqGKc4ORKRlWQY0PlkJyLIh
 nZxpOPFTLOGCWtgsO3lv+aTUzBKn/5OcjWrKkl17+OKRiknWgL6RKiY9GIyDZg==
X-Gm-Gg: AY/fxX52sQ4IBQBEhtJZNzdhK0pqqfawSjgpdaCIW41/f5dS96HUlYL9x5L0W4L/jae
 AGib7aKS1AtvZngBMzKgP70wnn0u46WZeS20Ue9m2smkr/Z8WAeMAsciPHXlwwOLmU+pH0goj1y
 DX+j8EMf0ImgnYeQLX8s1K6S0u8SKt8cwBnLkyRN2FadivxaVksZYZsAeH5Qm25N5uJfhaOce4k
 FbvL2nocPAFnz/ksGUsdXU42pEuj2yJ70grMVu/lEtQ8nNcMhsHGO1F9v+uT2oSmQGegynXTcu4
 PrPLh+nW3mYI/B50NUPqLLQBOLgRu/B/YcJ/WbvsJvOLCUhHkQzM38cfYAdqrZVAm6sSAoJEqOy
 xB4Mcnx782mOAeMyS7/9hLE1wcy6E9LgrPHR1ccQpIuPPmAnEU05IZal5+nv2B/SPKSG9mnO6rf
 0GcJ4=
X-Google-Smtp-Source: AGHT+IGv337yWHYMDItla6piBw6N1EJnGOXxWOBAKuSQ4sLNXoM2UsmQ20MyXosBgexls19NcrfrcQ==
X-Received: by 2002:a05:6000:1848:b0:430:f97a:6f43 with SMTP id
 ffacd0b85a97d-430f97a7049mr4750538f8f.53.1765798998968; 
 Mon, 15 Dec 2025 03:43:18 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:18 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:42:58 +0100
Message-ID: <20251215114302.32596-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798999; x=1766403799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=jveE2euyRAJ4R9rf96lKBApuNrPruyM8rcC/0ZQ0nGxehahThGlaGdjKOaWNy6yXBy
 sdUUCHCNjHriPzHITDg1vgyjLtydGV1i6gARE0Hx83hMZvNglx6TRYA5asm7c3hquqO9
 FQs+6y2lE4djpHcjqkA4+SdTxjZZ5UViZIZJ8AvrLqpYDSiNRYaIVvnHcOmNIbwoD5dl
 JcPFNDGHLDXRDs/u4r/WBSrpVeeejZXKX44vxlfW7+EBYfdr5J9rXn7BuWbu2neM/hpr
 hmYJxN7tq5qt46iwVzszqeoi3RdSXjTLuS4qDz2hRl6Pq8PotHg/4itqOHk1YvVikGs5
 SVHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jveE2euy
Subject: [Buildroot] [PATCH v2 3/7] package/dpdk: make libraries selectable
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

Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
built:
  - empty : use DPDK defaults
  - none  : disable all libs (-Ddisable_libs='*')
  - list  : pass to -Denable_libs= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 9b6b367ee8..200d151a7f 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -64,6 +64,27 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_LIBS_LIST
+	string "List of enabled libraries"
+	help
+	  Controls which DPDK libraries are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no libraries
+	    list   : e.g. "hash,fib,rib"
+
+	  To list all libraries found in the DPDK source tree:
+	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
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
index 829b0cc640..d0c7caaa48 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -56,6 +56,15 @@ ifneq ($(DPDK_DRIVERS),)
   endif
 endif
 
+DPDK_LIBS := $(call qstrip,$(BR2_PACKAGE_DPDK_LIBS_LIST))
+ifneq ($(DPDK_LIBS),)
+  ifeq ($(DPDK_LIBS),none)
+    DPDK_CONF_OPTS += -Ddisable_libs='*'
+  else
+    DPDK_CONF_OPTS += -Denable_libs='$(DPDK_LIBS)'
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
