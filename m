Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E029FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719C161002;
	Sun,  5 Nov 2023 09:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719C161002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NO-woUC30CZb; Sun,  5 Nov 2023 09:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A430360FFE;
	Sun,  5 Nov 2023 09:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A430360FFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA28E1BF57F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C2928219E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2928219E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfPCNTyB1WMO for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:31:58 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77BA58219B
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77BA58219B
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7a956887c20so146262939f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699176717; x=1699781517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cv1dNDKQ8htDyXxESyIT8bV01YU7AyTzB70QWxHUkF0=;
 b=VKYql3vVSwY2Q2pTKHCB7D3IUcAx5WXrurF+Aghwn5q1joMi61NHuStGUJ+ySrCyZQ
 rlwKfJq7xULgZic6h8BUEUaJMuUw/FOedGF2yPoPxVE2n2IJbBxlWdINi3X1LAsj2Fnz
 xZtToLL+/T8oKGoT2D+M6pq7/VDXaD0bw5pxzc+5rr8gIdqzFUOU4SYC9zftCyJI47un
 GKCX/nL0AWXp49DtJMAxYwZ5n3lhMhqxsFMPhp5/0bUQFnbGIl4gtlYb/nOB13EQZqT8
 qr9qwJlNS5QWUQJ5Fx2IsMezxXojmW8/mGquvKJ08jxS7dzw2rlI/OxoGotolAi51hqT
 KzTg==
X-Gm-Message-State: AOJu0YwNKAsI/1xvQFytbjGIABP1rQC3eDo3u8nk7+MZY3wBC4QVERfJ
 DvOc2u2M4vwuTJRO9ICNpzMVqepyU73g5Q==
X-Google-Smtp-Source: AGHT+IHRj1Z+EsnEZ6vfCzpu/fAd37IvUs1FPDhnAr9hC8gQfgNmbPVZPbZgqjXltTTNAvbZT5bKGA==
X-Received: by 2002:a05:6e02:20e6:b0:357:a5cc:de86 with SMTP id
 q6-20020a056e0220e600b00357a5ccde86mr34612714ilv.23.1699176717171; 
 Sun, 05 Nov 2023 01:31:57 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 t10-20020a056e02010a00b003595d948c42sm1771338ilm.5.2023.11.05.01.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:31:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 02:31:55 -0700
Message-Id: <20231105093155.2945661-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699176717; x=1699781517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cv1dNDKQ8htDyXxESyIT8bV01YU7AyTzB70QWxHUkF0=;
 b=mMjOddklHaGVuFLkCQrCmwxjrQTlHgVOywcpUfIs4q61FCTZSFNG27j66AIp8PFj1i
 QnNYkLoI8W2LThUMmT+z+kdXiPPX2y15qofhZUw493ijKssJFjWk6xj9rjjtroBvSp5u
 MiJZ1hZv+hc92sut92C4gOtOudU1Cs9b2vUoz/Jn+6oiRy6Ir4VeQIIjYB9d4CDpgljL
 NLQVnSnYNthK+Z7IiOTtF+xotPm6bxywJlb/Z4NX1HV5n3LeAYpFudxCjzYmmPDLEJXR
 62inltapCXr1+S2QjRHaxYhw3wbhUPndaXwaR1Ehm3l5wgJepsx7kRdAlymqa5Po0DCk
 CBnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mMjOddkl
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.8.1
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

Drop no longer required host-python-typing-extensions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index f8282277a1..a83288e43a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  f7a1602f3c34e9a5bb82603d4d80c9e3  setuptools-rust-1.6.0.tar.gz
-sha256  c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262  setuptools-rust-1.6.0.tar.gz
+md5  c5ca990845902dbaa1885f9ad9399988  setuptools-rust-1.8.1.tar.gz
+sha256  94b1dd5d5308b3138d5b933c3a2b55e6d6927d1a22632e509fcea9ddd0f7e486  setuptools-rust-1.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index a3e4d7a9d3..f07263becf 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.6.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.8.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0e/c9/6f9de9f7a8404416d5d22484ccdeb138f469cc1e11bbd62a2bd26d5c1385
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9fedb88462248e94ea4383cda0065111582a4d5a32ca84acf60ab1107
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version host-python-typing-extensions
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
