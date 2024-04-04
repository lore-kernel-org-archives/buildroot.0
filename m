Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD08CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 08:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A05401C9;
	Thu,  4 Apr 2024 08:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9w6AEt4S-Qy; Thu,  4 Apr 2024 08:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BAA41B49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BAA41B49;
	Thu,  4 Apr 2024 08:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 427481BF2B8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F62A82CCA
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_527TBRVTY6 for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 08:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1590382C33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1590382C33
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1590382C33
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 08:17:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e0f8480fbso695081a12.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 01:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712218663; x=1712823463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0OjIbL5tQrZrrW6gzWl+49dgXTJ1CnQn17y1D71CPwI=;
 b=svuAjJNwVESEGnl9URUmK711BWfEE0Rv3QPgnupEsg3r3lrhuwdT2giGR0z1GogNk2
 rfninTU/Aa1qpXpvrhDYAFtAefDcLIxa4GSg+FOYMBE4jjVGmZSCAPPkChVflRKWGiXu
 8P+k/7j5y0tvRBdR9tb4i98o806chHNCXUEyxPGYRNoEwJVnUIr9n/TT8451ZunvnJyk
 gJp1V7RTul6gwlTHm3pXuK9VKv4LDRrVUmKpsm6X8zeYir6/R45mIEbYnbmM78FEFlS9
 r3rhdyAl4wujlTzS4Y89m3IMHUehqNIsMBUnm+jglSj0hEtbty8GdeK1xO2Cx4lUutIv
 n65A==
X-Gm-Message-State: AOJu0YzHcFjkQt+fD33wRlJ3UmaL2akH9aOLe0hq6Ir/ye9EFE8Tek/u
 wuPs/gbMAOwmSFR6afAy6pngI9S6COemUZZa5GXhDnZRNJoM8XBZyVqaXPvxQjY=
X-Google-Smtp-Source: AGHT+IF8fhJuw+3/9exlCuqddy45Fu1KrHgQYCd8RE7smXJfeikrBe+5FVvZ3gnjI6bRrkr/BLHeSQ==
X-Received: by 2002:a17:906:17cc:b0:a47:3526:2e0f with SMTP id
 u12-20020a17090617cc00b00a4735262e0fmr1019898eje.75.1712218663055; 
 Thu, 04 Apr 2024 01:17:43 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090609ca00b00a4733982ba9sm8614271eje.160.2024.04.04.01.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:17:42 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 10:17:13 +0200
Message-Id: <20240404081714.1190807-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712218663; x=1712823463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0OjIbL5tQrZrrW6gzWl+49dgXTJ1CnQn17y1D71CPwI=;
 b=Up3mbMMxOL1mz9VawDsfYyxJr67EkquZdt8ZLgHgzAPqi9bmVVPULv+KUDUHDK50VR
 SRM0TaQtlb+xP5JD0PZS62K4YWTH+UEbenzzwCmXVcg0IUaTQws15Pz1JzTUQjeqLVvU
 tIbMrPBsq/TusY0Weie82FSG6QCPJdJeW1P2qPxS2S1wK7Okrw5aHjEWrtlyzAPTMjVQ
 +Ep3q6q+sJWcdSfPaELBp0R1Efvur6SB6RG1FU5HjF3j9ZKA+0QOQEUnKKc1Ne5tK1BC
 /Qa161P/ScKeP57DI4JKmaLU/5UY1wDHjYKwSjiOJbn6MKUzbVHjwwwkQSv2MNsBSSf9
 KG0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Up3mbMMx
Subject: [Buildroot] [PATCH v2 1/3] package/python-yamllint: new package
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
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
index 87767993a2..a02370a2ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1437,6 +1437,7 @@ menu "External python modules"
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
