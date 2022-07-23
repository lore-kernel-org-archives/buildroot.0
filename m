Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE38C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 23:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C3F60F23;
	Sat, 23 Jul 2022 23:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C3F60F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ArCJnY1_vz4; Sat, 23 Jul 2022 23:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C8B60B55;
	Sat, 23 Jul 2022 23:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C8B60B55
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58E7D1BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346934019F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346934019F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV3mnzA_FVDH for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 23:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C8A40256
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9C8A40256
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 23:09:27 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id c185so484912iof.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Es/geTpmcAZJMDdBvzETI8pXJDmlcBrZRbwxr+Ap/MQ=;
 b=hqdyChmHvJritZXB0w8fmoDX9WQ/u+pO06b/73ekmJtFKWo7z98yZ130VJ1A2s/4B6
 TMV7mTTbZx4MHRveZhHXp0mpp+NCQUcmpacYuX+XszC9EkgUYhrpjQCycATUdBHkoRPJ
 NKfgx+KwkAF6jUQKCZgGiXDXBpdVRnTZfxn0/uVx/xApWtaEFLhgCv6F5WUz1/l42PRg
 I0Cb/vT+X4ZRg0r/dv48Yw4mhSXRPUFx03+BYN7+R75nMEjfeh73KqMNJHDkgQd+KPCM
 fhAkz7aHAmtFu1tzSG6fD6/ocuGWvNvIB5wZ+2DB+j2LwaBCY0HJ+QaXkWJvVdyAVC8A
 1Xew==
X-Gm-Message-State: AJIora9O+/KQDQeEuPynTOkWkHA48oofhnpswvmakiAwz9dNvAH0PXmO
 ZyiT1tYt+0lmZ4DM8fVZoHeUf5b1CXg1Vw==
X-Google-Smtp-Source: AGRyM1uRWhuJY3E8KXModKULFNqRQuaq8FuSWlSbWNjsDsSmtzSL6CgCFYqI0g9wCLg5vVJ1boNF2Q==
X-Received: by 2002:a05:6638:3f16:b0:33f:52fb:3e28 with SMTP id
 ck22-20020a0566383f1600b0033f52fb3e28mr2367526jab.46.1658617766648; 
 Sat, 23 Jul 2022 16:09:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 d4-20020a0566022d4400b00678e1d1b2c7sm3992593iow.0.2022.07.23.16.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 16:09:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:09:20 -0600
Message-Id: <20220723230920.364671-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Es/geTpmcAZJMDdBvzETI8pXJDmlcBrZRbwxr+Ap/MQ=;
 b=lvFrh+gJEErtlY4DGyknmbPbh8ftiwImWpBaWCBR2npg+NQRQZfc+wEn34R1i2VyP5
 0xtIz4ipSRyOTgjnHvlGLgMCE1d55PhqUVO9RsKeCJBHJtkd3Pju3NYx8EdTVMJ+F5ZS
 TYFj0Kf8hMlBMs3h85oMqmqOHRRKmV0uF35rQJst0bzo6hkXa2wLO0MXkAgaqWebEBru
 7mKqKKeiqKg8/qNyl2k7ulycQqljWZPv4y+DC3nYY2d+q6Zf3WHIs80NWPGToG86E7Wz
 2wRM5XPvodrc2ZCQxIsDpBbmGFMmYQzQ25dvJ4KatArXGhJISAHl81hmYdeSi2FkZ8Hs
 W+pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lvFrh+gJ
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.4.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 2375c7528f..3215f2b65d 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  9760ac511ebe33c759b76efb0a1299dd  setuptools-rust-1.3.0.tar.gz
-sha256  958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de  setuptools-rust-1.3.0.tar.gz
+md5  c51ca03d0a6a91ffc3a036822a2deb54  setuptools-rust-1.4.1.tar.gz
+sha256  18ff850831f58ee21d5783825c99fad632da21e47645e9427fd7dec048029e76  setuptools-rust-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index c342773476..44c736ed11 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.3.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.4.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/a9/55/5db4a5b137af2afdc23a6e251d5ebb3b4e04c8deb68fbb5ffdacbd134c0c
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/ed/c6/8effd679eb1cb6d3fd9fc7837cf86c6e4c1ba7a33c3e5e35c741c04016c5
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
