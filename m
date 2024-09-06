Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF4E6FE34
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 17:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB0B818A2;
	Fri,  6 Sep 2024 17:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5q0pSkjUmR2; Fri,  6 Sep 2024 17:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1430F818DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1430F818DC;
	Fri,  6 Sep 2024 17:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7B01BF38A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB8E408DD
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lK1kl366IIQ for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 17:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A9A2408D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A9A2408D9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A9A2408D9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 17:15:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso3915365e9.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 10:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725642916; x=1726247716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krC2znMnnN1smE5XhZ+TJvG9KjlJdjFEKTwK/kQvX3c=;
 b=cSUoiSjBViOVV5MunC9FlGOAFlQc/YT7BBLBfeCJcpvnCMzPKCKajA3Miz+Wl0HV7K
 yhtfR34Y0Ff8/OcxCuGco5cBwFQqt0uVoXDnag669yygQn4UcFwqvrM7l573g81OiWlV
 YWNXSKuWL45Kb4lJpE6npjRUsaMwa0bOtoSJOQiT+aiVSdRag/oXvqdxN0h2kjKy19+E
 h6gMOCUwzupuWm1HLg4W1dsBfeJ/ISNU7VPjeejWy10cnD5wnVnSlQeqgUhPaxMdYrEJ
 /9jKS0Luc+cgG+dcXW4IAIlUJ9Lif+azWeXJgkSnMrDupAHmDddMbdhuN+7nW/3bzMwD
 XfSA==
X-Gm-Message-State: AOJu0YwIQImjTXoGwXAiD8cdamyqqgBooGIzgnCdm9TUX0OxHfMiaap6
 8jwrsfUEU0ToviLgV+VmSnB5FGz7l2fwiAd3cUcRUVP0txSWBnQ/nUzUT6P3lCnvOEbM5pqSVaz
 2Ll4=
X-Google-Smtp-Source: AGHT+IHkpiAEqdQlCP67PBdWOl5HUKOG/N0PmHulr1gucgXBCDhDMQ3l3Fod2HPnIRiWWy+DmTHamw==
X-Received: by 2002:a05:600c:1c26:b0:424:8be4:f2c with SMTP id
 5b1f17b1804b1-42c9f498cf8mr22422895e9.2.1725642916174; 
 Fri, 06 Sep 2024 10:15:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05c6fb9sm26193875e9.7.2024.09.06.10.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 10:15:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 19:15:02 +0200
Message-ID: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725642916; x=1726247716;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=krC2znMnnN1smE5XhZ+TJvG9KjlJdjFEKTwK/kQvX3c=;
 b=ktkmIddsib632eNCLLVXbg+kqJjiqsAE3E0XDmYyCBmcIdHZFj6cCumvhh86DZiyI+
 Y9V+kAcwbl/DTAnptDup++PHTGRYGQPaSudldr5eS4HX99JoTBakksGJx14wzxqvfzQr
 oAvVmBdO8PdiftYjxQS9XVP2S5Rk4v56ZDHGs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ktkmIdds
Subject: [Buildroot] [PATCH v3 1/2] package/iana-assignments: new package
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
  Added in v3

 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/iana-assignments/Config.in             | 14 ++++++++++++++
 package/iana-assignments/iana-assignments.hash |  2 ++
 package/iana-assignments/iana-assignments.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/iana-assignments/Config.in
 create mode 100644 package/iana-assignments/iana-assignments.hash
 create mode 100644 package/iana-assignments/iana-assignments.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 069965680b2b..10c8b802a9c2 100644
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
index f33c4780f8ef..c2f63dd9c695 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2463,6 +2463,7 @@ endif
 	source "package/htpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
+	source "package/iana-assignments/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 	source "package/ifenslave/Config.in"
diff --git a/package/iana-assignments/Config.in b/package/iana-assignments/Config.in
new file mode 100644
index 000000000000..b7bd52abd2d1
--- /dev/null
+++ b/package/iana-assignments/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IANA_ASSIGNMENTS
+	bool "IANA assignments"
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
