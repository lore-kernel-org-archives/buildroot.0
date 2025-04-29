Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F37C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE16280D5A;
	Tue, 29 Apr 2025 09:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sILh8LLarD0r; Tue, 29 Apr 2025 09:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12AB80CA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12AB80CA1;
	Tue, 29 Apr 2025 09:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCFE4E4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2DAD605D4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 09:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_Xq6BkWv1H7 for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 09:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E2D1605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2D1605A6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E2D1605A6
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 09:06:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso911344466b.1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 02:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745917610; x=1746522410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mKeRwoLiNpHCiGRKeQ8xsTMLccRpN4O6fNkj/zb7TdQ=;
 b=NnyPauQDlSSoUkinNdckP9NojukI/wmHGEJpM3Nb1+hVb4N1NKN1DPUmAHpLlRWnBQ
 cGJcJi8E50l6KNnKsMqu/EyUX3eyqb30oh0OlcWAGanWOgLxDKO0OndZzmKgUF0htMiq
 CPu11JtpdH+p+leMY9sGjEYT9wkK5jzXlrMI+8MX7trqXItHm5FCcrB1+QMrFkIdWeem
 ek1T5iIZVit7fTUMYqGwIt8vxB6h/zLdXBFq3boo89/s8rxrxDcjCYCHcsoX0U4a53/w
 hGHQxMH1AAPDl1KIjFb19eDwBnWOhnYPFVvKSb48bVfiFYNgW2PDduVF5l6JZE+kzTIO
 9oHQ==
X-Gm-Message-State: AOJu0YwWbAGx7F/bI7AHyTR0K6AdS5GnlE5nYGuEv4EewuksNZgPhESX
 adXYwKUn4sB8e+3iDIkU0tAy0pdGn+a1EYw7V9MNWqhUbonke3Ot5Jzxaw==
X-Gm-Gg: ASbGncukdiPif6J+WF1R/O7EVL/Wmtsu8YZJ5T0gLzNYHk6rxt3yilwMILOV+Yh7f4U
 olKhaDVtMM978JR6duB0QwNqXppu9uaqI3kwXDKnbPWXYutengzaoieBwz9/Q+uN8V6SRmlbpUR
 qWt8RZCIQYxMVrAeUs/X+8/wYwIaaMkmI607KQ1VLBVvx420yrVSit5Bzc4jC6rPJ+az7PMS17X
 x+3YXJzyKk+glsCh7FSgbGa4H2UCBIhQfr5U/UgaNS0FRBC0Qew2Qnl93iU/P3LXq+tuoLTzO/z
 vsCCAzDuSycvout8IVUv+vYis+PoWIR3PQ9iPRUIV2ySAfws5a0ElO9hp32jVUg4JxkkMyLIZQF
 C53dcGSXWy8OCHMjhm+SYMg==
X-Google-Smtp-Source: AGHT+IHeQqnSlBsD10C6T6AwJRLIhbW62qD8Q3sAicE4Bq2ljNQ8XLWYplStS3qrNw/9K08hpsh0aw==
X-Received: by 2002:a17:907:7289:b0:ac1:e07b:63ca with SMTP id
 a640c23a62f3a-acec6973b11mr203105466b.22.1745917610123; 
 Tue, 29 Apr 2025 02:06:50 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed70611sm755598266b.143.2025.04.29.02.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:06:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 11:06:43 +0200
Message-Id: <20250429090643.232543-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745917610; x=1746522410; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mKeRwoLiNpHCiGRKeQ8xsTMLccRpN4O6fNkj/zb7TdQ=;
 b=VkLLMt1SdwfnQH+3q9p1prQAA4Y2swLbwZ5a7RRKlHYpC9ZoU4TCB0Pr+doQsTu11D
 sQMo2S/y4QtvoKMGQG+yLGaCqM2M7cLUwsb6Pu8yPbrbuDXuPr5/TutuYmwCCoJZ04bR
 gZhDo2DZMA0dagfRT6swsD4p+3P8Gfr92zqoouyNIpbuBiMseL0tCX84Algw9EIIBltd
 B2osrM4ok5A/lEET8/rbXJ2RFN2Z7cuh0lYRzRFasaMhdjXkq3sQIzRLVPHlFODt403+
 BAkw8mjzklONSvxZ3akrHAnamRjHb/uqUiwduAmBRl1nkp1Fe5ueFmgGufwFi959+i9Q
 Fnqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VkLLMt1S
Subject: [Buildroot] [PATCH] package/lpac: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lpac/Config.in | 16 ++++++++++++++++
 package/lpac/lpac.hash |  5 +++++
 package/lpac/lpac.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/lpac/Config.in
 create mode 100644 package/lpac/lpac.hash
 create mode 100644 package/lpac/lpac.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15389d530b..01ba341522 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3490,6 +3490,7 @@ F:	package/libuci/
 F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
+F:	package/lpac/
 F:	package/modem-manager/
 F:	package/ncftp/
 F:	package/nftables/
diff --git a/package/Config.in b/package/Config.in
index 167965d64b..44030c09f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2553,6 +2553,7 @@ endif
 	source "package/linux-zigbee/Config.in"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
+	source "package/lpac/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/lynx/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/lpac/Config.in b/package/lpac/Config.in
new file mode 100644
index 0000000000..6cfe11cc67
--- /dev/null
+++ b/package/lpac/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LPAC
+	bool "lpac"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  C-based eUICC LPA.
+
+	  https://github.com/estkme-group/lpac
+
+comment "lpac needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/lpac/lpac.hash b/package/lpac/lpac.hash
new file mode 100644
index 0000000000..bf93ef245f
--- /dev/null
+++ b/package/lpac/lpac.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  3d87080a625b10430eebb82f89e2d24e16a84a8435a9c40b3718fd88c82028ba  lpac-2.2.1.tar.gz
+sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  src/LICENSE
+sha256  b673293d21e887eaa9b971696b33f0f9141839900c65c83e560afa469d291ba6  euicc/LICENSE
+sha256  163766832b15cc9c90d593216360c67af579b8b36932b297fca2aeb61544de2f  cjson/LICENSE
diff --git a/package/lpac/lpac.mk b/package/lpac/lpac.mk
new file mode 100644
index 0000000000..de79ca6e5b
--- /dev/null
+++ b/package/lpac/lpac.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lpac
+#
+################################################################################
+
+LPAC_VERSION = 2.2.1
+LPAC_SITE = $(call github,estkme-group,lpac,v$(LPAC_VERSION))
+LPAC_LICENSE = LGPL-2.0+ (library), AGPL-3.0 (programs), MIT (cjson)
+LPAC_LICENSE_FILES = src/LICENSE euicc/LICENSE cjson/LICENSE
+LPAC_DEPENDENCIES = pcsc-lite
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LPAC_DEPENDENCIES += libcurl
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
+LPAC_DEPENDENCIES += libqmi
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+LPAC_DEPENDENCIES += libqrtr-glib
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
+LPAC_DEPENDENCIES += libmbim
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
