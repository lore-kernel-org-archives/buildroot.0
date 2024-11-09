Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9A2D5E379
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394CF605BB;
	Sat,  9 Nov 2024 18:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c1REylFWb-h; Sat,  9 Nov 2024 18:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495C6605CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495C6605CF;
	Sat,  9 Nov 2024 18:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F93D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B3380C99
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24mQMrR3jbhh for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68C9F80C7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C9F80C7C
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C9F80C7C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:54:18 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a6bcbd23c9so12239845ab.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731178457; x=1731783257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HULsvgxxmnGpytgc/lH8M/nySKMAeXI9v2jzeR6S6b8=;
 b=ggQb+QbL4OLwtUqH/4kifJW5KbqBbdAuG/zrj73gKpxUg7qvxbGZLvb1FQyd1YZfgV
 UZcfqbtRwWGQSkeAbSTusqvJfq0QSGqT5o7EJCX0dnrwPpZWRGpckvni4+XjL9uae+cU
 t0bmnmKiuVekwn8xdIYXyA+/nqZe4G46dPIJLPndSjhCW797HL+4b1LKPGYY60O23XSR
 a2rYF54rxeylcnET1JwQ7Pn0JqTGo1J5kZq48Cy2EPnjMmX06nI5n78zvCIwQruRJUKA
 dnJZAwGbZHhftdqX+wu7mun18rqYbwGXhNygMCLEX873rki50e37izREhr1aByKIz3kW
 x/eA==
X-Gm-Message-State: AOJu0Yz3S/1TkOR2sJNeXWsJ/6LmZJetkiaZ+5gnSEQ25kqyheziOVOW
 F9/GdDk9KuuIrdp8bgidsrxPYVVy7mknYRMF/ffsnFBFKcUK1Xdv2zN6KA==
X-Google-Smtp-Source: AGHT+IFYUO3+/Sl0v/LNR6W2RS1iwqm+axrlP0sqc1DX7ph1euCQDq2iVh609emYMog4oJA/uW4xEA==
X-Received: by 2002:a05:6e02:1a82:b0:3a3:4175:79da with SMTP id
 e9e14a558f8ab-3a6f19c686emr66169925ab.13.1731178457018; 
 Sat, 09 Nov 2024 10:54:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f987dd1asm4528605ab.51.2024.11.09.10.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:54:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:54:14 -0700
Message-Id: <20241109185414.771741-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731178457; x=1731783257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HULsvgxxmnGpytgc/lH8M/nySKMAeXI9v2jzeR6S6b8=;
 b=ThojPIda0DDPG/6DcyUNXgX13U1QcXwy9LkOEgf9ARgNy0I4MM7YD8mbgrpxxFwG7B
 iBRDrw2EwbxJgCPXRTNV6ZKDySIBMCaB9ZUoS5JI4DKshPAYf8IT4+ebl5WwnTEh60MX
 qrUQqsY+MwtKWsW3uXIWr8BTNZRDYXcDNGsv5V9RNPcq66Zr5eF90zc7tjlxsXH2ilaJ
 nv4ws2SdUIbn76pDiaVkDOq09Rh0riTF+zqZzm5AiFXwf610u+hV748h4zCwBFbaR7+M
 BZRFt9Yuu5CRB7tPkx40R1vZRfWDPMySO6sHWLX80IzXkdmUdZNj6YUG2T8phaq/CzRh
 92yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ThojPIda
Subject: [Buildroot] [PATCH 1/1] package/python-pylibfdt: bump to version
 1.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 38a07742b6..456fe41005 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  8b137ca636ab30a8fa10c35c419bf3ec  pylibfdt-1.7.1.tar.gz
-sha256  254224035abd85d1409bfa59967ed249103e7bcf0d3a638aea64454e2f776e97  pylibfdt-1.7.1.tar.gz
+md5  78859f23154da8c951770f2c5287804e  pylibfdt-1.7.2.tar.gz
+sha256  b18c6c40400ed4374d0a142dcdb07e5402574ff1304454019a1fd92735b54756  pylibfdt-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 494d030288..7d7398a995 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.1
+PYTHON_PYLIBFDT_VERSION = 1.7.2
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/1f/99/26fa7008cc0020da5c6407c48b34de21b3613232bd8875814016aec3ead5
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/b1/cc/54fc80135b3eb7fcbfded65eee7c71b2b970b5124e3066a158421222f191
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
