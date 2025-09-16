Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAC7CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8E160DB9;
	Tue, 16 Sep 2025 00:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH0vbJkw3ZW2; Tue, 16 Sep 2025 00:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A290860D6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A290860D6C;
	Tue, 16 Sep 2025 00:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D81199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D0260D6A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TPe9Nd-4tgL for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B051360D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B051360D56
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B051360D56
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:53:36 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-417661ecc5eso24722175ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757984015; x=1758588815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SlhHMymsU78cigzz9nwFmFohzAWAsGGOc4EIdUKt9UM=;
 b=f/LUfeFhkygBrA0C8YV09IVGQvNj0CeRBGyoARiQXyfYwdC4Mj+VHk/O5VpWPQybJL
 oW0B2hhQXPL4H++hHpFYoMUWmiblUQQhYmPGObzh2xL7V4clsSPxN4vIudNwLMKoayI4
 F7dAYFG+pSb2KOxZQOvABiwj06IRx8jc/5d78a96KXachS04Tq3fFELe/hmw2OWaZUsY
 Ru0GxP4pqkiVtv3H9N+mwnoG1TKvhUA/017m4F7VUOCmdqK76gU3PtFYyN9ZM7MAR7Ug
 CcizXJZfO3KYppqaZ5oX8iFhLsBjT5gMQDxXB0ze0Q/3JNj4VdFIAuhKHXlpBbTUhVnq
 WjkA==
X-Gm-Message-State: AOJu0YziEdQhnOwGXg+4vlMueasr79ReOd5GG0sy9lXEQ7Dv/Ulu9RrM
 ensA1DkksSGq6ykpTympMtGFYpjg1KgnbWOwasxaML+WeqRLoAik2KrHm06LXg==
X-Gm-Gg: ASbGnctnFMv1HYe3nRikxycElYw4IQuYFzYHAIHGKlbSj3xZY5tNivKE1VOcFVK9lk3
 9EYn5iVOsuHh20H4v8TVTPgIaA7HCul5Jgc4czofxjCCI8f4IKhVuK37kxrfIZIyzc2P8GeAM8y
 XGdZZJci0dvH3l9AVn8P5yjWQenJ7YL2e4ZvNLTNArrJ30JtFkxycxbMFzfJw5gvEmIEZoPmtS8
 t644fUoRumrLrBoVQoxjiTFvk+f9NahJ6pxBmwY85zXOIch3aQ6YfMo8KzhY/MMf9DUxAoPK5qa
 3mb16vrTTc8ZjX0BR3zhEXExOE7kaeHq8O09GkBXDMjeW/OmzUOf6BLd4E25bNnzrjDyXSTqBkl
 d2rfQqEiiYvFGCxofDbin+hv/M6NmVacAPj2TwgqD54G5Rcj3rYFAxegL1i5DJ8gTHK/islVK1r
 A8rAGEE3DmyFk=
X-Google-Smtp-Source: AGHT+IHOofGiXsKyiwmyVcSWxLTh/t6+JKfQBb9la+xiDeZA3Kb3xGIekUc9a/zFTNxNnOuIjKFf5A==
X-Received: by 2002:a05:6e02:1a49:b0:424:cf7:7d04 with SMTP id
 e9e14a558f8ab-4240cf77ec3mr24423745ab.4.1757984015384; 
 Mon, 15 Sep 2025 17:53:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41deede654esm64283295ab.9.2025.09.15.17.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:53:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:53:33 -0600
Message-ID: <20250916005333.2536248-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757984015; x=1758588815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SlhHMymsU78cigzz9nwFmFohzAWAsGGOc4EIdUKt9UM=;
 b=BcwgjC4Dsf8SVq1H5Nj83/XrHMYs8DPJ/5nNm3s49yfXT4g9bzsLDSDGSH2F3Pj3vb
 h0NfvIGWIB/sZ1sOqW4+pZPAZHBjBJbAn4pN0IDpl9pYBe5YpnquXKIAM73WuLwDXHTr
 eeAP9vFIRPJo7/hXC+wFacMVg1OVxp0DEvGPljnXrnW/fFGm24VP/CU5I91VTeiG+erC
 1CVcoqsvRUeTcfDPwqr1p7XdMgTZlxUa/eAU33HGO9AHg6IAN0UGyV2cden9+POdMT1/
 UqnRqj1dZm+wWaaRM3WHhwTgnN1r11DqX0b1AxDh/noGzhDjuJ+MjJhSECAVpy6cxHxd
 Tl6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BcwgjC4D
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.38.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index b1b816fa51..8f1652711d 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  a24d71a651889b89c12983c6bd3d1abf  sentry_sdk-2.21.0.tar.gz
-sha256  a6d38e0fb35edda191acf80b188ec713c863aaa5ad8d5798decb8671d02077b6  sentry_sdk-2.21.0.tar.gz
+md5  b3c58e0fb7cee9fb4aa2078fcd57a928  sentry_sdk-2.38.0.tar.gz
+sha256  792d2af45e167e2f8a3347143f525b9b6bac6f058fb2014720b40b84ccbeb985  sentry_sdk-2.38.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 25b419f1e2..82f3b6d4a4 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.21.0
+PYTHON_SENTRY_SDK_VERSION = 2.38.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/08/63/3f0e88709cf4af992e2813c27d8ba628a891db0805e3fcc6dc834e142c5b
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b2/22/60fd703b34d94d216b2387e048ac82de3e86b63bc28869fb076f8bb0204a
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
