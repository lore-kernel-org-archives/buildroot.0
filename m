Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212BFC02187
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4424072B;
	Sat, 14 Sep 2024 22:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeKZCb9ayBdn; Sat, 14 Sep 2024 22:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E2D4073D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E2D4073D;
	Sat, 14 Sep 2024 22:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0381A1BF86D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D47B64018E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-cU0utCaC9z for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 927D140130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 927D140130
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 927D140130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:06:05 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a043496fdeso11133095ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726351564; x=1726956364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0uXhvVj/H6Mgh7kcWO2MZBnaG2CUi8PzYxp89OwnyhI=;
 b=ghVxhWaCDZ24MDuxce3qukpFNYnew+s3C4Ri7uzPFCfSis9rj26BprMGQ2EgkeaIi/
 zHAP8dD3AM6LnbFzURVZ6g79wiJ9Bx4FCqhikZsxuMQGzIyjjVcauEqP2h8zXTFY249H
 U5pREP81AO0znhMr81uKFTLPZx5pq4fMEu+apKBVsh+PhqSZxEvFytWkXgEk/HW3C1R3
 OfhBqsBIsA+E91Lx8Jj6WPoglMoeIzlCL9Jie8aYhtmJcw8+HhjcNLANIyI/E+tuyXLq
 0MxCm4+JHBZITNuPVM8O7p8xhUTlrbEgds+36XcsHx41dzWEj6DC6LUdFUfQ+5byUCsx
 6hng==
X-Gm-Message-State: AOJu0YwRy/IS+1+1uvttUWq9Psl0jA/GWDXvEE40YSUD+U+qASfBdapS
 vN99TK4NrSK0/iKJo0+z24vv5ZZel36tr8LZfk6wZH0YqCZCsHduKLxsPw==
X-Google-Smtp-Source: AGHT+IGJWU6HSZHfO/IqQQEgYGHHVopKGpGnQiAbSDVuftVNK4W6aPV5pEUdVYTOebXCU86MC1LTvQ==
X-Received: by 2002:a05:6e02:1c0d:b0:39f:60d7:8146 with SMTP id
 e9e14a558f8ab-3a0847d8ecamr102191745ab.0.1726351563825; 
 Sat, 14 Sep 2024 15:06:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34b36sm596552173.124.2024.09.14.15.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:06:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:06:01 -0600
Message-Id: <20240914220601.1341809-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726351564; x=1726956364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0uXhvVj/H6Mgh7kcWO2MZBnaG2CUi8PzYxp89OwnyhI=;
 b=fP+74g6cys6YGi7ENSoA/3Fc1UZ2jT2wmUnPWo4DDFxOF0YauTXsFBBqpGjtipSOOh
 L9vQwOIbZQRIur2WWtQ2oNdLj0x0wNPSGlRsGaLR7/8LkESzGPXs0OVldxoOrfK0QmKR
 NoaJo2O0aGGWjueOEFMK62MZ2VFRhLexZ0dgKo9cgyq4UM9T+rK8B6xcM+E4ObyD3Qs7
 /lxh0pDlqxatk/j0ppFpUslKbuPEzdJvr0j90t6NpUmgoIUSj2RxzPmO8gUYIeFDGs1A
 P8hwkYPv8x4+hGNgKnQpzXD8TFVf3xGn4bZwrkRW4DpAca8UHJ4HXuKeHz3Z5Mn81Iho
 OQhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fP+74g6c
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version 4.2.0
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
 package/python-bcrypt/python-bcrypt.hash | 2 +-
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index f3e0517429..6855047de6 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  630f29d9eccca3aea0521eaeff7e4aab43611f1bbf4f8afcdf590aeee9fc8187  python-bcrypt-4.1.3-cargo2.tar.gz
+sha256  2385fd07301cf6d01befc1245d9310a97790492be76e388dd7c0d8de0409806f  python-bcrypt-4.2.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 3d1aeab288..0654ea4730 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.1.3
+PYTHON_BCRYPT_VERSION = 4.2.0
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/ca/e9/0b36987abbcd8c9210c7b86673d88ff0a481b4610630710fb80ba5661356
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/e4/7e/d95e7d96d4828e965891af92e43b52a4cd3395dc1c1ef4ee62748d0471d0
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
