Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5313CCAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 17:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0669860786;
	Tue, 17 Sep 2024 17:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eb8O0H0xFGm; Tue, 17 Sep 2024 17:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE33060D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE33060D8C;
	Tue, 17 Sep 2024 17:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEC31BF35F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B8F81DE6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fex96Mme1W92 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 17:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F65681DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F65681DE5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F65681DE5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:34:32 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82ceab75c05so160723439f.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726594472; x=1727199272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RA/913qh8LDWqA/Ng5RIM5wiibFn47QTcmgfx1z8xLs=;
 b=Kz/xpPZEEOj2AWX2jpr2FmWbjQ4A4P1xvAEGBpSm9foa8ZX7jO5IiM4bYS+/AaCfNY
 o76nfRLeSkDvKbyAsZHtS47v6+F5hd5NpKAen6+OBD77AyIGM663isgmac5RTSCy8s/H
 gJXylE723xQ7Wstk14sl9izFgzTYgnQ4MlMBcoUOCysGjgtLB4kVX5+xd07a1iE2We6C
 iEFXGXn6mBPMeRrpVOh6OQok/OgpdsB32O1latBDsfy5/AZlgRFjgtrpqualyx5k2emK
 XASMa63HUkgIJCjjCafhcDK15sqacpYc007XdHsdCKS0GUHMkRp+2VVOetAUpk2bmBes
 8QVg==
X-Gm-Message-State: AOJu0YwYq5h4Va7ZJwO1YAfBchFlJdkc0ijDPSjtKeJzzRK9lCHMwE3q
 vTqf2CEyafmisjXeGzg2K7QDlZhTSArsmkUPt6XoPYkK0m2FwQKS8BwF2Q==
X-Google-Smtp-Source: AGHT+IGTp1g0BzXE11OFFsCwcxOblls8UWz9v7XMP2h7Xujkc2aeHt6MxM7AulEHz9WRsRi12iN7hQ==
X-Received: by 2002:a05:6602:29d4:b0:82a:34da:72f7 with SMTP id
 ca18e2360f4ac-82d37858b53mr1698083239f.16.1726594471743; 
 Tue, 17 Sep 2024 10:34:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b733asm218458239f.25.2024.09.17.10.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 10:34:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:34:27 -0600
Message-Id: <20240917173427.3843214-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726594472; x=1727199272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RA/913qh8LDWqA/Ng5RIM5wiibFn47QTcmgfx1z8xLs=;
 b=kqA/5tUxA7qucsE0+dAJ3TZ1yCLos5uh9lbWbWTpOzotLxvM2UADDBHafmi15jVnB0
 khm66C1dY4hjXA+219m/vucjcHQA4Xl1+jRbphiK1mNHNR7aEt0jwj2ZWUovL/cVUM+j
 lGMEdan3LRcsjl7gLxXXOGFIef/ufoA9cPtAmnATTUwLktgfx6KD2O1yuUJGgu5TY5EZ
 7TKFfgQr1vI6KVaFNytI/4J13B2ApnswFnrhtskExnIASGJ+JAziTtsCO5qFjLB5CXL0
 J4eW0R+h9M7d1xmfi2l91406F9zFe1MTept6okK9SI6F3EeJhwXh6dMcAb1gddxcI667
 MDIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kqA/5tUx
Subject: [Buildroot] [PATCH v2 1/1] package/python-lark: bump to version
 1.2.2
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

Verified license remains MIT after hash changed.

License hash changed due to line endings changing from windows style
to unix style.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add note about line endings in license changing
---
 package/python-lark/python-lark.hash | 6 +++---
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 9ea778c8da..35ee842a4a 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  124c36ea3b68783f06cea5fe6ee8a6f2  lark-1.1.8.tar.gz
-sha256  7ef424db57f59c1ffd6f0d4c2b705119927f566b68c0fe1942dddcc0e44391a5  lark-1.1.8.tar.gz
+md5  99760ed81904c56b2db2b7ab7723063e  lark-1.2.2.tar.gz
+sha256  ca807d0162cd16cef15a8feecb862d7319e7a09bdb13aef927968e45040fed80  lark-1.2.2.tar.gz
 # Locally computed sha256 checksums
-sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
+sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 9cb30abb65..1a85b49bd3 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.8
+PYTHON_LARK_VERSION = 1.2.2
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/12/1c/b466b58dacac15ffefce9bcb5128e18948a143849610a7d5300f31920be0
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/af/60/bc7622aefb2aee1c0b4ba23c1446d3e30225c8770b38d7aedbfb65ca9d5a
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
