Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFC6EEB56D
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C011780CFE;
	Wed, 31 Dec 2025 19:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd1VdsXyvOZd; Wed, 31 Dec 2025 19:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EB780CFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767210769;
	bh=I7sKL6dbphkd3nf6MM2uFwgHXhcL++FNrk7ZDuNVagA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HyCFJPODqzw5z7Jo0aS34Qcu+X0GMUwI+aAZ51/ui3L5oZTOrON+feRfBp7m/I2o+
	 AEKQ+y30O6IX2ak88gYUTZHR5eNGbioVt70QdZcXJelxdz6of63b0cxyQQOaC+6j5C
	 oMyPLIIYhii/CyhCgOGrcFwzxDxnqfxJBAdd5GPuwI+MCGTq7gLMQnXFxQQ49+NcoS
	 aNVDlwNq1dRyxzW/Rt8tOlGMgyVNrYk3dpGNtaSRuObKC/u77qQNcW7Fh8aSpOksq/
	 53HauiW4RGXf3HRN5uO0e4kPmSUMPfGoH2alDlbsXjHGpf9nYjR6/n8elDF9JZhmtv
	 T43iZ5m/XsmBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40EB780CFF;
	Wed, 31 Dec 2025 19:52:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9595A249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8818B4059D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UezbWoaQgSr for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90DAF4059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90DAF4059A
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90DAF4059A
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:52:46 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7ce0ef9d4eeso610106a34.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767210765; x=1767815565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlZDG2h3FzAeOBnU1meDuw3E50fVW+7pqhPylnH45BA=;
 b=qryZqy3hSXd2iIUlOq9MqcXBctHjuXnYdjAr9kZWLrTF3mDNGSyt75LaNNyad5AWM2
 C3tei4+dWSMaqH/ZGuAsrg/W3rxqJkpIcBrWBUhKu714ebPBNn2R6aa0btSOMVgHbYUc
 8YgvJX95TdOnI9IbkRXQzcHas9aofuEULD5fztV1IjPwMoV32lOxOEKTtJB1TqHuzgIi
 Y85cOQz1rxZZyv0+Pv03vcCH+AISnitiw1WgKOH0qac/jm5CUK6et79/u1EnAu7uOL/S
 3ueQLB+lJ8SQ80pn74Mf+Mf8A9Wej7sqs8y+UbKL7gf4MLTPHBUCw4dwEf0OHbHujtSA
 QRlQ==
X-Gm-Message-State: AOJu0YxZJmnx8zvEXWg2vElgGV/YFkx+CBkTfzmp8zgbVugX+2skvFKQ
 jUz7E7MxjbaBiyGW6a/qdqCCHES/RY04yJgu4FflVH11VmnUKFFnOIJFZmXv/Xw4Li8=
X-Gm-Gg: AY/fxX7C/yN0q8UFwDy3W4DbyAv3Stcw+sI9dNbctsEHC/ZdZjl0mDsH3YfvvWYClY3
 qj0JoS+eqeSi8XNEfIK4AvJIWglpwlHAbURzPDg6SWKhDwXrka9uEBMsb3okPZXLwUhFAqlFs7i
 FJ1ta7i7OlwL9RX2uKjeJSqevIgJTI0eJ1u4lilJUamwbDqaUTzTLmA4I2swqi4xW3/RR3l/6ho
 8zGasE6fW2fJszf8Njzv9nLzsH18yEJMbZcGMHjcpfmelqZbQAyS0Y6OOt5wVFBPWdYaVmYGsx9
 zz8/8lMDtoUnriaJmjL0RSV7++7reWZgaKHEfNeEwqIbLRsTRRLqotDHgWx1hpc8lw4USe6Tug7
 SR6Aloatg9dKyEml8AxmpbLvoM+v8l37v1TnIcQbN70/jqRJA4KDhnkscnTfc/Kj+EHZi/XGw1d
 iHXnOd0bTYOdCU+FdgurIlSFYJiBW6ONPJtwPuTJACaZsiNVOiI8pskW4NPoNB5qckKBppF+uqT
 y5eqq3KfHmZTroGoPeWGJSxomxtyupLbN/s9XHIIJlFXzc8gjrHuf0=
X-Google-Smtp-Source: AGHT+IEVZwkXTGTDoQvcI0UD96DeasH3aj1kaIb5oq09usPBZAehWUA70HvqrGF/t0Q2J7Yl0bLgCw==
X-Received: by 2002:a05:6830:3496:b0:7c7:162:e0c7 with SMTP id
 46e09a7af769-7cc668e953dmr19136727a34.6.1767210765087; 
 Wed, 31 Dec 2025 11:52:45 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d7f1dsm24854006a34.15.2025.12.31.11.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:52:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:52:42 -0700
Message-ID: <20251231195242.4045046-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767210765; x=1767815565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JlZDG2h3FzAeOBnU1meDuw3E50fVW+7pqhPylnH45BA=;
 b=SIdjgRVsi8uKHPDaQAQpl9vAqdheMkXAoU7x9tQI5HJyDhgtGExWhmPCuRRZ0/o4qN
 ACNH9R4gc6XGjPGB/4pmpEaraF+3odZyeOsUUioBLIWNNzYMiot20dRi+xsITJDIZVSW
 dl6fzyRiGT7F8MgvwlE9WYCMR17PKAQK23yBblwz9RTxkSNaDxNbQX9Ni1E8gZmmyH4U
 jx2oDVcnxYwt7uoQ6MT8CP7wnB8Rouqbr2DqxHK9kVDCQnrNNG2d4U2IodwRRhN/UoS+
 fcvPyEByAMkHYFEKR3X9qYkUnr17AgZkadxtKMsV/PomH7zJxvR4yTlolE26twDTY4vY
 Tmhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SIdjgRVs
Subject: [Buildroot] [PATCH 1/1] package/python-socketio: bump to version
 5.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 3535c00819..11c6557077 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  fa264f1d5086cda8df1e01e7feb4a09c  python_socketio-5.12.1.tar.gz
-sha256  0299ff1f470b676c09c1bfab1dead25405077d227b2c13cf217a34dadc68ba9c  python_socketio-5.12.1.tar.gz
+md5  2020f7a9aa9fc74786ff2bdc8b48a68f  python_socketio-5.16.0.tar.gz
+sha256  f79403c7f1ba8b84460aa8fe4c671414c8145b21a501b46b676f3740286356fd  python_socketio-5.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index b07e6a689c..2c6b581c1e 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.12.1
+PYTHON_SOCKETIO_VERSION = 5.16.0
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ce/d0/40ed38076e8aee94785d546d3e3a1cae393da5806a8530be877187e2875f
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b8/55/5d8af5884283b58e4405580bcd84af1d898c457173c708736e065f10ca4a
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
