Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B061F3095C
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 13:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A9640BBB;
	Thu,  5 Mar 2026 13:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqHulr5f79_s; Thu,  5 Mar 2026 13:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF1F40BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772716715;
	bh=9yTZPevJ6NgEydqmR2mDFW/uP/nRIWX8UUwgtHn9BV8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUruOLx/Uq62HfMMnfd4s8xGKUAFCm8NSLqKcVtVJyFhu7xnAEecBgm9UIjICb6eS
	 asuYRNE7yHi97j6aK0Onvu9QTQuCi1cxH/gYj8b3idU7x665e1yc7z5W/IPBvgLP6p
	 R472MhqdOOk51ioXV0S1LDrvBQO2d8WveROQee/aDdyyN9JYccZ/o64m7e+mKD/KwR
	 cFmtb5/Unm0u7waTpy2MfzWXAs4PBmnZHbMhLMz3lYFI3EHgf6EKFF9QZmtMBtzo7l
	 ERnG037kqOnpmHf1HduYuC2gFJR0S5f8hkv3W0IugsIHMRX0skhrQYalbMPuJngMvP
	 +eP8bNfSTQRRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF1F40BC2;
	Thu,  5 Mar 2026 13:18:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEAF4223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE6A40120
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1YUjIEs6gWI for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 13:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95EA84009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EA84009A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95EA84009A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso1591056f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 05:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772716710; x=1773321510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1yD/+cAUc1BTIeZEDz0kVIP5MXdRJfX/ErID2oeecFI=;
 b=QDuU779CrhT0SDtgxA8Z5kXUqKjh5qLW4j6AJLzBkqHb8/EVUr8wCbtgE9ATh8a/gh
 KNnarF4Jxwkkaofw/goYVbzqqqCS36NOST7qvraaz0eSL4HSJfzGutCws5wtmwhnQiBV
 2v4Bihu6ATGUuQIFPvqluYbWHl+hOLGAnPI24uhiD0wfzv5Tle2cgA8f2p7fCXMTS1E7
 duJ1ytuXGFxsuroRXCnDCD6V+b9zlhavuVY1zQs90IFJzAzAQlU4i1y06Lf3B0kU6NSU
 GYeA+LAm2x8vZScTs33dwCejHggKVIoYhAt8bnNkmkTUP6KGXJGxkStepaFLhobsM/jv
 FAGA==
X-Gm-Message-State: AOJu0YwswJMNWKVjkwg+6Oc5RfA2uDWK4RqHXvAsQOIMuYlm7vjgcpBP
 a2WK4eHN9EXrBssxyT126k9p4hMNKvQ4JVG6RJxkoDKb1H+5XfEVINMUpV2auXUFOq246tO526N
 bbheu
X-Gm-Gg: ATEYQzzu3CkqrcAD1c75RPOizqUqFzato29Qs8dOc89j7xbteuid98En/snnB9lTP/n
 4iSyDCMRe1JcxtqQchwCeGf7snvaUdwvT9z37yzA9Z/MIF9VCVDZu93nT+drXqHvI/0ZFvjX5iy
 BKsTJQu8XJeWizPELRB4Euj41jK9Z82hb1JEC0vQzhh8c6oC6QC6umyajsAX1rDf31fOYJGlQDF
 aJdXdHJYgfcHeHfxPKOefUh3Go3EA8K3jV8rUIMR3F0KrQgxEdnlsW6Z9OJkABKaoSfIvaKNvmg
 hb/JU1cQFb4NIk4c3+Y02Qddng+pbv/POC6NC0hooe/xrg46jiO0MuDQ5pDcZNy7hF/t5TKAbdc
 k43XBr6NYzDuybicIe7myHvawkmtC7gOl9rZkj6lPMpSn70CkR1HODSof/it+JmCV00vqVJA1kf
 B92XZj9pLzWdHPJjIqAdP6dg8vgfmX/SstMChe0UkfE6P3kFskfrGBqzfk+HLoP/2qki1r+YzY4
 cvgl3+dwfW9XvjXR8XOeDo3gm0ZBv5xN8vrmNAO6CK3XVOwGDbi8xuBf8OTQgWnRWexxcCkG0T8
 Ag==
X-Received: by 2002:a05:6000:1acc:b0:439:ad3a:b737 with SMTP id
 ffacd0b85a97d-439c7fd4677mr10686337f8f.35.1772716710320; 
 Thu, 05 Mar 2026 05:18:30 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm33025907f8f.38.2026.03.05.05.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 05:18:29 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  5 Mar 2026 14:16:58 +0100
Message-ID: <20260305131701.56962-3-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
References: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772716710; x=1773321510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yD/+cAUc1BTIeZEDz0kVIP5MXdRJfX/ErID2oeecFI=;
 b=HqpuM1KP3OpBJ0YdYPauCr6XzKMWgtMcXKetmUXxiEHAqlRtEHyrFpIcmFLe6AFFst
 Pu25wtoE2/fS7B74X14tO1t20oR3vVdA73BfyUPQ1IKAwam7Juwzf/7w3VBrAx0Z/xRa
 6H9AROD8p3QL3PM+4fOtwdk1dGWOArGpj21Ck=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HqpuM1KP
Subject: [Buildroot] [PATCH 1/2] package/libcppconnman: add new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/libcppconnman/Config.in
 create mode 100644 package/libcppconnman/libcppconnman.hash
 create mode 100644 package/libcppconnman/libcppconnman.mk

diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..f1fee9ae72
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	help
+	  Compile CLI example.
+
+endif
\ No newline at end of file
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..6367503e7f
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6fe3f4eb7372786f76b6be8cf77720066f4aa216c6596e99d8015e7139a00073  libcppconnman-1.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..2a0eb10ec9
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 1.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
