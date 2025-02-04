Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA25C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E97D60C08;
	Tue,  4 Feb 2025 16:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTNrKaRazbRg; Tue,  4 Feb 2025 16:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B51860D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B51860D50;
	Tue,  4 Feb 2025 16:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC867185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1E240635
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktGxCk-eSkRO for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2468140F41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2468140F41
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2468140F41
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38634c35129so4586730f8f.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686987; x=1739291787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yszYT5PdstMS9cqxcvyQyKMCvMwZL2n6D9fdTdL43SA=;
 b=Yr7Gzy3S2mkXBEjMuF3cwWndbYr2Z6aVQAvNIt8BodbD8FpA6yw0vAQO3RRZKBeOO7
 1UBFetfatES/+r9E2E9cP+/8QSKds0iUuI0+3AJISU/ZVXUsxCWnWQRUOz1Re4oeRg71
 1OeEwUXVObvSLXxTffm4CbgnPFEk/yI9auESk8UAFP/FDi7zw5ChwhCSgLWOMMv1qOs1
 bcXa0cKGMu8biAeOoZ6RVcTbj38IdU8HsgrzzjauQhTLVsi+Hml2fkNshm6xSPuKGq/O
 IDQVzXNfPuTKmwf51Ao2PKrsRqqq0W6lu2Qzp9UAWcvuaVLZvImXpviaJ9dP+xO9YfZ4
 SBTw==
X-Gm-Message-State: AOJu0Yw0HeqKMmLGxnuUGXSYU21zAO1Rug2cOtnYHqnlp4FHY9MEiYge
 HHWGYhgtzPJBLGsZVoWZ0mrgRPpSdOIhtajEvVXBVlTjFBhOupHxtxktjnYTH5BoCfgXCcOLj3s
 U/yk=
X-Gm-Gg: ASbGncsPXzEov1M+BmFyOYtoqI7AyjUhhwfrMzfe+Cf5olvHXLEIJXoS+F/kLQLpvNm
 NqVdvEX9fwwSADVhApzEKpTABh1uESt8ZbI47YOiAAFSbdMNlm1geNg83I+Z2MQ5C1BDIYzFid1
 ckIeeMkG1KtVr8jd51k1wx1w09uhRjMRfQ5D8HJaqEre6hGFKrIFdKVBu3mJOf3VtR62jYcGkwx
 +ELsWIvWAyJyLPRVfXu2owXFbCU00re5W7JhublNxiwDS8dvNKP7UAfLV/0rq80rkg8EUrJyri7
 PosH5wVBfCJGepe3hgO7eBX8doaXa4VkgxgasUn+xf2+nktiN9zUoDw=
X-Google-Smtp-Source: AGHT+IHcgUwe+seBwxl83y9K/6Iu//SxRV0gM0H3QL8BkuCpnksAXUfqofn7kATpE+tbA0Tm3AHPnw==
X-Received: by 2002:a5d:5983:0:b0:38d:b2b8:fadd with SMTP id
 ffacd0b85a97d-38db2b8fc5cmr91191f8f.32.1738686987156; 
 Tue, 04 Feb 2025 08:36:27 -0800 (PST)
Received: from P-NTS-Evian.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm16032693f8f.89.2025.02.04.08.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:36:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Feb 2025 17:36:21 +0100
Message-ID: <20250204163622.192932-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204163622.192932-1-romain.naour@smile.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686987; x=1739291787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yszYT5PdstMS9cqxcvyQyKMCvMwZL2n6D9fdTdL43SA=;
 b=qUo82Nl6sKPOVV3K/4ss5JFF7KjBugO/Y+GzDwS/ccREFU1o/2J2iGqENC6LjU/6l3
 PnEKNJ9lgXKCnjIOj1z6LE/+a/b5BD8aZJA/nlEeMJtJc/OhbL24jqgw5fTAFsV5y8gJ
 Wtuh0zFgrNKuqdepPrcm36/QEMmwfIp/EXbmM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=qUo82Nl6
Subject: [Buildroot] [PATCH v5 6/6] [WIP] am57: add dtso example
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only for testing external dtso build.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../ti/am574x-idk/dts/ti/omap/am57xx-evm.dtso | 127 ++++++++++++++++++
 configs/am574x_idk_defconfig                  |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 board/ti/am574x-idk/dts/ti/omap/am57xx-evm.dtso

diff --git a/board/ti/am574x-idk/dts/ti/omap/am57xx-evm.dtso b/board/ti/am574x-idk/dts/ti/omap/am57xx-evm.dtso
new file mode 100644
index 0000000000..12385a3106
--- /dev/null
+++ b/board/ti/am574x-idk/dts/ti/omap/am57xx-evm.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for AM57xx GP EVM boards
+ *
+ * Copyright (C) 2020-2022 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+&{/} {
+	compatible = "ti,am5728-evm", "ti,am572x-beagle-x15", "ti,am5728", "ti,dra742", "ti,dra74", "ti,dra7";
+	model = "TI AM5728 EVM";
+
+	aliases {
+		display0 = "/display";
+		display1 = "/connector"; // Fixme: &lcd0 and &hdmi0 could be
+					 // resolved here correcly based on
+					 // information in the base dtb symbol
+					 // table with a fix in dtc
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-user1 {
+			gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+			label = "USER1";
+			linux,code = <BTN_1>;
+		};
+
+		button-user2 {
+			gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
+			label = "USER2";
+			linux,code = <BTN_2>;
+		};
+
+		button-user3 {
+			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+			label = "USER3";
+			linux,code = <BTN_3>;
+		};
+
+		button-user4 {
+			gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+			label = "USER4";
+			linux,code = <BTN_4>;
+		};
+
+		button-user5 {
+			gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+			label = "USER5";
+			linux,code = <BTN_5>;
+		};
+	};
+
+	lcd0: display {
+		compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
+		backlight = <&lcd_bl>;
+		enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		label = "lcd";
+
+		port {
+			lcd_in: endpoint {
+				remote-endpoint = <&dpi_out>;
+			};
+		};
+	};
+
+	lcd_bl: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 243 245 247 249 251 252 253 255>;
+		default-brightness-level = <8>;
+		pwms = <&ehrpwm1 0 50000 0>;
+	};
+};
+
+&ehrpwm1 {
+	status = "okay";
+};
+
+&epwmss1 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@5c {
+		compatible = "pixcir,pixcir_tangoc";
+		attb-gpio = <&gpio2 4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x5c>;
+		reset-gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+	};
+};
+
+&uart8 {
+	status = "okay";
+};
+
+&dss {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dpi_out: endpoint {
+				data-lines = <24>;
+				remote-endpoint = <&lcd_in>;
+			};
+		};
+	};
+};
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
index 4b90d12745..b1aaec0f6a 100644
--- a/configs/am574x_idk_defconfig
+++ b/configs/am574x_idk_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/ti/am574x-idk/dts"
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
