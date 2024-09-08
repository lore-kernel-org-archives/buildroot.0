Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4201ACD4F4C
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7650B4035A;
	Sun,  8 Sep 2024 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhSWqKF9vNqV; Sun,  8 Sep 2024 14:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB66640353
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB66640353;
	Sun,  8 Sep 2024 14:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 774EE1BF2B9
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 14:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6483D605E1
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 14:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCxY__BqzeF8 for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 14:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0434E605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0434E605AE
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0434E605AE
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 14:48:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so11430501fa.0
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 07:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725806899; x=1726411699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VUMdG/r+kvqO/a60leXFJ3pwXBvBdCUO2dJo0QvKYL0=;
 b=wgQnesfnYbbNBHCi4YNQx0dLRh6Dwq+M7Mv0sgTtRlhxHUS6r4CglFOQrNnlugWaYn
 BqOSfe/Gy+MUxZ0Da0bjbrS1v9wVJvdL6gghdzx23Nj6OjrPl/uUoyerFcgHHoijc6Or
 YEblM9aIxRtYfE120Xlf0mCF1ZSkDjxtf0T5LaIndl6B82D7GsYgmixFx6IcgI1vEvFr
 irzC/j31x4rpgf5tzs/0FCgHjrBuQ3y4S+Nw1Wnx1U9VJyNCcRxj2z/6yas7yCpLr0aM
 qr0MiD+a3evGBv5kF4ZcgIN6y5rvzggeTNlC/jx6MsGoUC4inZDGYWQSVMNSET0VX8V/
 U/dg==
X-Gm-Message-State: AOJu0Yws8Kg6QwAi98K2vUvAxy4BY34xOEYV2dty220lDa57hf/nHN43
 79ux3D1NiZ3RbDgXsTE5YNrJyOldhJNoqwkQrZ5A4bDY13n/NovArvu+2N2INaf2duop7I2vP6Q
 +fr0=
X-Google-Smtp-Source: AGHT+IF8wcVQ+OlY97ltsgHl00s7o2o0LjJL7iXP3c7WnRNq4gsJ+wIkBELeA/5X+w+Ckf6PVuY6nw==
X-Received: by 2002:a2e:be91:0:b0:2f7:4e9b:93e1 with SMTP id
 38308e7fff4ca-2f751f69e28mr61916801fa.36.1725806898981; 
 Sun, 08 Sep 2024 07:48:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-102-18.retail.telecomitalia.it. [87.4.102.18])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4693fsm1926602a12.37.2024.09.08.07.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:48:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 16:48:14 +0200
Message-ID: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725806899; x=1726411699;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUMdG/r+kvqO/a60leXFJ3pwXBvBdCUO2dJo0QvKYL0=;
 b=Dem7L8+wwafIPYUTcAqtS7+JQb5WcdsRWnZOL3DNI4VLDVblZ8KUnx2/Q4LUcpKOE4
 lucNQuO2JWukmpiQ4TT+qnfPfShb7xLo1UodEjGrUq/YK7unOD3ysowOuqw5CrDQLsPg
 TMVPs1bbm3aHIFd/mQlw5LqyZlujj/0btQ1j0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Dem7L8+w
Subject: [Buildroot] [PATCH v4 1/2] package/iana-assignments: new package
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
Cc: Floris Bos <bos@je-eigen-domein.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The fixing of [1] and related code reviews [2] and [3] highlighted the
need for a package providing a versioned PEN (Enterprise Numbers)
registry file from IANA (Internet Assigned Numbers Authority).
The GitHub repository from which this package originates is a mirror of
the IANA registries periodically updated from https://www.iana.org/protocols.

[1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240902210055.239859-1-dario.binacchi@amarulasolutions.com
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20240904174021.2670289-1-dario.binacchi@amarulasolutions.com/
Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v3 -> v4:
  - select BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG when the package is enabled

Added in v3

 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/iana-assignments/Config.in             | 15 +++++++++++++++
 package/iana-assignments/iana-assignments.hash |  2 ++
 package/iana-assignments/iana-assignments.mk   | 18 ++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/iana-assignments/Config.in
 create mode 100644 package/iana-assignments/iana-assignments.hash
 create mode 100644 package/iana-assignments/iana-assignments.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b0efabfd5d35..40e46741612b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -792,6 +792,7 @@ F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/iana-assignments/
 F:	package/sscep/
 F:	package/uuu/
 
diff --git a/package/Config.in b/package/Config.in
index 17855fed3058..729e05be675d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2465,6 +2465,7 @@ endif
 	source "package/htpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
+	source "package/iana-assignments/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 	source "package/ifenslave/Config.in"
diff --git a/package/iana-assignments/Config.in b/package/iana-assignments/Config.in
new file mode 100644
index 000000000000..f1b803cfec1a
--- /dev/null
+++ b/package/iana-assignments/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IANA_ASSIGNMENTS
+	bool "IANA assignments"
+	select BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
+	help
+	  Mirror of the IANA registries periodically updated
+	  from https://www.iana.org/protocols.
+
+	  https://github.com/larseggert/iana-assignments
+
+if BR2_PACKAGE_IANA_ASSIGNMENTS
+
+config BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
+	bool "PEN (Enterprise Numbers) registry"
+
+endif
diff --git a/package/iana-assignments/iana-assignments.hash b/package/iana-assignments/iana-assignments.hash
new file mode 100644
index 000000000000..c58fb61df292
--- /dev/null
+++ b/package/iana-assignments/iana-assignments.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  e7a1f8153715fa9e0f4c5d102f9271bce425a468f58a445e7c5ecdf7105fd460  iana-assignments-bf358dc8d89b7939557220b8055699b42a4133e9.tar.gz
diff --git a/package/iana-assignments/iana-assignments.mk b/package/iana-assignments/iana-assignments.mk
new file mode 100644
index 000000000000..824b26d4ecf6
--- /dev/null
+++ b/package/iana-assignments/iana-assignments.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# iana-assignments
+#
+################################################################################
+
+IANA_ASSIGNMENTS_VERSION = bf358dc8d89b7939557220b8055699b42a4133e9
+IANA_ASSIGNMENTS_SITE = $(call github,larseggert,iana-assignments,$(IANA_ASSIGNMENTS_VERSION))
+
+ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
+define IANA_ASSIGNMENTS_INSTALL_PEN_REG
+	$(INSTALL) -D -m 0644 $(@D)/enterprise-numbers/enterprise-numbers \
+		$(TARGET_DIR)/usr/share/misc/iana/enterprise-numbers
+endef
+IANA_ASSIGNMENTS_POST_INSTALL_TARGET_HOOKS += IANA_ASSIGNMENTS_INSTALL_PEN_REG
+endif
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
