Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4577DC07548
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 10:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C9841FB5;
	Wed, 15 Nov 2023 10:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C9841FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GG7fS9OV3k3s; Wed, 15 Nov 2023 10:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F5342126;
	Wed, 15 Nov 2023 10:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F5342126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4E81BF307
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7479142098
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7479142098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwA6lqVu9gnD for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 10:02:55 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FF814203A
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 10:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF814203A
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so94604771fa.3
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 02:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700042572; x=1700647372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtSUO/pP0cCsBjgiNHni1L4Ke0HnhrG7gsQdyaJd3S4=;
 b=ufqTzKE/EGm2yd9OHTZ+ptpfb2WADfpixIJmvOnwas+ci0/YQyEOJlJ0g6tR6b0pLh
 zPSI51SdJYeHWYz5wdIaNxB9etKz4rRpLN5HxptMbg0raZqe8NPvc9q7XDtcfGOhuVnj
 slyzCWRPwbbAu13YpVTenGYI+DtaRwinzqXly50rAGv8pHSILfB8CgpDBVYU5I5K2Yv4
 x9weCrBb1bgKeA5HgGCjxG1txWmMYws6rQnL5W9JeYMDrPmTIl55DuS46XmGL9h0HRBS
 8n0RyKEVRVcbzzksebcHYitvsn/ImUHC61ha5o8bR4G+qmgOfcHSe1oEoQ+7EgY/5K9g
 MyFQ==
X-Gm-Message-State: AOJu0YxU+/OWtApW++YTiH/Gt1QF91m27ZX8RAFPNxIYCzJYtSH3YNzd
 LC5/ZTClFw4zcurR0/ngf2bn1qOQJTcvLQ==
X-Google-Smtp-Source: AGHT+IHCrUUNBf+yx237FYy6sLF6AdQT6KMsRRZVb8yJ5LY3w97694PF5hk8muOw7TtCabFVkblV3A==
X-Received: by 2002:a19:6554:0:b0:507:c763:27a5 with SMTP id
 c20-20020a196554000000b00507c76327a5mr9284467lfj.62.1700042571960; 
 Wed, 15 Nov 2023 02:02:51 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600011d000b0033134ab9691sm10027058wrx.57.2023.11.15.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 02:02:51 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Wed, 15 Nov 2023 11:02:18 +0100
Message-ID: <20231115100222.29685-3-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115100222.29685-1-bstruempfel@ultratronik.de>
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700042572; x=1700647372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtSUO/pP0cCsBjgiNHni1L4Ke0HnhrG7gsQdyaJd3S4=;
 b=QhFURqBzIpcdiHP/Gh2GdkhdjSEx/pVIwIawMlHWe4J4bJgB6wp2sGfLRrNeWOBRME
 wCsB4sHqW/BU+3GzP9u5eSnhy8B9av2CXys4QbcjQNNqDN7+GOt8HcPfJSNmFBEEwbr3
 74ldzxvGu3owUACJeW4KEQ7trWV321R8hVl8kShzvgD50pv0uyCZNfLNCiHb7p4cymFz
 ki44xCyc6TBwt2asp1/pqbc7x2MUXAUimYSRc3IUh8jHx14OTmdYtVnJuvqsMFfpKRZn
 jeMt65wk6ybNGfu+keFxgiNCtpjzhY9cfaanDxlL+PbMnGUVEyZl33rU37UYQOja5cu1
 VSwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QhFURqBz
Subject: [Buildroot] [PATCH 2/2] package/swupdate: Add compatibility to
 libgpiod2
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <boerge.struempfel@gmail.com>

The corresponding patch series has already been accepted to the swupdate master branch

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
---
 ...cfw-Refactored-switch_mode-signature.patch |  73 ++++++
 ...pio-chip-and-lines-in-gpio-structure.patch | 128 +++++++++++
 .../0003-ucfw-Refactored-gpio-handling.patch  | 131 +++++++++++
 ...d-compatibility-with-libgpiod-v2-api.patch | 208 ++++++++++++++++++
 package/swupdate/Config.in                    |   2 +-
 package/swupdate/swupdate.mk                  |   5 +-
 6 files changed, 545 insertions(+), 2 deletions(-)
 create mode 100644 package/swupdate/0001-ucfw-Refactored-switch_mode-signature.patch
 create mode 100644 package/swupdate/0002-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
 create mode 100644 package/swupdate/0003-ucfw-Refactored-gpio-handling.patch
 create mode 100644 package/swupdate/0004-ucfw-Add-compatibility-with-libgpiod-v2-api.patch

diff --git a/package/swupdate/0001-ucfw-Refactored-switch_mode-signature.patch b/package/swupdate/0001-ucfw-Refactored-switch_mode-signature.patch
new file mode 100644
index 0000000000..d700375ae0
--- /dev/null
+++ b/package/swupdate/0001-ucfw-Refactored-switch_mode-signature.patch
@@ -0,0 +1,73 @@
+From f2bf9f7ccfb3b1ccd87d528f92ee1e6cbe31df35 Mon Sep 17 00:00:00 2001
+From: Boerge Struempfel <boerge.struempfel@gmail.com>
+Date: Fri, 20 Oct 2023 14:33:12 +0200
+Subject: [PATCH 1/8] ucfw: Refactored switch_mode signature
+
+This commit aims to reduce the number of parameters, which have to be
+given to the switch_mode function. This makes it much easier to add a
+different variation of this function depending on the installed libgpiod
+version.
+
+Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
+Acked-by: Stefano Babic <stefano.babic@swupdate.org>
+---
+ handlers/ucfw_handler.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/handlers/ucfw_handler.c b/handlers/ucfw_handler.c
+index ed121c7..9d01fea 100644
+--- a/handlers/ucfw_handler.c
++++ b/handlers/ucfw_handler.c
+@@ -109,16 +109,17 @@ struct handler_priv {
+ 	unsigned int nbytes;
+ };
+ 
+-static int switch_mode(char *devreset, int resoffset, char *devprog, int progoffset, int mode)
++
++static int switch_mode(struct handler_priv *priv, int mode)
+ {
+ 	struct gpiod_chip *chipreset, *chipprog;
+ 	struct gpiod_line *linereset, *lineprog;
+ 	int ret = 0;
+ 	int status;
+ 
+-	chipreset = gpiod_chip_open(devreset);
+-	if (strcmp(devreset, devprog))
+-		chipprog = gpiod_chip_open(devprog);
++	chipreset = gpiod_chip_open(priv->reset.gpiodev);
++	if (strcmp(priv->reset.gpiodev, priv->prog.gpiodev))
++		chipprog = gpiod_chip_open(priv->prog.gpiodev);
+ 	else
+ 		chipprog = chipreset;
+ 
+@@ -128,13 +129,13 @@ static int switch_mode(char *devreset, int resoffset, char *devprog, int progoff
+ 		goto freegpios;
+ 	}
+ 
+-	linereset = gpiod_chip_get_line(chipreset, resoffset);
+-	lineprog = gpiod_chip_get_line(chipprog, progoffset);
++	linereset = gpiod_chip_get_line(chipreset, priv->reset.offset);
++	lineprog = gpiod_chip_get_line(chipprog, priv->prog.offset);
+ 
+ 	if (!linereset || !lineprog) {
+ 		ERROR("Cannot get requested GPIOs: %d on %s and %d on %s",
+-			resoffset, devreset,
+-			progoffset, devprog);
++			priv->reset.offset, priv->reset.gpiodev,
++			priv->prog.offset, priv->prog.gpiodev);
+ 		ret  =-ENODEV;
+ 		goto freegpios;
+ 	}
+@@ -378,8 +379,7 @@ static int prepare_update(struct handler_priv *priv,
+ 	char msg[128];
+ 	int len;
+ 
+-	ret = switch_mode(priv->reset.gpiodev, priv->reset.offset,
+-			  priv->prog.gpiodev, priv->prog.offset, MODE_PROG);
++	ret = switch_mode(priv, MODE_PROG);
+ 	if (ret < 0) {
+ 		return -ENODEV;
+ 	}
+-- 
+2.42.0
+
diff --git a/package/swupdate/0002-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch b/package/swupdate/0002-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
new file mode 100644
index 0000000000..1adb3f52a2
--- /dev/null
+++ b/package/swupdate/0002-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
@@ -0,0 +1,128 @@
+From f007608043e7b14f3d84253a548142435174bd3f Mon Sep 17 00:00:00 2001
+From: Boerge Struempfel <boerge.struempfel@gmail.com>
+Date: Fri, 20 Oct 2023 14:33:13 +0200
+Subject: [PATCH 2/8] ucfw: Save the gpio chip and lines in gpio structure
+
+This is a prerequisite for splitting the switch_mode function into a
+the initialization phase, the actual mode-setting phase and then a
+cleanup phase.
+
+Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
+---
+ handlers/ucfw_handler.c | 43 ++++++++++++++++++++++-------------------
+ 1 file changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/handlers/ucfw_handler.c b/handlers/ucfw_handler.c
+index 9d01fea..b156ff5 100644
+--- a/handlers/ucfw_handler.c
++++ b/handlers/ucfw_handler.c
+@@ -91,6 +91,8 @@ struct mode_setup {
+ 	char gpiodev[SWUPDATE_GENERAL_STRING_SIZE];
+ 	unsigned int offset;
+ 	bool active_low;
++	struct gpiod_chip *chip;
++	struct gpiod_line *line;
+ };
+ 
+ enum {
+@@ -109,30 +111,27 @@ struct handler_priv {
+ 	unsigned int nbytes;
+ };
+ 
+-
+ static int switch_mode(struct handler_priv *priv, int mode)
+ {
+-	struct gpiod_chip *chipreset, *chipprog;
+-	struct gpiod_line *linereset, *lineprog;
+ 	int ret = 0;
+ 	int status;
+ 
+-	chipreset = gpiod_chip_open(priv->reset.gpiodev);
++	priv->reset.chip = gpiod_chip_open(priv->reset.gpiodev);
+ 	if (strcmp(priv->reset.gpiodev, priv->prog.gpiodev))
+-		chipprog = gpiod_chip_open(priv->prog.gpiodev);
++		priv->prog.chip = gpiod_chip_open(priv->prog.gpiodev);
+ 	else
+-		chipprog = chipreset;
++		priv->prog.chip = priv->reset.chip;
+ 
+-	if (!chipreset || !chipprog) {
++	if (!priv->reset.chip || !priv->prog.chip) {
+ 		ERROR("Cannot open gpio driver");
+ 		ret  =-ENODEV;
+ 		goto freegpios;
+ 	}
+ 
+-	linereset = gpiod_chip_get_line(chipreset, priv->reset.offset);
+-	lineprog = gpiod_chip_get_line(chipprog, priv->prog.offset);
++	priv->reset.line = gpiod_chip_get_line(priv->reset.chip, priv->reset.offset);
++	priv->prog.line = gpiod_chip_get_line(priv->prog.chip, priv->prog.offset);
+ 
+-	if (!linereset || !lineprog) {
++	if (!priv->reset.line || !priv->prog.line) {
+ 		ERROR("Cannot get requested GPIOs: %d on %s and %d on %s",
+ 			priv->reset.offset, priv->reset.gpiodev,
+ 			priv->prog.offset, priv->prog.gpiodev);
+@@ -140,13 +139,13 @@ static int switch_mode(struct handler_priv *priv, int mode)
+ 		goto freegpios;
+ 	}
+ 
+-	status = gpiod_line_request_output(linereset, RESET_CONSUMER, 0);
++	status = gpiod_line_request_output(priv->reset.line, RESET_CONSUMER, 0);
+ 	if (status) {
+ 		ret  =-ENODEV;
+ 		ERROR("Cannot request reset line");
+ 		goto freegpios;
+ 	}
+-	status = gpiod_line_request_output(lineprog, PROG_CONSUMER, mode);
++	status = gpiod_line_request_output(priv->prog.line, PROG_CONSUMER, mode);
+ 	if (status) {
+ 		ret  =-ENODEV;
+ 		ERROR("Cannot request prog line");
+@@ -156,22 +155,27 @@ static int switch_mode(struct handler_priv *priv, int mode)
+ 	/*
+ 	 * A reset is always done
+ 	 */
+-	gpiod_line_set_value(linereset, 0);
++	gpiod_line_set_value(priv->reset.line, 0);
+ 
+ 	/* Set programming mode */
+-	gpiod_line_set_value(lineprog, mode);
++	gpiod_line_set_value(priv->prog.line, mode);
+ 
+ 	usleep(20000);
+ 
+ 	/* Remove reset */
+-	gpiod_line_set_value(linereset, 1);
++	gpiod_line_set_value(priv->reset.line, 1);
+ 
+ 	usleep(20000);
+ 
+ freegpios:
+-	if (chipreset) gpiod_chip_close(chipreset);
+-	if (chipprog && (chipprog != chipreset)) gpiod_chip_close(chipprog);
+-
++	if (priv->prog.chip && (priv->prog.chip != priv->reset.chip)){
++		gpiod_chip_close(priv->prog.chip);
++		priv->reset.chip = NULL;
++	}
++	if (priv->reset.chip) {
++		gpiod_chip_close(priv->reset.chip);
++		priv->reset.chip = NULL;
++	}
+ 	return ret;
+ }
+ 
+@@ -449,8 +453,7 @@ static int finish_update(struct handler_priv *priv)
+ 	int ret;
+ 
+ 	close(priv->fduart);
+-	ret = switch_mode(priv->reset.gpiodev, priv->reset.offset,
+-			  priv->prog.gpiodev, priv->prog.offset, MODE_NORMAL);
++	ret = switch_mode(priv, MODE_NORMAL);
+ 	if (ret < 0) {
+ 		return -ENODEV;
+ 	}
+-- 
+2.42.0
+
diff --git a/package/swupdate/0003-ucfw-Refactored-gpio-handling.patch b/package/swupdate/0003-ucfw-Refactored-gpio-handling.patch
new file mode 100644
index 0000000000..674246bb6f
--- /dev/null
+++ b/package/swupdate/0003-ucfw-Refactored-gpio-handling.patch
@@ -0,0 +1,131 @@
+From 35444603d8d3e30dba2323a51feb27189373ac5d Mon Sep 17 00:00:00 2001
+From: Boerge Struempfel <boerge.struempfel@gmail.com>
+Date: Fri, 20 Oct 2023 14:33:14 +0200
+Subject: [PATCH 3/8] ucfw: Refactored gpio handling
+
+This commit splits the switch_mode function into the
+gpio-initialization, the actual mode switch and the cleanup phases. This
+is mainly done in order to prepare for adding gpiolib v2 api capability
+but has the added advantage, that the gpios are no longer released
+during the update, which for one prevents the gpios from floating, and
+for another, stops other processes from taking over the pins during an
+update phase.
+
+Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
+---
+ handlers/ucfw_handler.c | 60 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 45 insertions(+), 15 deletions(-)
+
+diff --git a/handlers/ucfw_handler.c b/handlers/ucfw_handler.c
+index b156ff5..6c60cd8 100644
+--- a/handlers/ucfw_handler.c
++++ b/handlers/ucfw_handler.c
+@@ -111,8 +111,18 @@ struct handler_priv {
+ 	unsigned int nbytes;
+ };
+ 
+-static int switch_mode(struct handler_priv *priv, int mode)
+-{
++static void free_gpios(struct handler_priv *priv) {
++	if (priv->prog.chip && (priv->prog.chip != priv->reset.chip)){
++		gpiod_chip_close(priv->prog.chip);
++		priv->reset.chip = NULL;
++	}
++	if (priv->reset.chip) {
++		gpiod_chip_close(priv->reset.chip);
++		priv->reset.chip = NULL;
++	}
++}
++
++static int register_gpios(struct handler_priv *priv){
+ 	int ret = 0;
+ 	int status;
+ 
+@@ -145,37 +155,51 @@ static int switch_mode(struct handler_priv *priv, int mode)
+ 		ERROR("Cannot request reset line");
+ 		goto freegpios;
+ 	}
+-	status = gpiod_line_request_output(priv->prog.line, PROG_CONSUMER, mode);
++	status = gpiod_line_request_output(priv->prog.line, PROG_CONSUMER, 0);
+ 	if (status) {
+ 		ret  =-ENODEV;
+ 		ERROR("Cannot request prog line");
+ 		goto freegpios;
+ 	}
+ 
++	return ret;
++freegpios:
++	free_gpios(priv);
++	return ret;
++}
++
++static int switch_mode(struct handler_priv *priv, int mode)
++{
++	int ret = 0;
++	if (!priv->reset.line || !priv->prog.line) return -ENODEV;
++
+ 	/*
+ 	 * A reset is always done
+ 	 */
+-	gpiod_line_set_value(priv->reset.line, 0);
++	ret = gpiod_line_set_value(priv->reset.line, 0);
++	if (ret){
++		ERROR("unable to set reset to 0");
++		return ret;
++	}
+ 
+ 	/* Set programming mode */
+-	gpiod_line_set_value(priv->prog.line, mode);
++	ret = gpiod_line_set_value(priv->prog.line, mode);
++	if (ret){
++		ERROR("unable to set prog to %i",mode);
++		return ret;
++	}
+ 
+ 	usleep(20000);
+ 
+ 	/* Remove reset */
+-	gpiod_line_set_value(priv->reset.line, 1);
++	ret = gpiod_line_set_value(priv->reset.line, 1);
++	if (ret){
++		ERROR("unable to set reset to 1");
++		return ret;
++	}
+ 
+ 	usleep(20000);
+ 
+-freegpios:
+-	if (priv->prog.chip && (priv->prog.chip != priv->reset.chip)){
+-		gpiod_chip_close(priv->prog.chip);
+-		priv->reset.chip = NULL;
+-	}
+-	if (priv->reset.chip) {
+-		gpiod_chip_close(priv->reset.chip);
+-		priv->reset.chip = NULL;
+-	}
+ 	return ret;
+ }
+ 
+@@ -383,6 +407,11 @@ static int prepare_update(struct handler_priv *priv,
+ 	char msg[128];
+ 	int len;
+ 
++	ret = register_gpios(priv);
++	if (ret < 0) {
++		return -ENODEV;
++	}
++
+ 	ret = switch_mode(priv, MODE_PROG);
+ 	if (ret < 0) {
+ 		return -ENODEV;
+@@ -454,6 +483,7 @@ static int finish_update(struct handler_priv *priv)
+ 
+ 	close(priv->fduart);
+ 	ret = switch_mode(priv, MODE_NORMAL);
++	free_gpios(priv);
+ 	if (ret < 0) {
+ 		return -ENODEV;
+ 	}
+-- 
+2.42.0
+
diff --git a/package/swupdate/0004-ucfw-Add-compatibility-with-libgpiod-v2-api.patch b/package/swupdate/0004-ucfw-Add-compatibility-with-libgpiod-v2-api.patch
new file mode 100644
index 0000000000..4a0abd5860
--- /dev/null
+++ b/package/swupdate/0004-ucfw-Add-compatibility-with-libgpiod-v2-api.patch
@@ -0,0 +1,208 @@
+From 60d88b616c31105b34d19a1230f692602b92ce8d Mon Sep 17 00:00:00 2001
+From: Boerge Struempfel <boerge.struempfel@gmail.com>
+Date: Fri, 20 Oct 2023 14:33:15 +0200
+Subject: [PATCH 4/8] ucfw: Add compatibility with libgpiod v2 api
+
+In order to detect the libgpiod api version, we use
+GPIOD_LINE_BULK_MAX_LINES, since this is only defined in v1 and not in
+v2.
+
+Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
+---
+ handlers/ucfw_handler.c | 157 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 157 insertions(+)
+
+diff --git a/handlers/ucfw_handler.c b/handlers/ucfw_handler.c
+index 6c60cd8..8644d04 100644
+--- a/handlers/ucfw_handler.c
++++ b/handlers/ucfw_handler.c
+@@ -80,6 +80,14 @@
+ #define PROG_CONSUMER	RESET_CONSUMER
+ #define DEFAULT_TIMEOUT 2
+ 
++/*
++ * Use GPIOD_LINE_BULK_MAX_LINES in order to determine,
++ * whether this is compiled using libgpio v1 or v2.
++ */
++#ifdef GPIOD_LINE_BULK_MAX_LINES
++#define USE_GPIOD_API_V1
++#endif
++
+ void ucfw_handler(void);
+ 
+ /*
+@@ -91,8 +99,12 @@ struct mode_setup {
+ 	char gpiodev[SWUPDATE_GENERAL_STRING_SIZE];
+ 	unsigned int offset;
+ 	bool active_low;
++#ifdef USE_GPIOD_API_V1
+ 	struct gpiod_chip *chip;
+ 	struct gpiod_line *line;
++#else
++	struct gpiod_line_request *request;
++#endif
+ };
+ 
+ enum {
+@@ -111,6 +123,7 @@ struct handler_priv {
+ 	unsigned int nbytes;
+ };
+ 
++#ifdef USE_GPIOD_API_V1
+ static void free_gpios(struct handler_priv *priv) {
+ 	if (priv->prog.chip && (priv->prog.chip != priv->reset.chip)){
+ 		gpiod_chip_close(priv->prog.chip);
+@@ -203,6 +216,150 @@ static int switch_mode(struct handler_priv *priv, int mode)
+ 	return ret;
+ }
+ 
++#else
++/* Implementation for LIBGPIOD V2 api*/
++
++static void free_gpios(struct handler_priv *priv) {
++	if(priv->reset.request){
++		gpiod_line_request_release(priv->reset.request);
++		priv->reset.request = NULL;
++	}
++	if(priv->prog.request){
++		gpiod_line_request_release(priv->prog.request);
++		priv->prog.request = NULL;
++	}
++}
++
++static int register_gpios(struct handler_priv *priv) {
++	struct gpiod_line_settings *settings;
++	struct gpiod_request_config *req_cfg;
++	struct gpiod_line_config *reset_cfg, *prog_cfg;
++	struct gpiod_chip *chip;
++	int ret = 0;
++
++	settings = gpiod_line_settings_new();
++	if (!settings) {
++		ERROR("Unable to allocate line settings");
++		return -ENODEV;
++	}
++	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_OUTPUT);
++
++	req_cfg = gpiod_request_config_new();
++	if (!req_cfg) {
++		ERROR("Unable to allocate the request config structure");
++		ret  =-ENODEV;
++		goto freesettings;
++	}
++	gpiod_request_config_set_consumer(req_cfg, RESET_CONSUMER);
++
++	reset_cfg = gpiod_line_config_new();
++	if (!reset_cfg) {
++		ERROR("Unable to allocate the reset line config structure");
++		ret  =-ENODEV;
++		goto freerequestconfig;
++	}
++	ret = gpiod_line_config_add_line_settings(reset_cfg, &priv->reset.offset, 1, settings);
++	if (ret) {
++		ERROR("Unable to add reset line settings");
++		goto freeresetconfig;
++	}
++
++	prog_cfg = gpiod_line_config_new();
++	if (!prog_cfg) {
++		ERROR("Unable to allocate the prog line config structure");
++		ret  =-ENODEV;
++		goto freeresetconfig;
++	}
++
++	ret = gpiod_line_config_add_line_settings(prog_cfg, &priv->prog.offset, 1, settings);
++	if (ret) {
++		ERROR("Unable to add reset line settings");
++		goto freeprogconfig;
++	}
++
++	TRACE("Request lines for reset");
++	chip = gpiod_chip_open(priv->reset.gpiodev);
++	if (!chip) {
++		ERROR("Unable to open chip '%s'",priv->reset.gpiodev);
++		ret  =-ENODEV;
++		goto freeprogconfig;
++	}
++
++	priv->reset.request = gpiod_chip_request_lines(chip, req_cfg, reset_cfg);
++	gpiod_chip_close(chip);
++	if (!priv->reset.request) {
++		ERROR("Unable to request lines on chip '%s'", priv->reset.gpiodev);
++		goto freeprogconfig;
++	}
++
++	TRACE("Request lines for prog");
++	chip = gpiod_chip_open(priv->prog.gpiodev);
++	if (!chip) {
++		ERROR("Unable to open chip '%s'", priv->prog.gpiodev);
++		ret  =-ENODEV;
++		goto freelinerequest;
++	}
++
++	priv->prog.request = gpiod_chip_request_lines(chip, req_cfg, prog_cfg);
++	gpiod_chip_close(chip);
++	if (!priv->prog.request) {
++		ERROR("unable to request lines on chip '%s'", priv->prog.gpiodev);
++		ret  =-ENODEV;
++	}
++
++	goto freeprogconfig; // clean up everything except for the gpiod_line_requests
++
++freelinerequest:
++	gpiod_line_request_release(priv->reset.request);
++	priv->reset.request = NULL;
++freeprogconfig:
++	gpiod_line_config_free(prog_cfg);
++freeresetconfig:
++	gpiod_line_config_free(reset_cfg);
++freerequestconfig:
++	gpiod_request_config_free(req_cfg);
++freesettings:
++	gpiod_line_settings_free(settings);
++	return ret;
++}
++
++
++static int switch_mode(struct handler_priv *priv, int mode)
++{
++
++	int ret = 0;
++
++	/*
++	 * A reset is always done
++	 */
++	ret = gpiod_line_request_set_value(priv->reset.request, priv->reset.offset, 0);
++	if (ret){
++		ERROR("Unable to set reset to 0");
++		return ret;
++	}
++
++	/* Set programming mode */
++	ret = gpiod_line_request_set_value(priv->prog.request, priv->prog.offset, mode);
++	if (ret){
++		ERROR("Unable to set prog to %i", mode);
++		return ret;
++	}
++
++	usleep(20000);
++
++	/* Remove reset */
++	ret = gpiod_line_request_set_value(priv->reset.request, priv->reset.offset, 1);
++	if (ret){
++		ERROR("Unable to set reset to 1");
++		return ret;
++	}
++
++	usleep(20000);
++
++	return ret;
++}
++#endif
++
+ static bool verify_chksum(char *buf, unsigned int *size)
+ {
+ 	int i;
+-- 
+2.42.0
+
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 7d9fc90e10..efda0b3cba 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -39,7 +39,7 @@ config BR2_PACKAGE_SWUPDATE
 	    rdiff handler.
 	  * Select BR2_PACKAGE_LIBUBOOTENV to add support for setting
 	    the U-Boot environment.
-	  * Select BR2_PACKAGE_LIBGPIOD to add support for
+	  * Select BR2_PACKAGE_LIBGPIOD or BR2_PACKAGE_LIBGPIOD2 to add support for
 	    microcontroller firmware update.
 	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
 	    Guard.
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ea4a5a62e5..1ca4408de4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -78,7 +78,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=n
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+ifeq ($(BR2_PACKAGE_LIBGPIOD2),y)
+SWUPDATE_DEPENDENCIES += libgpiod2
+SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
+else ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
 SWUPDATE_DEPENDENCIES += libgpiod
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
 else
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
