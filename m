Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DED2C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA7C4022F;
	Sun, 15 Sep 2024 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE4Pd_qbg7y9; Sun, 15 Sep 2024 09:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E5344021D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5344021D;
	Sun, 15 Sep 2024 09:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA8A1BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 095F9606F3
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeApzGy4vK1z for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0980F606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0980F606CE
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0980F606CE
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:17:41 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so113050739f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726391861; x=1726996661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cbfdbb0Z4/SFPM11CVIGoDvaELKgjTHzbJ8JO2KHpk4=;
 b=W9UunkyaB8lBnKEZq+j0/7aIBsuybIS7AaN3BZE9ulFtHwxFlCbrr1Gu+igOqV6ESb
 AZqz+UHzfCf/tAgZqcEZIhDxOIMtjR9hcRVqS1DwLs++7EDcGND0meGjlaxbwkdaq5FI
 UlwcPuPgi61CCtoca967JMZNixuhAMYI0PU32GnNWCP698LEDc9epT09KEZpk8jjGVmh
 tawyHVPwAdPoG07WwPBD/sg5LXPkvO3WPYX5Ar3pvJMSNfKQ/JhHQgtI3hAb8INkIuNK
 okjDU9eti5+BP6uBVqAhYpoi8pFgILZ0UKnRmuIsUWXTrly+0TxdM1hG43sr6ZHgbgWM
 dVCw==
X-Gm-Message-State: AOJu0YyTfrc/B2DFRGMQgxy0zQLgXmf9CAd0KPLXgrm+GYDGLx1A1Jp0
 +dsuRtgqgl6fOBrEbUhjdI0RcviQnbrnoEV5j0FMeoXWBOH48wJt3MP7lg==
X-Google-Smtp-Source: AGHT+IFy87cxR/Nvwlh61avfI/qbT9tWC2sNOT1ZegKvcMhCpJEC/gsnRwIJrwEwsI5GPBVkZcj4jA==
X-Received: by 2002:a05:6602:2dcd:b0:82c:ed3d:3a4c with SMTP id
 ca18e2360f4ac-82d1f947a9dmr1240937239f.11.1726391860491; 
 Sun, 15 Sep 2024 02:17:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49354ac7sm87778539f.47.2024.09.15.02.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:17:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 03:17:33 -0600
Message-Id: <20240915091733.1589728-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726391861; x=1726996661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cbfdbb0Z4/SFPM11CVIGoDvaELKgjTHzbJ8JO2KHpk4=;
 b=Y7Ddqn+a2ZBaZBtf9N/HpxyzaC7n0R8xEi4S3p0daTVCNaraMiiv7ImCF9QeozVRpH
 2Y6pY2YiTWZ0XWv73vhNCrno7WJitzsrivpX4WHHFjIvvrRn7/ehGa4tPznMoJuVvs81
 0U5G1bl3Z79XRDgaT5w2fXG1WECufrbG42k8znoetZ3y/+Dt+iRSVY7t/iWnKZHGxy7A
 bZJAn7rk8tWby3+/yqnVspYggJB5J8E4KeEqK9OrI/Zq9TMh6/52RUky6QCyuWYGfJjw
 vFKFeE9R/zFO/xiJpTKRx31LOx06oRsAMxb0pzU9uab8nsGVGl2PtIeOo7WgZzqT/DLG
 BO2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y7Ddqn+a
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 4.0.2
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
 .../python-jaraco-functools/python-jaraco-functools.hash    | 4 ++--
 package/python-jaraco-functools/python-jaraco-functools.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index 97db6b75fb..d99e1aa537 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  6683d6f56930d4f0b34157b083813cf3  jaraco.functools-4.0.0.tar.gz
-sha256  c279cb24c93d694ef7270f970d499cab4d3813f4e08273f95398651a634f0925  jaraco.functools-4.0.0.tar.gz
+md5  70deb206d55e5d003e008e1385e80b5d  jaraco_functools-4.0.2.tar.gz
+sha256  3460c74cd0d32bf82b9576bbb3527c4364d5b27a21f5158a62aed6c4b42e23f5  jaraco_functools-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 5637b75629..65a273a16f 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.0.0
-PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco.functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/57/7c/fe770e264913f9a49ddb9387cca2757b8d7d26f06735c1bfbb018912afce
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.0.2
+PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/03/b1/6ca3c2052e584e9908a2c146f00378939b3c51b839304ab8ef4de067f042
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
