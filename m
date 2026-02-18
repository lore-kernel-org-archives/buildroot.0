Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CCDE9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 16:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19B560903;
	Wed, 18 Feb 2026 16:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSOzgdQYbymI; Wed, 18 Feb 2026 16:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ECD7608F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771431316;
	bh=sJLiHdUhqw1EYMGzTP5jsbrulHfAakTTesqSYk8rP8w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PYYRBqnx8x/O+uiPniWgIf8dfdKcosCkXC6SIyDTyB6U7bhvEYNiAwKnnI1RXE62l
	 hAiv2gpFGj4Ix9Lb5Ldnj/ilH3+63YrdSVEb4SzTZabwdr7wPugy4FIaVY7SndsHTS
	 pdxw8OpRW2GibY6Q6TNwKoz153hHNBHTbchzloCYZ6g1QXnLWGnAt4Rl6cNzNAkDkn
	 sFkObPM3LgaXYvvPjIb5DyUs/bjfSiZ/gKbLEay3ViWOII3lMbMG23JTXDQj897jNq
	 ft7haCS/mQ2Yp0LRszty/6R3Digl7wWxZPVdt1SB35euxv8dw3r+iqvmN7gHuGdpoV
	 eL5ciSInM4VvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECD7608F5;
	Wed, 18 Feb 2026 16:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33682206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D9540351
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pv0hRTDmmA6i for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 16:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CC1C400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC1C400A0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC1C400A0
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:15:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso742629f8f.0
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 08:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771431311; x=1772036111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XCbJFU0Mny2Cnew/Q4B5a+POTLAUQG6WEq940ICnr8=;
 b=tx+aFOseIgwn850pZZeq0csl9mcZivDnmgVP7dVP0m1WnW3Bwbt5wkhDvYo7WnVD10
 IUZ+htqc1IOj1YgNu4QoA9k5JCs6xL1q/gzq5nyp3AVSk12VWoDLvPhV5OpSzIkA6Piu
 0MJZ7ErVXR2rQRMJxhOa0WSwMbJKoQp/H9aPd1Q+rpcqOWlZZLRjeITiOF+hK1xNu0IT
 ralvBe58RvhTsC26+75yqDS+ePCtUA5MT/RD8NnTqpcTHlvwLEoCGKOuFpiv/Q3VhLu8
 vs6gk5hLO3jhgsuJqzrouNrtus2B0joJnT8ihInACKEuWjiVpNlRqtW/C5gtgxK9hRBV
 Ap2Q==
X-Gm-Message-State: AOJu0Yxplz7fyYQLtdTwUHkYJpOldGE7fCiFlwUQEDWlK+P8Tnu2Xdhi
 D6wML/ROAiSyOUgme0XVOOqPv7muF7QKzvbM29hKnymAWblaqUYKlOnNtvyUvQ==
X-Gm-Gg: AZuq6aIND3pv1OWJo58vCn+o3ObMj93AMI40ZPbm9qTBrA4E1eaFGTXjy+0h2dpWupi
 C/i42Ss9v5T/sqjE4yKzz7e2xwLmiJ6okAlf9qWs8PZeEOu2wN6Mo2WmHk9Qk1VRw2niaXu1xSJ
 xOX4/tVlAF0PXAPDdD3J0Xli+FKIM010v2kYdEvOSHzZUDNOWyBsCEMIUAl9uxjPAcqpkqLyN+B
 w6UcYcPCfYZyM4zO7mGQZ4p0JAPfgVcqL3yv0Pyuo+yI65g2E9F6Abo794cgBTAja9vu3o5cgXM
 en7CES5HSyy05mrb+3mWB7oPKzL4bzbvGG97Oh4Z2HyyrcIo6901VPpuoL2Pz3lE3SHxlSmh/mn
 nRs1EzSV/Vi0sm0xwPiH75Au4hy57KAf7STtEmQLHDnJCpF08Vj92ClrhtkdihWgnS+XNB11D5G
 m0LNrNTO41WhnLw24qqIPZJEGS85fIN2HSqklYEVjEhG6ZzECYXlPVTC3B2MxFbzylyfyTXSw=
X-Received: by 2002:a05:6000:220f:b0:435:9e32:2b85 with SMTP id
 ffacd0b85a97d-43958c52e5dmr4615721f8f.29.1771431310471; 
 Wed, 18 Feb 2026 08:15:10 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm917968255e9.9.2026.02.18.08.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 08:15:10 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 18:15:03 +0200
Message-ID: <20260218161503.125586-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771431311; x=1772036111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5XCbJFU0Mny2Cnew/Q4B5a+POTLAUQG6WEq940ICnr8=;
 b=LwFH8f9xh+R6VHzNmeFobygoa5ze7YYiEXvOTTl7p5EMoWLp9ZkgMIkOAmjoNG04le
 fqLgSKnTZYSzpeaHjbfP7RcRQsHTycehEVYBO6dzAbUsiEMMl1+7qo8Yhh5T0SAE0gND
 twJ02D8S92CuioG6sPlP8TwgjGNEkZlUB8z+3+RXmJfYe8SfKl74PZ9gmI7coYUzw3g+
 7A8wCH21KSi/LSJXqyGHBCU/6GH16HKHs427m/GTN36p0SJuxCZTEJsrmEMSweMj8YHd
 CggPE7vpg59my8u6OKybD51sgEaawQtLAYx9qK9mgK/9eH9lCJYABWbTgtLhT9ShUgma
 tZLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LwFH8f9x
Subject: [Buildroot] [PATCH 1/1] package/python-rich-click: new package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-rich-click/Config.in              |  9 +++++++++
 package/python-rich-click/python-rich-click.hash |  5 +++++
 package/python-rich-click/python-rich-click.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-rich-click/Config.in
 create mode 100644 package/python-rich-click/python-rich-click.hash
 create mode 100644 package/python-rich-click/python-rich-click.mk

diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..edb3b17151 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1375,6 +1375,7 @@ menu "External python modules"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rich/Config.in"
+	source "package/python-rich-click/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rich-click/Config.in b/package/python-rich-click/Config.in
new file mode 100644
index 0000000000..ea0749f7ac
--- /dev/null
+++ b/package/python-rich-click/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_RICH_CLICK
+	bool "python-rick-click"
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	help
+	  rich-click is a wrapper around Click that
+	  renders help output nicely using Rich.
+
+	  https://github.com/ewels/rich-click
diff --git a/package/python-rich-click/python-rich-click.hash b/package/python-rich-click/python-rich-click.hash
new file mode 100644
index 0000000000..900170b999
--- /dev/null
+++ b/package/python-rich-click/python-rich-click.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rich-click/json
+md5  a8c8797cf21e21323f51531861b5100d  rich_click-1.9.7.tar.gz
+sha256  022997c1e30731995bdbc8ec2f82819340d42543237f033a003c7b1f843fc5dc  rich_click-1.9.7.tar.gz
+# Locally computed sha256 checksums
+sha256  d460cfe666617a2f86cb7c66f9041f0a87611c8b0c1f2f3f674a2022adc1f2af  LICENSE
diff --git a/package/python-rich-click/python-rich-click.mk b/package/python-rich-click/python-rich-click.mk
new file mode 100644
index 0000000000..0325ff66a7
--- /dev/null
+++ b/package/python-rich-click/python-rich-click.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rich-click
+#
+################################################################################
+
+PYTHON_RICH_CLICK_VERSION = 1.9.7
+PYTHON_RICH_CLICK_SOURCE = rich_click-$(PYTHON_RICH_CLICK_VERSION).tar.gz
+PYTHON_RICH_CLICK_SITE = https://files.pythonhosted.org/packages/04/27/091e140ea834272188e63f8dd6faac1f5c687582b687197b3e0ec3c78ebf
+PYTHON_RICH_CLICK_SETUP_TYPE = poetry
+PYTHON_RICH_CLICK_LICENSE = MIT
+PYTHON_RICH_CLICK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
