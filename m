Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E013ECCD1AA
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34DE4053E;
	Tue, 21 Oct 2025 12:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-6Br4bLYppL; Tue, 21 Oct 2025 12:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBCDD40546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCDD40546;
	Tue, 21 Oct 2025 12:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C2C43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23E2760A9C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojZBdr854jk1 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:04:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E10660A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E10660A95
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E10660A95
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4710022571cso46230415e9.3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048243; x=1761653043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T1SFQAg8O+a31Ei8MdMVYSRTr5a/IR8XG1i28KNvmcg=;
 b=Hj2qCRgIFVkl/86Tzg24xUIxG75ZQSNYllMaXmHguFnhPkSC4P96eWGNR4LBN54tXz
 dSPI8LU3BBdMJzUsIn6En5sHdETwNup/Cd8sLNkAevpHgtzwkhGl9xDV4u4Y2quPUMmF
 0z5WlAKYgTS1+yKcrcSaGT18Od5/CdzMzklsiodcAfn3ZYtvvV/58Hs6QAHoOUxUcadY
 Y1pI1yJWXv0z1YbQ0D2ACRjG/IXxhr0gyEtAXKKQ/ajynJC4e/DEKIni61o5XVnfVuHs
 Op/AcxeW2u6CYsoRrPdrWZYWbrtZl48PTiVklBTdhTkyZTUNDgQZo5vQ/cgCac4dTx4L
 e7iA==
X-Gm-Message-State: AOJu0YwjXegK9XVyqmWiTc5gKQFZXndAh36LzbwFdt10XUyVFuyCnb50
 xNZyDm9VBodQqHtx26JKNMwIpWh+lDyJzO4IsB7kRZaCWH2/2qpct1EmHEgR0w==
X-Gm-Gg: ASbGncseuKtMiYR2NXmlSuZ+OhON0BvYGJy0hFWa8fOzJaYQUg1WD5biVJJ5v32iF/M
 epUMp9lV6ByeFv7EGWGmZlSfcpsFhKo/pnEShwjFI5OLfYsQ8F3NPShG/AStYw/nzqB1+B5R1y4
 BJQC6TsgJ3N5PGDZmMfwugzRHXOc8gpPFmVLcFZUkwHWMKy7EmFkVlZI9s56eMctWcWOcgPjkl3
 f43cAPauTMT9D125Lm8X9yML+i0eOBZFNAbKOxPzELP3rczSS6wLOeoAU+OnTJX2QMhRU8eU+Xk
 eji8NMfV5zmuz3iBhm3OTgo0yeswmaLJMZvbxk013DnHipR+DrGuG45Pj5DjR5YXcsAlJfcorUx
 HlsJlwXqJK+gufI9sufnnPlr32c7IjJNZjRLJOi921yBNN2Y2VxSO9Zxf4j9b0UcMrsc=
X-Google-Smtp-Source: AGHT+IHqR+jGk5vEOOfjPHRqCuIEDAbNVS4WPpn3yvBxvVLSXXAfi0WIi6JC4dGaZw7WxAGMbEMfYQ==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id
 5b1f17b1804b1-47117917572mr148504575e9.32.1761048242769; 
 Tue, 21 Oct 2025 05:04:02 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:04:02 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:41 +0200
Message-ID: <20251021120342.483933-5-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048243; x=1761653043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1SFQAg8O+a31Ei8MdMVYSRTr5a/IR8XG1i28KNvmcg=;
 b=JawK3NqByea3HE41b7zR4FRr/pR2IQ8RYbgc+s4hxC5KwS84Dsot+1sfmAZSm9ohlR
 f0P+/t21y8PcOcXIGsSvh1cta5qe2e4ZwEdhY/ErARtVyk+TGYGYqEULizsYpT6yIriH
 aeCWlUrrUbmDEIOYyzI2JTD1M3JE1j4XxCklfSTz3HHgX13reO8AhX8YICp7eogW7RpQ
 V3sEvac4cQqZoPKrY0WZrSH26flZQOp5FLrWaNrfSORxjON6aTdVvrhWg8cSNh5Xp+XB
 aRVzTjTuIQIFCiOQ39UEndaQOqRBntqs6uAWYSfsaQxIJHPExafUsupJ5hiD+WRj52vb
 L4RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JawK3NqB
Subject: [Buildroot] [PATCH 4/5] package/dpdk: make libraries selectable
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
---
 package/dpdk/Config.in | 14 ++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 5de1c63937..e311611548 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -64,6 +64,20 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	    find drivers -mindepth 2 -maxdepth 2 -type d \
 	    ! -printf '%P\n' | sort
 
+config BR2_PACKAGE_DPDK_LIBS_LIST
+	string "Comma-separated libraries (e.g. graph,hash,fib)"
+	help
+	  Controls which DPDK libraries are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no libraries
+	    list   : e.g. "graph,hash,fib"
+
+	  To list all libraries found in the DPDK source tree:
+	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 9333a67c31..e54668ca2d 100644
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
