Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18026CD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C421C81FC4;
	Wed,  3 Apr 2024 09:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYrK6PPGFJoJ; Wed,  3 Apr 2024 09:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49AB81FD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49AB81FD5;
	Wed,  3 Apr 2024 09:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93C201BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804FA60D94
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWwp75SoXDoL for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50B9160D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50B9160D6C
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B9160D6C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:54:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a47385a4379so146214066b.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 02:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712138086; x=1712742886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4bzuylniY/fHIzPDZVe/bCqr8xMgMy02XnpPwhdvik=;
 b=Fp7hHsCCI34O57DoNr3m3GQt+tyLpfMhUdAhZ6vNb2XDGBCvh4vrkd0zLv9HI/GScU
 kAMOMeNnrQSAJdx+8J3IyqHmJxtl+HH0KzTm7zMi0NvmvHKDKoy2SoSKjq3HkrUivQje
 j2o6tthaehXhXdXjT48rWFvcH1mwfF24k4deHjvCz4ZzMZUy3brO1M02B/guPU/49NYy
 lXUVXSE8XVTfd5Q4S6Wun2mlZfduwaP6JP2DN5WrT06roHEMFs57zePdhONyx85vNs6g
 ZFbKR3TmSL21f/mSSFNBlNrQo6nxHHLV+dvx1ZMc5d5c/OlmW81u+Fe15mUB3tEFG5ee
 a1NA==
X-Gm-Message-State: AOJu0Yzs0O98atkfuRzDt4NleY20TvmDHEIBVIb+i7fHb9dD6d3tbpQp
 DQADGC3GUsK3uo+I03WD56TUk7o03zThdPnVbcpfECPhpHPBASh90QjK53g8
X-Google-Smtp-Source: AGHT+IFGF7IAWCFvSwzuDIBgn97myfJRY3Ov7JgwCFU7qzlRlg8B+CAr1jvsKj1pew2GVaE7x4yunA==
X-Received: by 2002:a17:906:b42:b0:a51:79c1:83c1 with SMTP id
 v2-20020a1709060b4200b00a5179c183c1mr92423ejg.17.1712138086009; 
 Wed, 03 Apr 2024 02:54:46 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170906780e00b00a46c8dbd5e4sm7507555ejm.7.2024.04.03.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:54:44 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 11:54:14 +0200
Message-Id: <20240403095413.320062-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712138086; x=1712742886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P4bzuylniY/fHIzPDZVe/bCqr8xMgMy02XnpPwhdvik=;
 b=d9hhKGty2ULtasNECHppX4u9F0udP3PZMahK/V2hqcBt8P2X8dhvgi5hJgeGHneWvA
 fOJA8wTDIiWYwJ28CNbdDSu8uwMZ/Vb8wR94ymkOY5UHy2n4bu1r/EXQtHtISZk5TH/O
 zfmx231OkNe6TQHzA396TwfEIac9OyyE7CsilCW5K+16AgLO2Ordmfn4mXVEPhmRpPAy
 AnTzvrC9IR3X+5QBp0NfShSQjvp8pl+qAGiCi2Zgk/5NLTvyWdIHIMwNND6u6xnh4Z23
 HvR+MdJvN0p0dp7RBdNmcaGOacoRuMuW9rQKL0PngIIYmmynm4ub47mqNHpH4pWPEv1/
 ZxXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d9hhKGty
Subject: [Buildroot] [PATCH] package/python-yamllint: new package
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Xuanhao Shi <x-shi@ti.com>,
 Michael Walle <michale@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This host package is needed since u-boot 2024.04 for building ti defconfigs.

This is an requirement for using buildman/binman [1].

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-yamllint/Config.in            |  6 ++++++
 package/python-yamllint/python-yamllint.hash |  3 +++
 package/python-yamllint/python-yamllint.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-yamllint/Config.in
 create mode 100644 package/python-yamllint/python-yamllint.hash
 create mode 100644 package/python-yamllint/python-yamllint.mk

diff --git a/package/Config.in b/package/Config.in
index 15ee978b6a..415afbd438 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1434,6 +1434,7 @@ menu "External python modules"
 	source "package/python-xmljson/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-xmodem/Config.in"
+	source "package/python-yamllint/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
diff --git a/package/python-yamllint/Config.in b/package/python-yamllint/Config.in
new file mode 100644
index 0000000000..cb67b355c3
--- /dev/null
+++ b/package/python-yamllint/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_YAMLLINT
+	bool "python-yamllint"
+	help
+	  A linter for YAML files.
+
+	  https://github.com/adrienverge/yamllint
diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
new file mode 100644
index 0000000000..d80e0fdf42
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
new file mode 100644
index 0000000000..ceaca3b0b8
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-yamllint
+#
+################################################################################
+
+PYTHON_YAMLLINT_VERSION = 1.35.1
+PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
+PYTHON_YAMLLINT_SETUP_TYPE = pep517
+PYTHON_YAMLLINT_LICENSE = GPL-3.0
+PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
