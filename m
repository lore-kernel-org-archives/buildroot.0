Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34179E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A02D8608F3;
	Sun,  8 Dec 2024 14:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OJnn7mSFFNO; Sun,  8 Dec 2024 14:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A00F60B31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A00F60B31;
	Sun,  8 Dec 2024 14:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56ED1979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F7D881C21
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E57xBfYAVYa0 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B80F181C11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80F181C11
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B80F181C11
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:40 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa64412dbbfso35064466b.0
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668718; x=1734273518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LVl6OunxM1gAN1SORJZ8GM8uoaCPncXnaEzhQvipnU=;
 b=Dfm+1GNQIi0PyHQExi10odmW9zI2Kq9oLSa1vYibwmSUMnl9fGAaTEkMmzIo/alwtH
 hZSuH4SB5Ohf4tJEDNz/eSOGDNlvrYCQk/7Ti/NNmzv5E+UrwcLeVo9GY3o+o97wfaZi
 /6fayTpVRyIUci3pg28lSYVqKaqDfqmv20pskohpoD7EU+Ut5c6o5Bo2xhEaMEXCD0ev
 J+PaLJPRFzDTN/i0Y2xDaa3SyDIQXGRz3xxecyYJmDBzGQ1HSlUNok5ARzF1ntMknURU
 aaHDCFfc5RON4/9YJg8yKeZ2JgfKvO5PPBlnZKYYJhB2lxoFm5eqAJVXwZJ3RJEJKQea
 ePqw==
X-Gm-Message-State: AOJu0YxCGUOzyeKp8HCmY4c+Kq2s5eAq1/23dp5J/jgu9SMuChJrAEgq
 SBjGjlAKEDdLOUk+EIaj8ikPefJO0gCcONlS7z1TGUrtHf49Nf2iqlMNdw==
X-Gm-Gg: ASbGnctoNHbDNS7CWuqtRGDEmFWSJgLXVY3BXQQP99mcdYcRqgFmAtPI7G/G0utzfpX
 IaNw1w7xL7CQZ7IsObfNokDVYRJGwdUQ+2uVadBIRX0sh+zR8ab1Fs4QRQHQk+QdjIHI/hfrSOq
 A7uiGdZcw5c8JNjbX0Lb4OZUcC+R+IkWBI2mzfGaRiGJ5cdHuK0OYIkXd/MuD44qC5qHMtzo2zE
 Dlt+H7k+GmOUidCrGM54IcbiwEzfC2Szu2v4LDb7E0=
X-Google-Smtp-Source: AGHT+IFJHcyEiDRKNR8xEtmViUk/DJAbnZ1lhPPq8gNS61zCZDfNpm1zsjZDlLh+q/j38ZcTAeXaeQ==
X-Received: by 2002:a17:907:d212:b0:a9e:c267:34b1 with SMTP id
 a640c23a62f3a-aa63a242b46mr392940266b.12.1733668716446; 
 Sun, 08 Dec 2024 06:38:36 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:35 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:59 +0200
Message-ID: <20241208143802.1048266-9-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668718; x=1734273518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LVl6OunxM1gAN1SORJZ8GM8uoaCPncXnaEzhQvipnU=;
 b=IFgxs31YsFAzUJCSK7OmUaaQddx36qeoW09D56MfFv/za/ehmLwLzG9W6coARCWz6s
 PIjr7YDWQkAaHZhRXddxNP6RxwkyU6K1/Q/Z/v+JdOIdF2tXwQSlelWikIJfx76ZnoUb
 c+omp9Jk682e7F/48INlz0tN2w7lyijrbI5PbGw2YAkNdRuQq1nfv41ij02Y9MLKfnH2
 6nEzZrX6EWFf/v8dgStATdKsvQwIAdNCi/dNmNuMOyv4A+B94X8Qs434tpFo1zfocuaw
 xFYIQY97mefVjIcf8FZ6AzcSlYIyuu2ETVlhlkNXqlApmYsiZQ8HFYCm81rV2BrORqW0
 7jBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IFgxs31Y
Subject: [Buildroot] [PATCH v2 08/11] board/lx2160acex7: Add qoriq-mc-utils
 patches
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

The DPL and DPC files are necessary for configuring the DPAA2 network
objects. We include as-is all the Solidrun patches, but the defconfig
only uses lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-{dpl,dpc}.dtb.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- split out from previous [PATCH 6/7] board/lx2160acex7: new platform

 ...x2160-cex7-based-clearfog-cx-dpl-dpc.patch |  937 +++++
 ...160-cex6-based-evaluation-board-dpl-.patch | 1454 +++++++
 ...n-for-lx2162a-som-and-clearfog-board.patch | 3622 +++++++++++++++++
 ...som-clearfog-enable-dpni-connections.patch |  188 +
 ...rfog-cx-configure-qsfp-ports-type-ph.patch |   52 +
 5 files changed, 6253 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch

diff --git a/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
new file mode 100644
index 000000000000..5dd2cd638d88
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
@@ -0,0 +1,937 @@
+From 24334396edb16fbebe5f0b07a8264d53493dbff4 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 28 Jun 2024 19:16:57 +0200
+Subject: [PATCH] add solidrun lx2160 cex7 based clearfog-cx dpl/dpc
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../clearfog-cx-s1_8-s2_0-dpc.dts             | 108 ++++
+ .../clearfog-cx-s1_8-s2_0-dpl.dts             | 556 ++++++++++++++++++
+ .../LX2160A-CEX7/null-s1_0-s2_0-dpc.dts       |  72 +++
+ .../LX2160A-CEX7/null-s1_0-s2_0-dpl.dts       | 157 +++++
+ 4 files changed, 893 insertions(+)
+ create mode 100644 config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
+ create mode 100644 config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dts
+ create mode 100644 config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpc.dts
+ create mode 100644 config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
+
+diff --git a/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
+new file mode 100644
+index 0000000..dcc376e
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
+@@ -0,0 +1,108 @@
++/*
++ * Copyright 2018 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/*
++ * This DPC configures SolidRun Clearfog-CX with 8x10Gbps SerDes & 1Gbps RGMII ports.
++ */
++
++/dts-v1/;
++
++/ {
++	resources {
++		icid_pools {
++
++			icid_pool@1 {
++				num = <0x64>;
++				base_icid = <0x0>;
++			};
++		};
++	};
++
++	mc_general {
++		log {
++			mode = "LOG_MODE_ON";
++			level = "LOG_LEVEL_WARNING";
++		};
++
++		console {
++			mode = "CONSOLE_MODE_OFF";
++			uart_id = <0x4>;
++			level = "LOG_LEVEL_WARNING";
++		};
++	};
++
++	controllers {
++		qbman {
++			/* Transform this number of 8-WQ channels into four times
++			 * as many 2-WQ channels. This allows the creation of a
++			 * larger number of DPCONs.
++			 */
++			wq_ch_conversion = <32>;
++		};
++	};
++
++	board_info {
++		ports {
++			mac@3 {
++				link_type = "MAC_LINK_TYPE_FIXED";
++			};
++
++			mac@4 {
++				link_type = "MAC_LINK_TYPE_FIXED";
++			};
++
++			mac@5 {
++				link_type = "MAC_LINK_TYPE_FIXED";
++			};
++
++			mac@6 {
++				link_type = "MAC_LINK_TYPE_FIXED";
++			};
++
++			mac@7 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@8 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@9 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@10 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@17 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++		};
++	};
++};
+diff --git a/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dts b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dts
+new file mode 100644
+index 0000000..e91f837
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dts
+@@ -0,0 +1,556 @@
++/*
++ * Copyright 2018 NXP
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++/ {
++	dpl-version = <10>;
++	/*****************************************************************
++	 * Containers
++	 *****************************************************************/
++	containers {
++
++		dprc@1 {
++			compatible = "fsl,dprc";
++			parent = "none";
++			options = "DPRC_CFG_OPT_SPAWN_ALLOWED", "DPRC_CFG_OPT_ALLOC_ALLOWED", "DPRC_CFG_OPT_OBJ_CREATE_ALLOWED", "DPRC_CFG_OPT_TOPOLOGY_CHANGES_ALLOWED", "DPRC_CFG_OPT_IRQ_CFG_ALLOWED";
++
++			objects {
++
++				/* -------------- DPBPs --------------*/
++				obj_set@dpbp {
++					type = "dpbp";
++					ids = <0 >;
++				};
++
++				/* -------------- DPCONs --------------*/
++				obj_set@dpcon {
++					type = "dpcon";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 >;
++				};
++
++				/* -------------- DPIOs --------------*/
++				obj_set@dpio {
++					type = "dpio";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 >;
++				};
++
++				/* -------------- DPMACs --------------*/
++				obj_set@dpmac {
++					type = "dpmac";
++					ids = <3 4 5 6 7 8 9 10 17 >;
++				};
++
++				/* -------------- DPMCPs --------------*/
++				obj_set@dpmcp {
++					type = "dpmcp";
++					ids = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 >;
++				};
++
++				/* -------------- DPNIs --------------*/
++				obj_set@dpni {
++					type = "dpni";
++					ids = <0 >;
++				};
++
++				/* -------------- DPRTCs --------------*/
++				obj_set@dprtc {
++					type = "dprtc";
++					ids = <0 >;
++				};
++
++				/* -------------- DPSECIs --------------*/
++				obj_set@dpseci {
++					type = "dpseci";
++					ids = <0 >;
++				};
++			};
++		};
++	};
++
++	/*****************************************************************
++	 * Objects
++	 *****************************************************************/
++	objects {
++
++		dpbp@0 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpcon@0 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@1 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@2 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@3 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@4 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@5 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@6 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@7 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@8 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@9 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@10 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@11 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@12 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@13 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@14 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@15 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpio@0 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@1 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@2 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@3 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@4 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@5 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@6 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@7 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@8 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@9 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@10 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@11 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@12 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@13 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@14 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@15 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpmac@3 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@4 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@5 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@6 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@7 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@8 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@9 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@10 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@17 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmcp@1 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@2 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@3 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@4 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@5 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@6 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@7 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@8 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@9 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@10 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@11 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@12 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@13 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@14 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@15 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@16 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@17 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@18 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@19 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@20 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@21 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@22 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@23 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@24 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@25 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@26 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@27 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@28 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@29 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@30 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@31 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@32 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@33 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@34 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@35 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@36 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@37 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@38 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@39 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@40 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@41 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@42 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@43 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@44 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@45 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@46 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@47 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@48 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@49 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@50 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@51 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@52 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpni@0 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++		};
++
++		dprtc@0 {
++			compatible = "fsl,dprtc";
++		};
++
++		dpseci@0 {
++			compatible = "fsl,dpseci";
++			priorities = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
++		};
++	};
++
++	/*****************************************************************
++	 * Connections
++	 *****************************************************************/
++	connections {
++
++		connection@1{
++			endpoint1 = "dpni@0";
++			endpoint2 = "dpmac@17";
++		};
++	};
++};
+diff --git a/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpc.dts b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpc.dts
+new file mode 100644
+index 0000000..ac707bc
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpc.dts
+@@ -0,0 +1,72 @@
++/*
++ * Copyright 2018 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/*
++* This DPC is a bare example without networking.
++*/
++
++/dts-v1/;
++
++/ {
++	resources {
++		icid_pools {
++			icid_pool@1 {
++				num = <0x64>;
++				base_icid = <0x0>;
++			};
++		};
++	};
++
++	mc_general {
++		log {
++			mode = "LOG_MODE_ON";
++			level = "LOG_LEVEL_WARNING";
++		};
++
++		console {
++			mode = "CONSOLE_MODE_OFF";
++			uart_id = <0x4>;
++			level = "LOG_LEVEL_WARNING";
++		};
++	};
++
++	controllers {
++		qbman {
++			/* Transform this number of 8-WQ channels into four times
++			 * as many 2-WQ channels. This allows the creation of a
++			 * larger number of DPCONs.
++			 */
++			wq_ch_conversion = <32>;
++		};
++	};
++
++	board_info {
++		ports {
++		};
++	};
++};
+diff --git a/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
+new file mode 100644
+index 0000000..9847cc3
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
+@@ -0,0 +1,157 @@
++/*
++ * Copyright 2020 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++/ {
++	dpl-version = <10>;
++
++	containers {
++		dprc@1 {
++			compatible = "fsl,dprc";
++			parent = "none";
++			options = "DPRC_CFG_OPT_SPAWN_ALLOWED", "DPRC_CFG_OPT_ALLOC_ALLOWED", "DPRC_CFG_OPT_OBJ_CREATE_ALLOWED", "DPRC_CFG_OPT_TOPOLOGY_CHANGES_ALLOWED", "DPRC_CFG_OPT_IRQ_CFG_ALLOWED";
++
++			objects {
++				obj_set@dpmcp {
++					type = "dpmcp";
++					ids = <0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf 0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 0x21 0x22 0x23>;
++				};
++			};
++		};
++	};
++
++	objects {
++		dpmcp@1 {
++		};
++
++		dpmcp@2 {
++		};
++
++		dpmcp@3 {
++		};
++
++		dpmcp@4 {
++		};
++
++		dpmcp@5 {
++		};
++
++		dpmcp@6 {
++		};
++
++		dpmcp@7 {
++		};
++
++		dpmcp@8 {
++		};
++
++		dpmcp@9 {
++		};
++
++		dpmcp@10 {
++		};
++
++		dpmcp@11 {
++		};
++
++		dpmcp@12 {
++		};
++
++		dpmcp@13 {
++		};
++
++		dpmcp@14 {
++		};
++
++		dpmcp@15 {
++		};
++
++		dpmcp@16 {
++		};
++
++		dpmcp@17 {
++		};
++
++		dpmcp@18 {
++		};
++
++		dpmcp@19 {
++		};
++
++		dpmcp@20 {
++		};
++
++		dpmcp@21 {
++		};
++
++		dpmcp@22 {
++		};
++
++		dpmcp@23 {
++		};
++
++		dpmcp@24 {
++		};
++
++		dpmcp@25 {
++		};
++
++		dpmcp@26 {
++		};
++
++		dpmcp@27 {
++		};
++
++		dpmcp@28 {
++		};
++
++		dpmcp@29 {
++		};
++
++		dpmcp@30 {
++		};
++
++		dpmcp@31 {
++		};
++
++		dpmcp@32 {
++		};
++
++		dpmcp@33 {
++		};
++
++		dpmcp@34 {
++		};
++
++		dpmcp@35 {
++		};
++	};
++
++	connections {
++	};
++};
+-- 
+2.35.3
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch
new file mode 100644
index 000000000000..195ee20851f3
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch
@@ -0,0 +1,1454 @@
+From 8933c2fac644bd9e4553bee466fab6d11a0b661a Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 13 Oct 2024 11:59:53 +0200
+Subject: [PATCH] add solidrun lx2160 cex6 based evaluation board dpl/dpc
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../LX2160A-CEX6/evb-s1_3-s2_0-dpc.dts        |   99 ++
+ .../LX2160A-CEX6/evb-s1_3-s2_0-dpl.dts        | 1327 +++++++++++++++++
+ 2 files changed, 1426 insertions(+)
+ create mode 100644 config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpc.dts
+ create mode 100644 config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpl.dts
+
+diff --git a/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpc.dts b/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpc.dts
+new file mode 100644
+index 0000000..46cdca1
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpc.dts
+@@ -0,0 +1,99 @@
++/*
++ * Copyright 2018 NXP
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++
++/ {
++	resources {
++		icid_pools {
++			icid_pool@1 {
++				num = <0x64>;
++				base_icid = <0x0>;
++			};
++		};
++	};
++
++	mc_general {
++		log {
++			mode = "LOG_MODE_ON";
++			level = "LOG_LEVEL_WARNING";
++		};
++
++		console {
++			mode = "CONSOLE_MODE_OFF";
++			uart_id = <0x4>;
++			level = "LOG_LEVEL_WARNING";
++		};
++	};
++
++	controllers {
++		qbman {
++			/* Transform this number of 8-WQ channels into four times
++			 * as many 2-WQ channels. This allows the creation of a
++			 * larger number of DPCONs.
++			 */
++			wq_ch_conversion = <64>;
++		};
++	};
++
++	board_info {
++		recycle_ports {
++			recycle@1 {
++				max_rate = "1G";
++			};
++
++			recycle@2 {
++				max_rate = "1G";
++			};
++		};
++
++		ports {
++			/* Serdes 1 */
++			mac@3 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@4 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@5 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@6 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			/* WRIOP MAC */
++			mac@17 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++		};
++	};
++};
+diff --git a/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpl.dts b/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpl.dts
+new file mode 100644
+index 0000000..1840af4
+--- /dev/null
++++ b/config/lx2160a/LX2160A-CEX6/evb-s1_3-s2_0-dpl.dts
+@@ -0,0 +1,1327 @@
++/*
++ * Copyright 2018 NXP
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++/ {
++	dpl-version = <10>;
++	/*****************************************************************
++	 * Containers
++	 *****************************************************************/
++	containers {
++
++		dprc@1 {
++			compatible = "fsl,dprc";
++			parent = "none";
++			options = "DPRC_CFG_OPT_SPAWN_ALLOWED", "DPRC_CFG_OPT_ALLOC_ALLOWED", "DPRC_CFG_OPT_OBJ_CREATE_ALLOWED", "DPRC_CFG_OPT_TOPOLOGY_CHANGES_ALLOWED", "DPRC_CFG_OPT_IRQ_CFG_ALLOWED";
++
++			objects {
++
++				/* -------------- DPBPs --------------*/
++				obj_set@dpbp {
++					type = "dpbp";
++					ids = <0 1 2 3 4 5 6 7 8 >;
++				};
++
++				/* -------------- DPCONs --------------*/
++				obj_set@dpcon {
++					type = "dpcon";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 >;
++				};
++
++				/* -------------- DPIOs --------------*/
++				obj_set@dpio {
++					type = "dpio";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 >;
++				};
++
++				/* -------------- DPMACs --------------*/
++				obj_set@dpmac {
++					type = "dpmac";
++					ids = <3 4 5 6 17 >;
++				};
++
++				/* -------------- DPMCPs --------------*/
++				obj_set@dpmcp {
++					type = "dpmcp";
++					ids = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 >;
++				};
++
++				/* -------------- DPNIs --------------*/
++				obj_set@dpni {
++					type = "dpni";
++					ids = <0 1 2 3 4 >;
++				};
++
++				/* -------------- DPRTCs --------------*/
++				obj_set@dprtc {
++					type = "dprtc";
++					ids = <0 >;
++				};
++
++				/* -------------- DPSECIs --------------*/
++				obj_set@dpseci {
++					type = "dpseci";
++					ids = <0 >;
++				};
++			};
++		};
++	};
++
++	/*****************************************************************
++	 * Objects
++	 *****************************************************************/
++	objects {
++
++		dpbp@0 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@1 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@2 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@3 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@4 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@5 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@6 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@7 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@8 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpcon@0 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@1 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@2 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@3 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@4 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@5 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@6 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@7 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@8 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@9 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@10 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@11 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@12 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@13 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@14 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@15 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@16 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@17 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@18 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@19 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@20 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@21 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@22 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@23 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@24 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@25 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@26 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@27 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@28 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@29 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@30 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@31 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@32 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@33 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@34 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@35 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@36 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@37 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@38 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@39 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@40 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@41 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@42 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@43 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@44 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@45 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@46 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@47 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@48 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@49 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@50 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@51 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@52 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@53 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@54 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@55 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@56 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@57 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@58 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@59 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@60 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@61 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@62 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@63 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@64 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@65 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@66 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@67 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@68 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@69 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@70 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@71 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@72 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@73 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@74 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@75 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@76 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@77 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@78 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@79 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@80 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@81 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@82 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@83 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@84 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@85 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@86 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@87 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@88 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@89 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@90 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@91 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@92 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@93 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@94 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@95 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@96 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@97 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@98 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@99 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@100 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@101 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@102 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@103 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@104 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@105 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@106 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@107 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@108 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@109 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@110 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@111 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@112 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@113 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@114 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@115 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@116 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@117 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@118 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@119 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@120 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@121 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@122 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@123 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@124 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@125 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@126 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@127 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@128 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@129 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@130 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@131 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@132 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@133 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@134 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@135 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@136 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@137 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@138 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@139 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@140 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@141 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@142 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@143 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpio@0 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@1 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@2 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@3 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@4 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@5 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@6 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@7 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@8 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@9 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@10 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@11 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@12 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@13 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@14 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@15 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpmac@3 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@4 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@5 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@6 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@17 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmcp@1 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@2 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@3 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@4 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@5 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@6 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@7 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@8 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@9 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@10 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@11 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@12 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@13 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@14 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@15 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@16 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@17 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@18 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@19 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@20 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@21 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@22 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@23 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@24 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@25 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@26 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@27 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@28 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@29 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@30 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@31 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@32 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@33 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@34 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@35 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@36 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@37 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@38 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@39 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@40 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@41 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@42 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@43 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@44 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@45 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@46 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@47 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@48 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@49 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@50 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@51 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@52 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@53 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@54 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@55 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@56 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@57 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@58 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@59 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@60 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpni@0 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@1 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@2 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@3 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@4 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dprtc@0 {
++			compatible = "fsl,dprtc";
++		};
++
++		dpseci@0 {
++			compatible = "fsl,dpseci";
++			priorities = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
++		};
++	};
++
++	/*****************************************************************
++	 * Connections
++	 *****************************************************************/
++	connections {
++
++		connection@1{
++			endpoint1 = "dpni@4";
++			endpoint2 = "dpmac@17";
++		};
++
++		connection@2{
++			endpoint1 = "dpni@3";
++			endpoint2 = "dpmac@3";
++		};
++
++		connection@3{
++			endpoint1 = "dpni@2";
++			endpoint2 = "dpmac@4";
++		};
++
++		connection@4{
++			endpoint1 = "dpni@1";
++			endpoint2 = "dpmac@5";
++		};
++
++		connection@5{
++			endpoint1 = "dpni@0";
++			endpoint2 = "dpmac@6";
++		};
++	};
++};
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch
new file mode 100644
index 000000000000..550d04be8b5b
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch
@@ -0,0 +1,3622 @@
+From 6e7355c062f643227f7d80029bad46f8542048d2 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 28 Oct 2024 17:01:33 +0100
+Subject: [PATCH] add configuration for lx2162a som and clearfog board
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../LX2160A-CEX7/null-s1_0-s2_0-dpl.dts       |   19 +
+ .../LX2162A-SOM/clearfog-s1_3-s2_7-dpc.dts    |  119 ++
+ .../LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts    | 1535 ++++++++++++++
+ .../LX2162A-SOM/clearfog-s1_3-s2_9-dpc.dts    |  127 ++
+ .../LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts    | 1759 +++++++++++++++++
+ 5 files changed, 3559 insertions(+)
+ create mode 100644 config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpc.dts
+ create mode 100644 config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
+ create mode 100644 config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpc.dts
+ create mode 100644 config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
+
+diff --git a/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
+index 9847cc3..8411680 100644
+--- a/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
++++ b/config/lx2160a/LX2160A-CEX7/null-s1_0-s2_0-dpl.dts
+@@ -41,6 +41,16 @@
+ 					type = "dpmcp";
+ 					ids = <0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf 0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 0x21 0x22 0x23>;
+ 				};
++
++				obj_set@dprtc {
++					type = "dprtc";
++					ids = <0 >;
++				};
++
++				obj_set@dpseci {
++					type = "dpseci";
++					ids = <0 >;
++				};
+ 			};
+ 		};
+ 	};
+@@ -150,6 +160,15 @@
+ 
+ 		dpmcp@35 {
+ 		};
++
++		dprtc@0 {
++			compatible = "fsl,dprtc";
++		};
++
++		dpseci@0 {
++			compatible = "fsl,dpseci";
++			priorities = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
++		};
+ 	};
+ 
+ 	connections {
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpc.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpc.dts
+new file mode 100644
+index 0000000..0f0ec4b
+--- /dev/null
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpc.dts
+@@ -0,0 +1,119 @@
++/*
++ * Copyright 2020 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++
++/ {
++	resources {
++		icid_pools {
++			icid_pool@1 {
++				num = <0x64>;
++				base_icid = <0x0>;
++			};
++		};
++	};
++
++	mc_general {
++		log {
++			mode = "LOG_MODE_ON";
++			level = "LOG_LEVEL_WARNING";
++		};
++
++		console {
++			mode = "CONSOLE_MODE_OFF";
++			uart_id = <0x4>;
++			level = "LOG_LEVEL_WARNING";
++		};
++	};
++
++	controllers {
++		qbman {
++			/* Transform this number of 8-WQ channels into four times
++			 * as many 2-WQ channels. This allows the creation of a
++			 * larger number of DPCONs.
++			 */
++			wq_ch_conversion = <64>;
++		};
++	};
++
++	board_info {
++		recycle_ports {
++			recycle@1 {
++				max_rate = "1G";
++			};
++
++			recycle@2 {
++				max_rate = "1G";
++			};
++		};
++
++		ports {
++			/* Serdes 1 */
++			mac@3 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@4 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@5 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@6 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			/* Serdes 2 */
++			mac@12 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@13 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@14 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@16 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@17 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@18 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++		};
++	};
++};
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
+new file mode 100644
+index 0000000..35afac5
+--- /dev/null
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
+@@ -0,0 +1,1535 @@
++/*
++ * Copyright 2020 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++/ {
++	dpl-version = <10>;
++	/*****************************************************************
++	 * Containers
++	 *****************************************************************/
++	containers {
++
++		dprc@1 {
++			compatible = "fsl,dprc";
++			parent = "none";
++			options = "DPRC_CFG_OPT_SPAWN_ALLOWED", "DPRC_CFG_OPT_ALLOC_ALLOWED", "DPRC_CFG_OPT_OBJ_CREATE_ALLOWED", "DPRC_CFG_OPT_TOPOLOGY_CHANGES_ALLOWED", "DPRC_CFG_OPT_IRQ_CFG_ALLOWED";
++
++			objects {
++
++				/* -------------- DPBPs --------------*/
++				obj_set@dpbp {
++					type = "dpbp";
++					ids = <0 1 2 3 4 5 6 7 8 9 >;
++				};
++
++				/* -------------- DPCONs --------------*/
++				obj_set@dpcon {
++					type = "dpcon";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 >;
++				};
++
++				/* -------------- DPIOs --------------*/
++				obj_set@dpio {
++					type = "dpio";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 >;
++				};
++
++				/* -------------- DPMACs --------------*/
++				obj_set@dpmac {
++					type = "dpmac";
++					ids = <3 4 5 6 12 13 14 16 17 18 >;
++				};
++
++				/* -------------- DPMCPs --------------*/
++				obj_set@dpmcp {
++					type = "dpmcp";
++					ids = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 >;
++				};
++
++				/* -------------- DPNIs --------------*/
++				obj_set@dpni {
++					type = "dpni";
++					ids = <0 1 2 3 4 5 6 7 8 9 >;
++				};
++
++				/* -------------- DPRTCs --------------*/
++				obj_set@dprtc {
++					type = "dprtc";
++					ids = <0 >;
++				};
++
++				/* -------------- DPSECIs --------------*/
++				obj_set@dpseci {
++					type = "dpseci";
++					ids = <0 >;
++				};
++			};
++		};
++	};
++
++	/*****************************************************************
++	 * Objects
++	 *****************************************************************/
++	objects {
++
++		dpbp@0 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@1 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@2 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@3 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@4 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@5 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@6 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@7 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@8 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@9 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpcon@0 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@1 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@2 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@3 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@4 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@5 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@6 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@7 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@8 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@9 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@10 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@11 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@12 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@13 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@14 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@15 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@16 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@17 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@18 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@19 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@20 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@21 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@22 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@23 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@24 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@25 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@26 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@27 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@28 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@29 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@30 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@31 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@32 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@33 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@34 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@35 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@36 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@37 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@38 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@39 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@40 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@41 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@42 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@43 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@44 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@45 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@46 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@47 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@48 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@49 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@50 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@51 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@52 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@53 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@54 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@55 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@56 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@57 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@58 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@59 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@60 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@61 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@62 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@63 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@64 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@65 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@66 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@67 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@68 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@69 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@70 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@71 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@72 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@73 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@74 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@75 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@76 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@77 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@78 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@79 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@80 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@81 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@82 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@83 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@84 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@85 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@86 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@87 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@88 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@89 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@90 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@91 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@92 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@93 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@94 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@95 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@96 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@97 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@98 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@99 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@100 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@101 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@102 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@103 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@104 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@105 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@106 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@107 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@108 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@109 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@110 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@111 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@112 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@113 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@114 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@115 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@116 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@117 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@118 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@119 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@120 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@121 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@122 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@123 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@124 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@125 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@126 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@127 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@128 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@129 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@130 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@131 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@132 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@133 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@134 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@135 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@136 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@137 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@138 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@139 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@140 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@141 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@142 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@143 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@144 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@145 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@146 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@147 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@148 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@149 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@150 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@151 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@152 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@153 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@154 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@155 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@156 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@157 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@158 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@159 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpio@0 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@1 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@2 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@3 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@4 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@5 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@6 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@7 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@8 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@9 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@10 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@11 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@12 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@13 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@14 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@15 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpmac@3 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@4 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@5 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@6 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@12 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@13 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@14 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@16 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@17 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@18 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmcp@1 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@2 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@3 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@4 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@5 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@6 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@7 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@8 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@9 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@10 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@11 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@12 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@13 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@14 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@15 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@16 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@17 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@18 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@19 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@20 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@21 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@22 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@23 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@24 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@25 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@26 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@27 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@28 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@29 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@30 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@31 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@32 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@33 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@34 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@35 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@36 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@37 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@38 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@39 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@40 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@41 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@42 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@43 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@44 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@45 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@46 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@47 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@48 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@49 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@50 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@51 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@52 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@53 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@54 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@55 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@56 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@57 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@58 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@59 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@60 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@61 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpni@0 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@1 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@2 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@3 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@4 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@5 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@6 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@7 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@8 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@9 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dprtc@0 {
++			compatible = "fsl,dprtc";
++		};
++
++		dpseci@0 {
++			compatible = "fsl,dpseci";
++			priorities = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
++		};
++	};
++
++	/*****************************************************************
++	 * Connections
++	 *****************************************************************/
++	connections {
++
++		/*connection@1{
++			endpoint1 = "dpni@0";
++			endpoint2 = "dpmac@3";
++		};
++
++		connection@2{
++			endpoint1 = "dpni@1";
++			endpoint2 = "dpmac@4";
++		};
++
++		connection@3{
++			endpoint1 = "dpni@2";
++			endpoint2 = "dpmac@5";
++		};
++
++		connection@4{
++			endpoint1 = "dpni@3";
++			endpoint2 = "dpmac@6";
++		};
++
++		connection@5{
++			endpoint1 = "dpni@4";
++			endpoint2 = "dpmac@12";
++		};
++
++		connection@6{
++			endpoint1 = "dpni@5";
++			endpoint2 = "dpmac@13";
++		};
++
++		connection@7{
++			endpoint1 = "dpni@6";
++			endpoint2 = "dpmac@14";
++		};
++
++		connection@8{
++			endpoint1 = "dpni@7";
++			endpoint2 = "dpmac@16";
++		};
++
++		connection@9{
++			endpoint1 = "dpni@8";
++			endpoint2 = "dpmac@17";
++		};
++
++		connection@10{
++			endpoint1 = "dpni@9";
++			endpoint2 = "dpmac@18";
++		};*/
++	};
++};
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpc.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpc.dts
+new file mode 100644
+index 0000000..5aa4640
+--- /dev/null
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpc.dts
+@@ -0,0 +1,127 @@
++/*
++ * Copyright 2020 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++
++/ {
++	resources {
++		icid_pools {
++			icid_pool@1 {
++				num = <0x64>;
++				base_icid = <0x0>;
++			};
++		};
++	};
++
++	mc_general {
++		log {
++			mode = "LOG_MODE_ON";
++			level = "LOG_LEVEL_WARNING";
++		};
++
++		console {
++			mode = "CONSOLE_MODE_OFF";
++			uart_id = <0x4>;
++			level = "LOG_LEVEL_WARNING";
++		};
++	};
++
++	controllers {
++		qbman {
++			/* Transform this number of 8-WQ channels into four times
++			 * as many 2-WQ channels. This allows the creation of a
++			 * larger number of DPCONs.
++			 */
++			wq_ch_conversion = <64>;
++		};
++	};
++
++	board_info {
++		recycle_ports {
++			recycle@1 {
++				max_rate = "1G";
++			};
++
++			recycle@2 {
++				max_rate = "1G";
++			};
++		};
++
++		ports {
++			/* Serdes 1 */
++			mac@3 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@4 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@5 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@6 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			/* Serdes 2 */
++			mac@11 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@12 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@13 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@14 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@15 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@16 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@17 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++
++			mac@18 {
++				link_type = "MAC_LINK_TYPE_PHY";
++			};
++		};
++	};
++};
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
+new file mode 100644
+index 0000000..1745da4
+--- /dev/null
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
+@@ -0,0 +1,1759 @@
++/*
++ * Copyright 2020 NXP
++ * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *   * Redistributions of source code must retain the above copyright
++ *     notice, this list of conditions and the following disclaimer.
++ *   * Redistributions in binary form must reproduce the above copyright
++ *     notice, this list of conditions and the following disclaimer in the
++ *     documentation and/or other materials provided with the distribution.
++ *   * Neither the name of the above-listed copyright holders nor the
++ *     names of any contributors may be used to endorse or promote products
++ *     derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/dts-v1/;
++/ {
++	dpl-version = <10>;
++	/*****************************************************************
++	 * Containers
++	 *****************************************************************/
++	containers {
++
++		dprc@1 {
++			compatible = "fsl,dprc";
++			parent = "none";
++			options = "DPRC_CFG_OPT_SPAWN_ALLOWED", "DPRC_CFG_OPT_ALLOC_ALLOWED", "DPRC_CFG_OPT_OBJ_CREATE_ALLOWED", "DPRC_CFG_OPT_TOPOLOGY_CHANGES_ALLOWED", "DPRC_CFG_OPT_IRQ_CFG_ALLOWED";
++
++			objects {
++
++				/* -------------- DPBPs --------------*/
++				obj_set@dpbp {
++					type = "dpbp";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 >;
++				};
++
++				/* -------------- DPCONs --------------*/
++				obj_set@dpcon {
++					type = "dpcon";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 >;
++				};
++
++				/* -------------- DPIOs --------------*/
++				obj_set@dpio {
++					type = "dpio";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 >;
++				};
++
++				/* -------------- DPMACs --------------*/
++				obj_set@dpmac {
++					type = "dpmac";
++					ids = <3 4 5 6 11 12 13 14 15 16 17 18 >;
++				};
++
++				/* -------------- DPMCPs --------------*/
++				obj_set@dpmcp {
++					type = "dpmcp";
++					ids = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 >;
++				};
++
++				/* -------------- DPNIs --------------*/
++				obj_set@dpni {
++					type = "dpni";
++					ids = <0 1 2 3 4 5 6 7 8 9 10 11 >;
++				};
++
++				/* -------------- DPRTCs --------------*/
++				obj_set@dprtc {
++					type = "dprtc";
++					ids = <0 >;
++				};
++
++				/* -------------- DPSECIs --------------*/
++				obj_set@dpseci {
++					type = "dpseci";
++					ids = <0 >;
++				};
++			};
++		};
++	};
++
++	/*****************************************************************
++	 * Objects
++	 *****************************************************************/
++	objects {
++
++		dpbp@0 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@1 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@2 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@3 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@4 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@5 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@6 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@7 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@8 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@9 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@10 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpbp@11 {
++			compatible = "fsl,dpbp";
++		};
++
++		dpcon@0 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@1 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@2 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@3 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@4 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@5 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@6 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@7 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@8 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@9 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@10 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@11 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@12 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@13 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@14 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@15 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@16 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@17 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@18 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@19 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@20 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@21 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@22 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@23 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@24 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@25 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@26 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@27 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@28 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@29 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@30 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@31 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@32 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@33 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@34 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@35 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@36 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@37 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@38 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@39 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@40 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@41 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@42 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@43 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@44 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@45 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@46 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@47 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@48 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@49 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@50 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@51 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@52 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@53 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@54 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@55 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@56 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@57 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@58 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@59 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@60 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@61 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@62 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@63 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@64 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@65 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@66 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@67 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@68 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@69 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@70 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@71 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@72 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@73 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@74 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@75 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@76 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@77 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@78 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@79 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@80 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@81 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@82 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@83 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@84 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@85 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@86 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@87 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@88 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@89 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@90 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@91 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@92 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@93 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@94 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@95 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@96 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@97 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@98 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@99 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@100 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@101 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@102 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@103 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@104 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@105 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@106 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@107 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@108 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@109 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@110 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@111 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@112 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@113 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@114 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@115 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@116 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@117 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@118 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@119 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@120 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@121 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@122 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@123 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@124 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@125 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@126 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@127 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@128 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@129 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@130 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@131 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@132 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@133 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@134 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@135 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@136 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@137 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@138 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@139 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@140 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@141 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@142 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@143 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@144 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@145 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@146 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@147 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@148 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@149 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@150 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@151 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@152 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@153 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@154 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@155 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@156 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@157 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@158 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@159 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@160 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@161 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@162 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@163 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@164 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@165 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@166 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@167 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@168 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@169 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@170 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@171 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@172 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@173 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@174 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@175 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@176 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@177 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@178 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@179 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@180 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@181 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@182 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@183 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@184 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@185 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@186 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@187 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@188 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@189 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@190 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpcon@191 {
++			compatible = "fsl,dpcon";
++			num_priorities = <0x2>;
++		};
++
++		dpio@0 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@1 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@2 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@3 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@4 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@5 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@6 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@7 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@8 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@9 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@10 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@11 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@12 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@13 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@14 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpio@15 {
++			compatible = "fsl,dpio";
++			channel_mode = "DPIO_LOCAL_CHANNEL";
++			num_priorities = <0x8>;
++		};
++
++		dpmac@3 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@4 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@5 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@6 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@11 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@12 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@13 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@14 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@15 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@16 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@17 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmac@18 {
++			compatible = "fsl,dpmac";
++		};
++
++		dpmcp@1 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@2 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@3 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@4 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@5 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@6 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@7 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@8 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@9 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@10 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@11 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@12 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@13 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@14 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@15 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@16 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@17 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@18 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@19 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@20 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@21 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@22 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@23 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@24 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@25 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@26 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@27 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@28 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@29 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@30 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@31 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@32 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@33 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@34 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@35 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@36 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@37 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@38 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@39 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@40 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@41 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@42 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@43 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@44 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@45 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@46 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@47 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@48 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@49 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@50 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@51 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@52 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@53 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@54 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@55 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@56 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@57 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@58 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@59 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@60 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@61 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@62 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpmcp@63 {
++			compatible = "fsl,dpmcp";
++		};
++
++		dpni@0 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@1 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@2 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@3 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@4 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@5 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@6 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@7 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@8 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@9 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@10 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dpni@11 {
++			compatible = "fsl,dpni";
++			type = "DPNI_TYPE_NIC";
++			num_queues = <16>;
++			num_tcs = <1>;
++			num_cgs = <1>;
++			mac_filter_entries = <16>;
++			vlan_filter_entries = <0>;
++			fs_entries = <64>;
++			qos_entries = <0>;
++			dist_key_size = <56>;
++			num_channels= <1>;
++			num_opr = <0>;
++		};
++
++		dprtc@0 {
++			compatible = "fsl,dprtc";
++		};
++
++		dpseci@0 {
++			compatible = "fsl,dpseci";
++			priorities = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
++		};
++	};
++
++	/*****************************************************************
++	 * Connections
++	 *****************************************************************/
++	connections {
++
++		/*connection@1{
++			endpoint1 = "dpni@0";
++			endpoint2 = "dpmac@3";
++		};
++
++		connection@2{
++			endpoint1 = "dpni@1";
++			endpoint2 = "dpmac@4";
++		};
++
++		connection@3{
++			endpoint1 = "dpni@2";
++			endpoint2 = "dpmac@5";
++		};
++
++		connection@4{
++			endpoint1 = "dpni@3";
++			endpoint2 = "dpmac@6";
++		};
++
++		connection@5{
++			endpoint1 = "dpni@4";
++			endpoint2 = "dpmac@11";
++		};
++
++		connection@6{
++			endpoint1 = "dpni@5";
++			endpoint2 = "dpmac@12";
++		};
++
++		connection@7{
++			endpoint1 = "dpni@6";
++			endpoint2 = "dpmac@13";
++		};
++
++		connection@8{
++			endpoint1 = "dpni@7";
++			endpoint2 = "dpmac@14";
++		};
++
++		connection@9{
++			endpoint1 = "dpni@8";
++			endpoint2 = "dpmac@15";
++		};
++
++		connection@10{
++			endpoint1 = "dpni@9";
++			endpoint2 = "dpmac@16";
++		};
++
++		connection@11{
++			endpoint1 = "dpni@10";
++			endpoint2 = "dpmac@17";
++		};
++
++		connection@12{
++			endpoint1 = "dpni@11";
++			endpoint2 = "dpmac@18";
++		};*/
++	};
++};
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch
new file mode 100644
index 000000000000..3f8eb937081a
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch
@@ -0,0 +1,188 @@
+From 44dd1bb169ab73e5b4d2d27a441bc52b9295e930 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Wed, 30 Oct 2024 18:56:20 +0100
+Subject: [PATCH] lx2162: som: clearfog: enable dpni connections
+
+Enable the dpni connections so that interfaces are created automatically
+during boot. Ordering ensures linux netdev numbers are sorted by dpmac
+numbers, i.e. eth0 = dpmac3, eth1=dpmac4, ...
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts    | 26 ++++++++--------
+ .../LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts    | 30 +++++++++----------
+ 2 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
+index 35afac5..b6219e9 100644
+--- a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_7-dpl.dts
+@@ -1,6 +1,6 @@
+ /*
+  * Copyright 2020 NXP
+- * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions are met:
+@@ -1482,54 +1482,54 @@
+ 	 *****************************************************************/
+ 	connections {
+ 
+-		/*connection@1{
+-			endpoint1 = "dpni@0";
++		connection@1{
++			endpoint1 = "dpni@9";
+ 			endpoint2 = "dpmac@3";
+ 		};
+ 
+ 		connection@2{
+-			endpoint1 = "dpni@1";
++			endpoint1 = "dpni@8";
+ 			endpoint2 = "dpmac@4";
+ 		};
+ 
+ 		connection@3{
+-			endpoint1 = "dpni@2";
++			endpoint1 = "dpni@7";
+ 			endpoint2 = "dpmac@5";
+ 		};
+ 
+ 		connection@4{
+-			endpoint1 = "dpni@3";
++			endpoint1 = "dpni@6";
+ 			endpoint2 = "dpmac@6";
+ 		};
+ 
+ 		connection@5{
+-			endpoint1 = "dpni@4";
++			endpoint1 = "dpni@5";
+ 			endpoint2 = "dpmac@12";
+ 		};
+ 
+ 		connection@6{
+-			endpoint1 = "dpni@5";
++			endpoint1 = "dpni@4";
+ 			endpoint2 = "dpmac@13";
+ 		};
+ 
+ 		connection@7{
+-			endpoint1 = "dpni@6";
++			endpoint1 = "dpni@3";
+ 			endpoint2 = "dpmac@14";
+ 		};
+ 
+ 		connection@8{
+-			endpoint1 = "dpni@7";
++			endpoint1 = "dpni@2";
+ 			endpoint2 = "dpmac@16";
+ 		};
+ 
+ 		connection@9{
+-			endpoint1 = "dpni@8";
++			endpoint1 = "dpni@1";
+ 			endpoint2 = "dpmac@17";
+ 		};
+ 
+ 		connection@10{
+-			endpoint1 = "dpni@9";
++			endpoint1 = "dpni@0";
+ 			endpoint2 = "dpmac@18";
+-		};*/
++		};
+ 	};
+ };
+diff --git a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
+index 1745da4..7acb2e2 100644
+--- a/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
++++ b/config/lx2162a/LX2162A-SOM/clearfog-s1_3-s2_9-dpl.dts
+@@ -1,6 +1,6 @@
+ /*
+  * Copyright 2020 NXP
+- * Copyright 2022 Josua Mayer <josua@solid-run.com>
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions are met:
+@@ -1696,64 +1696,64 @@
+ 	 *****************************************************************/
+ 	connections {
+ 
+-		/*connection@1{
+-			endpoint1 = "dpni@0";
++		connection@1{
++			endpoint1 = "dpni@11";
+ 			endpoint2 = "dpmac@3";
+ 		};
+ 
+ 		connection@2{
+-			endpoint1 = "dpni@1";
++			endpoint1 = "dpni@10";
+ 			endpoint2 = "dpmac@4";
+ 		};
+ 
+ 		connection@3{
+-			endpoint1 = "dpni@2";
++			endpoint1 = "dpni@9";
+ 			endpoint2 = "dpmac@5";
+ 		};
+ 
+ 		connection@4{
+-			endpoint1 = "dpni@3";
++			endpoint1 = "dpni@8";
+ 			endpoint2 = "dpmac@6";
+ 		};
+ 
+ 		connection@5{
+-			endpoint1 = "dpni@4";
++			endpoint1 = "dpni@7";
+ 			endpoint2 = "dpmac@11";
+ 		};
+ 
+ 		connection@6{
+-			endpoint1 = "dpni@5";
++			endpoint1 = "dpni@6";
+ 			endpoint2 = "dpmac@12";
+ 		};
+ 
+ 		connection@7{
+-			endpoint1 = "dpni@6";
++			endpoint1 = "dpni@5";
+ 			endpoint2 = "dpmac@13";
+ 		};
+ 
+ 		connection@8{
+-			endpoint1 = "dpni@7";
++			endpoint1 = "dpni@4";
+ 			endpoint2 = "dpmac@14";
+ 		};
+ 
+ 		connection@9{
+-			endpoint1 = "dpni@8";
++			endpoint1 = "dpni@3";
+ 			endpoint2 = "dpmac@15";
+ 		};
+ 
+ 		connection@10{
+-			endpoint1 = "dpni@9";
++			endpoint1 = "dpni@2";
+ 			endpoint2 = "dpmac@16";
+ 		};
+ 
+ 		connection@11{
+-			endpoint1 = "dpni@10";
++			endpoint1 = "dpni@1";
+ 			endpoint2 = "dpmac@17";
+ 		};
+ 
+ 		connection@12{
+-			endpoint1 = "dpni@11";
++			endpoint1 = "dpni@0";
+ 			endpoint2 = "dpmac@18";
+-		};*/
++		};
+ 	};
+ };
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch
new file mode 100644
index 000000000000..1f1cefc8e275
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch
@@ -0,0 +1,52 @@
+From 35dffd4f4a82a18897bf0b78df8f1402ef5e2d03 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 31 Oct 2024 17:35:21 +0100
+Subject: [PATCH] lx2160acex7: clearfog-cx: configure qsfp ports type phy
+
+Interface type PHY allows Linux to configure ethernet speed at runtime
+for each port, rather than sticking to assignment from serdes protocols.
+
+This is particularly useful with SD1 protocol 18 which by default drives
+just two ports at 25Gbps while QSFP connector has 4.
+At protocol 18 Linux can switch any of the 8 ports between 10Gbps and
+25Gbps as needed.
+
+Due to lack of software support, the QSFP ports need to define speed in
+device-tree.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
+index dcc376e..9a508d2 100644
+--- a/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
++++ b/config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dts
+@@ -69,19 +69,19 @@
+ 	board_info {
+ 		ports {
+ 			mac@3 {
+-				link_type = "MAC_LINK_TYPE_FIXED";
++				link_type = "MAC_LINK_TYPE_PHY";
+ 			};
+ 
+ 			mac@4 {
+-				link_type = "MAC_LINK_TYPE_FIXED";
++				link_type = "MAC_LINK_TYPE_PHY";
+ 			};
+ 
+ 			mac@5 {
+-				link_type = "MAC_LINK_TYPE_FIXED";
++				link_type = "MAC_LINK_TYPE_PHY";
+ 			};
+ 
+ 			mac@6 {
+-				link_type = "MAC_LINK_TYPE_FIXED";
++				link_type = "MAC_LINK_TYPE_PHY";
+ 			};
+ 
+ 			mac@7 {
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
