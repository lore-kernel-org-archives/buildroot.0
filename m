Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC6E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 17:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB3340316;
	Sun,  8 Dec 2024 17:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LXUFsIxbHNG; Sun,  8 Dec 2024 17:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9B440222
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9B440222;
	Sun,  8 Dec 2024 17:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F07EE0
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6994071B
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0V0uw0rlBPa for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFADD406E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFADD406E0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFADD406E0
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa67bc91f88so9593466b.0
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668720; x=1734273520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBjIG2ENw8o76UBtHFoQ/RF16EFJRog9Z35h6sZai+A=;
 b=mUSE7wH0K2J2PYyq4/UVKMI4W2mb8AofY28yXyTsQisxM3mezG2zchzrLvEHQK5rFL
 zcB/J0oi5hpLaB0DUN/JaPYJDfePeXhw1JxZdbxDXGwAr84EAomRSL+5NKokyvL3z9Gg
 KDtAKraZnzpVFp/kBFnm6Pb0bZWKlUmyW7OmALnQ7EK5tlh+edS9btytXd8r4HRIIviq
 5DK+PoYbtJ1vCdL9n6CF594+iWVMeCXMqbxqpTO0qFeDQreQZZHn7AwCPV0Vsw46VQxw
 1GAkwezrfbXhIzzOuL60XGUQUjRnlO6U3/TzXg55lNkT+milna3NAB4o/rF2JFt92g0K
 99Eg==
X-Gm-Message-State: AOJu0YzgTHGKzRhx7K5I8c/yKXZBic8YTafDQ6YmZe5LFWQhzG8u0VAk
 96Cjdrmuar2Bp8BFbWObrnow+sLKo22RzmLeu4xrJcVAdkWyXBZb8EAiGw==
X-Gm-Gg: ASbGnctFcULzrunjQn8EbWpgG4ZnEouMlyus+WwRnUSwVGBtATZ5839/opmhaS4+KkE
 mzcZ1eiBopgXMLJveztIzgYQvDbVtZcOERkPKkni9zTSMF+wKOwiKaOKC+psP4cqElbaZ0yKLf+
 KUFpalZkTkOLYmLUvTZ3SjfgMmOcVBUFJ5nlxBTOP4thG0qLycw+6HNj/3UvCpWu0LI30F7iKXC
 z8RPTnSc2+4U2e+/zwI273tJErJv88Wwm0ZGh4aWAg=
X-Google-Smtp-Source: AGHT+IEWij0Bhu5X4AmiU0O9ScvajKzkzxavb9DP0wBESxz5E5WRpERzJOCPGllXEZt2SN3YrCG1QQ==
X-Received: by 2002:a17:907:72c3:b0:a9a:2a56:b54 with SMTP id
 a640c23a62f3a-aa639feb6bdmr368539066b.5.1733668718800; 
 Sun, 08 Dec 2024 06:38:38 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:37 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:38:00 +0200
Message-ID: <20241208143802.1048266-10-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Dec 2024 17:24:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668720; x=1734273520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBjIG2ENw8o76UBtHFoQ/RF16EFJRog9Z35h6sZai+A=;
 b=kUN8Ybzr1UQKrBBWQecQWAXC0B/+GHpUX40TX0Vq+yHCBnb2S/fXtD1qy353oEbs7y
 YcPU6drZ1GdjIfOljZLKu1E6hw1WpZmBEOSrVqrUu43ZvdcZKGCaHzpHyQ7en7hsmVQl
 Oksa0vX7x8I3ab9d+s0X4VGma+AkdM9xV3uWSY62s3aezVDQDaHzaonqWXcX6wf4aYFo
 sfWF14sGcQdZ8HsDx15TBFiTdotkXqrl7Ma3CMIweJTjpUv7Y6pjUovUx8Rruv4W9SxC
 hIDuoEEDWtWaubt8/+Suby2ajS142+es0SlYzEQQfGXztL7V9770EMdPzq/rKYXc5NcM
 wvzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kUN8Ybzr
Subject: [Buildroot] [PATCH v2 09/11] board/lx2160acex7: add qoriq-rcw
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

These come unmodified from SolidRun as of lx2160a_build commit
497e9ebf0e2a ("atf: update sdram configuration for internal cex6 evb
revision 1.2"), and are needed to establish a bootable Reset
Configuration Word for the platform.

The Buildroot defconfig only uses
lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- split out from previous [PATCH 6/7] board/lx2160acex7: new platform
- update to latest lx2160a_build HEAD

 ...n-solidrun-lx2160a-cex-7-on-clearfog.patch |  950 ++++++++
 ...-MEM_PLL_CFG-into-ddr-speed-specific.patch |  112 +
 ...separate-configurations-for-flexspi-.patch |  894 ++++++++
 ...me-sdhc1-config-to-generic-sdhc-for-.patch |  149 ++
 ...c-jumpc-and-jump-to-pbi-instructions.patch |   55 +
 ...add-configuration-for-both-sdhc-xspi.patch |  836 +++++++
 ...ootlocptr-reduce-size-of-pbi-section.patch |   90 +
 ...ge-2.2GHz-configuration-platform-clo.patch |  475 ++++
 ...configuration-for-fraction-ddr-speed.patch |  420 ++++
 ...n-solidrun-internal-lx2160a-cex6-eva.patch |  220 ++
 ...le-A-050426-workaround-for-silicon-o.patch |   35 +
 ...le-pci-errata-workarounds-for-all-ac.patch |   87 +
 ...-configuration-for-2.2GHz-binned-soc.patch |   42 +
 .../0014-lx2162aqds-re-enable-dpmac11.patch   |   27 +
 ...n-for-lx2162a-som-and-clearfog-evalu.patch |  532 +++++
 ...rfog-cx-add-configuration-for-serdes.patch | 2000 +++++++++++++++++
 ...configuration-for-serdes-1-protocol-.patch |   49 +
 ...ipt-generating-configs-from-template.patch | 1476 ++++++++++++
 ...rfog-cx-add-configuration-for-serdes.patch | 1611 +++++++++++++
 ...add-configuration-for-each-ddr-speed.patch |  285 +++
 20 files changed, 10345 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0017-lx2160acex7-add-configuration-for-serdes-1-protocol-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0018-solidrun-add-script-generating-configs-from-template.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0019-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0020-lx2160acex6-add-configuration-for-each-ddr-speed.patch

diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
new file mode 100644
index 000000000000..f6af96404e07
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
@@ -0,0 +1,950 @@
+From 5a5ec65c0eb53efbcb69894576d7d04f671a730e Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Wed, 12 Jun 2024 15:19:39 +0200
+Subject: [PATCH] add configuration solidrun lx2160a-cex-7 on clearfog-cx board
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex7/Makefile                          |  1 +
+ lx2160acex7/README                            |  0
+ .../clearfog-cx/rcw_2000_700_2400_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_2600_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_2900_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_3200_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2400_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2600_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2900_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_3200_8_5_2.rcw   | 23 +++++
+ lx2160acex7/clearfog-cx/sd1_8_eq.rcwi         | 39 ++++++++
+ lx2160acex7/include/SD1_8.rcwi                | 24 +++++
+ lx2160acex7/include/SD2_5.rcwi                | 27 ++++++
+ lx2160acex7/include/SD3_2.rcwi                | 27 ++++++
+ lx2160acex7/include/common.rcwi               | 90 +++++++++++++++++++
+ lx2160acex7/include/common_pbi.rcwi           | 55 ++++++++++++
+ lx2160acex7/include/pll_2000_700_xxxx.rcwi    | 14 +++
+ lx2160acex7/include/pll_2200_700_xxxx.rcwi    | 14 +++
+ lx2160acex7/include/pll_xxxx_xxx_2400.rcwi    |  7 ++
+ lx2160acex7/include/pll_xxxx_xxx_2600.rcwi    |  7 ++
+ lx2160acex7/include/pll_xxxx_xxx_2900.rcwi    |  7 ++
+ lx2160acex7/include/pll_xxxx_xxx_3200.rcwi    |  7 ++
+ lx2160acex7_rev2/Makefile                     |  1 +
+ lx2160acex7_rev2/README                       |  0
+ .../clearfog-cx/rcw_2000_700_2400_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_2600_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_2900_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2000_700_3200_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2400_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2600_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_2900_8_5_2.rcw   | 23 +++++
+ .../clearfog-cx/rcw_2200_700_3200_8_5_2.rcw   | 23 +++++
+ 32 files changed, 688 insertions(+)
+ create mode 100644 lx2160acex7/Makefile
+ create mode 100644 lx2160acex7/README
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/sd1_8_eq.rcwi
+ create mode 100644 lx2160acex7/include/SD1_8.rcwi
+ create mode 100644 lx2160acex7/include/SD2_5.rcwi
+ create mode 100644 lx2160acex7/include/SD3_2.rcwi
+ create mode 100644 lx2160acex7/include/common.rcwi
+ create mode 100644 lx2160acex7/include/common_pbi.rcwi
+ create mode 100644 lx2160acex7/include/pll_2000_700_xxxx.rcwi
+ create mode 100644 lx2160acex7/include/pll_2200_700_xxxx.rcwi
+ create mode 100644 lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
+ create mode 100644 lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
+ create mode 100644 lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
+ create mode 100644 lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
+ create mode 100644 lx2160acex7_rev2/Makefile
+ create mode 100644 lx2160acex7_rev2/README
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+
+diff --git a/lx2160acex7/Makefile b/lx2160acex7/Makefile
+new file mode 100644
+index 0000000..f77e46b
+--- /dev/null
++++ b/lx2160acex7/Makefile
+@@ -0,0 +1 @@
++include ../Makefile.inc
+diff --git a/lx2160acex7/README b/lx2160acex7/README
+new file mode 100644
+index 0000000..e69de29
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+new file mode 100644
+index 0000000..ba0f82c
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+new file mode 100644
+index 0000000..b1723d3
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+new file mode 100644
+index 0000000..fa59785
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+new file mode 100644
+index 0000000..90ac8a4
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+new file mode 100644
+index 0000000..464a285
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+new file mode 100644
+index 0000000..1ef7db6
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+new file mode 100644
+index 0000000..d021306
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+new file mode 100644
+index 0000000..bfef1d4
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/sd1_8_eq.rcwi b/lx2160acex7/clearfog-cx/sd1_8_eq.rcwi
+new file mode 100644
+index 0000000..44961c1
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/sd1_8_eq.rcwi
+@@ -0,0 +1,39 @@
++/*
++ * SERDES tuning based on the following hardware -
++ * - SolidRun COM express type 7 revision 1.7 and newer
++ * - SolidRun ClearFog CX revision 1.3 with TI retimers and EPT COM express headers
++ */
++
++.pbi
++/* Lane E (SD1 TX/RX 3) */
++write 0x01EA0C28,0x00000000
++write 0x01EA0C30,0x20818120
++write 0x01EA0C34,0x23000000
++write 0x01EA0C68,0x80000000
++write 0x01EA0C74,0x00002020
++write 0x01EA0C80,0x00008000
++
++/* Lane F (SD1 TX/RX 2)*/
++write 0x01EA0D28,0x00000000
++write 0x01EA0D30,0x20818120
++write 0x01EA0D34,0x23000000
++write 0x01EA0D68,0x80000000
++write 0x01EA0D74,0x00002020
++write 0x01EA0D80,0x00008000
++
++/* Lane G (SD1 TX/RX 1)*/
++write 0x01EA0E28,0x00000000
++write 0x01EA0E30,0x20818120
++write 0x01EA0E34,0x23000000
++write 0x01EA0E68,0x80000000
++write 0x01EA0E74,0x00002020
++write 0x01EA0E80,0x00008000
++
++/* Lane H (SD1 TX/RX 0)*/
++write 0x01EA0F28,0x00000000
++write 0x01EA0F30,0x20818120
++write 0x01EA0F34,0x23000000
++write 0x01EA0F68,0x80000000
++write 0x01EA0F74,0x00002020
++write 0x01EA0F80,0x00008000
++.end
+diff --git a/lx2160acex7/include/SD1_8.rcwi b/lx2160acex7/include/SD1_8.rcwi
+new file mode 100644
+index 0000000..87ce260
+--- /dev/null
++++ b/lx2160acex7/include/SD1_8.rcwi
+@@ -0,0 +1,24 @@
++/*
++ * Serdes 1 Reference Clocks:
++ * - PLLF = 100MHz
++ * - PLLS = 161.1328125MHz
++ */
++
++/* Serdes 1 Protocol 8: 8x10Gbps */
++SRDS_PRTCL_S1=8
++
++/* Disable PLLF */
++SRDS_PLL_PD_PLL1=1
++
++/* Use PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S1=1
++
++/* Enable PLLS */
++SRDS_PLL_PD_PLL2=0
++
++/*
++ * Select PLLF frequency 100MHz (don't care): Bit 0 = 0
++ * Select PLLS frequency 161.1328125MHz: Bit 1 = 1
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932-933)
++ */
++SRDS_PLL_REF_CLK_SEL_S1=2
+diff --git a/lx2160acex7/include/SD2_5.rcwi b/lx2160acex7/include/SD2_5.rcwi
+new file mode 100644
+index 0000000..8fed5bd
+--- /dev/null
++++ b/lx2160acex7/include/SD2_5.rcwi
+@@ -0,0 +1,27 @@
++/*
++ * Serdes 2 Reference Clocks:
++ * - PLLF = 100MHz
++ * - PLLS = 100MHz
++ */
++
++/* Serdes 2 Protocol 5: 1x PCI-e x4 Gen 3 + 4x SATA */
++SRDS_PRTCL_S2=5
++
++/* Enable PLLF */
++SRDS_PLL_PD_PLL3=0
++
++/* Don't use PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S2=0
++
++/* Enable PLLS */
++SRDS_PLL_PD_PLL4=0
++
++/*
++ * Select PLLF frequency 100MHz: Bit 0 = 0
++ * Select PLLS frequency 100MHz: Bit 1 = 0
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 934-935)
++ */
++SRDS_PLL_REF_CLK_SEL_S2=0
++
++/* Support up to PCI-e Gen 3 */
++SRDS_DIV_PEX_S2=1
+diff --git a/lx2160acex7/include/SD3_2.rcwi b/lx2160acex7/include/SD3_2.rcwi
+new file mode 100644
+index 0000000..b0be701
+--- /dev/null
++++ b/lx2160acex7/include/SD3_2.rcwi
+@@ -0,0 +1,27 @@
++/*
++ * Serdes 3 Reference Clocks:
++ * - PLLF = 100MHz
++ * - PLLS = 100MHz
++ */
++
++/* Serdes 3 Protocol 2: 1x PCI-e x8 Gen 3 */
++SRDS_PRTCL_S3=2
++
++/* Disable PLLF */
++SRDS_PLL_PD_PLL5=1
++
++/* Don't use Serdes 3 PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S3=0
++
++/* Enable PLLS */
++SRDS_PLL_PD_PLL6=0
++
++/*
++ * Select PLLF frequency 100MHz: Bit 0 = 0
++ * Select PLLS frequency 100MHz: Bit 1 = 0
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 936-937)
++ */
++SRDS_PLL_REF_CLK_SEL_S3=0
++
++/* Support up to PCI-e Gen 3 */
++SRDS_DIV_PEX_S3=1
+diff --git a/lx2160acex7/include/common.rcwi b/lx2160acex7/include/common.rcwi
+new file mode 100644
+index 0000000..e8a5660
+--- /dev/null
++++ b/lx2160acex7/include/common.rcwi
+@@ -0,0 +1,90 @@
++/*
++ * LX2160A COM-Express Type 7 Common Configuration
++ */
++
++/* DDR CGU PLL clk out div 4 */
++MEM_PLL_CFG=3
++MEM2_PLL_CFG=3
++/* C[5:8]_PLL are CG[5:8] div 1 */
++C5_PLL_SEL=0
++C6_PLL_SEL=0
++C7_PLL_SEL=0
++C8_PLL_SEL=0
++/* Cluster group A clock is PLL1 div 1 (unused on LX2160A) */
++HWA_CGA_M1_CLK_SEL=1
++/* Cluster group B clock is PLL2 div 2 (for DCE) */
++HWA_CGB_M1_CLK_SEL=6
++/* fall-back boot-mode is ocram, when DCFG bit location pointer registers are null */
++BOOT_LOC=21 // TODO: test if SPI boot still functional
++/* SYSCLK is 100MHz */
++SYSCLK_FREQ=600
++/* USB-3.0 clock is 100MHz */
++USB3_CLK_FSEL=39
++
++/* IIC1 is I2C */
++IIC1_PMUX=0
++/* IIC2 is SD Card-Detect */
++IIC2_PMUX=6
++/* IIC3 is I2C */
++IIC3_PMUX=0
++/* IIC4 is I2C (unused) */
++IIC4_PMUX=0
++/* IIC5 is I2C */
++IIC5_PMUX=0
++/* IIC6 is I2C (unused) */
++IIC6_PMUX=0
++/*
++ * SDHC1 CMD/CLK/VBUS/DAT[0:3] are SDHC
++ * SPI3_PCS0 is VSEL
++ */
++SDHC1_BASE_PMUX=0
++/* SDHC1_DS is GPIO (unused) */
++SDHC1_DS_PMUX=1
++/* SDHC1_CMD/DAT0/DAT1_DIR (SPI3_PCS[1:3]) are GPIO1[14:12] */
++SDHC1_DIR_PMUX=1
++/* USB[1:2]_DRVVBUS/PWRFAULT are GPIO4[28:25] (unused) */
++USB_EXT_PMUX=1
++/* XSPI1_A_DQS/SCK/CS0_B/CS1_B are SPI */
++XSPI1_A_BASE_PMUX=0
++/* XSPI1_A_DATA[3:0] are SPI */
++XSPI1_A_DATA30_PMUX=0
++/* XSPI1_A_DATA[7:4] are SPI */
++XSPI1_A_DATA74_PMUX=0
++/* ASLEEP is ASLEEP (unused) */
++ASLEEP_PMUX=0
++/* EVT[2:0] are GPIO3[14:12] */
++EVT20_PMUX=1
++/* EVT[4:3] are GPIO3[16:15] */
++EVT43_PMUX=1
++/* CLK_OUT is GPIO (unused) */
++CLK_OUT_PMUX=1
++/* IRQ[3:0] are GPIO3[3:0] */
++IRQ03_00_PMUX=1
++/* IRQ[7:4] are GPIO3[7:4] */
++IRQ07_04_PMUX=1
++/* IRQ[11:8] are GPIO3[11:8] */
++IRQ11_08_PMUX=1
++/* EC1_* are RGMII */
++EC1_PMUX=0
++/* EC2_* are PTP */
++EC2_PMUX=2
++/* EC_GTX_CLK125 is PTP */
++GTX_CLK_PMUX=0
++/* UART1_SOUT/SIN are UART1 */
++UART1_SOUTSIN_PMUX=0
++/* UART1_RTS/CTS_B are GPIO (unused) */
++UART1_RTSCTS_PMUX=1
++/* UART2_SOUT/SIN are UART2 */
++UART2_SOUTSIN_PMUX=0
++/* UART2_RTS/CTS_B are GPIO (unused) */
++UART2_RTSCTS_PMUX=1
++/* SDHC2_CMD/DAT[3:0]/DS/CLK are SDHC */
++SDHC2_BASE_PMUX=0
++/* SDHC2_DAT[7:4] are SDHC */
++SDHC2_DAT74_PMUX=0
++
++/*
++ * Original SolidRun Settings in LSDK-21.08
++ *
++ * HWA_CGB_M1_CLK_SEL=7 // Cluster Group B PLL 2 / 3 is clock
++ */
+diff --git a/lx2160acex7/include/common_pbi.rcwi b/lx2160acex7/include/common_pbi.rcwi
+new file mode 100644
+index 0000000..0c28f92
+--- /dev/null
++++ b/lx2160acex7/include/common_pbi.rcwi
+@@ -0,0 +1,55 @@
++/*
++ * LX2160A COM-Express Type 7 Common Configuration
++ */
++
++/* Drive the fan full speed pin */
++.pbi
++write 0x2320000,0x20000000
++.end
++
++/* Errata to write on scratch reg for validation */
++#include <../lx2160asi/scratchrw1.rcw>
++
++/* Boot Location Pointer */
++#include <../lx2160asi/bootlocptr_sd.rcw>
++
++/* Errata for SATA controller */
++#include <../lx2160asi/a010554.rcw>
++
++#if LX_SR == 1
++/* Errata for PCIe controller */
++#include <../lx2160asi/a011270.rcw>
++#include <../lx2160asi/a050234.rcw>
++#endif
++
++/* common PBI commands */
++#include <../lx2160asi/common.rcw>
++
++#if LX_SR == 2
++/*PCIe Errata A-009531*/
++#include <../lx2160asi/a009531_PEX3.rcw>
++#include <../lx2160asi/a009531_PEX5.rcw>
++
++/*PCIe Errata A-008851*/
++#include <../lx2160asi/a008851_PEX3.rcw>
++#include <../lx2160asi/a008851_PEX5.rcw>
++
++/*SerDes Errata A-050479*/
++#include <../lx2160asi/a050479.rcw>
++
++/* Errata A-050426 */
++#include <../lx2160asi/a050426.rcw>
++#endif
++
++/*
++ * FlexSPI controller supports modifcation of the FlexSPI Clock
++ * divisor value, default value of this is 80.
++ * For 700 MHz, FlexSPI clock runs with default value is
++ *    (Platform Clock * 2) / (Divisor value)
++ *      => 700 * 2 / 80 ==> 17MHz
++ * On Clearfog-CX bus speed is limited to 20MHz by a mux on carrier board.
++ * Explicitly set the default value again, in case it was modified elsewhere.
++ */
++.pbi
++write 0x1e00900,0x00000014
++.end
+diff --git a/lx2160acex7/include/pll_2000_700_xxxx.rcwi b/lx2160acex7/include/pll_2000_700_xxxx.rcwi
+new file mode 100644
+index 0000000..2a3725f
+--- /dev/null
++++ b/lx2160acex7/include/pll_2000_700_xxxx.rcwi
+@@ -0,0 +1,14 @@
++/*
++ * Core and Platform Clocks:
++ * - Platform: 700MHz
++ * - Core: 2000MHz
++ */
++
++/* platform clock is system clock mul 14 div 2 = 700 */
++SYS_PLL_RAT=14
++
++/* core clocks are 2000 */
++CGA_PLL1_RAT=20
++CGA_PLL2_RAT=20
++CGB_PLL1_RAT=20
++CGB_PLL2_RAT=7
+diff --git a/lx2160acex7/include/pll_2200_700_xxxx.rcwi b/lx2160acex7/include/pll_2200_700_xxxx.rcwi
+new file mode 100644
+index 0000000..91d1a9b
+--- /dev/null
++++ b/lx2160acex7/include/pll_2200_700_xxxx.rcwi
+@@ -0,0 +1,14 @@
++/*
++ * Core and Platform Clocks:
++ * - Platform: 700MHz
++ * - Core: 2200MHz
++ */
++
++/* platform clock is system clock mul 14 div 2 = 700 */
++SYS_PLL_RAT=14
++
++/* core clocks are 2200 */
++CGA_PLL1_RAT=22
++CGA_PLL2_RAT=22
++CGB_PLL1_RAT=22
++CGB_PLL2_RAT=7
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
+new file mode 100644
+index 0000000..9c79664
+--- /dev/null
++++ b/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
+@@ -0,0 +1,7 @@
++/*
++ * DDR Rate: 2400MHz
++ */
++
++/* data rate is reference clock mul 24 = 2400 */
++MEM_PLL_RAT=24
++MEM2_PLL_RAT=24
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
+new file mode 100644
+index 0000000..404d52a
+--- /dev/null
++++ b/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
+@@ -0,0 +1,7 @@
++/*
++ * DDR Rate: 2600MHz
++ */
++
++/* data rate is reference clock mul 26 = 2600 */
++MEM_PLL_RAT=26
++MEM2_PLL_RAT=26
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
+new file mode 100644
+index 0000000..2ba2426
+--- /dev/null
++++ b/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
+@@ -0,0 +1,7 @@
++/*
++ * DDR Rate: 2900MHz
++ */
++
++/* data rate is reference clock mul 29 = 2900 */
++MEM_PLL_RAT=29
++MEM2_PLL_RAT=29
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi b/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
+new file mode 100644
+index 0000000..cbc2cf4
+--- /dev/null
++++ b/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
+@@ -0,0 +1,7 @@
++/*
++ * DDR Rate: 3200MHz
++ */
++
++/* data rate is reference clock mul 32 = 3200 */
++MEM_PLL_RAT=32
++MEM2_PLL_RAT=32
+diff --git a/lx2160acex7_rev2/Makefile b/lx2160acex7_rev2/Makefile
+new file mode 100644
+index 0000000..f77e46b
+--- /dev/null
++++ b/lx2160acex7_rev2/Makefile
+@@ -0,0 +1 @@
++include ../Makefile.inc
+diff --git a/lx2160acex7_rev2/README b/lx2160acex7_rev2/README
+new file mode 100644
+index 0000000..e69de29
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+new file mode 100644
+index 0000000..1c23c5c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+new file mode 100644
+index 0000000..87391ab
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+new file mode 100644
+index 0000000..9114f36
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+new file mode 100644
+index 0000000..7e97984
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+new file mode 100644
+index 0000000..d59ceed
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+new file mode 100644
+index 0000000..1bf815b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+new file mode 100644
+index 0000000..01138dc
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+new file mode 100644
+index 0000000..e99a12b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+-- 
+2.35.3
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch
new file mode 100644
index 000000000000..1c3097827584
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch
@@ -0,0 +1,112 @@
+From 9d49cf46a3fde08abd3ba48169c7688dfeed74bb Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 27 Sep 2024 17:58:11 +0200
+Subject: [PATCH] lx2160acex7: move MEM_PLL_CFG into ddr-speed-specific
+ includes
+
+Both MEM_PLL_RAT and MEM_PLL_CFG together create the final ddr clock
+speed, move the latter from common.rcwi into each speed-specific
+include.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex7/include/common.rcwi            | 3 ---
+ lx2160acex7/include/pll_xxxx_xxx_2400.rcwi | 9 +++++++--
+ lx2160acex7/include/pll_xxxx_xxx_2600.rcwi | 9 +++++++--
+ lx2160acex7/include/pll_xxxx_xxx_2900.rcwi | 9 +++++++--
+ lx2160acex7/include/pll_xxxx_xxx_3200.rcwi | 9 +++++++--
+ 5 files changed, 28 insertions(+), 11 deletions(-)
+
+diff --git a/lx2160acex7/include/common.rcwi b/lx2160acex7/include/common.rcwi
+index e8a5660..5523318 100644
+--- a/lx2160acex7/include/common.rcwi
++++ b/lx2160acex7/include/common.rcwi
+@@ -2,9 +2,6 @@
+  * LX2160A COM-Express Type 7 Common Configuration
+  */
+ 
+-/* DDR CGU PLL clk out div 4 */
+-MEM_PLL_CFG=3
+-MEM2_PLL_CFG=3
+ /* C[5:8]_PLL are CG[5:8] div 1 */
+ C5_PLL_SEL=0
+ C6_PLL_SEL=0
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
+index 9c79664..6356b36 100644
+--- a/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
++++ b/lx2160acex7/include/pll_xxxx_xxx_2400.rcwi
+@@ -1,7 +1,12 @@
+ /*
+  * DDR Rate: 2400MHz
++ *
++ * DDR PHY Clock (half ddr clock, quarter mts rate)
++ * multiplier = 24 (24)
++ * divider = 4 (3)
++ * 100MHz x 24 / 4 = 600MHz (MTS = 4 x 600 = 2400MHz)
+  */
+-
+-/* data rate is reference clock mul 24 = 2400 */
+ MEM_PLL_RAT=24
++MEM_PLL_CFG=3
+ MEM2_PLL_RAT=24
++MEM2_PLL_CFG=3
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
+index 404d52a..d72047d 100644
+--- a/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
++++ b/lx2160acex7/include/pll_xxxx_xxx_2600.rcwi
+@@ -1,7 +1,12 @@
+ /*
+  * DDR Rate: 2600MHz
++ *
++ * DDR PHY Clock (half ddr clock, quarter mts rate)
++ * multiplier = 26 (26)
++ * divider = 4 (3)
++ * 100MHz x 26 / 4 = 650MHz (MTS = 4 x 650 = 2600MHz)
+  */
+-
+-/* data rate is reference clock mul 26 = 2600 */
+ MEM_PLL_RAT=26
++MEM_PLL_CFG=3
+ MEM2_PLL_RAT=26
++MEM2_PLL_CFG=3
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
+index 2ba2426..9ad274f 100644
+--- a/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
++++ b/lx2160acex7/include/pll_xxxx_xxx_2900.rcwi
+@@ -1,7 +1,12 @@
+ /*
+  * DDR Rate: 2900MHz
++ *
++ * DDR PHY Clock (half ddr clock, quarter mts rate)
++ * multiplier = 29 (29)
++ * divider = 4 (3)
++ * 100MHz x 29 / 4 = 725MHz (MTS = 4 x 725 = 2900MHz)
+  */
+-
+-/* data rate is reference clock mul 29 = 2900 */
+ MEM_PLL_RAT=29
++MEM_PLL_CFG=3
+ MEM2_PLL_RAT=29
++MEM2_PLL_CFG=3
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi b/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
+index cbc2cf4..abf7e9d 100644
+--- a/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
++++ b/lx2160acex7/include/pll_xxxx_xxx_3200.rcwi
+@@ -1,7 +1,12 @@
+ /*
+  * DDR Rate: 3200MHz
++ *
++ * DDR PHY Clock (half ddr clock, quarter mts rate)
++ * multiplier = 32 (32)
++ * divider = 4 (3)
++ * 100MHz x 32 / 4 = 800MHz (MTS = 4 x 800 = 3200MHz)
+  */
+-
+-/* data rate is reference clock mul 32 = 3200 */
+ MEM_PLL_RAT=32
++MEM_PLL_CFG=3
+ MEM2_PLL_RAT=32
++MEM2_PLL_CFG=3
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch
new file mode 100644
index 000000000000..58c4f6e6c8d5
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch
@@ -0,0 +1,894 @@
+From 229c609e139b5f95ea96c03dc084ba53b4f09d5e Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 28 Sep 2024 12:24:13 +0200
+Subject: [PATCH] lx2160acex7: add separate configurations for flexspi and
+ sdhc1 boot
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../rcw_2000_700_2400_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2400_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_2600_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2600_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_2900_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2900_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_3200_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_3200_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2400_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2400_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2600_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2600_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2900_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2900_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_3200_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_3200_8_5_2_xspi.rcw} |  2 ++
+ lx2160acex7/include/common_pbi.rcwi           |  4 +++
+ .../rcw_2000_700_2400_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2400_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_2600_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2600_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_2900_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_2900_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2000_700_3200_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2000_700_3200_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2400_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2400_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2600_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2600_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_2900_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_2900_8_5_2_xspi.rcw} |  2 ++
+ .../rcw_2200_700_3200_8_5_2_sdhc1.rcw         | 25 +++++++++++++++++++
+ ...2.rcw => rcw_2200_700_3200_8_5_2_xspi.rcw} |  2 ++
+ 33 files changed, 436 insertions(+)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2400_8_5_2.rcw => rcw_2000_700_2400_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2600_8_5_2.rcw => rcw_2000_700_2600_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2900_8_5_2.rcw => rcw_2000_700_2900_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_3200_8_5_2.rcw => rcw_2000_700_3200_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2400_8_5_2.rcw => rcw_2200_700_2400_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2600_8_5_2.rcw => rcw_2200_700_2600_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2900_8_5_2.rcw => rcw_2200_700_2900_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_3200_8_5_2.rcw => rcw_2200_700_3200_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2400_8_5_2.rcw => rcw_2000_700_2400_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2600_8_5_2.rcw => rcw_2000_700_2600_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2900_8_5_2.rcw => rcw_2000_700_2900_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_3200_8_5_2.rcw => rcw_2000_700_3200_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2400_8_5_2.rcw => rcw_2200_700_2400_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2600_8_5_2.rcw => rcw_2200_700_2600_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2900_8_5_2.rcw => rcw_2200_700_2900_8_5_2_xspi.rcw} (93%)
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_3200_8_5_2.rcw => rcw_2200_700_3200_8_5_2_xspi.rcw} (93%)
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..0299002
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+index ba0f82c..9cb1229 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..90a27ac
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+index b1723d3..5a3f820 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..3a08744
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+index fa59785..ace0f0a 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..19a3af1
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+index 90ac8a4..2c7bbed 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..bf7af38
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+index 464a285..f23be28 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..ff778ec
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+index 1ef7db6..62cf89e 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..90cd09c
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+index d021306..13ec066 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..88731fa
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+index bfef1d4..b80f8cb 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/include/common_pbi.rcwi b/lx2160acex7/include/common_pbi.rcwi
+index 0c28f92..848d48b 100644
+--- a/lx2160acex7/include/common_pbi.rcwi
++++ b/lx2160acex7/include/common_pbi.rcwi
+@@ -11,7 +11,11 @@ write 0x2320000,0x20000000
+ #include <../lx2160asi/scratchrw1.rcw>
+ 
+ /* Boot Location Pointer */
++#if defined(LX_BOOTSOURCE_SDHC1)
+ #include <../lx2160asi/bootlocptr_sd.rcw>
++#elif defined(LX_BOOTSOURCE_XSPI)
++#include <../lx2160asi/bootlocptr_nor.rcw>
++#endif
+ 
+ /* Errata for SATA controller */
+ #include <../lx2160asi/a010554.rcw>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..b77ed2c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+index 1c23c5c..5c11864 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..2d19602
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+index 87391ab..21df735 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..d141116
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+index 9114f36..d128916 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..8b5ec8d
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+index 7e97984..55d8bc1 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..7763a4a
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+index d59ceed..9643b52 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..b238680
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+index 1bf815b..79cea0d 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..46b16ab
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+index 01138dc..b12898a 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+new file mode 100644
+index 0000000..dc9180f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+similarity index 93%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+index e99a12b..c2ff13a 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from XSPI
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch
new file mode 100644
index 000000000000..dfdd0b2232b0
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch
@@ -0,0 +1,149 @@
+From 8756b34d63f7357f7309bfa27fd175b198285bae Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 28 Sep 2024 14:54:36 +0200
+Subject: [PATCH] lx2160acex7:  rename sdhc1 config to generic sdhc, for both
+ sd & emmc
+
+Both sdhc1 and sdhc2 boot can share same rcw.
+They use identical boot location pointer values, differences were only
+in old rcw with explicit block-copy from boot media to ocram.
+
+This block-copy is not required for either spi, emmc or sd boot.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2400_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2600_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2900_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_3200_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2400_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2600_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2900_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_3200_8_5_2_sdhc.rcw} | 0
+ lx2160acex7/include/common.rcwi                           | 8 ++++++--
+ lx2160acex7/include/common_pbi.rcwi                       | 2 +-
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2400_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2600_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_2900_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2000_700_3200_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2400_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2600_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_2900_8_5_2_sdhc.rcw} | 0
+ ...0_8_5_2_sdhc1.rcw => rcw_2200_700_3200_8_5_2_sdhc.rcw} | 0
+ 18 files changed, 7 insertions(+), 3 deletions(-)
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2400_8_5_2_sdhc1.rcw => rcw_2000_700_2400_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2600_8_5_2_sdhc1.rcw => rcw_2000_700_2600_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_2900_8_5_2_sdhc1.rcw => rcw_2000_700_2900_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2000_700_3200_8_5_2_sdhc1.rcw => rcw_2000_700_3200_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2400_8_5_2_sdhc1.rcw => rcw_2200_700_2400_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2600_8_5_2_sdhc1.rcw => rcw_2200_700_2600_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2900_8_5_2_sdhc1.rcw => rcw_2200_700_2900_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_3200_8_5_2_sdhc1.rcw => rcw_2200_700_3200_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2400_8_5_2_sdhc1.rcw => rcw_2000_700_2400_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2600_8_5_2_sdhc1.rcw => rcw_2000_700_2600_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_2900_8_5_2_sdhc1.rcw => rcw_2000_700_2900_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2000_700_3200_8_5_2_sdhc1.rcw => rcw_2000_700_3200_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2400_8_5_2_sdhc1.rcw => rcw_2200_700_2400_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2600_8_5_2_sdhc1.rcw => rcw_2200_700_2600_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2900_8_5_2_sdhc1.rcw => rcw_2200_700_2900_8_5_2_sdhc.rcw} (100%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_3200_8_5_2_sdhc1.rcw => rcw_2200_700_3200_8_5_2_sdhc.rcw} (100%)
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7/include/common.rcwi b/lx2160acex7/include/common.rcwi
+index 5523318..c76b174 100644
+--- a/lx2160acex7/include/common.rcwi
++++ b/lx2160acex7/include/common.rcwi
+@@ -11,8 +11,12 @@ C8_PLL_SEL=0
+ HWA_CGA_M1_CLK_SEL=1
+ /* Cluster group B clock is PLL2 div 2 (for DCE) */
+ HWA_CGB_M1_CLK_SEL=6
+-/* fall-back boot-mode is ocram, when DCFG bit location pointer registers are null */
+-BOOT_LOC=21 // TODO: test if SPI boot still functional
++/*
++ * fall-back boot-mode when DCFG boot location pointer registers are null
++ * - 0b10101 (21): OCRAM
++ * - 0b11010 (26): XSPI
++ */
++BOOT_LOC=21
+ /* SYSCLK is 100MHz */
+ SYSCLK_FREQ=600
+ /* USB-3.0 clock is 100MHz */
+diff --git a/lx2160acex7/include/common_pbi.rcwi b/lx2160acex7/include/common_pbi.rcwi
+index 848d48b..36b723d 100644
+--- a/lx2160acex7/include/common_pbi.rcwi
++++ b/lx2160acex7/include/common_pbi.rcwi
+@@ -10,7 +10,7 @@ write 0x2320000,0x20000000
+ /* Errata to write on scratch reg for validation */
+ #include <../lx2160asi/scratchrw1.rcw>
+ 
+-/* Boot Location Pointer */
++/* Set Boot Location Pointer (Fall-back when unset is BOOT_LOC) */
+ #if defined(LX_BOOTSOURCE_SDHC1)
+ #include <../lx2160asi/bootlocptr_sd.rcw>
+ #elif defined(LX_BOOTSOURCE_XSPI)
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+similarity index 100%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc1.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
new file mode 100644
index 000000000000..207a4e723dea
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
@@ -0,0 +1,55 @@
+From 22e16d5c3969a2fdfdb23423a8d28d5e80eea987 Mon Sep 17 00:00:00 2001
+From: Rabeeh Khoury <rabeeh@solid-run.com>
+Date: Mon, 23 Mar 2020 12:16:13 +0200
+Subject: [PATCH 5/6] add loadc, jumpc and jump to pbi instructions
+
+Add 'load conditional', 'jump condidional' and 'jump' to PBI
+instructions.
+
+Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
+---
+ rcw.py | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/rcw.py b/rcw.py
+index e7d3795..bcd088d 100755
+--- a/rcw.py
++++ b/rcw.py
+@@ -330,6 +330,34 @@ def build_pbi(lines):
+             v2 = struct.pack(endianess + 'L', p2)
+             subsection += v1
+             subsection += v2
++        elif op == 'loadc':
++            if p1 == None or p2 == None:
++                print('Error: "loadc" instruction requires two parameters')
++                return ''
++            v1 = struct.pack(endianess + 'L', 0x80140000)
++            v2 = struct.pack(endianess + 'L', p1)
++            v3 = struct.pack(endianess + 'L', p2)
++            subsection += v1
++            subsection += v2
++            subsection += v3
++        elif op == 'jumpc':
++            if p1 == None or p2 == None:
++                print('Error: "jumpc" instruction requires two parameters')
++                return ''
++            v1 = struct.pack(endianess + 'L', 0x80850000)
++            v2 = struct.pack(endianess + 'L', p1)
++            v3 = struct.pack(endianess + 'L', p2)
++            subsection += v1
++            subsection += v2
++            subsection += v3
++        elif op == 'jump':
++            if p1 == None:
++                print('Error: "jump" instruction requires a parameter')
++                return ''
++            v1 = struct.pack(endianess + 'L', 0x80840000)
++            v2 = struct.pack(endianess + 'L', p1)
++            subsection += v1
++            subsection += v2
+         elif op == 'awrite':
+             if opsize == '.b5':
+                 # altconfig write with B=5 (16 bytes)
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch
new file mode 100644
index 000000000000..9c79a8050a4d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch
@@ -0,0 +1,836 @@
+From ac13e12390764b8770227c0032f62994ece7e17b Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 28 Sep 2024 17:40:04 +0200
+Subject: [PATCH 6/6] lx2160acex7: add configuration for both sdhc & xspi
+
+Add "auto" configuration supporting both sdhc and xspi boot sources.
+A special pbi section is added setting boot location pointer according
+to rcw source.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../rcw_2000_700_2400_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2600_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2900_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_3200_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2400_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2600_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2900_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_3200_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ lx2160acex7/include/common_pbi.rcwi           | 16 ++---
+ .../rcw_2000_700_2400_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2600_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2900_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_3200_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2000_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2400_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2600_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_2900_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_700_3200_8_5_2_auto.rcw          | 23 +++++++
+ .../rcw_2200_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ lx2160asi/bootlocptr_auto.rcw                 | 60 +++++++++++++++++++
+ 34 files changed, 453 insertions(+), 23 deletions(-)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+ create mode 100644 lx2160asi/bootlocptr_auto.rcw
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..ba0f82c
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+index 0299002..4d67915 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..b1723d3
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+index 90a27ac..0424418 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..fa59785
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+index 3a08744..be0d219 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..90ac8a4
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+index 19a3af1..e1f9092 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..464a285
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+index bf7af38..6f696f5 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..1ef7db6
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+index ff778ec..46d84cb 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..d021306
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+index 90cd09c..55e6b2b 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..bfef1d4
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+index 88731fa..2978d72 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 1
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/include/common_pbi.rcwi b/lx2160acex7/include/common_pbi.rcwi
+index 36b723d..7dd4be7 100644
+--- a/lx2160acex7/include/common_pbi.rcwi
++++ b/lx2160acex7/include/common_pbi.rcwi
+@@ -10,13 +10,6 @@ write 0x2320000,0x20000000
+ /* Errata to write on scratch reg for validation */
+ #include <../lx2160asi/scratchrw1.rcw>
+ 
+-/* Set Boot Location Pointer (Fall-back when unset is BOOT_LOC) */
+-#if defined(LX_BOOTSOURCE_SDHC1)
+-#include <../lx2160asi/bootlocptr_sd.rcw>
+-#elif defined(LX_BOOTSOURCE_XSPI)
+-#include <../lx2160asi/bootlocptr_nor.rcw>
+-#endif
+-
+ /* Errata for SATA controller */
+ #include <../lx2160asi/a010554.rcw>
+ 
+@@ -57,3 +50,12 @@ write 0x2320000,0x20000000
+ .pbi
+ write 0x1e00900,0x00000014
+ .end
++
++/* Set Boot Location Pointer (Fall-back when unset is BOOT_LOC) */
++#if defined(LX_BOOTSOURCE_SDHC)
++#include <../lx2160asi/bootlocptr_sd.rcw>
++#elif defined(LX_BOOTSOURCE_XSPI)
++#include <../lx2160asi/bootlocptr_nor.rcw>
++#else
++#include <../lx2160asi/bootlocptr_auto.rcw>
++#endif
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..1c23c5c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+index b77ed2c..c7b307e 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..87391ab
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+index 2d19602..a4c254c 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..9114f36
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+index d141116..88ea5f2 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..7e97984
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+index 8b5ec8d..486ade8 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..d59ceed
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+index 7763a4a..20f7d58 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..1bf815b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+index b238680..0f93cf2 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..01138dc
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+index 46b16ab..a06759e 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..e99a12b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+index dc9180f..dbc0a91 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+@@ -13,7 +13,7 @@
+  */
+ 
+ #define LX_SR 2
+-#define LX_BOOTSOURCE_SDHC1
++#define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160asi/bootlocptr_auto.rcw b/lx2160asi/bootlocptr_auto.rcw
+new file mode 100644
+index 0000000..24c7286
+--- /dev/null
++++ b/lx2160asi/bootlocptr_auto.rcw
+@@ -0,0 +1,60 @@
++/*
++ * Generic code for auto booting.
++ *
++ * For each boot source test rcw source, and set bootlocl/h accordingly.
++ *
++ * For single boot-source atf create_pbl adds block copy commands
++ * and sets boot location pointer.
++ * Automatic boot relies on rcw to include those commands;
++ * create_pbl merely replaces their arguments.
++ *
++ * Copyright 2020 Rabeeh Khoury <rabeeh@solid-run.com>
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ *
++ * Changelog:
++ * - 28/09/2024: changed formatting and comments
++ */
++.pbi
++/* Load condition PORSR1 and mask RCW_SRC */
++loadc 0x01e00000,0x07800000
++
++/* If it is 0x8 << 23 (SDHC1) then skip the following jump command */
++jumpc 0x00000014,0x04000000
++
++/* skip sdhc1 boot */
++jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++/* copy blocks from sdhc1 (atf create_pbl will fixup arguments) */
++blockcopy 0x08,0x0000a000,0x1800d000,0x00020000
++
++/* set boot location pointer for sdhc */
++write 0x01e00400,0x1800d000
++write 0x01e00404,0x00000000
++
++/* If it is 0x9 << 23 (SDHC2) then skip the following jump command */
++loadc 0x01e00000,0x07800000
++jumpc 0x00000014,0x04800000
++
++/* skip sdhc2 boot */
++jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++
++/* copy blocks from sdhc1 (atf create_pbl will fixup arguments) */
++blockcopy 0x09,0x0000a000,0x1800d000,0x00020000
++
++/* set boot location pointer for sdhc */
++write 0x01e00400,0x1800d000
++write 0x01e00404,0x00000000
++
++/* If it is 0xf << 23 (XSPI) then skip the following jump command */
++loadc 0x01e00000,0x07800000
++jumpc 0x00000014,0x07800000
++
++/* skip xspi boot */
++jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++
++/* copy blocks from xspi (atf create_pbl will fixup arguments) */
++blockcopy 0x0f,0x20009000,0x1800d000,0x00020000
++
++/* set boot location pointer for xspi */
++write 0x01e00400,0x20100000
++write 0x01e00404,0x00000000
++.end
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch
new file mode 100644
index 000000000000..7ca4db49763d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch
@@ -0,0 +1,90 @@
+From 86b80b4442027c2fa4f22bb3aa602abb0e15ff85 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 7 Oct 2024 14:37:13 +0200
+Subject: [PATCH] bootlocptr: reduce size of pbi section
+
+- Remove duplicate 'loadc' commands, the condition register value is not
+  affected by 'jump' and 'jumpc'. Saves 6 words.
+- Remove 'write' command for bootlocptr high byte, its value zero is
+  shared by all boot sources and implicitly initialised. Saves 6 words.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160asi/bootlocptr_auto.rcw | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/lx2160asi/bootlocptr_auto.rcw b/lx2160asi/bootlocptr_auto.rcw
+index 24c7286..08e7916 100644
+--- a/lx2160asi/bootlocptr_auto.rcw
++++ b/lx2160asi/bootlocptr_auto.rcw
+@@ -5,56 +5,47 @@
+  *
+  * For single boot-source atf create_pbl adds block copy commands
+  * and sets boot location pointer.
+- * Automatic boot relies on rcw to include those commands;
+- * create_pbl merely replaces their arguments.
++ * Automatic boot relies on rcw to include the blockcopy and bootlocptr
++ * commands, create_pbl then replaces their arguments.
+  *
+  * Copyright 2020 Rabeeh Khoury <rabeeh@solid-run.com>
+  * Copyright 2024 Josua Mayer <josua@solid-run.com>
+  *
+  * Changelog:
+  * - 28/09/2024: changed formatting and comments
++ * - 07/10/2024: removed unnecessary commands to reduce size
+  */
+ .pbi
+ /* Load condition PORSR1 and mask RCW_SRC */
+ loadc 0x01e00000,0x07800000
+ 
+-/* If it is 0x8 << 23 (SDHC1) then skip the following jump command */
++/* If condition is 0x8 << 23 (SDHC1) then skip the following jump command */
+ jumpc 0x00000014,0x04000000
+ 
+ /* skip sdhc1 boot */
+-jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++jump 0x20 /* this jump + blockcopy = (4+4+4+4)+(4+4)=24 bytes */
++
+ /* copy blocks from sdhc1 (atf create_pbl will fixup arguments) */
+ blockcopy 0x08,0x0000a000,0x1800d000,0x00020000
+-
+-/* set boot location pointer for sdhc */
+ write 0x01e00400,0x1800d000
+-write 0x01e00404,0x00000000
+ 
+-/* If it is 0x9 << 23 (SDHC2) then skip the following jump command */
+-loadc 0x01e00000,0x07800000
++/* If condition is 0x9 << 23 (SDHC2) then skip the following jump command */
+ jumpc 0x00000014,0x04800000
+ 
+ /* skip sdhc2 boot */
+-jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++jump 0x20 /* this jump + blockcopy = (4+4+4+4)+(4+4)=24 bytes */
+ 
+ /* copy blocks from sdhc1 (atf create_pbl will fixup arguments) */
+ blockcopy 0x09,0x0000a000,0x1800d000,0x00020000
+-
+-/* set boot location pointer for sdhc */
+ write 0x01e00400,0x1800d000
+-write 0x01e00404,0x00000000
+ 
+-/* If it is 0xf << 23 (XSPI) then skip the following jump command */
+-loadc 0x01e00000,0x07800000
++/* If condition is 0xf << 23 (XSPI) then skip the following jump command */
+ jumpc 0x00000014,0x07800000
+ 
+ /* skip xspi boot */
+-jump 0x28 /* this jump + blockcopy + write = (4+4+4+4)+(4+4)+2x(4+4)=40 bytes */
++jump 0x20 /* this jump + blockcopy = (4+4+4+4)+(4+4)=24 bytes */
+ 
+ /* copy blocks from xspi (atf create_pbl will fixup arguments) */
+ blockcopy 0x0f,0x20009000,0x1800d000,0x00020000
+-
+-/* set boot location pointer for xspi */
+-write 0x01e00400,0x20100000
+-write 0x01e00404,0x00000000
++write 0x01e00400,0x1800d000
+ .end
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch
new file mode 100644
index 000000000000..fbbbdffc2876
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch
@@ -0,0 +1,475 @@
+From 7ef0c57ae7c852bb8f35310b0bd5708bb2a98c4a Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 8 Oct 2024 12:30:42 +0200
+Subject: [PATCH 8/9] lx2160acex7: change 2.2GHz configuration platform clock
+ to 750MHz
+
+2.2GHz cpu clock is only for accordingly binned part number from NXP.
+These parts support platform clock up to 750MHz.
+
+Update the configuration accordingly to 2200_750_xxxx and drop the
+combination with 2200_700.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ ...2400_8_5_2_auto.rcw => rcw_2200_750_2400_8_5_2_auto.rcw} | 2 +-
+ ...2400_8_5_2_sdhc.rcw => rcw_2200_750_2400_8_5_2_sdhc.rcw} | 2 +-
+ ...2400_8_5_2_xspi.rcw => rcw_2200_750_2400_8_5_2_xspi.rcw} | 2 +-
+ ...2600_8_5_2_auto.rcw => rcw_2200_750_2600_8_5_2_auto.rcw} | 2 +-
+ ...2600_8_5_2_sdhc.rcw => rcw_2200_750_2600_8_5_2_sdhc.rcw} | 2 +-
+ ...2600_8_5_2_xspi.rcw => rcw_2200_750_2600_8_5_2_xspi.rcw} | 2 +-
+ ...2900_8_5_2_auto.rcw => rcw_2200_750_2900_8_5_2_auto.rcw} | 2 +-
+ ...2900_8_5_2_sdhc.rcw => rcw_2200_750_2900_8_5_2_sdhc.rcw} | 2 +-
+ ...2900_8_5_2_xspi.rcw => rcw_2200_750_2900_8_5_2_xspi.rcw} | 2 +-
+ ...3200_8_5_2_auto.rcw => rcw_2200_750_3200_8_5_2_auto.rcw} | 2 +-
+ ...3200_8_5_2_sdhc.rcw => rcw_2200_750_3200_8_5_2_sdhc.rcw} | 2 +-
+ ...3200_8_5_2_xspi.rcw => rcw_2200_750_3200_8_5_2_xspi.rcw} | 2 +-
+ .../{pll_2200_700_xxxx.rcwi => pll_2200_750_xxxx.rcwi}      | 6 +++---
+ ...2400_8_5_2_auto.rcw => rcw_2200_750_2400_8_5_2_auto.rcw} | 2 +-
+ ...2400_8_5_2_sdhc.rcw => rcw_2200_750_2400_8_5_2_sdhc.rcw} | 2 +-
+ ...2400_8_5_2_xspi.rcw => rcw_2200_750_2400_8_5_2_xspi.rcw} | 2 +-
+ ...2600_8_5_2_auto.rcw => rcw_2200_750_2600_8_5_2_auto.rcw} | 2 +-
+ ...2600_8_5_2_sdhc.rcw => rcw_2200_750_2600_8_5_2_sdhc.rcw} | 2 +-
+ ...2600_8_5_2_xspi.rcw => rcw_2200_750_2600_8_5_2_xspi.rcw} | 2 +-
+ ...2900_8_5_2_auto.rcw => rcw_2200_750_2900_8_5_2_auto.rcw} | 2 +-
+ ...2900_8_5_2_sdhc.rcw => rcw_2200_750_2900_8_5_2_sdhc.rcw} | 2 +-
+ ...2900_8_5_2_xspi.rcw => rcw_2200_750_2900_8_5_2_xspi.rcw} | 2 +-
+ ...3200_8_5_2_auto.rcw => rcw_2200_750_3200_8_5_2_auto.rcw} | 2 +-
+ ...3200_8_5_2_sdhc.rcw => rcw_2200_750_3200_8_5_2_sdhc.rcw} | 2 +-
+ ...3200_8_5_2_xspi.rcw => rcw_2200_750_3200_8_5_2_xspi.rcw} | 2 +-
+ 25 files changed, 27 insertions(+), 27 deletions(-)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2400_8_5_2_auto.rcw => rcw_2200_750_2400_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2400_8_5_2_sdhc.rcw => rcw_2200_750_2400_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2400_8_5_2_xspi.rcw => rcw_2200_750_2400_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2600_8_5_2_auto.rcw => rcw_2200_750_2600_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2600_8_5_2_sdhc.rcw => rcw_2200_750_2600_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2600_8_5_2_xspi.rcw => rcw_2200_750_2600_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2900_8_5_2_auto.rcw => rcw_2200_750_2900_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2900_8_5_2_sdhc.rcw => rcw_2200_750_2900_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_2900_8_5_2_xspi.rcw => rcw_2200_750_2900_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_3200_8_5_2_auto.rcw => rcw_2200_750_3200_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_3200_8_5_2_sdhc.rcw => rcw_2200_750_3200_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7/clearfog-cx/{rcw_2200_700_3200_8_5_2_xspi.rcw => rcw_2200_750_3200_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7/include/{pll_2200_700_xxxx.rcwi => pll_2200_750_xxxx.rcwi} (61%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2400_8_5_2_auto.rcw => rcw_2200_750_2400_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2400_8_5_2_sdhc.rcw => rcw_2200_750_2400_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2400_8_5_2_xspi.rcw => rcw_2200_750_2400_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2600_8_5_2_auto.rcw => rcw_2200_750_2600_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2600_8_5_2_sdhc.rcw => rcw_2200_750_2600_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2600_8_5_2_xspi.rcw => rcw_2200_750_2600_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2900_8_5_2_auto.rcw => rcw_2200_750_2900_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2900_8_5_2_sdhc.rcw => rcw_2200_750_2900_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_2900_8_5_2_xspi.rcw => rcw_2200_750_2900_8_5_2_xspi.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_3200_8_5_2_auto.rcw => rcw_2200_750_3200_8_5_2_auto.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_3200_8_5_2_sdhc.rcw => rcw_2200_750_3200_8_5_2_sdhc.rcw} (91%)
+ rename lx2160acex7_rev2/clearfog-cx/{rcw_2200_700_3200_8_5_2_xspi.rcw => rcw_2200_750_3200_8_5_2_xspi.rcw} (91%)
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+index 464a285..533fba1 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 1
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+index 6f696f5..845ab35 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+index f23be28..765758e 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+index 1ef7db6..c09807c 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 1
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+index 46d84cb..7808b12 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+index 62cf89e..33bef8b 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+index d021306..0f3d8a3 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 1
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+index 55e6b2b..68452e0 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+index 13ec066..0069109 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+index bfef1d4..aa2fb4b 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 1
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+index 2978d72..6f06730 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+rename to lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+index b80f8cb..94dcc9b 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 1
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7/include/pll_2200_700_xxxx.rcwi b/lx2160acex7/include/pll_2200_750_xxxx.rcwi
+similarity index 61%
+rename from lx2160acex7/include/pll_2200_700_xxxx.rcwi
+rename to lx2160acex7/include/pll_2200_750_xxxx.rcwi
+index 91d1a9b..0f57b67 100644
+--- a/lx2160acex7/include/pll_2200_700_xxxx.rcwi
++++ b/lx2160acex7/include/pll_2200_750_xxxx.rcwi
+@@ -1,11 +1,11 @@
+ /*
+  * Core and Platform Clocks:
+- * - Platform: 700MHz
++ * - Platform: 750MHz
+  * - Core: 2200MHz
+  */
+ 
+-/* platform clock is system clock mul 14 div 2 = 700 */
+-SYS_PLL_RAT=14
++/* platform clock is system clock mul 15 div 2 = 750 */
++SYS_PLL_RAT=15
+ 
+ /* core clocks are 2200 */
+ CGA_PLL1_RAT=22
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+index d59ceed..4185ea6 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 2
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+index 20f7d58..93b10d2 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+index 9643b52..feb3e42 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2400_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+index 1bf815b..e04fcfb 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 2
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+index 0f93cf2..32225fe 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+index 79cea0d..6fbba40 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2600_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+index 01138dc..b9797ca 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 2
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+index a06759e..a7b5bd2 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+index b12898a..273d91c 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_2900_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+index e99a12b..046adc8 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+@@ -13,7 +13,7 @@
+ 
+ #define LX_SR 2
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+index dbc0a91..9798b74 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_SDHC
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+similarity index 91%
+rename from lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
+rename to lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+index c2ff13a..6b875e7 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_700_3200_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+@@ -15,7 +15,7 @@
+ #define LX_SR 2
+ #define LX_BOOTSOURCE_XSPI
+ #include <../lx2160asi/lx2160a.rcwi>
+-#include <../lx2160acex7/include/pll_2200_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+ #include <../lx2160acex7/include/common.rcwi>
+ #include <../lx2160acex7/include/SD1_8.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch
new file mode 100644
index 000000000000..0e680661f350
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch
@@ -0,0 +1,420 @@
+From 51af4e2a98e234e27a0127b2455b6049ce8097e2 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 8 Oct 2024 12:44:10 +0200
+Subject: [PATCH] lx2160acex7: add configuration for fraction ddr speed 2666
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../rcw_2000_700_2666_8_5_2_auto.rcw          | 23 +++++++++++++++++
+ .../rcw_2000_700_2666_8_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_8_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_auto.rcw          | 23 +++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ lx2160acex7/include/pll_xxxx_xxx_2666.rcwi    | 12 +++++++++
+ .../rcw_2000_700_2666_8_5_2_auto.rcw          | 23 +++++++++++++++++
+ .../rcw_2000_700_2666_8_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_8_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_auto.rcw          | 23 +++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_8_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ 13 files changed, 304 insertions(+)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/include/pll_xxxx_xxx_2666.rcwi
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..8178257
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..6f362cf
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+new file mode 100644
+index 0000000..cb6614a
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..6822342
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..f111731
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+new file mode 100644
+index 0000000..112f017
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/include/pll_xxxx_xxx_2666.rcwi b/lx2160acex7/include/pll_xxxx_xxx_2666.rcwi
+new file mode 100644
+index 0000000..06d3da1
+--- /dev/null
++++ b/lx2160acex7/include/pll_xxxx_xxx_2666.rcwi
+@@ -0,0 +1,12 @@
++/*
++ * DDR Rate: 2666MHz
++ *
++ * DDR PHY Clock (half ddr clock, quarter mts rate)
++ * multiplier = 20 (20)
++ * divider = 3 (2)
++ * 100MHz x 20 / 3 = 666MHz (MTS = 4 x 666 = 2666MHz)
++ */
++MEM_PLL_RAT=20
++MEM_PLL_CFG=2
++MEM2_PLL_RAT=20
++MEM2_PLL_CFG=2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..73efdfa
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..5ac0305
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+new file mode 100644
+index 0000000..ffc7388
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_8_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+new file mode 100644
+index 0000000..0206680
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..0213f6c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+new file mode 100644
+index 0000000..d31d063
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_8_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  8
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_8.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch
new file mode 100644
index 000000000000..e246e2741a25
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch
@@ -0,0 +1,220 @@
+From 19067dac1cea330e12cf3594cf6ca2a7a3d257be Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 11 Oct 2024 16:39:12 +0200
+Subject: [PATCH] add configuration solidrun internal lx2160a-cex6 evaluation
+ board
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex6_rev2/Makefile                     |  1 +
+ lx2160acex6_rev2/README                       |  0
+ .../evb/rcw_2000_700_2900_3_3_2_auto.rcw      | 22 +++++
+ lx2160acex6_rev2/include/common.rcwi          | 88 +++++++++++++++++++
+ lx2160acex7/include/SD1_3.rcwi                | 27 ++++++
+ lx2160acex7/include/SD2_3.rcwi                | 24 +++++
+ 6 files changed, 162 insertions(+)
+ create mode 100644 lx2160acex6_rev2/Makefile
+ create mode 100644 lx2160acex6_rev2/README
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/include/common.rcwi
+ create mode 100644 lx2160acex7/include/SD1_3.rcwi
+ create mode 100644 lx2160acex7/include/SD2_3.rcwi
+
+diff --git a/lx2160acex6_rev2/Makefile b/lx2160acex6_rev2/Makefile
+new file mode 100644
+index 0000000..f77e46b
+--- /dev/null
++++ b/lx2160acex6_rev2/Makefile
+@@ -0,0 +1 @@
++include ../Makefile.inc
+diff --git a/lx2160acex6_rev2/README b/lx2160acex6_rev2/README
+new file mode 100644
+index 0000000..e69de29
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..8d14387
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+@@ -0,0 +1,22 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/include/common.rcwi b/lx2160acex6_rev2/include/common.rcwi
+new file mode 100644
+index 0000000..8cc5ec7
+--- /dev/null
++++ b/lx2160acex6_rev2/include/common.rcwi
+@@ -0,0 +1,88 @@
++/*
++ * LX2160A COM-Express Type 6 Common Configuration
++ */
++
++/* C[5:8]_PLL are CG[5:8] div 1 */
++C5_PLL_SEL=0
++C6_PLL_SEL=0
++C7_PLL_SEL=0
++C8_PLL_SEL=0
++/* Cluster group A clock is PLL1 div 1 (unused on LX2160A) */
++HWA_CGA_M1_CLK_SEL=1
++/* Cluster group B clock is PLL2 div 2 (for DCE) */
++HWA_CGB_M1_CLK_SEL=6
++/*
++ * fall-back boot-mode when DCFG boot location pointer registers are null
++ * - 0b10101 (21): OCRAM
++ * - 0b11010 (26): XSPI
++ */
++BOOT_LOC=21
++/* SYSCLK is 100MHz */
++SYSCLK_FREQ=600
++/* USB-3.0 clock is 100MHz */
++USB3_CLK_FSEL=39
++
++/* IIC1 is I2C */
++IIC1_PMUX=0
++/* IIC2 is SD Card-Detect */
++IIC2_PMUX=6
++/* IIC3 is I2C */
++IIC3_PMUX=0
++/* IIC4 is I2C */
++IIC4_PMUX=0
++/* IIC5 SCL/SDA are SPI3_SOUT/SPI3_SIN */
++IIC5_PMUX=3
++/* IIC6 is PHY reset gpio */
++IIC6_PMUX=1
++/* SDHC1 CMD/CLK/DAT[0:3]/VSEL are SDHC1 CMD/CLK/DAT[0:3]/SPI3_PCS0 */
++SDHC1_BASE_PMUX=3
++/* SDHC1_DS is SPI3_SCK */
++SDHC1_DS_PMUX=2
++/* SDHC1_CMD_DIR (A4) / SDHC1_DAT0_DIR (B3) / SDHC1_DAT123_DIR (C3) are SPI3_PCS[1:3] */
++SDHC1_DIR_PMUX=3
++/* USB[1:2]_DRVVBUS/PWRFAULT are GPIO4[28:25] (unused) */
++USB_EXT_PMUX=1
++/* XSPI1_A_DQS/SCK/CS0_B/CS1_B are SPI */
++XSPI1_A_BASE_PMUX=0
++/* XSPI1_A_DATA[3:0] are SPI */
++XSPI1_A_DATA30_PMUX=0
++/* XSPI1_A_DATA[7:4] are SPI */
++XSPI1_A_DATA74_PMUX=0
++/* ASLEEP is ASLEEP (unused, bootstrap) */
++ASLEEP_PMUX=0
++/* EVT[2:0] are GPIO3[14:12] */
++EVT20_PMUX=1
++/* EVT[4:3] are GPIO3[16:15] */
++EVT43_PMUX=1
++/* CLK_OUT is GPIO (unused) */
++CLK_OUT_PMUX=1
++/* IRQ[3:0] are GPIO3[3:0] */
++IRQ03_00_PMUX=1
++/* IRQ[7:4] are GPIO3[7:4] */
++IRQ07_04_PMUX=1
++/* IRQ[11:8] are GPIO3[11:8] */
++IRQ11_08_PMUX=1
++/* EC1_* are RGMII */
++EC1_PMUX=0
++/* EC2_* are GPIO4[23:12] */
++EC2_PMUX=1
++/* EC_GTX_CLK125 is PTP */
++GTX_CLK_PMUX=0
++/* UART1_SOUT/SIN are UART1 */
++UART1_SOUTSIN_PMUX=0
++/* UART1_RTS/CTS_B are UART3_SOUT/SIN */
++UART1_RTSCTS_PMUX=2
++/* UART2_SOUT/SIN are UART2 */
++UART2_SOUTSIN_PMUX=0
++/* UART2_RTS/CTS_B are UART4_SOUT/SIN */
++UART2_RTSCTS_PMUX=2
++/* SDHC2_CMD/DAT[3:0]/DS/CLK are SDHC */
++SDHC2_BASE_PMUX=0
++/* SDHC2_DAT[7:4] are SDHC */
++SDHC2_DAT74_PMUX=0
++
++/*
++ * Original SolidRun Settings in LSDK-21.08
++ *
++ * HWA_CGB_M1_CLK_SEL=7 // Cluster Group B PLL 2 / 3 is clock
++ */
+diff --git a/lx2160acex7/include/SD1_3.rcwi b/lx2160acex7/include/SD1_3.rcwi
+new file mode 100644
+index 0000000..a49adb3
+--- /dev/null
++++ b/lx2160acex7/include/SD1_3.rcwi
+@@ -0,0 +1,27 @@
++/*
++ * Serdes 1 Reference Clocks:
++ * - PLLF = 100MHz
++ * - PLLS = 161.1328125MHz
++ */
++
++/* Serdes 1 Protocol 3: 4x10Gbps + 1xPCI-e-x4 */
++SRDS_PRTCL_S1=3
++
++/* Enable Serdes 1 PLLF */
++SRDS_PLL_PD_PLL1=0
++
++/* Don't use Serdes 1 PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S1=0
++
++/* Enable Serdes 1 PLLS */
++SRDS_PLL_PD_PLL2=0
++
++/*
++ * Select Serdes 1 PLLF frequency 100MHz for pcie: Bit 0 = 0
++ * Select Serdes 1 PLLS frequency 161.1328125MHz (not documented in RM) for usxgmii: Bit 1 = 1
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932-933)
++ */
++SRDS_PLL_REF_CLK_SEL_S1=2
++
++/* Support up to PCI-e Gen 3 */
++SRDS_DIV_PEX_S1=1
+diff --git a/lx2160acex7/include/SD2_3.rcwi b/lx2160acex7/include/SD2_3.rcwi
+new file mode 100644
+index 0000000..724ed9f
+--- /dev/null
++++ b/lx2160acex7/include/SD2_3.rcwi
+@@ -0,0 +1,24 @@
++/*
++ * Serdes 2 Reference Clocks:
++ * - PLLF = 100MHz
++ * - PLLS = 100MHz
++ */
++
++/* Serdes 2 Protocol 3: 2xPCI-e-x4 */
++SRDS_PRTCL_S2=3
++
++/* Enable Serdes 2 PLLF */
++SRDS_PLL_PD_PLL3=0
++
++/* Enable Serdes 2 PLLS */
++SRDS_PLL_PD_PLL4=0
++
++/* Don't use Serdes 2 PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S2=0
++
++/*
++ * Select Serdes 2 PLLF frequency 100MHz (Bit 0)
++ * Select Serdes 2 PLLS frequency 100MHz (Bit 1)
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932-933)
++ */
++SRDS_PLL_REF_CLK_SEL_S2=0
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch
new file mode 100644
index 000000000000..2134c7c146d9
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch
@@ -0,0 +1,35 @@
+From e42d8bf470388b16c4addb47b17669a6967bebe2 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 20 Oct 2024 15:39:21 +0200
+Subject: [PATCH] lx2160acex7: enable A-050426 workaround for silicon one
+
+A-050426 affects both Silicon revisions 1 and 2, enable for 1 as well.
+
+Note this significantly increases size of PBI and currently leads to
+issues with autoboot support. Plain sdhc or xspi builds continue to
+work.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex7/include/common_pbi.rcwi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lx2160acex7/include/common_pbi.rcwi b/lx2160acex7/include/common_pbi.rcwi
+index 7dd4be7..bb0f8bc 100644
+--- a/lx2160acex7/include/common_pbi.rcwi
++++ b/lx2160acex7/include/common_pbi.rcwi
+@@ -33,10 +33,10 @@ write 0x2320000,0x20000000
+ 
+ /*SerDes Errata A-050479*/
+ #include <../lx2160asi/a050479.rcw>
++#endif
+ 
+ /* Errata A-050426 */
+ #include <../lx2160asi/a050426.rcw>
+-#endif
+ 
+ /*
+  * FlexSPI controller supports modifcation of the FlexSPI Clock
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch
new file mode 100644
index 000000000000..157747f84391
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch
@@ -0,0 +1,87 @@
+From 30773f1070b4a315bcaa041e85ee2bdf8e04bf5b Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 20 Oct 2024 15:45:00 +0200
+Subject: [PATCH 12/13] lx2160acex6: enable pci errata workarounds for all
+ active ports
+
+SolidRun internal cex6 evaluation baord uses PEX2, PEX3, PEX4 and PEX5.
+Include workarounds for A-008851 and A-009531 for all available ports.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../evb/rcw_2000_700_2900_3_3_2_auto.rcw      |  2 +-
+ lx2160acex6_rev2/include/common_pbi.rcwi      | 52 +++++++++++++++++++
+ 2 files changed, 53 insertions(+), 1 deletion(-)
+ create mode 100644 lx2160acex6_rev2/include/common_pbi.rcwi
+
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+index 8d14387..6ae1090 100644
+--- a/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+@@ -19,4 +19,4 @@
+ #include <../lx2160acex7/include/SD1_3.rcwi>
+ #include <../lx2160acex7/include/SD2_3.rcwi>
+ #include <../lx2160acex7/include/SD3_2.rcwi>
+-#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/include/common_pbi.rcwi b/lx2160acex6_rev2/include/common_pbi.rcwi
+new file mode 100644
+index 0000000..aaadeb2
+--- /dev/null
++++ b/lx2160acex6_rev2/include/common_pbi.rcwi
+@@ -0,0 +1,52 @@
++/*
++ * LX2160A COM-Express Type 6 Common Configuration
++ */
++
++/* Drive the fan full speed pin */
++.pbi
++write 0x2320000,0x20000000
++.end
++
++/* Errata to write on scratch reg for validation */
++#include <../lx2160asi/scratchrw1.rcw>
++
++/* Errata for SATA controller */
++#include <../lx2160asi/a010554.rcw>
++
++#if LX_SR == 1
++/* Errata for PCIe controller */
++#include <../lx2160asi/a011270.rcw>
++#include <../lx2160asi/a050234.rcw>
++#endif
++
++/* common PBI commands */
++#include <../lx2160asi/common.rcw>
++
++#if LX_SR == 2
++/*PCIe Errata A-009531*/
++#include <../lx2160asi/a009531_PEX2.rcw>
++#include <../lx2160asi/a009531_PEX3.rcw>
++#include <../lx2160asi/a009531_PEX4.rcw>
++#include <../lx2160asi/a009531_PEX5.rcw>
++
++/*PCIe Errata A-008851*/
++#include <../lx2160asi/a008851_PEX2.rcw>
++#include <../lx2160asi/a008851_PEX3.rcw>
++#include <../lx2160asi/a008851_PEX4.rcw>
++#include <../lx2160asi/a008851_PEX5.rcw>
++
++/*SerDes Errata A-050479*/
++#include <../lx2160asi/a050479.rcw>
++#endif
++
++/* Errata A-050426 */
++#include <../lx2160asi/a050426.rcw>
++
++/* Set Boot Location Pointer (Fall-back when unset is BOOT_LOC) */
++#if defined(LX_BOOTSOURCE_SDHC)
++#include <../lx2160asi/bootlocptr_sd.rcw>
++#elif defined(LX_BOOTSOURCE_XSPI)
++#include <../lx2160asi/bootlocptr_nor.rcw>
++#else
++#include <../lx2160asi/bootlocptr_auto.rcw>
++#endif
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch
new file mode 100644
index 000000000000..e8ab196a20bd
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch
@@ -0,0 +1,42 @@
+From 4cd3955a69be423a48eefccc27442c148ece8ffd Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 20 Oct 2024 15:51:12 +0200
+Subject: [PATCH 13/13] lx2160acex6: add configuration for 2.2GHz binned soc
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../evb/rcw_2200_750_3200_3_3_2_auto.rcw      | 22 +++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
+
+diff --git a/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..a66d4ec
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
+@@ -0,0 +1,22 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch
new file mode 100644
index 000000000000..a7d81aeb668c
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch
@@ -0,0 +1,27 @@
+From 40ea49cde613dad5f63d157f40180ebe4f07f7f9 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 27 May 2023 17:20:22 +0300
+Subject: [PATCH 14/15] lx2162aqds: re-enable dpmac11
+
+dpmac11 was unintentionally disabled along with dpmac7-10.
+Fix the initializer value of DEVDISR2 to only disable dpmac7-10.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2162aqds/disable_mac7_10.rcw | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lx2162aqds/disable_mac7_10.rcw b/lx2162aqds/disable_mac7_10.rcw
+index ef3edba..d52589c 100644
+--- a/lx2162aqds/disable_mac7_10.rcw
++++ b/lx2162aqds/disable_mac7_10.rcw
+@@ -11,5 +11,5 @@
+ */
+ 
+ .pbi
+-write 0x1e00074,0x00007c0
++write 0x1e00074,0x00003c0
+ .end
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch
new file mode 100644
index 000000000000..83c6caea771a
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch
@@ -0,0 +1,532 @@
+From 8aa66ef6694c03231f6432f0d62e40dffa88d3e4 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 27 Oct 2024 18:26:26 +0100
+Subject: [PATCH] add configuration for lx2162a som and clearfog evaluation
+ board
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex7/include/SD1_0.rcwi                |  17 +++
+ lx2160acex7/include/SD2_0.rcwi                |  17 +++
+ lx2160acex7/include/SD3_0.rcwi                |  20 +++
+ lx2160acex7/include/pll_2000_650_xxxx.rcwi    |  15 ++
+ lx2162asom_rev2/Makefile                      |   1 +
+ lx2162asom_rev2/README                        |   0
+ .../rcw_2000_650_2900_18_11_0_auto.rcw        |  22 +++
+ .../rcw_2000_650_2900_18_7_0_auto.rcw         |  22 +++
+ .../rcw_2000_650_2900_18_9_0_auto.rcw         |  19 +++
+ lx2162asom_rev2/include/SD1_18.rcwi           |  18 +++
+ lx2162asom_rev2/include/SD2_11.rcwi           |  25 ++++
+ lx2162asom_rev2/include/SD2_7.rcwi            |  25 ++++
+ lx2162asom_rev2/include/SD2_9.rcwi            |  22 +++
+ lx2162asom_rev2/include/common.rcwi           | 128 ++++++++++++++++++
+ lx2162asom_rev2/include/common_pbi.rcwi       |  51 +++++++
+ 15 files changed, 402 insertions(+)
+ create mode 100644 lx2160acex7/include/SD1_0.rcwi
+ create mode 100644 lx2160acex7/include/SD2_0.rcwi
+ create mode 100644 lx2160acex7/include/SD3_0.rcwi
+ create mode 100644 lx2160acex7/include/pll_2000_650_xxxx.rcwi
+ create mode 100644 lx2162asom_rev2/Makefile
+ create mode 100644 lx2162asom_rev2/README
+ create mode 100644 lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_11_0_auto.rcw
+ create mode 100644 lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_7_0_auto.rcw
+ create mode 100644 lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_9_0_auto.rcw
+ create mode 100644 lx2162asom_rev2/include/SD1_18.rcwi
+ create mode 100644 lx2162asom_rev2/include/SD2_11.rcwi
+ create mode 100644 lx2162asom_rev2/include/SD2_7.rcwi
+ create mode 100644 lx2162asom_rev2/include/SD2_9.rcwi
+ create mode 100644 lx2162asom_rev2/include/common.rcwi
+ create mode 100644 lx2162asom_rev2/include/common_pbi.rcwi
+
+diff --git a/lx2160acex7/include/SD1_0.rcwi b/lx2160acex7/include/SD1_0.rcwi
+new file mode 100644
+index 0000000..718a441
+--- /dev/null
++++ b/lx2160acex7/include/SD1_0.rcwi
+@@ -0,0 +1,17 @@
++/* Serdes 1 Protocol 0: Disabled */
++SRDS_PRTCL_S1=0
++
++/* Disable Serdes 1 PLLF */
++SRDS_PLL_PD_PLL1=1
++
++/* Disable Serdes 1 PLLF reference clock */
++SRDS_REFCLKF_DIS_S2=1
++
++/* Don't use Serdes 1 PLLF as reference for PLLS */
++SRDS_INTRA_REF_CLK_S1=0
++
++/* Disable Serdes 1 PLLS */
++SRDS_PLL_PD_PLL2=1
++
++/* Select Serdes 1 PLL Default Fequencies (don't care) */
++SRDS_PLL_REF_CLK_SEL_S1=0
+diff --git a/lx2160acex7/include/SD2_0.rcwi b/lx2160acex7/include/SD2_0.rcwi
+new file mode 100644
+index 0000000..6af65a3
+--- /dev/null
++++ b/lx2160acex7/include/SD2_0.rcwi
+@@ -0,0 +1,17 @@
++/* Serdes 2 Protocol 0: Disabled */
++SRDS_PRTCL_S2=0
++
++/* Disable Serdes 2 PLLF */
++SRDS_PLL_PD_PLL3=1
++
++/* Disable Serdes 2 PLLF reference clock */
++SRDS_REFCLKF_DIS_S2=1
++
++/* Don't use Serdes 2 PLLF as reference for PLLS */
++SRDS_INTRA_REF_CLK_S2=0
++
++/* Disable Serdes 2 PLLS */
++SRDS_PLL_PD_PLL4=1
++
++/* Select Serdes 2 PLL Default Fequencies (don't care) */
++SRDS_PLL_REF_CLK_SEL_S2=0
+diff --git a/lx2160acex7/include/SD3_0.rcwi b/lx2160acex7/include/SD3_0.rcwi
+new file mode 100644
+index 0000000..250437c
+--- /dev/null
++++ b/lx2160acex7/include/SD3_0.rcwi
+@@ -0,0 +1,20 @@
++/* Serdes 3 Protocol 0: Disabled */
++SRDS_PRTCL_S3=0
++
++/* Disable Serdes 3 PLLF */
++SRDS_PLL_PD_PLL5=1
++
++/* Disable Serdes 3 PLLF reference clock */
++SRDS_REFCLKF_DIS_S3=1
++
++/* Don't use Serdes 3 PLLF as reference for PLLS */
++SRDS_INTRA_REF_CLK_S3=0
++
++/* Disable Serdes 3 PLLS */
++SRDS_PLL_PD_PLL6=1
++
++/*
++ * Select Serdes 3 PLL Default Fequencies (don't care)
++ * (See QorIQ LX2162A Reference Manual, Rev. 1, 12/2021, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 936-937)
++ */
++SRDS_PLL_REF_CLK_SEL_S3=0
+diff --git a/lx2160acex7/include/pll_2000_650_xxxx.rcwi b/lx2160acex7/include/pll_2000_650_xxxx.rcwi
+new file mode 100644
+index 0000000..0bc7e8b
+--- /dev/null
++++ b/lx2160acex7/include/pll_2000_650_xxxx.rcwi
+@@ -0,0 +1,15 @@
++/*
++ * Core and Platform Clocks:
++ * - Platform: 650MHz
++ * - Core: 2000MHz
++ */
++
++/* platform clock is system clock mul 13 div 2 = 650 */
++SYS_PLL_RAT=13
++
++/* core clocks are 2000 */
++CGA_PLL1_RAT=20
++CGA_PLL2_RAT=20
++CGB_PLL1_RAT=20
++/* same as all nxp 2000_650_* */
++CGB_PLL2_RAT=8
+diff --git a/lx2162asom_rev2/Makefile b/lx2162asom_rev2/Makefile
+new file mode 100644
+index 0000000..f77e46b
+--- /dev/null
++++ b/lx2162asom_rev2/Makefile
+@@ -0,0 +1 @@
++include ../Makefile.inc
+diff --git a/lx2162asom_rev2/README b/lx2162asom_rev2/README
+new file mode 100644
+index 0000000..e69de29
+diff --git a/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_11_0_auto.rcw b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_11_0_auto.rcw
+new file mode 100644
+index 0000000..cc1b0e5
+--- /dev/null
++++ b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_11_0_auto.rcw
+@@ -0,0 +1,22 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  11
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 650  MHz
++ * DDR      -- 2900 MT/s
++ *
++ */
++
++#define HAVE_PEX3
++#define HAVE_PEX4
++
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_650_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2162asom_rev2/include/common.rcwi>
++#include <../lx2162asom_rev2/include/SD1_18.rcwi>
++#include <../lx2162asom_rev2/include/SD2_11.rcwi>
++#include <../lx2160acex7/include/SD3_0.rcwi>
++#include <../lx2162asom_rev2/include/common_pbi.rcwi>
+diff --git a/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_7_0_auto.rcw b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_7_0_auto.rcw
+new file mode 100644
+index 0000000..475abbb
+--- /dev/null
++++ b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_7_0_auto.rcw
+@@ -0,0 +1,22 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  7
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 650  MHz
++ * DDR      -- 2900 MT/s
++ *
++ */
++
++#define HAVE_PEX3
++#define HAVE_PEX4
++
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_650_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2162asom_rev2/include/common.rcwi>
++#include <../lx2162asom_rev2/include/SD1_18.rcwi>
++#include <../lx2162asom_rev2/include/SD2_7.rcwi>
++#include <../lx2160acex7/include/SD3_0.rcwi>
++#include <../lx2162asom_rev2/include/common_pbi.rcwi>
+diff --git a/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_9_0_auto.rcw b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_9_0_auto.rcw
+new file mode 100644
+index 0000000..4425597
+--- /dev/null
++++ b/lx2162asom_rev2/clearfog/rcw_2000_650_2900_18_9_0_auto.rcw
+@@ -0,0 +1,19 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  9
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 650  MHz
++ * DDR      -- 2900 MT/s
++ *
++ */
++
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_650_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2162asom_rev2/include/common.rcwi>
++#include <../lx2162asom_rev2/include/SD1_18.rcwi>
++#include <../lx2162asom_rev2/include/SD2_9.rcwi>
++#include <../lx2160acex7/include/SD3_0.rcwi>
++#include <../lx2162asom_rev2/include/common_pbi.rcwi>
+diff --git a/lx2162asom_rev2/include/SD1_18.rcwi b/lx2162asom_rev2/include/SD1_18.rcwi
+new file mode 100644
+index 0000000..34c5be3
+--- /dev/null
++++ b/lx2162asom_rev2/include/SD1_18.rcwi
+@@ -0,0 +1,18 @@
++/* Serdes 1 Protocol 18: 2x10Gbps + 2x25Gbps */
++SRDS_PRTCL_S1=18
++
++/* Enable Serdes 1 PLLF */
++SRDS_PLL_PD_PLL1=0
++
++/* Enable Serdes 1 PLLS */
++SRDS_PLL_PD_PLL2=0
++
++/* Use Serdes 1 PLLF for PLLS (LX2162A has no physical input for PLLS) */
++SRDS_INTRA_REF_CLK_S1=1
++
++/*
++ * Select Serdes 1 PLLF frequency 161.1328125MHz for 25GE mode (lanes 2+3): Bit 0 = 0
++ * Select Serdes 1 PLLS frequency 161.1328125MHz for 10GE mode (not documented in RM): Bit 1 = 1
++ * (See QorIQ LX2162A Reference Manual, Rev. 1, 12/2021, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932)
++ */
++SRDS_PLL_REF_CLK_SEL_S1=2
+diff --git a/lx2162asom_rev2/include/SD2_11.rcwi b/lx2162asom_rev2/include/SD2_11.rcwi
+new file mode 100644
+index 0000000..9434b7b
+--- /dev/null
++++ b/lx2162asom_rev2/include/SD2_11.rcwi
+@@ -0,0 +1,25 @@
++/* Serdes 2 Protocol 11: 6x1Gbps & 2x PCI-e x1 Gen 3 */
++SRDS_PRTCL_S2=11
++
++/* Enable Serdes 2 PLLF */
++SRDS_PLL_PD_PLL3=0
++
++/* Enable Serdes 2 PLLS */
++SRDS_PLL_PD_PLL4=0
++
++/* Use Serdes 2 PLLF for PLLS (to share PLLF 100MHz reference clock) */
++SRDS_INTRA_REF_CLK_S2=1
++
++/*
++ * Select Serdes 2 PLLF frequency 100MHz for PCI: Bit 0 = 0
++ * Select Serdes 2 PLLS frequency 100MHz for 1G mode: Bit 1 = 0
++ * (See QorIQ LX2162A Reference Manual, Rev. 1, 12/2021, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 934-935)
++ */
++SRDS_PLL_REF_CLK_SEL_S2=0
++
++/* Support up to PCI-e Gen 3 */
++SRDS_DIV_PEX_S2=1
++
++/* Configure Ethernet Controllers 1+2 Pins as GPIOs to avoid competing for WRIO MACs 17+18 */
++EC1_PMUX=1
++EC2_PMUX=1
+diff --git a/lx2162asom_rev2/include/SD2_7.rcwi b/lx2162asom_rev2/include/SD2_7.rcwi
+new file mode 100644
+index 0000000..eb25a86
+--- /dev/null
++++ b/lx2162asom_rev2/include/SD2_7.rcwi
+@@ -0,0 +1,25 @@
++/* Serdes 2 Protocol 7: 2x10Gbps 4x1Gbps & 2x PCI-e x1 Gen 2 */
++SRDS_PRTCL_S2=7
++
++/* Enable Serdes 2 PLLF */
++SRDS_PLL_PD_PLL3=0
++
++/* Enable Serdes 2 PLLS */
++SRDS_PLL_PD_PLL4=0
++
++/* Don't use Serdes 2 PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S2=0
++
++/*
++ * Select Serdes 2 PLLF frequency 100MHz for 1G (and pcie): Bit 0 = 0
++ * Select Serdes 2 PLLS frequency 156.25MHz for 10G mode: Bit 1 = 0
++ * (See QorIQ LX2162A Reference Manual, Rev. 1, 12/2021, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 934-935)
++ */
++SRDS_PLL_REF_CLK_SEL_S2=0
++
++/* Support up to PCI-e Gen 2 */
++SRDS_DIV_PEX_S2=2
++
++/* Configure Ethernet Controllers 1+2 Pins as GPIOs to avoid competing for WRIO MACs 17+18 */
++EC1_PMUX=1
++EC2_PMUX=1
+diff --git a/lx2162asom_rev2/include/SD2_9.rcwi b/lx2162asom_rev2/include/SD2_9.rcwi
+new file mode 100644
+index 0000000..68728ba
+--- /dev/null
++++ b/lx2162asom_rev2/include/SD2_9.rcwi
+@@ -0,0 +1,22 @@
++/* Serdes 2 Protocol 9: 8x1Gbps */
++SRDS_PRTCL_S2=9
++
++/* Disable Serdes 2 PLLF */
++SRDS_PLL_PD_PLL3=1
++
++/* Enable Serdes 2 PLLS */
++SRDS_PLL_PD_PLL4=0
++
++/* Use Serdes 2 PLLF for PLLS (to share PLLF 100MHz reference clock) */
++SRDS_INTRA_REF_CLK_S2=1
++
++/*
++ * Select Serdes 2 PLLF frequency 100MHz (don't care): Bit 0 = 0
++ * Select Serdes 2 PLLS frequency 100MHz for 1G mode: Bit 1 = 0
++ * (See QorIQ LX2162A Reference Manual, Rev. 1, 12/2021, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 934-935)
++ */
++SRDS_PLL_REF_CLK_SEL_S2=0
++
++/* Configure Ethernet Controllers 1+2 Pins as GPIOs to avoid competing for WRIO MACs 17+18 */
++EC1_PMUX=1
++EC2_PMUX=1
+diff --git a/lx2162asom_rev2/include/common.rcwi b/lx2162asom_rev2/include/common.rcwi
+new file mode 100644
+index 0000000..35a6db6
+--- /dev/null
++++ b/lx2162asom_rev2/include/common.rcwi
+@@ -0,0 +1,128 @@
++/*
++ * LX2162A SoM Common Configuration
++ */
++
++/* C[5:8]_PLL are CG[5:8] div 1 */
++C5_PLL_SEL=0
++C6_PLL_SEL=0
++C7_PLL_SEL=0
++C8_PLL_SEL=0
++/* Cluster group A clock is PLL1 div 1 (unused on LX2160A) */
++HWA_CGA_M1_CLK_SEL=1
++/* Cluster group B clock is PLL2 div 2 (for DCE) */
++HWA_CGB_M1_CLK_SEL=6
++/*
++ * fall-back boot-mode when DCFG boot location pointer registers are null
++ * - 0b10101 (21): OCRAM
++ * - 0b11010 (26): XSPI
++ */
++BOOT_LOC=21
++/* SYSCLK is 100MHz */
++SYSCLK_FREQ=600
++/* USB-3.0 clock is 100MHz */
++USB3_CLK_FSEL=39
++
++/* IIC1 is I2C */
++IIC1_PMUX=0
++/* IIC2 is SD Card-Detect */
++IIC2_PMUX=6
++/* IIC3 is I2C */
++IIC3_PMUX=0
++/* IIC4 is I2C (unused) */
++IIC4_PMUX=0
++/* IIC5 is I2C */
++IIC5_PMUX=0
++/* IIC6 is I2C (unused) */
++IIC6_PMUX=0
++/*
++ * SDHC1 CMD/CLK/VBUS/DAT[0:3] are SDHC
++ * SPI3_PCS0 is VSEL
++ */
++SDHC1_BASE_PMUX=0
++/* SDHC1_DS is GPIO (unused) */
++SDHC1_DS_PMUX=1
++/* SDHC1_CMD/DAT0/DAT1_DIR (SPI3_PCS[1:3]) are GPIO1[14:12] */
++SDHC1_DIR_PMUX=1
++/* USB[1:2]_DRVVBUS/PWRFAULT are GPIO4[28:25] (unused) */
++USB_EXT_PMUX=1
++/* XSPI1_A_DQS/SCK/CS0_B/CS1_B are SPI */
++XSPI1_A_BASE_PMUX=0
++/* XSPI1_A_DATA[3:0] are SPI */
++XSPI1_A_DATA30_PMUX=0
++/* XSPI1_A_DATA[7:4] are SPI */
++XSPI1_A_DATA74_PMUX=0
++/* ASLEEP is ASLEEP (unused) */
++ASLEEP_PMUX=0
++/* EVT[2:0] are GPIO3[14:12] */
++EVT20_PMUX=1
++/* EVT[4:3] are GPIO3[16:15] */
++EVT43_PMUX=1
++/* CLK_OUT is GPIO (unused) */
++CLK_OUT_PMUX=1
++/* IRQ[3:0] are GPIO3[3:0] */
++IRQ03_00_PMUX=1
++/* IRQ[7:4] are GPIO3[7:4] */
++IRQ07_04_PMUX=1
++/* IRQ[11:8] are GPIO3[11:8] */
++IRQ11_08_PMUX=1
++/* EC1_* are RGMII */
++EC1_PMUX=0
++/* EC2_* are PTP */
++EC2_PMUX=2
++/* EC_GTX_CLK125 is PTP */
++GTX_CLK_PMUX=0
++/* UART1_SOUT/SIN are UART1 */
++UART1_SOUTSIN_PMUX=0
++/* UART1_RTS/CTS_B are GPIO (unused) */
++UART1_RTSCTS_PMUX=1
++/* UART2_SOUT/SIN are UART2 */
++UART2_SOUTSIN_PMUX=0
++/* UART2_RTS/CTS_B are GPIO (unused) */
++UART2_RTSCTS_PMUX=1
++/* SDHC2_CMD/DAT[3:0]/DS/CLK are SDHC */
++SDHC2_BASE_PMUX=0
++/* SDHC2_DAT[7:4] are SDHC */
++SDHC2_DAT74_PMUX=0
++
++
++/* configure IIC1, IIC3, IIC5, IIC6 pins for i2c */
++IIC1_PMUX=0
++IIC3_PMUX=0
++IIC5_PMUX=0
++IIC6_PMUX=0
++
++/*
++ * Configure GPIOs:
++ * EVT0_B: GPIO3_DAT12
++ * EVT1_B: GPIO3_DAT13 (SFP 25 upper LED)
++ * EVT2_B: GPIO3_DAT14 (SFP 25 lower LED)
++ * EVT3_B: GPIO3_DAT15 (SFP 25 lower MODABS)
++ * EVT4_B: GPIO3_DAT16 (SFP 10 upper MODABS)
++ * PROC_IRQ0:  GPIO3_DAT00
++ * PROC_IRQ1:  GPIO3_DAT01 (SFP 10 lower MODABS)
++ * PROC_IRQ2:  GPIO3_DAT02
++ * PROC_IRQ3:  GPIO3_DAT03
++ * PROC_IRQ4:  GPIO3_DAT04
++ * PROC_IRQ5:  GPIO3_DAT05 (SFP 10 upper LED)
++ * PROC_IRQ6:  GPIO3_DAT06
++ * PROC_IRQ7:  GPIO3_DAT07
++ * PROC_IRQ8:  GPIO3_DAT08
++ * PROC_IRQ9:  GPIO3_DAT09
++ * PROC_IRQ10: GPIO3_DAT10 (SFP 25 upper MODABS)
++ * PROC_IRQ11: GPIO3_DAT11 (SFP 10 lower LED)
++ */
++EVT20_PMUX=1
++EVT43_PMUX=1
++IRQ03_00_PMUX=1
++IRQ07_04_PMUX=1
++IRQ11_08_PMUX=1
++
++/* Configure USB1 Pins for USB */
++USB_EXT_PMUX=0
++
++
++/*
++ * Original SolidRun Settings in LSDK-21.08
++ *
++ * HWA_CGB_M1_CLK_SEL=7 // Cluster Group B PLL 2 / 3 is clock
++ */
+diff --git a/lx2162asom_rev2/include/common_pbi.rcwi b/lx2162asom_rev2/include/common_pbi.rcwi
+new file mode 100644
+index 0000000..05f19fc
+--- /dev/null
++++ b/lx2162asom_rev2/include/common_pbi.rcwi
+@@ -0,0 +1,51 @@
++/*
++ * LX2162A SoM Common Configuration
++ */
++
++/* Errata to write on scratch reg for validation */
++#include <../lx2160asi/scratchrw1.rcw>
++
++/* common PBI commands */
++#include <../lx2160asi/common.rcw>
++
++/* PCIe Errata A-009531, A-008851 */
++#ifdef HAVE_PEX1
++#include <../lx2160asi/a009531_PEX1.rcw>
++#include <../lx2160asi/a008851_PEX1.rcw>
++#endif
++#ifdef HAVE_PEX3
++#include <../lx2160asi/a009531_PEX3.rcw>
++#include <../lx2160asi/a008851_PEX3.rcw>
++#endif
++#ifdef HAVE_PEX4
++#include <../lx2160asi/a009531_PEX4.rcw>
++#include <../lx2160asi/a008851_PEX4.rcw>
++#endif
++
++/* SerDes Errata A-050479 */
++#include <../lx2160asi/a050479.rcw>
++
++/* PEX2/5/6 clock disable (not available on LX2162) */
++#include <../lx2162aqds/disable_pci2_5_6.rcw>
++
++/* USB2 clock disable (not available on LX2162) */
++#include <../lx2162aqds/disable_usb2.rcw>
++
++/* MAC7 to MAC10 clock disable (not available on LX2162) */
++#include <../lx2162aqds/disable_mac7_10.rcw>
++
++/* DDR2 clock disable*/
++#include <../lx2162aqds/disable_ddr2.rcw>
++
++/* Errata A-050426 */
++#include <../lx2160asi/a050426.rcw>
++
++/* Set Boot Location Pointer (Fall-back when unset is BOOT_LOC) */
++#if defined(LX_BOOTSOURCE_SDHC)
++#include <../lx2160asi/bootlocptr_sd.rcw>
++#elif defined(LX_BOOTSOURCE_XSPI)
++#include <../lx2160asi/bootlocptr_nor.rcw>
++#else
++#include <../lx2160asi/bootlocptr_auto.rcw>
++#endif
++
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
new file mode 100644
index 000000000000..fb6688f50ac4
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
@@ -0,0 +1,2000 @@
+From c9c51751856fabca518d364ef344f5e1470f6669 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 31 Oct 2024 16:01:27 +0100
+Subject: [PATCH] lx2160acex7: clearfog-cx: add configuration for serdes 1
+ protocol 18
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ .../rcw_2000_700_2400_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2400_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ lx2160acex7/include/SD1_18.rcwi               | 24 ++++++++++++++++++
+ lx2160acex7/include/SD1_8.rcwi                |  4 +--
+ .../rcw_2000_700_2400_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2400_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2666_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2666_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_auto.rcw         | 23 +++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_sdhc.rcw         | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_18_5_2_xspi.rcw         | 25 +++++++++++++++++++
+ 62 files changed, 1486 insertions(+), 2 deletions(-)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/include/SD1_18.rcwi
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..9e95ac8
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..470237f
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..a13d207
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..ff8a674
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..8d73b20
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..c6595d2
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..3c2f588
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..4671e9a
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..91e4908
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..978d3a6
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..1d1a869
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..3f96225
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..732ca38
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..de60fca
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..1b44c27
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..f69abb1
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..09c62dc
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..f1c0c96
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..2b75335
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..7839ab2
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..901b323
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..951a9eb
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..4d6aec0
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..eb909ee
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..b430f80
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..c935b09
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..b1f39b4
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..d0736c2
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ */
++
++#define LX_SR 1
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..6410353
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..daa99df
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/include/SD1_18.rcwi b/lx2160acex7/include/SD1_18.rcwi
+new file mode 100644
+index 0000000..cf67395
+--- /dev/null
++++ b/lx2160acex7/include/SD1_18.rcwi
+@@ -0,0 +1,24 @@
++/*
++ * Serdes 1 Reference Clocks:
++ * - PLLF = 161.1328125MHz
++ * - PLLS = 100MHz
++ */
++
++/* Serdes 1 Protocol 18: 6x10Gbps + 2x25Gbps */
++SRDS_PRTCL_S1=18
++
++/* Enable PLLF */
++SRDS_PLL_PD_PLL1=0
++
++/* Use PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S1=1
++
++/* Enable PLLS */
++SRDS_PLL_PD_PLL2=0
++
++/*
++ * Select PLLF frequency 161.1328125MH for 25G mode: Bit 0 = 0
++ * Select PLLS frequency 161.1328125MHz for 10G mode: Bit 1 = 1
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932-933)
++ */
++SRDS_PLL_REF_CLK_SEL_S1=2
+diff --git a/lx2160acex7/include/SD1_8.rcwi b/lx2160acex7/include/SD1_8.rcwi
+index 87ce260..1646de8 100644
+--- a/lx2160acex7/include/SD1_8.rcwi
++++ b/lx2160acex7/include/SD1_8.rcwi
+@@ -1,7 +1,7 @@
+ /*
+  * Serdes 1 Reference Clocks:
+- * - PLLF = 100MHz
+- * - PLLS = 161.1328125MHz
++ * - PLLF = 161.1328125MHz
++ * - PLLS = 100MHz
+  */
+ 
+ /* Serdes 1 Protocol 8: 8x10Gbps */
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..6f454ad
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..a3bc9c9
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..144f54b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..2a11587
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..bb3437e
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..90eacf6
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..af17640
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..4dd1b96
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..d9c8671
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2666_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..2a23f78
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..cf44444
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..f93ef7f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..0067b24
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..290ebb1
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..e9e5e99
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..02b2961
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..1fa9e1f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..12f62c1
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..f951e53
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..227510c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..4a30d7f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..86b272d
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..03d233f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..8321f14
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2666_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2666 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2666.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..4444769
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..fc1ad2d
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..311d2df
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+new file mode 100644
+index 0000000..3665618
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+@@ -0,0 +1,23 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ */
++
++#define LX_SR 2
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..49b4d42
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC1
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+new file mode 100644
+index 0000000..bdfe337
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  18
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_18.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0017-lx2160acex7-add-configuration-for-serdes-1-protocol-.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0017-lx2160acex7-add-configuration-for-serdes-1-protocol-.patch
new file mode 100644
index 000000000000..238d1943f929
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0017-lx2160acex7-add-configuration-for-serdes-1-protocol-.patch
@@ -0,0 +1,49 @@
+From cbb5b8743e3790dd9172a6b9146e60dfaec221ac Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Wed, 6 Nov 2024 11:18:12 +0100
+Subject: [PATCH] lx2160acex7: add configuration for serdes 1 protocol 4
+
+This configuration can boot, but currently leads to issues on
+clearfog-cx in linux.
+Therefore no board configuration has been added beyond the include.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ lx2160acex7/include/SD1_4.rcwi | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+ create mode 100644 lx2160acex7/include/SD1_4.rcwi
+
+diff --git a/lx2160acex7/include/SD1_4.rcwi b/lx2160acex7/include/SD1_4.rcwi
+new file mode 100644
+index 0000000..3c6023a
+--- /dev/null
++++ b/lx2160acex7/include/SD1_4.rcwi
+@@ -0,0 +1,25 @@
++/*
++ * Serdes 1 Reference Clocks:
++ * - PLLF = 161.1328125MHz
++ * - PLLS = 100MHz
++ */
++
++/* Serdes 1 Protocol 4: 8x1Gbps */
++SRDS_PRTCL_S1=4
++
++/* Disable PLLF */
++SRDS_PLL_PD_PLL1=1
++SRDS_REFCLKF_DIS_S1=1
++
++/* Don't use PLLF for PLLS */
++SRDS_INTRA_REF_CLK_S1=0
++
++/* Enable PLLS */
++SRDS_PLL_PD_PLL2=0
++
++/*
++ * Select PLLF frequency 100MHz (don't care): Bit 0 = 0
++ * Select PLLS frequency 100MHz: Bit 1 = 0
++ * (See QorIQ LX2160A Reference Manual, Rev. 0, 07/2020, 4.9.8.9 Reset Control Word (RCW) Register Descriptions, Bits 932-933)
++ */
++SRDS_PLL_REF_CLK_SEL_S1=0
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0018-solidrun-add-script-generating-configs-from-template.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0018-solidrun-add-script-generating-configs-from-template.patch
new file mode 100644
index 000000000000..f13293f32fbe
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0018-solidrun-add-script-generating-configs-from-template.patch
@@ -0,0 +1,1476 @@
+From b189c0e2b7e4e73d293874ac2fea3176c1a1f652 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 7 Nov 2024 13:26:49 +0100
+Subject: [PATCH 18/19] solidrun: add script generating configs from template
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ GenerateSRConfigs.sh                          | 47 +++++++++++++++++++
+ .../rcw_2000_700_2400_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2400_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2400_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2600_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2600_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2600_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2900_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2900_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2900_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_3200_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_3200_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_3200_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_750_2400_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2400_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2400_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2400_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2400_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2400_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_2600_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2600_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2600_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2600_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2600_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2600_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_2900_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2900_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2900_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2900_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2900_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2900_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_3200_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_3200_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_3200_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_3200_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_3200_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_3200_8_5_2_xspi.rcw          |  2 +-
+ lx2160acex7_clearfog-cx.tmpl                  | 25 ++++++++++
+ .../rcw_2000_700_2400_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2400_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2400_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2400_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2600_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2600_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2600_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2600_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_2900_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_2900_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_2900_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_2900_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2000_700_3200_18_5_2_auto.rcw         |  2 +
+ .../rcw_2000_700_3200_18_5_2_sdhc.rcw         |  2 +-
+ .../rcw_2000_700_3200_8_5_2_auto.rcw          |  2 +
+ .../rcw_2000_700_3200_8_5_2_sdhc.rcw          |  2 +-
+ .../rcw_2200_750_2400_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2400_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2400_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2400_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2400_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2400_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_2600_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2600_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2600_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2600_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2600_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2600_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_2900_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_2900_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_2900_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_2900_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_2900_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_2900_8_5_2_xspi.rcw          |  2 +-
+ .../rcw_2200_750_3200_18_5_2_auto.rcw         |  4 +-
+ .../rcw_2200_750_3200_18_5_2_sdhc.rcw         |  4 +-
+ .../rcw_2200_750_3200_18_5_2_xspi.rcw         |  2 +-
+ .../rcw_2200_750_3200_8_5_2_auto.rcw          |  4 +-
+ .../rcw_2200_750_3200_8_5_2_sdhc.rcw          |  4 +-
+ .../rcw_2200_750_3200_8_5_2_xspi.rcw          |  2 +-
+ 82 files changed, 216 insertions(+), 80 deletions(-)
+ create mode 100755 GenerateSRConfigs.sh
+ create mode 100644 lx2160acex7_clearfog-cx.tmpl
+
+diff --git a/GenerateSRConfigs.sh b/GenerateSRConfigs.sh
+new file mode 100755
+index 0000000..907e359
+--- /dev/null
++++ b/GenerateSRConfigs.sh
+@@ -0,0 +1,47 @@
++#!/bin/bash -e
++
++generate() {
++	local template=${1}
++	local MODULE=${2}
++	local SOC_REVISION=${3}
++	local BOARD=${4}
++	local CPU_SPEED=${5}
++	local BUS_SPEED=${6}
++	local DDR_SPEED=${7}
++	local SD1=${8}
++	local SD2=${9}
++	local SD3=${10}
++	local BOOTSOURCE=${11}
++
++	local SOC_REVISION_SUFFIX="_rev${SOC_REVISION}"
++	if [ "${SOC_REVISION_SUFFIX}" = "_rev1" ]; then
++		SOC_REVISION_SUFFIX=
++	fi
++
++	local rcw="${MODULE,,}${SOC_REVISION_SUFFIX,,}/${BOARD,,}/rcw_${CPU_SPEED}_${BUS_SPEED}_${DDR_SPEED}_${SD1}_${SD2}_${SD3}_${BOOTSOURCE,,}.rcw"
++	cat "$template" | sed \
++		-e "s;%module%;${MODULE,,};g" -e "s;%MODULE%;${MODULE^^};g" \
++		-e "s;%SOC_REVISION%;${SOC_REVISION};g" \
++		-e "s;%board%;${BOARD,,};g" -e "s;%BOARD%;${BOARD^^};g" \
++		-e "s;%CPU_SPEED%;${CPU_SPEED};g" \
++		-e "s;%BUS_SPEED%;${BUS_SPEED};g" \
++		-e "s;%DDR_SPEED%;${DDR_SPEED};g" \
++		-e "s;%bootsource%;${BOOTSOURCE,,};g" -e "s;%BOOTSOURCE%;${BOOTSOURCE^^};g" \
++		-e "s;%SD1%;${SD1};g" -e "s;%SD1%;${SD1};g" \
++		-e "s;%SD2%;${SD2};g" -e "s;%SD2%;${SD2};g" \
++		-e "s;%SD3%;${SD3};g" -e "s;%SD3%;${SD3};g" \
++		> "$rcw"
++	echo "Generated $rcw"
++}
++
++# generate LX2160A CEX-7 Clearfog-CX
++for DDR_SPEED in 2400 2600 2900 3200; do
++	for SOC_REVISION in 1 2; do
++		for BOOTSOURCE in auto sdhc xspi; do
++			for SD1 in 8 18; do
++				generate lx2160acex7_clearfog-cx.tmpl lx2160acex7 ${SOC_REVISION} clearfog-cx 2000 700 ${DDR_SPEED} ${SD1} 5 2 ${BOOTSOURCE}
++				generate lx2160acex7_clearfog-cx.tmpl lx2160acex7 ${SOC_REVISION} clearfog-cx 2200 750 ${DDR_SPEED} ${SD1} 5 2 ${BOOTSOURCE}
++			done
++		done
++	done
++done
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+index 9e95ac8..6941de1 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+index 470237f..7d178e9 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+index ba0f82c..438b671 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+index 4d67915..73c6f2d 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+index ff8a674..a57abb1 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+index 8d73b20..44cf09e 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+index b1723d3..9e17570 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+index 0424418..3e5409f 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+index 978d3a6..11d63a0 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+index 1d1a869..9f5b541 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+index fa59785..3ec47b4 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+index be0d219..b17d672 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+index 732ca38..cfd8219 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+index de60fca..bfb3a71 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+index 90ac8a4..ac7755c 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+index e1f9092..565252a 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+index f69abb1..49ef64f 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+index 09c62dc..e701626 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+index f1c0c96..37eee98 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+index 533fba1..53be672 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+index 845ab35..400b9a9 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+index 765758e..6ee9c7a 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+index 2b75335..166b558 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+index 7839ab2..240f34f 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+index 901b323..9f8ed4e 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+index c09807c..221d71a 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+index 7808b12..d3bb414 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+index 33bef8b..beefc3a 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+index b430f80..925fadb 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+index c935b09..a370eab 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+index b1f39b4..75851ac 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+index 0f3d8a3..fa408fa 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+index 68452e0..3cfcc61 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+index 0069109..4f89b17 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+index d0736c2..aff7dab 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+index 6410353..772ec32 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+index daa99df..5c25062 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+index aa2fb4b..7ec91ef 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+index 6f06730..1756c4e 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 1
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+index 94dcc9b..85b9f95 100644
+--- a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 1.0
+diff --git a/lx2160acex7_clearfog-cx.tmpl b/lx2160acex7_clearfog-cx.tmpl
+new file mode 100644
+index 0000000..29b6fd0
+--- /dev/null
++++ b/lx2160acex7_clearfog-cx.tmpl
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  %SD1%
++ * SerDes Protocol 2 -  %SD2%
++ * SerDes Protocol 3 -  %SD3%
++ *
++ * Frequencies:
++ * Core     -- %CPU_SPEED% MHz
++ * Platform -- %BUS_SPEED%  MHz
++ * DDR      -- %DDR_SPEED% MT/s
++ *
++ * Silicon %SOC_REVISION%.0
++ * Boot from %BOOTSOURCE%
++ */
++
++#define LX_SR %SOC_REVISION%
++#define LX_BOOTSOURCE_%BOOTSOURCE%
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../%module%/include/pll_%CPU_SPEED%_%BUS_SPEED%_xxxx.rcwi>
++#include <../%module%/include/pll_xxxx_xxx_%DDR_SPEED%.rcwi>
++#include <../%module%/include/common.rcwi>
++#include <../%module%/include/SD1_%SD1%.rcwi>
++#include <../%module%/include/SD2_%SD2%.rcwi>
++#include <../%module%/include/SD3_%SD3%.rcwi>
++#include <../%module%/include/common_pbi.rcwi>
++#include <../%module%/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+index 6f454ad..af1b66d 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+index a3bc9c9..e3d8d98 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+index 1c23c5c..5359341 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+index c7b307e..ef3e91f 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+index 2a11587..c24f4c5 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+index bb3437e..3adbbd6 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+index 87391ab..eca9cd1 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+index a4c254c..ad3cd52 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+index 2a23f78..ce5744f 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+index cf44444..74a55e0 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+index 9114f36..5bdbd19 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+index 88ea5f2..532bd1f 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+index 0067b24..15a5bb5 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+index 290ebb1..71929a9 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_18_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+index 7e97984..a6e38c8 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+index 486ade8..c3c7459 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw
+@@ -9,7 +9,7 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+index 02b2961..37b5ed7 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+index 1fa9e1f..2c64922 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+index 12f62c1..5d42ffd 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+index 4185ea6..8143c6a 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+index 93b10d2..d4f9354 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+index feb3e42..54faf81 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2400 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+index f951e53..78a799e 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+index 227510c..bdcc867 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+index 4a30d7f..5e5dd08 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+index e04fcfb..a00da7d 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+index 32225fe..b635b12 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+index 6fbba40..8c8e91c 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2600 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+index 4444769..9fd6241 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+index fc1ad2d..fb5b219 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+index 311d2df..f0ef2bc 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+index b9797ca..02f9795 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+index a7b5bd2..e779da8 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+index 273d91c..6903faf 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+index 3665618..6ce054a 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+index 49b4d42..22afca8 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+index bdfe337..d600c86 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_18_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+index 046adc8..9c0d832 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_auto.rcw
+@@ -5,13 +5,15 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+index 9798b74..f037a47 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_sdhc.rcw
+@@ -5,11 +5,11 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+- * Boot from SDHC1
++ * Boot from SDHC
+  */
+ 
+ #define LX_SR 2
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+index 6b875e7..44e93b1 100644
+--- a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_8_5_2_xspi.rcw
+@@ -5,7 +5,7 @@
+  *
+  * Frequencies:
+  * Core     -- 2200 MHz
+- * Platform -- 700  MHz
++ * Platform -- 750  MHz
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0019-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0019-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
new file mode 100644
index 000000000000..037c88f760d0
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0019-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
@@ -0,0 +1,1611 @@
+From b40f6920f1f572bf5cfce1f8a0be20a45ce6af9f Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 7 Nov 2024 13:39:05 +0100
+Subject: [PATCH 19/19] lx2160acex7: clearfog-cx: add configuration for serdes
+ 1 protocol 4
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ GenerateSRConfigs.sh                          |  2 +-
+ .../rcw_2000_700_2400_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2400_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2600_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_2900_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2000_700_3200_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2400_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2600_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_2900_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_auto.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_sdhc.rcw          | 25 +++++++++++++++++++
+ .../rcw_2200_750_3200_4_5_2_xspi.rcw          | 25 +++++++++++++++++++
+ 49 files changed, 1201 insertions(+), 1 deletion(-)
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+ create mode 100644 lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+
+diff --git a/GenerateSRConfigs.sh b/GenerateSRConfigs.sh
+index 907e359..1c98023 100755
+--- a/GenerateSRConfigs.sh
++++ b/GenerateSRConfigs.sh
+@@ -38,7 +38,7 @@ generate() {
+ for DDR_SPEED in 2400 2600 2900 3200; do
+ 	for SOC_REVISION in 1 2; do
+ 		for BOOTSOURCE in auto sdhc xspi; do
+-			for SD1 in 8 18; do
++			for SD1 in 4 8 18; do
+ 				generate lx2160acex7_clearfog-cx.tmpl lx2160acex7 ${SOC_REVISION} clearfog-cx 2000 700 ${DDR_SPEED} ${SD1} 5 2 ${BOOTSOURCE}
+ 				generate lx2160acex7_clearfog-cx.tmpl lx2160acex7 ${SOC_REVISION} clearfog-cx 2200 750 ${DDR_SPEED} ${SD1} 5 2 ${BOOTSOURCE}
+ 			done
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..1494b58
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..6dfc0d0
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..c89ebc5
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..5ba12c7
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..87ef115
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..9cf27a5
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..5486e12
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..11654c8
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..e8fc8e2
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..48e090c
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..8da555a
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..7ff9fc0
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..02607db
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..a20aa56
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..865d6e8
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..946750e
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..8458141
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..8313e25
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..92bde97
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..b754615
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..571fb86
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..85836d1
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..877da0f
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..e1fb8d0
+--- /dev/null
++++ b/lx2160acex7/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 1.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 1
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..5b8f33d
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..d499f67
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..362e13c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2400_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..262a600
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..d1100b8
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..606a38b
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2600_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..4afc979
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..82f2e78
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..41d1a83
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_2900_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..948094c
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..a50664e
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..57cd7ba
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..e09a28f
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..271fc35
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..b2acfa1
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2400_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..637ece3
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..009c2af
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..e3e28c7
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2600_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..bfff9a6
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..32e5ef4
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..affe4a2
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_2900_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+new file mode 100644
+index 0000000..0e731e9
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_auto.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+new file mode 100644
+index 0000000..7ca0f52
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_sdhc.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from SDHC
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_SDHC
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+diff --git a/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+new file mode 100644
+index 0000000..4c9df2a
+--- /dev/null
++++ b/lx2160acex7_rev2/clearfog-cx/rcw_2200_750_3200_4_5_2_xspi.rcw
+@@ -0,0 +1,25 @@
++/*
++ * SerDes Protocol 1 -  4
++ * SerDes Protocol 2 -  5
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from XSPI
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_XSPI
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex7/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_4.rcwi>
++#include <../lx2160acex7/include/SD2_5.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex7/include/common_pbi.rcwi>
++#include <../lx2160acex7/clearfog-cx/sd1_8_eq.rcwi>
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/qoriq-rcw/0020-lx2160acex6-add-configuration-for-each-ddr-speed.patch b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0020-lx2160acex6-add-configuration-for-each-ddr-speed.patch
new file mode 100644
index 000000000000..5ffbed12ea04
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/qoriq-rcw/0020-lx2160acex6-add-configuration-for-each-ddr-speed.patch
@@ -0,0 +1,285 @@
+From 16dccb51dec1c08fcf5dfcf5ca6778bb387f6b32 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 26 Nov 2024 11:11:57 +0100
+Subject: [PATCH] lx2160acex6: add configuration for each ddr speed
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ GenerateSRConfigs.sh                          |  6 +++++
+ lx2160acex6_evb.tmpl                          | 24 +++++++++++++++++++
+ .../evb/rcw_2000_700_2400_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2000_700_2600_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2000_700_2900_3_3_2_auto.rcw      |  2 ++
+ .../evb/rcw_2000_700_3200_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2200_750_2400_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2200_750_2600_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2200_750_2900_3_3_2_auto.rcw      | 24 +++++++++++++++++++
+ .../evb/rcw_2200_750_3200_3_3_2_auto.rcw      |  2 ++
+ 10 files changed, 178 insertions(+)
+ create mode 100644 lx2160acex6_evb.tmpl
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2000_700_2400_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2000_700_2600_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2000_700_3200_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2200_750_2400_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2200_750_2600_3_3_2_auto.rcw
+ create mode 100644 lx2160acex6_rev2/evb/rcw_2200_750_2900_3_3_2_auto.rcw
+
+diff --git a/GenerateSRConfigs.sh b/GenerateSRConfigs.sh
+index 1c98023..e55667a 100755
+--- a/GenerateSRConfigs.sh
++++ b/GenerateSRConfigs.sh
+@@ -45,3 +45,9 @@ for DDR_SPEED in 2400 2600 2900 3200; do
+ 		done
+ 	done
+ done
++
++# generate LX2160A CEX-6 Internal Evaluation Board
++for DDR_SPEED in 2400 2600 2900 3200; do
++	generate lx2160acex6_evb.tmpl lx2160acex6 2 evb 2000 700 ${DDR_SPEED} 3 3 2 auto
++	generate lx2160acex6_evb.tmpl lx2160acex6 2 evb 2200 750 ${DDR_SPEED} 3 3 2 auto
++done
+diff --git a/lx2160acex6_evb.tmpl b/lx2160acex6_evb.tmpl
+new file mode 100644
+index 0000000..79fbe85
+--- /dev/null
++++ b/lx2160acex6_evb.tmpl
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  %SD1%
++ * SerDes Protocol 2 -  %SD2%
++ * SerDes Protocol 3 -  %SD3%
++ *
++ * Frequencies:
++ * Core     -- %CPU_SPEED% MHz
++ * Platform -- %BUS_SPEED%  MHz
++ * DDR      -- %DDR_SPEED% MT/s
++ *
++ * Silicon %SOC_REVISION%.0
++ * Boot from %BOOTSOURCE%
++ */
++
++#define LX_SR %SOC_REVISION%
++#define LX_BOOTSOURCE_%BOOTSOURCE%
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_%CPU_SPEED%_%BUS_SPEED%_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_%DDR_SPEED%.rcwi>
++#include <../%module%_rev%SOC_REVISION%/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_%SD1%.rcwi>
++#include <../lx2160acex7/include/SD2_%SD2%.rcwi>
++#include <../lx2160acex7/include/SD3_%SD3%.rcwi>
++#include <../%module%_rev%SOC_REVISION%/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_2400_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_2400_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..3ba20f4
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_2400_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_2600_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_2600_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..780ac70
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_2600_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+index 6ae1090..6d54680 100644
+--- a/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_2900_3_3_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 2900 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2000_700_3200_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2000_700_3200_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..97c7ba3
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2000_700_3200_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2000 MHz
++ * Platform -- 700  MHz
++ * DDR      -- 3200 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2000_700_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2200_750_2400_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2200_750_2400_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..fbb8156
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2200_750_2400_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2400 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2400.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2200_750_2600_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2200_750_2600_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..68bd37f
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2200_750_2600_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2600 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2600.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2200_750_2900_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2200_750_2900_3_3_2_auto.rcw
+new file mode 100644
+index 0000000..a38c602
+--- /dev/null
++++ b/lx2160acex6_rev2/evb/rcw_2200_750_2900_3_3_2_auto.rcw
+@@ -0,0 +1,24 @@
++/*
++ * SerDes Protocol 1 -  3
++ * SerDes Protocol 2 -  3
++ * SerDes Protocol 3 -  2
++ *
++ * Frequencies:
++ * Core     -- 2200 MHz
++ * Platform -- 750  MHz
++ * DDR      -- 2900 MT/s
++ *
++ * Silicon 2.0
++ * Boot from AUTO
++ */
++
++#define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
++#include <../lx2160asi/lx2160a.rcwi>
++#include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
++#include <../lx2160acex7/include/pll_xxxx_xxx_2900.rcwi>
++#include <../lx2160acex6_rev2/include/common.rcwi>
++#include <../lx2160acex7/include/SD1_3.rcwi>
++#include <../lx2160acex7/include/SD2_3.rcwi>
++#include <../lx2160acex7/include/SD3_2.rcwi>
++#include <../lx2160acex6_rev2/include/common_pbi.rcwi>
+diff --git a/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw b/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
+index a66d4ec..7839e7c 100644
+--- a/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
++++ b/lx2160acex6_rev2/evb/rcw_2200_750_3200_3_3_2_auto.rcw
+@@ -9,9 +9,11 @@
+  * DDR      -- 3200 MT/s
+  *
+  * Silicon 2.0
++ * Boot from AUTO
+  */
+ 
+ #define LX_SR 2
++#define LX_BOOTSOURCE_AUTO
+ #include <../lx2160asi/lx2160a.rcwi>
+ #include <../lx2160acex7/include/pll_2200_750_xxxx.rcwi>
+ #include <../lx2160acex7/include/pll_xxxx_xxx_3200.rcwi>
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
