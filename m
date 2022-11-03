Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE18C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A1661012;
	Thu,  3 Nov 2022 19:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A1661012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMjqO5VbL2AQ; Thu,  3 Nov 2022 19:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0ED60FFD;
	Thu,  3 Nov 2022 19:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0ED60FFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05C5E1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2D0981F6E
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D0981F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nViFAeUelU6q for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0499781F6D
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0499781F6D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:07:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id m15so1567772ilq.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcE4rTGr1BO+eGQX9XToFHSG4J+eMe6UEq96RHOoGbU=;
 b=adCH7Re76g5A4OYP4YP7a6P2uE+7axe8//Q2bLWAsehnB6jz2IMoOlZOoIoprqLgIp
 hrvUkkI0Fr1lE2a9KP4iRoItZhr563euIQpoYqcxYDCRy952F0I9c5ywxA2NClKVbWH5
 XeWodQkxLio0q1osqQjCO4hJY2wz/UiYZYTnfJKUMiCFB4JtAuP3TlMWumJuHtB1OIE6
 7mjYp9fTqMJ4XSkz5PMVmJmVJgd3nvyo6hU1Vlg/V8w0UdDDHIOilzflIm8B+He3+48u
 3dVfPEh1m3yvxDf1QGhQSttddJI0DiWjmXDX04M+UzyKZLmjr40h5htieBxX/JuO8O+I
 lbEA==
X-Gm-Message-State: ACrzQf1L3Y4T7R5qSwnv+IiH1YZNvF7CowURd92YXYIv/nUqsi+JYlYB
 DoAb5JAuBHKQJWDVblgfPcnMTaHQQH20NMWj
X-Google-Smtp-Source: AMsMyM4I6KZRKa4mPrwWCb3JXaBkDMwxLOawa6kKbQHh31eCRSwUwrxXVHQjNMjkSs4KW8fddPO0hg==
X-Received: by 2002:a92:ca07:0:b0:2fa:ad2a:cd4c with SMTP id
 j7-20020a92ca07000000b002faad2acd4cmr18525505ils.292.1667502452836; 
 Thu, 03 Nov 2022 12:07:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z8-20020a92d6c8000000b002f9537986f3sm584537ilp.24.2022.11.03.12.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:07:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:07:30 -0600
Message-Id: <20221103190730.3777421-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zcE4rTGr1BO+eGQX9XToFHSG4J+eMe6UEq96RHOoGbU=;
 b=hcnS6ym9kNFibbrVTaO641RObUOvm99Hp+f46sPz/9s5mQjhlzxygIVyBq2EcpD9dl
 wuVyVtex1JoltWyclw80vGxPQ4EiVvG2T7OPB2OF0uxaBqxweMlbyT9S9VYUqthQ/FxX
 0zI4177uOXTlmN1CBWAiuT9VCm0P/MsksmgVu9aOg54hXHZFztWkztlxdetD/EzLzXqL
 odms55Qqyls0/7jwbF7f1xTxfGKpoW/FmYliCDEoVxdgDmHrk0uYthG/SrL7UWrEGgvO
 UN2FylEZtRjR6Li958cih3iboeJaml9goR517wG9meXM99eEk0loR8SnVCiVv0ZVRo6D
 3bfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hcnS6ym9
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: bump to
 version 3.3.3
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
 package/python-secretstorage/python-secretstorage.hash | 4 ++--
 package/python-secretstorage/python-secretstorage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
index a8e535f892..ae0a5be347 100644
--- a/package/python-secretstorage/python-secretstorage.hash
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/secretstorage/json
-md5  c2a8c0e08e5da198fc38c379b98c28f1  SecretStorage-3.1.2.tar.gz
-sha256  15da8a989b65498e29be338b3b279965f1b8f09b9668bd8010da183024c8bff6  SecretStorage-3.1.2.tar.gz
+md5  c6ff1cc866d2f1d274b75c6490726b1b  SecretStorage-3.3.3.tar.gz
+sha256  2403533ef369eca6d2ba81718576c5e0f564d5cca1b58f73a8b23e7d4eeebd77  SecretStorage-3.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  70f6bfca77633c35efa218328eda5486d7054c2914d61820980e378797520a25  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index 4c209bf513..81487aa8fb 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SECRETSTORAGE_VERSION = 3.1.2
+PYTHON_SECRETSTORAGE_VERSION = 3.3.3
 PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/fd/9f/36197c75d9a09b1ab63f56cb985af6cd858ca3fc41fd9cd890ce69bae5b9
+PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/53/a4/f48c9d79cb507ed1373477dbceaba7401fd8a23af63b837fa61f1dcd3691
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
