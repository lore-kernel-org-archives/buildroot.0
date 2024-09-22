Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2539CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B22D84011C;
	Sun, 22 Sep 2024 05:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVxaUlAic5lz; Sun, 22 Sep 2024 05:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5959240360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5959240360;
	Sun, 22 Sep 2024 05:55:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C96311BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EA98105C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WewFHsfnI_OZ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC30880F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC30880F82
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC30880F82
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:55:24 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a0cbc08b38so11441785ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726984523; x=1727589323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDdE8YF5DT9obSnrl+plmovkB+7PtTn0h/wOBVTyVFo=;
 b=FJ9EZ/lHLU/DBRjjgxvmlDaYfCqz9xnkW4apQmTewHmAFK4WBmT4ul6MPNuIVJe4/t
 HsllghjutKPyeb2dJCeSnF8HBMP1RQp4kR1mjq6ojZ2KAya/6Zlp58eeltybi/fj00DZ
 AClV/4pQYyfwZnfCzcsj5BB5tlfXygUAXRRyqXxGVJOKfheEOBMcJjtf1c0IxDFqsB7L
 wdt9jke9hirHffAh9KU8C06Lojn2YmNLU/1KelNpohNvIblatI2dPwQqxd0W8TQ958L1
 jI+Dj5/t5CyuSChwrXO6emAVoYIECoZ3XPKzdKb6rZxt6iA6OUdCpJp9qBSrVS7Y4kQ6
 OvQg==
X-Gm-Message-State: AOJu0YzqCT3CluPh5F/zGwCRZRRoT0flpBE/VHU1wvR5V0h1/3w4Yvit
 2NExsvCtOlcIFhBBi/nK+8yEZGbV5HeLA1Xg03ddbIpTFqS0YH8jzH7w6w==
X-Google-Smtp-Source: AGHT+IHWyVMa1l/PUC/kXKH+9UZ9VsBg1Qxe3RjJ2Qi0tQ6UPjVRcQX61t706CZvHET4OWRf9yytrA==
X-Received: by 2002:a05:6e02:180f:b0:3a0:98b2:8f3b with SMTP id
 e9e14a558f8ab-3a0c8ca77d2mr71180425ab.7.1726984523203; 
 Sat, 21 Sep 2024 22:55:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17ebesm4532571173.41.2024.09.21.22.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:55:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:55:20 -0600
Message-Id: <20240922055520.950674-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726984523; x=1727589323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bDdE8YF5DT9obSnrl+plmovkB+7PtTn0h/wOBVTyVFo=;
 b=CI+w3jmnOu70vK19FoHeMTMlfGzLvhxLpX97E/hjy0RON1aospZq8CCxO8cfgOz24o
 NpbCI3ghjo/h3Bz/OFG/2/G0b3av4hrClYuXSplef/ANU4Pfon7R6SNZP2KT9z3AS9Hi
 QgH0a8HwPEMjeh2BdoIxg45/j5K5aMnK+Bf8WRWp0gHkRfn8ZDyJTkftT5AoqiUorqb3
 S8U5iMautfxJgFwa1daTL+KuksV3G2c71LvUxk6OdsHAjYXxA2peQ6vUCtvwkBhmTHVI
 uinkl04bPK7zdODJK4nyN3IIv5SKQTsQoDjCrIxGHVYo3n13ZKP6EWNa+LBNUp7bThiB
 w9Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CI+w3jmn
Subject: [Buildroot] [PATCH 1/1] package/python-u-msgpack: bump to version
 2.8.0
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
https://github.com/vsergeev/u-msgpack-python/commit/931960b89372d1a94aa9734b549cbe87361222de

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 6 +++---
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 0ec2385533..22005747b9 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5  6c4fbe9e1df1c1563ecc9e435b82fdcb  u-msgpack-python-2.7.2.tar.gz
-sha256  e86f7ac6aa0ef4c6c49f004b4fd435bce99c23e2dd5d73003f3f9816024c2bd8  u-msgpack-python-2.7.2.tar.gz
+md5  062ac5812bcd32f967356c384a37297c  u-msgpack-python-2.8.0.tar.gz
+sha256  b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a  u-msgpack-python-2.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  f938fe2d3b7b329005d4b2851f106fd4351ca55f0836335acbe52386312f7f31  LICENSE
+sha256  2466f2b37a97e92bfe1ab9910c9e112e7b0dfd5d261f39cadb92629db503d13c  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index 372c5a8d45..f4a11eb0b9 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.7.2
+PYTHON_U_MSGPACK_VERSION = 2.8.0
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/44/a7/1cb4f059bbf72ea24364f9ba3ef682725af09969e29df988aa5437f0044e
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/36/9d/a40411a475e7d4838994b7f6bcc6bfca9acc5b119ce3a7503608c4428b49
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
