Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EAAC28B2F
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2194125D;
	Sat, 15 Mar 2025 19:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cC9pNKFgnfym; Sat, 15 Mar 2025 19:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1271741246
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1271741246;
	Sat, 15 Mar 2025 19:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FC3C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78BE9607B8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qH4CJvlvnuuR for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20FEF607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20FEF607CF
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20FEF607CF
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so4176815e9.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068638; x=1742673438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w4j+ipe3yhec+9IS5lueb149ZL4xc8Z2w7q11zvd2Qk=;
 b=Gcj7VbtPDdMNfD9lkWeeFA2fNKM8sXJmD2aiOavNzlArWuEiVszNvqCbpX5ruvB4Zg
 P6IIBbyIFFp14uxtGk7sNz+na2E2m1uijDuCBGKEA7cFTtCmTIZ8PeEC8tvX2Np+n0Pq
 r5yxoVlnamMhxbHn6cltReQ8pcHBG43kPxhKVloAbB7ALPIwmc8UPVeVvBAlzC7VXgeY
 TL/HvYzAcgI9Z9drKqitj65Sj2lmCTiCp7XhPQ8FQVCarPW0VigR8stlB4NBc5ChlN6L
 Mj8HKKeTD6aP++7CVtuHotQe73Oeyp9cmPQolVMd8TS+WvYQt1yLhezfAcYhpGIQ14zn
 QnQA==
X-Gm-Message-State: AOJu0Yyp9yRRXK+m/XPp+2SNLR7hefkkdDJmVVu8tAKtQxEOisOdZFG5
 YTcgCElZ+m+9JgxVwFQmq4M/EL/kFv+QlTZ8e1XjiVBdM4m8M01j4KuBGg==
X-Gm-Gg: ASbGnctApg1rNggzfyVWQAteS94ltvhlehd1kQJClQul78hrJmhlX0V4tfF6M5gPCT8
 JLAqXyjGw9s+xsdL0/UdpBP1bbbncq7hgsl9cDuJ0VeEhpkNvRjfvf9Q+dsts28PxpG//ilOMT4
 9z3K7L5fTjMyxIRidFJWa640qhEXdpugbHH//B5b7hcbRz3E4MxaEA2bL59YLuIlAKnvDmCjx0E
 PRTe6EARXQluytAE74cfocsw3kRyAtCU5S68T+PMjIu9pGK9tZoxHjHgXacykcpK9GbjAY5sFUy
 v3ognUL29u1h5kspzPWmCkC/Y5AHq+Bm/fEPAhF4WnMi0utYTQad8+c=
X-Google-Smtp-Source: AGHT+IEMBcz96eZLa5/jhuiudxASxaZv8MkPQ/W7jnW13bl4uxZ5/SBsdqFGIIZzmkEdpE80KwEd5Q==
X-Received: by 2002:a5d:64c4:0:b0:38f:210b:693f with SMTP id
 ffacd0b85a97d-3971f60bb2cmr6512377f8f.52.1742068638035; 
 Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:17 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Mar 2025 20:57:10 +0100
Message-ID: <f604e779cac2e3f064d9998da8fb950f11b3a659.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068638; x=1742673438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4j+ipe3yhec+9IS5lueb149ZL4xc8Z2w7q11zvd2Qk=;
 b=K+MxW9IZhJay5HVsPAD5ZFGAcPbkUbRbPeGIkfpkuun8QJPyclD8mgji/Xmcn6TPig
 fkfhLqI5tDMlaboy4mLh1Y6xRJiVx1id9xEbPPxK0FRTZqUsE8GEvYQ/n5J1EMRSMvcj
 jgV8xz9n0th8OMWLZWrulD6+E6qYWs+kGACRo3GmuQ5p3GZ4b9CzNGVC3ugsbHRo1zYJ
 7Cg+LqCOY7alGFBFCDMLOQ3VTXBiZeKRY3OpOgOQGxCHjxNHmGKgUf6hsf3FjJVIPUns
 u3xCImkeGvw8F1glO/FmpMq607lb5f220WIzbbafAjRaJtee9EYIafIhyeZrKxnLeMZv
 70mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K+MxW9IZ
Subject: [Buildroot] [PATCH 12/14 v4] package/passt: new package
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in        |  1 +
 package/passt/Config.in  | 19 +++++++++++++++++++
 package/passt/passt.hash |  4 ++++
 package/passt/passt.mk   | 41 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/passt/Config.in
 create mode 100644 package/passt/passt.hash
 create mode 100644 package/passt/passt.mk

diff --git a/package/Config.in b/package/Config.in
index 4297903fd8..8a5c992626 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2606,6 +2606,7 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
+	source "package/passt/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
diff --git a/package/passt/Config.in b/package/passt/Config.in
new file mode 100644
index 0000000000..a2d2f4f1fe
--- /dev/null
+++ b/package/passt/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PASST
+	bool "passt"
+	help
+	  passt: Plug A Simple Socket Transport
+	  pasta: Pack A Subtle Tap Abstraction
+
+	  passt implements a translation layer between a Layer-2
+	  network interface and native Layer-4 sockets (TCP, UDP,
+	  ICMP/ICMPv6 echo) on a host. It doesn't require any
+	  capabilities or privileges, and it can be used as a simple
+	  replacement for Slirp.
+
+	  pasta (same binary as passt, different command) offers
+	  equivalent functionality, for network namespaces: traffic
+	  is forwarded using a tap interface inside the namespace,
+	  without the need to create further interfaces on the host,
+	  hence not requiring any capabilities or privileges.
+
+	  https://passt.top/passt/about/
diff --git a/package/passt/passt.hash b/package/passt/passt.hash
new file mode 100644
index 0000000000..011ba84b89
--- /dev/null
+++ b/package/passt/passt.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  f76c12e0535b9f6af59ee747d8ed7a8f691bb1ac7429225484788f0bc6e23dac  passt-2025_02_17.a1e48a0-git4.tar.gz
+sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
new file mode 100644
index 0000000000..5b9fcd831f
--- /dev/null
+++ b/package/passt/passt.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# passt
+#
+################################################################################
+
+PASST_VERSION = 2025_02_17.a1e48a0
+PASST_SITE = https://passt.top/passt
+PASST_SITE_METHOD = git
+
+PASST_LICENSE = \
+	BSD-3-Clause, \
+	GPL-2.0-or-later
+PASST_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-or-later.txt
+
+define PASST_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+define PASST_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) \
+		prefix=/usr
+endef
+
+define PASST_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) \
+		prefix=/usr \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
