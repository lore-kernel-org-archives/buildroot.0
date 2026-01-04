Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCDAC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269D280DAE;
	Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpP2Xv0WnOzv; Sun,  4 Jan 2026 17:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEC380DA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767548833;
	bh=qn5CM4PZITVEEoJRAoEPha8Nz6bETYqsUKZaCC60SMQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=peRdI7W63HfGw3QmGfNIjVFqUhU6o0x6erkEyHhi0qXVpinBhdnQwt5D9AGMeGCZw
	 EROYepzu0LujNka5w3SJNQ3vpgjIsUZXMWCrrAP/CE5+UNyvm1VPL/gcI7/uHx1Al2
	 MUsCaXoNDt3lYHX+5VIg8YdTfa18DDbDG3N4R+rWWH5lDQ7nxGosQybRNrtQbNCSjS
	 ubPdgHgPUgZWtfD+O9lRIQuYPM5uCu4uOPyWPeXaDafEvmeT64Jmk/V1QXOp9n78V3
	 5/TupHanJ0/yIwVW1jmDAG4n7Ad47zsCCjKj0/gradiJVAJwxcYkCAZhHqOkr8Hi5W
	 5tqbph+r3d+xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEC380DA2;
	Sun,  4 Jan 2026 17:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B009E7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2821680DA2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeSD7rp3x5ev for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27EFE80D9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EFE80D9E
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27EFE80D9E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:10 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7ce2b14202fso558832a34.3
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 09:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767548830; x=1768153630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRy+7vZkMZRWUpUYeP0gCNHdodvf9pSNSM/vjARlkGM=;
 b=ITwMmRM2G44qiY6Os/XZxzQ9HRsdjr9CM7KC4Mh+YmXlHeZ9PaXtDO3LloUrUSJN21
 ojNrgkUN3HoQRB/yfLOnjGzQXXdPJUr1cXhDVl4UTP2BlQydQLvBn586krFGHlFjpLBL
 68759+XBFTG2L2Se7/Xa3GbNwAXziwB38Zb3NzhKnDGR0cZJ3Yh4xUIDZnwynrUFvZru
 5UAD0WUB1xfhpSrwpTLYoTV/svc62NZtvkez9VkaKRaNchI4QMjx7vgLahDZ+GqNGlE2
 k+2+txWZtn+OiMKfHZqOsAXW4izyG8wo2XsefjIsEgZ7W7ZyInL7vmVF+w5lCiYdiVk7
 gPiA==
X-Gm-Message-State: AOJu0YzHmgi8HzXnvEh1BQtDWMim7LUeUz4m3oVhLwBhYUNM3d4MLtvv
 F2tZCi9/avPG+gUmHWHqlFYrs2eXY/iyQUybxzRgnEJLR5E+uJo1ZbkYIN/TP7iV4fw6+w==
X-Gm-Gg: AY/fxX75+zHJFIyh/OuuIlF52J+4dAByjKHeabsU9h8G7FF7O60ICk0TdM4u7bM1vgZ
 Ey4G9425jkk6ja3I6ba9hK6GPFmVTdom86g0ih9eXLQxS/R2zbeSM63tsejpgYdDN0XLgKyM1GL
 mCDhvWAIQrE9rcRW1yETm1XDfBdmYdbV+E3X+xi+iAvtMf351bFdsqJGaufO293rfe2EXKG0h6a
 0HQOGmSb+PLhrf9vvG4y0Yu37hqYZDbeN09NO6cZ+S0+txuvTZgaOsPpYA10uCLKMeIqPQUEpN0
 J2UW6BcwtqTE2+sAJF+PhJ1ZfaiO8r1U1W5jDkrHR0djyvOyvYSUHSWxu/45e3R+rgGWGCOhQPZ
 3BMaGo8X+zvADwY/PM1qvmpxR4wvBtQg3X2tBTvFXqy/SCKI5JqzGihzw+yuVX+3Ph7jkYI7pqN
 hCj+r7u73OCQrmX2BqEe1zjl6Cqo1s+P+SnYjDwYiyBogqY2CmgAloBOH812xMaO5rs/SBD8y1M
 Z3lFQieKJrtdbCW+7try+WLarmz00Xjg8bHOB5l49TEn7Cj/IElo/Q=
X-Google-Smtp-Source: AGHT+IHbQ17PPqh4IUJl3VR5y5JMdfg39MZSqzgUO02Qe0NY3qHIZl7QOVnedNdQU+1+BvJaxvTLVw==
X-Received: by 2002:a05:6830:63cc:b0:7c6:d001:afb2 with SMTP id
 46e09a7af769-7cc66a9ff31mr21527961a34.35.1767548829814; 
 Sun, 04 Jan 2026 09:47:09 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bdb6sm32090486a34.11.2026.01.04.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 09:47:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 10:47:05 -0700
Message-ID: <20260104174707.3909632-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767548830; x=1768153630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DRy+7vZkMZRWUpUYeP0gCNHdodvf9pSNSM/vjARlkGM=;
 b=lVHHLrkn7NtmcIOy2/2fJCKdc0nv0k6IMPnAcegYykIyRt16sjTfggYeXIunQc1+Mt
 eB9k1sJ+FVHado51eutJcZjs7yub8KWAMO+5l38+mCnOdK4Es6w517hSJjD+bcw5rw03
 ffnjdJ5LwkNnEFQWpV+VjImPy2GhhnTkkpA4n3CLeBwmy2euoilsdikqowYiJ5B+H+a/
 1UDBSVC4d6wZZ90aXgGGhjmL87sSOjh/8+eiEvVwE0tgDRpaenF87F3r1UKYBEbJ1g8e
 q/fS5uW0B4n3NQEYMUafwldg2WHH6wH8BOIDhC6jDw1mYlhVEov/R1aHgP5W1Wpok/48
 d49w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lVHHLrkn
Subject: [Buildroot] [PATCH v2 1/3] package/python-librt: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-librt/Config.in         |  6 ++++++
 package/python-librt/python-librt.hash |  5 +++++
 package/python-librt/python-librt.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-librt/Config.in
 create mode 100644 package/python-librt/python-librt.hash
 create mode 100644 package/python-librt/python-librt.mk

diff --git a/package/Config.in b/package/Config.in
index def3db0e50..d639031eba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1204,6 +1204,7 @@ menu "External python modules"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
+	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
new file mode 100644
index 0000000000..1e29629680
--- /dev/null
+++ b/package/python-librt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LIBRT
+	bool "python-librt"
+	help
+	  Mypyc runtime library.
+
+	  https://github.com/mypyc/librt
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
new file mode 100644
index 0000000000..5c7f55bbb9
--- /dev/null
+++ b/package/python-librt/python-librt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/librt/json
+md5  2f0564db5d18a9e41bcd1fbdbdbee77c  librt-0.7.7.tar.gz
+sha256  81d957b069fed1890953c3b9c3895c7689960f233eea9a1d9607f71ce7f00b2c  librt-0.7.7.tar.gz
+# Locally computed sha256 checksums
+sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
new file mode 100644
index 0000000000..5c1ecd8e5e
--- /dev/null
+++ b/package/python-librt/python-librt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-librt
+#
+################################################################################
+
+PYTHON_LIBRT_VERSION = 0.7.7
+PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/b7/29/47f29026ca17f35cf299290292d5f8331f5077364974b7675a353179afa2
+PYTHON_LIBRT_SETUP_TYPE = setuptools
+PYTHON_LIBRT_LICENSE = MIT
+PYTHON_LIBRT_LICENSE_FILES = LICENSE
+PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
