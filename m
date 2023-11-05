Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71588C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1423A60E1B;
	Sun,  5 Nov 2023 02:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1423A60E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAPhNgw1j27P; Sun,  5 Nov 2023 02:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D41F060E24;
	Sun,  5 Nov 2023 02:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41F060E24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22CC61BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04E3760E24
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E3760E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yK-T85JDgzCD for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:32:36 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92ECE60E1B
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92ECE60E1B
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35809893291so13333375ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699151555; x=1699756355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66GXdTCwmkDc4IW9wBzCFcAph5Wl+ZUnlzmOptP/2yw=;
 b=nVqQpkSNJCECQy5GFlTILf4l0rO2+0DDuL551+ETXhxldIV7dxJOFGSu6UYpY2yFJL
 emGwvBPJ2HFVNc5U6HFhuwkqU3QHGvHZprwqEtBl4bPD7kMWm+kmQCvSWkBCJfnTCWCb
 YI+6f1zI7nPG/FV0Nj5GtFeRBGmNA48jSGWqjIF67EY9tEaFmYiyswUtWlg/1pJzgSGz
 dYa+64Mfs7tGOMjT6wPS2B/e1GdRBuWyNNZnniES1V/Um93MkmP/qtJbrPw+cANRJ3fp
 01I/NayW1GSqZUh8OQKtQ6glzrQyitS7Gf1MdHpupgVWbrFavLFyTN1SgNfdMVqJy4Ex
 +vQg==
X-Gm-Message-State: AOJu0YxJl7iPcrGtUTf5Arw5PL8+j9lH4+/+n0foIA88mpZeR/nQWhSc
 dxq/BUU+lKY+qnJZxbiYrTbFrOYybEk=
X-Google-Smtp-Source: AGHT+IFQcgI6yMQeIHz5n/YpM833rkyuClrgXxMLdX1oZkv01IuEN4awvv7yUtiDta5l7kjD0QqfSQ==
X-Received: by 2002:a05:6602:2f06:b0:7a6:7e4c:1bee with SMTP id
 q6-20020a0566022f0600b007a67e4c1beemr28121399iow.7.1699151555155; 
 Sat, 04 Nov 2023 19:32:35 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r25-20020a056638045900b0045903dcfa05sm1386683jap.109.2023.11.04.19.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:32:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:32:33 -0600
Message-Id: <20231105023233.2756751-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699151555; x=1699756355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66GXdTCwmkDc4IW9wBzCFcAph5Wl+ZUnlzmOptP/2yw=;
 b=L5uiDNOZezvIsNxcoTefk0KoPpc6W+A5kY3lKOY7v2+A3RhnRpD0/qfwEa0+XSJ4P6
 EOYILUZT0sc3KzuwQfZ9990EYDKkDmjSPEy6LnJ41R8m+ckWrAdBT3C2sIpzOp3TeEDX
 I+3yKV/jL0ObVk31dyIx6l91cbA1XwiFDJaAaltZb9HyGQvUrI/TQQKeegb1G//N/0wr
 pqEa9mWorgNkYANPDQ3GXzIWRlbqTbnn6WGvrrigTNKjwVzL8p30ixmYIwIYKjffsLgn
 Yja+BOQlrv/5iC44Y5yXBk2/ykCj/iY7c610D/2xdnIIFbVZk3/v3kT19vHJEaxu0pD4
 kR+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L5uiDNOZ
Subject: [Buildroot] [PATCH 1/1] package/python-canopen: bump to version
 2.2.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.hash | 6 +++---
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index e6485e72f0..fc3668bc6c 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  d51443bdc8a55faea63c9da82196dd47  canopen-2.1.0.tar.gz
-sha256  bc126bb1dcb62e3b34d8a12e38a07b5aa8319c17457c9bfe208f0bbbda90ff61  canopen-2.1.0.tar.gz
+md5  2a757a6996f896d2e6afbf2bcf598df2  canopen-2.2.0.tar.gz
+sha256  5f18651b9df6e4769b9882e969f934ae773ef24a45aabc3334b586982048d08c  canopen-2.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  d9035caf7b8b135899da92a2730e2ac2e9f5ae3220dc98bd661be18045fcf689  LICENSE.txt
+sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index a0f5220ded..963c4ab801 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.1.0
+PYTHON_CANOPEN_VERSION = 2.2.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/29/d1/54462c949c384b1a9a2bd260143a8ec6f4259a18d119bd122e8f8a791b50
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea51d6d966e998a77881c1bd726c6e8cc602fd04852772ce87
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
