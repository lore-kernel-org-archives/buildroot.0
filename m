Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BF9E784BE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 00:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986AF608F0;
	Mon, 29 Dec 2025 00:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0okS7OE6VMBG; Mon, 29 Dec 2025 00:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C2D608E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766968860;
	bh=wce8mkUFD9B4KWMSD1Uj81vMBFsSCBZyyVm42jHtB9w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cFvtV3vr+a7i3xXnI8TgkGgdYsNCrw+r/wieCWh7QKm5+U1wO9YKNXCKQhR3Bks+O
	 o50y1MUOTgKTP+oO+Kfw3CfqF4Di43BN5c5egDnXyAFzj1cOz8XmYhX8O+YkAnMtmx
	 1L1hPmk6+j0Dt1TSSkzrvgyMIYQfob8CGKhtx2JfUv1emHrI0nOWNfDCKI0Zqck6Dq
	 qWOFx7k/MNNJjZD4lehUcZvmeXrkeqOXXuRU/N/wH91aCuOL9nL6vEh6TK1izggNLk
	 VzV3xUdONFf5ZTZ+U6bpqH+4h+1PaGVIk+qp/lbb87xvv+BGfvVaOFzfcaGBdzUDbE
	 rxsh+rlgXh2Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C2D608E2;
	Mon, 29 Dec 2025 00:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E30B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4028680865
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGS4Od1prAuu for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 00:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57C568081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C568081F
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57C568081F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:40:54 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7cdd651c884so2185879a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766968853; x=1767573653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kz9Wm7b7im8U5cl05Rlaamg4UtlKsmg4oSlvVhN9QbM=;
 b=ES6VtrLae/TzBH67HXD92tzzT0QZx9PB6+tBnGnNAoWvd02rji8zN4sEDgM3FwZTuf
 /RYZBTsYng7gmL5cAZ1M9Q/w5BkXnCPDA1Kx+vTLnJ9XFeEc2cmpoA7itlgqWhp9vxqw
 KhT1RajIqZSoSv1R34VX87W5tSanRT2Af/UjHHEYKdPV9VfxB4OnPu+cpzlAkm+FX/X2
 5NUHGUQ2CzdopKtOrn864/McpLUQZ++rxNNabFQUimuOJTFsTIrLQBaACZsIvDKCTM9B
 zcrzF21Awq/rgefQeRAV307+Hd3b/WJl/Z4onbrtlXP6TF96cWzlsnojvv5jbrYOt9Kc
 aIug==
X-Gm-Message-State: AOJu0YwiNLLkQOsX1QTwuSnveXpcPZgNVIp27TDyc4OxXOr8JGXctsDY
 8JG4ehRaQTzTbLaCXQATBntsoNZjO7SYHxBg90nreH/jvKRMHW1L6i9FvyJ3i8HXadY=
X-Gm-Gg: AY/fxX6lnAX6hhDNf3uqXCr1ejtyv+Ju6qkFhoi4gRuzxqs7mwhCTqLWflguVlwxFvG
 M4jazaKiCxc/+lG5127YujQnXY44WQqJbC37fqV1KAomsEdyeRQxCOnJ3n30HMHU4yA4eRi8qXd
 M1wduoIg/O2eMurJXYH/sovUrEzii6qYlJ7wrP3pN6/9+K4FcIelQkqSY8ky1WxGKZGm8D/f6m9
 sHZg6w3iVNTzrHU4zdl3PsjngbVv6fM8wHZVWpgms7l0oPmVD/Dqgh5doZ2Eu7xAf4A+FNedyvn
 BCtgJxO+S5mIr5oG4W3LCDkeZGGyRRsEWge0hNTEGQJq0krY1sbZs2lQ2vnAuVEkX+kANOHJxyt
 /UjLog12RFsR2hmkx9lywAF6BWaeqzPX+2D4N+E+D5LW5mkoOdIwBp1fM0m/p3QZAjggFm94H9t
 83ppsmigGBGDw2E3PFEC2rJEEjIcY5zoCS606lnHqOFjqC8Ew5JA5ptyoITCk5MqTtA0VRN8iPp
 Xbi9BUICehumQ3qHeWbzUmWmYZ5LwZ1oOnHUdGbTzd8LQ61NolNC1W088Rbb3+4rw==
X-Google-Smtp-Source: AGHT+IG57TBkKpc1aDz/BgU5uL9mOfFm33qJj8OjWsGXxoVY45fzyF+NTrjgmciRAoXIBq0jmRLrwQ==
X-Received: by 2002:a9d:754f:0:b0:7c7:48b7:640a with SMTP id
 46e09a7af769-7cc58af6095mr12018375a34.7.1766968853080; 
 Sun, 28 Dec 2025 16:40:53 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bdb6sm19792412a34.11.2025.12.28.16.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 16:40:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 17:40:42 -0700
Message-ID: <20251229004042.3100499-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766968853; x=1767573653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kz9Wm7b7im8U5cl05Rlaamg4UtlKsmg4oSlvVhN9QbM=;
 b=TkoyZSagjeBfWHAuIZsj8TUtx3nDiRjJDgeKy3jLltlAUMafoJx1Plsux8KenH7Lfo
 1+XOqWRTt+uysBsbvvm2e7zYx0nWAuiJW3dR99erD8zXDGgj/Y1hendlupPIeOt2KEj1
 0LgBYH2X1PUdyWBLT5Ggs0UtUeguYYNc5jqn/JIw/QLnxyhU7ISnaaAgPwgm3+/uE7Je
 PPKCn/Ms2qCWtUES99N2fTvx3EYBl2yoAQwIRMGq9LHdgdmi4DUtspAfrO2LKU8cWFXX
 qLBS9ldHjvb5gHmLlU7Seo0xkgMYFyN4YXIRzGs1Wwv6C0UR2LT8CqUGytDKZdfFf4r+
 aPiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TkoyZSag
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.0.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add libavif support.

Add new python-pybind build dependency.

Set --skip-dependency-check since pybind isn't detected properly by
the pep517 build frontend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/Config.in          |  1 +
 package/python-pillow/python-pillow.hash |  4 ++--
 package/python-pillow/python-pillow.mk   | 14 +++++++++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
index 126cb452fa..51d8db5920 100644
--- a/package/python-pillow/Config.in
+++ b/package/python-pillow/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PILLOW
 	bool "python-pillow"
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  Pillow is the "friendly" PIL fork by Alex Clark and
 	  Contributors. PIL is the Python Imaging Library by Fredrik
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d9077daaf7..22d1f3fe7f 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  9464f92bed3be9c68293cb399ec1ec1a  pillow-11.3.0.tar.gz
-sha256  3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523  pillow-11.3.0.tar.gz
+md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
+sha256  87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353  pillow-12.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 80961b92a5..19e3f8e279 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 11.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238
+PYTHON_PILLOW_VERSION = 12.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
@@ -13,8 +13,9 @@ PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
-PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf python-pybind
 PYTHON_PILLOW_BUILD_OPTS = \
+	--skip-dependency-check \
 	-Cplatform-guessing=disable \
 	-Cimagequant=disable \
 	-Craqm=disable
@@ -40,6 +41,13 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Clcms=disable
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+PYTHON_PILLOW_DEPENDENCIES += libavif
+PYTHON_PILLOW_BUILD_OPTS += -Clibavif=enable
+else
+PYTHON_PILLOW_BUILD_OPTS += -Clibavif=disable
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
 PYTHON_PILLOW_BUILD_OPTS += -Cxcb=enable
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
