Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46559CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15AB660770;
	Tue, 17 Sep 2024 18:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ojyBy0AGWtj; Tue, 17 Sep 2024 18:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20DBE60D79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DBE60D79;
	Tue, 17 Sep 2024 18:24:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 223391BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110A9401ED
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXgMiLMmFsOG for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA54440139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA54440139
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA54440139
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:24:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so32444675ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726597494; x=1727202294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LIXWQ8UKdyCeH4y/UAmZnqas05FfOzSOVdpQEPAI7+w=;
 b=IzquEbliylMUBkVQSrDsnxtdmk40Z7JwoHQwMUiiTMGDaQirxzv9e6f2jA6WwMI9Q5
 rXpR8Ix0GLTJtrQSJ6ZMnwcHWh2U1a1ZOTASSmId4Izk047qsDGe8CDCIcV/l7Cb3FNi
 qqcvKDPMTt2EWyedFS+vudZ6ZmxmWpJSqAaPbaC5TxYeZaj3tib5NEkSiP9eDAKs3sQJ
 yPMcg/WEELg9prHcP81OwIfnTeApp5mBL4A8M7j7Sb5q51BikrGlUcUHYmXmZreWH9Yd
 K2EUb4aDUDBEqiumhIFVIg5jn05iufBj+z76o5+Fv1awemo6CtWshqSU+fmsd0YCKEQ5
 rrPQ==
X-Gm-Message-State: AOJu0Yw6XlvFIjuXQ1R+/czndpyo1kmpespRMqokLdd0ZfocxlLC4sZJ
 t/HC1JuFSMqQnDSZB66IJjpq/0vmzp+9wGYiUxH89A5JwDzgRmIegU2Y9w==
X-Google-Smtp-Source: AGHT+IG9Fs4oAGF7Dr3JK5NCbbchPggrWsmMebHvQfaQL6GsISlqojsU99QNrx/SnjHaBLmBwXHRoA==
X-Received: by 2002:a05:6e02:218d:b0:3a0:98f7:101d with SMTP id
 e9e14a558f8ab-3a098f711d0mr98618295ab.21.1726597494008; 
 Tue, 17 Sep 2024 11:24:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10b83sm23428825ab.31.2024.09.17.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:24:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:24:52 -0600
Message-Id: <20240917182452.3872754-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726597494; x=1727202294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LIXWQ8UKdyCeH4y/UAmZnqas05FfOzSOVdpQEPAI7+w=;
 b=OgQZjT1kmBeSsCUXiDH3NJMB3ye1tTtHl1rnRGGwsW2sRj98fP5DQspDm8oaPvKFvE
 +VQevtMfMFKsnJdKX0bN1VEyt6akomqYqLs20h/qRVGxCXfs7vbAFu/NWutGjdJ+snnR
 1vgYVRbiFvxb0MKDDIzyi5DU6rA+nIW7SLsOxorffhxPrJdO1kNdOhOaTaRPCc5HFwuS
 7SjGUBx8RwMMQDsSlGCrUTvy6b7zRBMTrJrzDWl8s2eeOJLxKYg/96Y7M+WG2amVu/kp
 RM9oDhV0PDupuZXMQOhZWxx0KC8VUTwAyhuwloj3FGqCtCbW19ssJAGzIEUKAvoa1oWR
 5Omg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OgQZjT1k
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 3.2.1
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
https://github.com/thombashi/pathvalidate/commit/72a9bb14d828708e8df883852e9ebb29a329a7c6

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 6 +++---
 package/python-pathvalidate/python-pathvalidate.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 4442d82ac1..dc6a1999e0 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  2a76cbe4e08f58087f418d150a1461b5  pathvalidate-3.2.0.tar.gz
-sha256  5e8378cf6712bff67fbe7a8307d99fa8c1a0cb28aa477056f8fc374f0dff24ad  pathvalidate-3.2.0.tar.gz
+md5  cc99f63c6f835eae4fe8643c79b8ca68  pathvalidate-3.2.1.tar.gz
+sha256  f5d07b1e2374187040612a1fcd2bcb2919f8db180df254c9581bb90bf903377d  pathvalidate-3.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  36289157e371aaae5b5d3ba4be87359ed07548cdc7a9f19ff61dc67cfc536a9c  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 243f541892..f5eb257cc1 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 3.2.0
+PYTHON_PATHVALIDATE_VERSION = 3.2.1
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/27/93/e2b086c7aba96c70b5e7ef48251702fb95027638fb5a3e787d2efd65783e
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/b4/8c/8713d8dcd8e357b9358695b441ee974580a8addfaea4f01437df07577052
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
+PYTHON_PATHVALIDATE_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
