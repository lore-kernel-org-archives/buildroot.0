Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7DCE9D404
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBE76105D;
	Wed,  4 Feb 2026 15:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dhzAJQk_ph3; Wed,  4 Feb 2026 15:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B464260D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219866;
	bh=5AvPb2KjdGylJ5/+HDbtxXUqRoHGmF5NjClPaZynrfA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GfUPRzkH1oc6nX6LEKyfdsHfmL736gHeDVdhqZ4q7rxaY1xjqLpaR7SKsQK9kp7HL
	 KZ1qULSBKg8MJtr8M0JpBRSPHRromePz8lVlU6tNY1w0qBKyWk6ayQSsFI+zWhRyaV
	 ukSnep8XNkvLTH9TCkhu4FxRPqC/ZamVINHWsh6ZyfHOKJ5xdjv3YB2DF2uhH6GGbs
	 jY9bQbh7JGYU+61kasUARn9bof0Q7qgnqLVUbAvtjfNaLj7rTrQ465Nup4WDTL+mQx
	 8KIzHKtuS866Bb3y4wGFX1+qGRiuB4jwIrOwR1NODCWpSDabR7xTt1fs4RUJngc+B8
	 2y/xHSwDQdRDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B464260D77;
	Wed,  4 Feb 2026 15:44:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E97DCF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C649F4016A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYEDb0NfIaXp for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A8FE401D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A8FE401D4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A8FE401D4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48069a48629so72621515e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219847; x=1770824647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aPJpN58+6cQVMYTsU5Btwf93ye64XRWzurpmDQcx3Ok=;
 b=dHFSRuAuUH67TDnXdMca6jbOm8OnAQO94+YL6v2PQC82uDoM6SkE5u44flDbguGF1Y
 OZNlRCqbr60QiKvh05cjBBBIoNQYPOl/z2iQgrOVpyWFnQ3x9QKwu1pXgSJSs2mUeByZ
 hBDyMkYp5zvIBh+SD9PcKwUaRD1Yp+ICu24MwUud3r/7j+nGPqVwHJj2ejZS9+MmGNMD
 MIjqEjsIcRNb1ABKUZ9pqpRR6QdO3EUDGj93aUoFTQMNYEqiiP5kueAkfM66j1tz/dQr
 dI11UJqrCFIhH3cWquTiLZJa7l95w9lA6WBwRn7VAz7tb0Tcr4zwpOMoVUAtRDzKQuQK
 tTSw==
X-Gm-Message-State: AOJu0Yy5s7Pz/Se34DjUiaNIPHAQbcdzdxhrR4B9DysGvEjA8CG4QxYB
 MVTUzbLNTcyoUzQcQ9NLEIBQzKMp2mYZK+qNci16JIeFWHJPAj0bMuN0tqZuJ70KbRJa9XU4V3X
 LRo878hg=
X-Gm-Gg: AZuq6aJdBfzPPetiLqN/sTR6WecIOWfR2D8zlvjsqpSCI9RUyAHzlI5oyP/Symxl61Z
 gqVLfBxlDzPPtvXWPAjCwjIRuZZhzcfYeIgD6U9cqxSkzN7Yn4wzQWzcz5yi8cVSd7O3O6gPJ5y
 TfQDVGjqC/nxfSP63IrNQzseqSLpDVPwDpvqtyPLBBYSGnZ6VXcvB31q5nJiOv9Dm257SbNKHpp
 E/JvU4coTTek4gJu24A7YcMrwqybgJzyMtGNr0KR1rQ0YZ1gL/uzWkqRqOmM9sEHIk1LCLOrFFw
 l9smS4apL25ecr1khybsmI/TalSQEZqqTXbOQKenxoolJpKPwUHKcUDY0aQISCIPKoM7TqUCbnC
 VkRJ/nnO/fJYmGo0E746TCNyeAQEolN88MKWRTgvE/PdOPfMVumD8RTbdc5YToCmcmN0IYbHnDE
 loNGnUHgFcpG6DuwTN1WVJUwurVT8we8RfKjHBPJyyr6DgMoayO2jkS0P65Kc=
X-Received: by 2002:a05:600c:6217:b0:480:4b59:932e with SMTP id
 5b1f17b1804b1-4830e9402c4mr52531035e9.11.1770219847479; 
 Wed, 04 Feb 2026 07:44:07 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:34 +0100
Message-ID: <20260204154340.766528-8-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219847; x=1770824647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPJpN58+6cQVMYTsU5Btwf93ye64XRWzurpmDQcx3Ok=;
 b=WFUF1Ah5JFiW2RiebTae879cTwutPHmklkZK6TYaGaLtc6I1cfuO9ENGOXRyEuT9i8
 eZvg7qqunz+sLb8R7MKaESKfnghny6cSthMgWFbIB654oUVicRePighWi8AZihs7+J4J
 prR4IfjOEzMaxnmXfqh+9zsYJuPTaePwLuXsiqkMJ0zIFlG3ksOIp1ESr5CwPiVfhDb3
 k4WhtmxDurhqmdag4oDVjbZK0Jf89DsACh4lZ4l28Wyhlh5/uLuppOX1w5SJzvwK8ZVM
 Dy05DrpWxBwcl5rwvCjqWBG1ANpus6kb/eaSVMAwefis9ZKyqXMJPrn8rr3pBXvjcTM3
 6iDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WFUF1Ah5
Subject: [Buildroot] [PATCH v3 7/7] Makefile: add new target "yellowconfig"
 based on kconfiglib
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As informally proposed during the 2026 Buildroot dev meeting,
this introduces a new kconfig user interface based on Zephyr's kconfiglib.
The name "yellowconfig" is inspired by the yellow-themed curses interface,
as opposed to the classical blue "menuconfig".
Read more about kconfiglib: https://github.com/zephyrproject-rtos/Kconfiglib

To run that target, one has to install kconfiglib beforehand,
for example by issuing the following command:
> pip install kconfiglib

In terms of user interface differences, Zephyr's kconfig brings:
- searching symbols as you type, and more symbols are visible in a single
  page of search results [1]
- symbols that aren't selectable (because of unmet dependencies) can be
  viewed (toggling them on or off with the key "A") [2]
- symbols y/n dependencies are displayed more clearly, each one on a newline.
  This is especially appreciable when there are many of them, whereas in the
  classical menuconfig one has to scroll left/right to view them [3]

Having this as a new make target allow for Buildroot users to try it out
and forge their opinion on this different interface without breaking
habits and usual workflows. However, in the longer run, this could possibly
allow to replace the custom-patched kconfig programs we ship in Buildroot
with an unmodified upstream supported codebase.

Moreover, as unselectable symbols can be displayed in the interface, this
would remove the need for comments in the like "<pkg> needs <condition>",
where we need to invert and maintain conditional dependencies.

As a final nice addition, having a Python based kconfiglib allows for
programmatic access to kconfig symbols and settings in scripts, which
could be useful in testing scenarios.

[1] https://gitlab.com/-/project/2648174/uploads/8ae29a772927e7e555f85f6d31876bb4/2026-02-04-105501_958x1015_scrot.png
[2] https://gitlab.com/-/project/2648174/uploads/8d27510cf738cab9fd95ffdd81f75bc9/2026-02-04-105514_958x1015_scrot.png
[3] https://gitlab.com/-/project/2648174/uploads/6d51a4b608fce076ac8c0c84623531f2/2026-02-04-105522_958x1015_scrot.png

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Makefile                    | 3 +++
 docs/manual/quickstart.adoc | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 4cf8750bfb..af810657a7 100644
--- a/Makefile
+++ b/Makefile
@@ -996,6 +996,9 @@ gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
+yellowconfig: outputmakefile
+	@$(COMMON_CONFIG_ENV) python -m menuconfig $(CONFIG_CONFIG_IN)
+
 nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
diff --git a/docs/manual/quickstart.adoc b/docs/manual/quickstart.adoc
index 605031037f..d8e788ca97 100644
--- a/docs/manual/quickstart.adoc
+++ b/docs/manual/quickstart.adoc
@@ -27,6 +27,13 @@ for the original curses-based configurator, or
 
 for the new curses-based configurator, or
 
+----
+ $ make yellowconfig
+----
+
+for the https://pypi.org/project/kconfiglib/[Python kconfiglib]
+curses-based configurator, or
+
 ----
  $ make xconfig
 ----
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
