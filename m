Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7436CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55660605CB;
	Tue, 17 Sep 2024 17:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNxwzEFeRtMX; Tue, 17 Sep 2024 17:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711BA60D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711BA60D8C;
	Tue, 17 Sep 2024 17:49:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 642EF1BF35F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E3440139
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHxaHnoLNEOr for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 17:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E36D40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E36D40133
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E36D40133
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:49:42 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82ceab75c05so161329939f.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726595382; x=1727200182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yiqNjkKZOsMmqhUwbXT/jdRrHeNc7Oo/eBQFDf0EhY=;
 b=QhlPqRe9/3Uxk6VW5+r01+okn+1nNU6AQ0GgUIuTqQVFuEP+LU3zdXribILq+J9KuF
 50bC8p9wF+1nX5gceQ3f6A9PWyl8oed7wKSL+PjP3lwCRMPlO8Q4MpMzz8mYW/Zl084r
 N5CDh+xS4SPJvHEtJlDdE33+5I2zIhJZBN+SI2zt0c9QiN1wSz05TcOwHo/kGrOkS9Bw
 YAtCGxTV0C3OfqkSp9uNVz0YQnX9jZkt4zT6qJdnkL5aGOUfORia7i0Nju5KwrNeoQj2
 Ve81pgBr9o5XIwpBMcP20Q7qcnZRmrxJHSAKpKCbSGoEVDjqG8oCP7G+zt1WFGDbhu/k
 +Efw==
X-Gm-Message-State: AOJu0YznM/hYtVlnrvne9NBpiU3P81k1HOWO7tusdTgXK+3uqEZoZTyS
 uRNi3E3lKn5fnbiQLA/faPjiOU6xw4nlMi0Ke3vXih4Vt8rtsbCVRMIp0A==
X-Google-Smtp-Source: AGHT+IH5kdPtR1Y96GaVE/iuStCFTGEJo/+ECHbuI51F9J0dzxRVBZSM+bvAJy0EA14hrzYy8HGUDQ==
X-Received: by 2002:a05:6602:2dd4:b0:82c:da74:61c with SMTP id
 ca18e2360f4ac-82d378401a9mr1114820239f.13.1726595381751; 
 Tue, 17 Sep 2024 10:49:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf463esm2098458173.29.2024.09.17.10.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 10:49:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:49:40 -0600
Message-Id: <20240917174940.3847505-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726595382; x=1727200182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yiqNjkKZOsMmqhUwbXT/jdRrHeNc7Oo/eBQFDf0EhY=;
 b=IgRnS0YXtwimRjtZ5/019u2t1a5qekj+QkZYTvFVd2HNdX/21Sk8qnuLeo5MOO/DZC
 VG0N1BLTCFLnTf3rA7UQe9HHGp6zuW+BP/jdX7h7qyBy/1pRS1Wa1FRJXdpWzLbYBBFI
 cRgOUxM3efv4ItW3F/W7v+9lQK0uosiaiwgVl3+X/I9CRqZpN9gMnjfBOwhTyMCr7lyt
 kyyQTOZBGGkfPYjYx373QsPufedhW8Cw3q1Itjw5JWnGDwfXDqj8SbldhQJMUxG2LkRS
 uL3Eoq27b6HGBIjHrQY3W7ubdr/fW09Vbmh5khbbOpaPxU0WuX0b/8caI0xpsprcRFem
 Iy+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IgRnS0YX
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version 3.3
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

License hash changed due to year update:
https://github.com/networkx/networkx/commit/7fc4fa51875d9e326416f998c51f208442d55dad

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index b9fe50fd9c..3b6f4c6fba 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  e81583dcb3d929b60660721912f3faed  networkx-3.2.1.tar.gz
-sha256  9f1bb5cf3409bf324e0a722c20bdb4c20ee39bf1c30ce8ae499c8502b0b5e0c6  networkx-3.2.1.tar.gz
+md5  c307f8c790cf3f18954ae7458b16c843  networkx-3.3.tar.gz
+sha256  0c127d8b2f4865f59ae9cb8aafcd60b5c70f3241ebd66f7defad7c4ab90126c9  networkx-3.3.tar.gz
 # Locally computed sha256 checksums
-sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
+sha256  5b433b90f755eb9bbd06feff1d1a4f5f232c5208a185694199e45fa95d762792  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index e463dca40a..ef51003047 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.2.1
+PYTHON_NETWORKX_VERSION = 3.3
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/c4/80/a84676339aaae2f1cfdf9f418701dd634aef9cc76f708ef55c36ff39c3ca
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/04/e6/b164f94c869d6b2c605b5128b7b0cfe912795a87fc90e78533920001f3ec
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
