Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C77D1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA646076C;
	Sun, 27 Oct 2024 23:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEbCrxPbZ2AI; Sun, 27 Oct 2024 23:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 898A1607E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898A1607E7;
	Sun, 27 Oct 2024 23:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73F781DAA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D624028F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2diG0RWN7-y for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D60B40270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D60B40270
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D60B40270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:20:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so152551639f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730071233; x=1730676033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cFKWyuaHsaiquuThZR+XHzGvz2Kqwv42ses1xn7f99Y=;
 b=TYr1dZCssFYv66bpxmJJkrdI2sXUUh4nPJqlzH+PFyz4yCIPZ3hDN/wsofgY1X2TdS
 U/1A8Hef4VSJ1KU9SeE3fhMuHfK8AhHROanmVsLZcnyQUANZfv0pR3RTWHF0SkLAtB18
 JCZMhwLao3sGiHM8jZqpnq3M6mHZjZZiha+8oBqtm3CiCh/HTXsZFM9jC7vnK+AGACcf
 V2RBBOJsj6k6z49YSuWxLtU0GMfh0OAwIWORDiq/Wz1QsEFPyk+oPKp/yP7CDpPRA7Wi
 2xXjnIrZHZ7vw3MIk1WNRg/KBlMs9iMVGzg0FtyCDmUnnSRneIz2UA7CpTsrMHthpS76
 r4+A==
X-Gm-Message-State: AOJu0Yzqz4Pzi0jDRK1uHgFLbYuMC3omMPi17GSI7M1uNijEsMMeJHAr
 a5UwTLvJ7k9v8sA5W8AzJVGYh0IfbvD9eHolDgbIXOWObOo/VB86O7mXbw==
X-Google-Smtp-Source: AGHT+IHekUR5zPNqIIgDd4M5QxcSaSJwGzVMIdicmVa79IvaGf15hCn9+SuS8D/SoSWkrM7L0wNq/w==
X-Received: by 2002:a05:6602:14cb:b0:835:3ffe:fe31 with SMTP id
 ca18e2360f4ac-83b1c40b3a5mr488458839f.8.1730071233215; 
 Sun, 27 Oct 2024 16:20:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc726179edsm1362037173.59.2024.10.27.16.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:20:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:20:31 -0600
Message-Id: <20241027232031.3880869-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730071233; x=1730676033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cFKWyuaHsaiquuThZR+XHzGvz2Kqwv42ses1xn7f99Y=;
 b=hAl2KNe9l6z/d5KAbeCXo/xk/DGK5w0itNw0Su251F4p8XyCyJLratn17efpvvfzzH
 CxLopjGuQiIS+R0MwgkiAvdCKAEzdvwoReUqmnyeAkG7QaWFjr5mZ7uaTjTD+j9yfOCc
 li6e+3Fi3qmhMkw4keoptMVBzqO9uEH3WA8hmh6B9fouWzS5MvLHQ9391ZLrdJWQdncs
 G0b3goz9uwfp043ztkSU/u0xKRTPXZqCi+ihXWvXfrVMqgxLfl75g8bi2gHBPAW2jt0X
 DEPfz6bEp63IfN1282LdEJci4GO5pTw2emKdMiWrGuLkg2+2YOj9PP5tdBvswTGscrvV
 RMKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hAl2KNe9
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 5.2.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 989cfd39f2..57d8557156 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  54db97ec8f7445c107d61829095ed915  redis-5.1.1.tar.gz
-sha256  f6c997521fedbae53387307c5d0bf784d9acc28d9f1d058abeac566ec4dbed72  redis-5.1.1.tar.gz
+md5  a3210ca8428bd0ac9691789c08b14478  redis-5.2.0.tar.gz
+sha256  0b1087665a771b1ff2e003aa5bdd354f15a70c9e25d5a7dbf9c722c16528a7b0  redis-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index a8123f225a..2c1734151d 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.1.1
+PYTHON_REDIS_VERSION = 5.2.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/e0/58/dcf97c3c09d429c3bb830d6075322256da3dba42df25359bd1c82b442d20
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/17/2f4a87ffa4cd93714cf52edfa3ea94589e9de65f71e9f99cbcfa84347a53
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
