Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE39E728E1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B9F40903;
	Sat, 30 Sep 2023 19:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39B9F40903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZkDXp3j0qql; Sat, 30 Sep 2023 19:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49558408F9;
	Sat, 30 Sep 2023 19:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49558408F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0BE41BF37C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9A9F60E5B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A9F60E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbSKFuolECXu for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:15:02 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE25B60A65
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE25B60A65
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-57ba5f05395so6591673eaf.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696101300; x=1696706100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccfbNKpv/nyb2u4bT5yI7gIDN0adSlvJi/KCQ4UQ9EA=;
 b=H44y7S1OZdflIX/D/9OdvV6IWLdYXtCvFkpEBszHvPvj8sU+GgAa5G/zXVCutkelXj
 bmZb/+HPI/KjZ0VuNjvFwAUdrjiYTpOnUmf9kOC1pR106fqZMabLNs9VAwCCj0K1XMxl
 kJWx2i8RG8fFd4Dy+UbFYMulCecHyq8y5U6o5ojCVU2Ja607YH1lvTq1wAg1XUm68oFH
 USky9MOWdWuP5EIZ7EpQvspnIQiPlZdNZi96GF1AhkSVOsS3Zm4sffiw1ThIcs0+JYfA
 81+lNaDTXgOWDhPMYx8MPiih7AEDUq4RiMGK4dExYi7OK3eda0mnuJKoiCRmRRkD/mvy
 p1tw==
X-Gm-Message-State: AOJu0YwAbWnM17XTyxe1EtJaeRLrC+2ARmfmFUPE+SaVeyKh4zwv0eUI
 eu3gJOaTRP4rGlw/AcnCjyv5Fuk/wuU=
X-Google-Smtp-Source: AGHT+IFbzd2yTHUFgbb6N8CrfjumLIw76DocUlKhttx2CHI7FxmhXyy6zgP5nHcVxOWhth/L+W98hg==
X-Received: by 2002:a05:6358:4298:b0:143:8af4:229e with SMTP id
 s24-20020a056358429800b001438af4229emr8643695rwc.9.1696101300603; 
 Sat, 30 Sep 2023 12:15:00 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:ff94:191c:6a3d:8b35])
 by smtp.gmail.com with ESMTPSA id
 z13-20020aa791cd000000b00694d420e25esm1349491pfa.157.2023.09.30.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 12:15:00 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 04:14:54 +0900
Message-ID: <20230930191455.757426-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696101300; x=1696706100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ccfbNKpv/nyb2u4bT5yI7gIDN0adSlvJi/KCQ4UQ9EA=;
 b=Uv/xIPAf8GssWhO7HW6puEKDbjKS5fM806LG/WonWO1YJ0OpzZEcl2FP1dMRHZ8W6x
 vxg6LuwbVk1j8mVM30QslbsbHSnJvJiFG53RyO+Msueb5AFDcSpqomC73B6isCwu5fyX
 aole7dF0WaS5VvygzNNnd0ywOUlXzWYgQbjKn7kI6X/E+DYCm/X9WVueEA6zkHQG2+xj
 m/6xrgtKBq1mUQRa/3iVj9AB7vG3LKcR8OE6tm2ANynnJAL+Q89wGFC3r0amzy2zrZ6Q
 WD+6wNduGU9eoe+qmxjmNdXXpAYSuBPF3z6HVKiSuroykhEMWnaWuWjPHzfXLTxUlkrd
 ppNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Uv/xIPAf
Subject: [Buildroot] [PATCH] package/itstool: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Translate XML with PO files using W3C Internationalization Tag Set rules
---
 package/itstool/itstool.hash |  4 ++++
 package/itstool/itstool.mk   | 15 +++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000000..7bd533c0d2
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  fba78a37dc3535e4686c7f57407b97d03c676e3a57beac5fb2315162b0cc3176  itstool-2.0.7.tar.gz
+sha256  f907bf6e8a3f4911af6904597c9dcb6b415ab2facf8d403fa3c5afa1f533ab90  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL3
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000000..3b738c2f01
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.7
+ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
+ITSTOOL_LICENSE = GPL-3.0+
+ITSTOOL_LICENSE_FILES = COPYING COPYING.GPL3
+HOST_ITSTOOL_DEPENDENCIES = host-python3 host-libxml2
+
+ITSTOOL_AUTORECONF = YES
+
+$(eval $(host-autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
