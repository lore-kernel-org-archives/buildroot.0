Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4988DC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EE240133;
	Thu, 11 Jan 2024 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EE240133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6E0En2qb_cI; Thu, 11 Jan 2024 07:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F7B40549;
	Thu, 11 Jan 2024 07:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F7B40549
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5231BF2C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7BA1615D9
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BA1615D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWuL11JDvxwm for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:26:06 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E28EB6151B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28EB6151B
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3606dc4fdf2so26347095ab.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704957964; x=1705562764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6Fw7WQWBhKB7yfqKLr12QjV8ioUkdjYTaGzBpuyaRM=;
 b=leoCstRZlyBAjRkooAftZOELvMXtnElzenhvt5SEAkuWU2XStYS79iBcGVKhG0+8LQ
 OlS3xhTrebzTcgGwB+arTxAo4ZxbhtqFk6ILAnzw4n5KWXqCryFQZLCwsWkaYGtzav2h
 vOs8si7e6P//NEeuGMI6ud7qy1SggN5X+iqIM8/B9hRNkmSFKKavEF1UJmrOGqTt0BBV
 FRdI2Gjx2TCnWFY5ADSrH5iDer0dRFsGDM+xhwS/GRG5DDDN5pZ/vvXY5+AcfBmkEL5V
 ngWTYmJ1JwHFKQf2uHM+1SC8cot01qPywFHak5gTHDnpbW68t+bXRngxUOx1WAYAZOtl
 wAMw==
X-Gm-Message-State: AOJu0Yxc08MUBbLEOAWhWWXrdSY7Ok8LKf2Qdpb6zyAVr66YtE9ul3ku
 7IO/m+EsFRdvJ2j/WlFhttpPVWfigpF32w==
X-Google-Smtp-Source: AGHT+IHus692pub0Gn9x1W4bRmF4WXSeNb6Q1pD4TIIt/1KiaqdGge8+rVF2STmHYIDXlxlpZWlvQg==
X-Received: by 2002:a92:ab06:0:b0:35f:da4f:84ed with SMTP id
 v6-20020a92ab06000000b0035fda4f84edmr837853ilh.18.1704957964275; 
 Wed, 10 Jan 2024 23:26:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 8-20020a056e020ca800b0035f75e80d1esm125698ilg.52.2024.01.10.23.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:26:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:26:01 -0700
Message-Id: <20240111072601.3080032-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704957964; x=1705562764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q6Fw7WQWBhKB7yfqKLr12QjV8ioUkdjYTaGzBpuyaRM=;
 b=nrfA0NHb3DxQd7sUDbnXihMiB5iSftPYLxIE3uk372oADOIScKaCxK8E4OxyEYiRRb
 LSXxRFxvR0xkZ6Oz7hvJ/kptf+O5uNZNuv6Deb3jb3NUM8MuWNxUjy2uXJAGyyKAVF5w
 2FkyLt1WMFfE4ELDaTsr4dVz2p0BiMB0Ulw9APVjwjgrKw73LkUwhrLi6zdL2lonTXHg
 GHEkSDZ3RKGKxSomYO28qQJfCbN1RZxhLdSUcnQbZ+h+RDrAQ5ahl3nY5IkKMs2xGUp7
 /7MnRvKwdJfbQKtDjM9mp3X7tAQl0Nn2jgkdwdyF8XHkeplfsBcAVCXT2D/aN+totF+L
 AdhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nrfA0NHb
Subject: [Buildroot] [PATCH 1/1] package/python-stack-data: bump to version
 0.6.3
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
 package/python-stack-data/python-stack-data.hash | 4 ++--
 package/python-stack-data/python-stack-data.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
index 6decd3ca8e..b155a77c81 100644
--- a/package/python-stack-data/python-stack-data.hash
+++ b/package/python-stack-data/python-stack-data.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/stack_data/json
-md5  bf86c3c81a0158e1e7f3979da5a0033b  stack_data-0.6.2.tar.gz
-sha256  32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815  stack_data-0.6.2.tar.gz
+md5  d04f7cda6589138e90691aec1edbf0d5  stack_data-0.6.3.tar.gz
+sha256  836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9  stack_data-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
index 1a85938311..7c38d2c4eb 100644
--- a/package/python-stack-data/python-stack-data.mk
+++ b/package/python-stack-data/python-stack-data.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STACK_DATA_VERSION = 0.6.2
+PYTHON_STACK_DATA_VERSION = 0.6.3
 PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
-PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
+PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/28/e3/55dcc2cfbc3ca9c29519eb6884dd1415ecb53b0e934862d3559ddcb7e20b
 PYTHON_STACK_DATA_SETUP_TYPE = pep517
 PYTHON_STACK_DATA_LICENSE = MIT
 PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
