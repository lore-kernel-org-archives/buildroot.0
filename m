Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DCBC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7FF4059F;
	Sun, 15 Sep 2024 06:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNXuEIOWoyiJ; Sun, 15 Sep 2024 06:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3103A40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3103A40640;
	Sun, 15 Sep 2024 06:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF73C1BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2D280A4F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKHYmBF7wyRM for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0105580A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0105580A48
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0105580A48
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:26:37 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82ceab75c05so77127839f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726381596; x=1726986396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iI10dtk/ou+4ZCUOe9R+BdoShUXT2u0agw9AjvHwAls=;
 b=IHvsK13MOAz3fogOZ8s4HZW7f5B3R85uxK0OT04aS48BP9hoJOw4bffgfj1x6VmtKy
 Bwklhll3yojsD8o9U2tW0tUKwETmsk7LgXRoFs6NTpkG53h6NC00NpPdegAXnSZ0DPwB
 QPv5/Xo5IK6gi3/siZx/PVGFfAaCHoVVdaUQeU6lfktBKenHRUuI4Eb9oimBt/srN27c
 TcWn4FxOLLx+9UhX40N3rQIB0EAGei7IajWGLLNIzwDy2b8QiZaXsQpu/WCPBOFexaYi
 CS01LPL7yN1Irr2D72UDEiltlDQ737l8j6DptD6Z7SYiRKViK/7NOoGutiCRBnn0AMol
 ritA==
X-Gm-Message-State: AOJu0YySe4i7E1VPrOoSA4CbU/0w8Y84CnZ+gfzzuJy8hXL9DQx08+kB
 /3wWRzUFOl4gygpVqTsEp/CWp67mt6LWH93SgqfakFSyiDON4A0CI7G3Qg==
X-Google-Smtp-Source: AGHT+IHLyt5SmjNYyfrlqr07QZTephckcDTNWm5uCzsrZOJGiSdoUi2pna1ALa2YFKXZuoawpXGj0A==
X-Received: by 2002:a05:6602:29d4:b0:82a:34da:72f7 with SMTP id
 ca18e2360f4ac-82d37858b53mr947137739f.16.1726381596370; 
 Sat, 14 Sep 2024 23:26:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492698e2sm82019339f.2.2024.09.14.23.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:26:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:26:31 -0600
Message-Id: <20240915062632.1518366-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726381596; x=1726986396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iI10dtk/ou+4ZCUOe9R+BdoShUXT2u0agw9AjvHwAls=;
 b=i985KmDDCKA0TMnMQgVLsNoLR+JGD4+OftMNzHqKIJj/jxUhD7ZTWXEEaT2ZzCaSF3
 qfDhVNMpHAKA+iupQ6LWjA8TaudZnVoi9hZog0hW1tZPE6EUpTvbZzz5sf7rGX6z6eZW
 jfqtuZuu7rWlaFojCmW73hMkTASkldOoZyDl52j2B7H90EbPyQX2qSX5aJ0JVZHDMeID
 2262SHHNPca+ztmWRfjGLzMW7viijDAtPenu0ilEZ/75D7KmImA1mTnAsUae36XovRJZ
 cZztROTwVAVLjt7aMf3pzhxwUfiIi8o2ZKzAih7PzLtLD0o6W6EojOUdimY2+QDTYBZg
 QXcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i985KmDD
Subject: [Buildroot] [PATCH 1/2] package/python-wheel: bump to version 0.44.0
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
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 377a85c8fd..1f9a49a44c 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz
-sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
+md5  440ff4fe51579b7ed16f02af8f8d9494  wheel-0.44.0.tar.gz
+sha256  a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49  wheel-0.44.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 320995521e..1802280e24 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.40.0
+PYTHON_WHEEL_VERSION = 0.44.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/b7/a0/95e9e962c5fd9da11c1e28aa4c0d8210ab277b1ada951d2aee336b505813
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
