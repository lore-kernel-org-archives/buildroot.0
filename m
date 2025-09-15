Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D667BCAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 23:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE9B60D59;
	Mon, 15 Sep 2025 23:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lViS2cT9ADx; Mon, 15 Sep 2025 23:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC62760D53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC62760D53;
	Mon, 15 Sep 2025 23:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C1B12D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F3B40A02
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvLjRbjND227 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 23:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE44D409C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE44D409C5
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE44D409C5
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:24:26 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-42408762dc3so6713715ab.2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 16:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757978666; x=1758583466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H6Xgdnmc7n6fD6cNm1Wh4iJb37ycgxkeguzvVqMGmH4=;
 b=ElBJ/5uW7IKNeWhRpcHsKRz8m2JUs8dkPIJ+e6jCQR9jixt0PuHWYrfMEKQyXHhWdO
 OLNE9aFESC8p0luleXFXQNQHj59tF5c0qVOtlQxkbu/mAo0hZol5etn1aeEKpob+6aTO
 Jcg1y0RUcqEZePl/PyaB1jySnGM2YxWYH/vGbeNDiyOViL9g5Gl8bJlcoZCH9jcsVPhA
 ERluRHqQnouij2GnUi2WDf+G82pTiUuRLuxKa/5Ejnyu8tzCYsIvJnRn2/WbqHAsgdfR
 RLYHMfYq4pQeDYsl9/4zn/+UcO6bQViJyNPcgMqz2OFDHugIOyeHxk1PD4WxPdoMyfvq
 W0dQ==
X-Gm-Message-State: AOJu0YwNl8taG8IzUTyT5si5Uj00Y/q/d7fIZT/jGV4G8+HMlMXaQ2W+
 8t3CR+qAnVKuguEsEp5ePaEhaTbhzE01aPWyXGIcqi5WLu192rNW1XKWtjRTww==
X-Gm-Gg: ASbGncuCFobUSMRfY4liDow3H7cIRXGD3dqDV/39qUVXGyi0dddQHvtByajZqlq8VuT
 bPOr0TPrNjKC6Q+i7v+0ry+XlKvTM3eTFCt+LMn4srqRrLr2LmNoqvvXE1zECKTMJFBw4oofU+D
 QpmJkJxG4IBO2q9giibNJsI+0f/cKEsN/qA6NRfL7IC6LwtbRXU8/63TZZDLqjQvO3jczejqhNp
 vLnDmuBejj35Or2sDzQb8TKkGakyigPtKvkcPM5c1x0Dko2eA5WbF8cdgNHkUfZJeZLqMs1bFQf
 K/VOXI1YMK3goFua0vjZTGZqQ4KwY+mxNxwaMDbBtIEeXVj/zJ1E7tLzm6NQBatYjc+5I4HoXPi
 PWy+j6E0QR+l4vjN1tDf+56TY6qSwyVMh43Tv4eH031N3eUGSmQIKQ1XCiO7iznLFLyCAfiZgt1
 Dx
X-Google-Smtp-Source: AGHT+IEiA3w8iYGTpt0dwJC7DTIDaqRuT/z2fY068XTBX/rKE/4Lfce1UGfmt8ZCdbM//StanmEhYQ==
X-Received: by 2002:a05:6e02:2193:b0:411:e396:5e2b with SMTP id
 e9e14a558f8ab-4209dad33c6mr157100505ab.4.1757978665622; 
 Mon, 15 Sep 2025 16:24:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41df02f4c0csm62357345ab.15.2025.09.15.16.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:24:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 17:24:23 -0600
Message-ID: <20250915232423.2152323-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757978666; x=1758583466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H6Xgdnmc7n6fD6cNm1Wh4iJb37ycgxkeguzvVqMGmH4=;
 b=eaguo+tuKY3c6cqr6rVDOkKb9dfwKVCxZqfauHGAM1hYSu2RlRDPirLtmcnDyfxXTS
 hf5NKsffXlMmJIJi/IvPXDZ5RipH7+BraSNM1DePo+VzPXkYJaXFY+KSH1dL04fAHNz2
 K34LyYroj0M4rRzOif5y+OPnP5nsaUlKnmq1Ks2uX+f46igkL8F5gyZBqgVMA6LZOqvp
 21P/6wavu0B7tO512i/vWL7206H1WUPFuUHWL8f+H1L5gO4JQvWBK+IJkOPHEyg+AJ4N
 4hLxkmq3JerP0PHMN7fbyzjtVcW9qg+g2rUCn/WvxUtF8RDGkLEtS5lafPysfz7ohCUa
 a3Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eaguo+tu
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.44.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 5f8b11c540..7ff243ebda 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  45f1bccaa3e23304d8da1916b05dd646  dbus_fast-2.44.1.tar.gz
-sha256  b027e96c39ed5622bb54d811dcdbbe9d9d6edec3454808a85a1ceb1867d9e25c  dbus_fast-2.44.1.tar.gz
+md5  ea8420ccd0c90ea8f3dda3df5b0a7a01  dbus_fast-2.44.3.tar.gz
+sha256  962b36abbe885159e31135c57a7d9659997c61a13d55ecb070a61dc502dbd87e  dbus_fast-2.44.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index fe17674708..6f629c0cc6 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.44.1
+PYTHON_DBUS_FAST_VERSION = 2.44.3
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/c2/a1/9693ec018feed2a7d3420eac6c807eabc6eb84227913104123c0d2ea5737
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/00/f2/8a3f2345452f4aa8e9899544ba6dfdf699cef39ecfb04238fdad381451c8
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
