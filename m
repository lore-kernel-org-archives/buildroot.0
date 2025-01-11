Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6BAE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A676E61108;
	Sat, 11 Jan 2025 15:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqa8qFoH_T2J; Sat, 11 Jan 2025 15:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC25E6111E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC25E6111E;
	Sat, 11 Jan 2025 15:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FD2942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 877D861108
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aegDJBcUO_se for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99C266111E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C266111E
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99C266111E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:54:35 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3ce464e52bdso8913445ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736610874; x=1737215674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VyuHVYwZmC1AjgPYl11P0/Hvd99/gPO6pz/dmshAmqk=;
 b=GalhneG3bwtI4QVGM38YePF++uQOeXqJmkU3lxHNZC7XyTZI/8l1CQABh2S4rZDc+j
 V/+PekTK1M0KhXPot2S05HdyrNZhiITRbJjCK1LoziZ6KyK1IMHUEhpIo3io2pRbhQxV
 oilZ/7bjMr6y303Ibs//307HoJU4i7bWPcletUHUJhjT1Szpi9+NY6uttHVet27Wj5ss
 5a6jBHEr51Lvfr9yxykmE6E2Mm632FePpw8DOT0nRBvJvCYedi06oFMWmnTKexCsEMtu
 60V2/UPg9ZX+KpSLFC2lQolB+dIKFHXV78ClMrajF5Nmz4L+Zm9A85RvngKq/+FYhHcO
 k8fg==
X-Gm-Message-State: AOJu0YwjmTnQGKtYeMhGOleLZmIDcpduWPFZiS3q9zCCos6Q1XUdYmKl
 TrG+dTF4cps+6vg/IUb9n6plSJcKOaE9r0z7D0MuewSOoRSiz9Yo5/3bcsuhq90=
X-Gm-Gg: ASbGncsObYj5sMXVhGZLqmJbwIbL7oIZLeN31Q8eOLeueBff/dlzzneznLXnCYKQGbg
 IYp71nOYyy5D7uqvsLS3Aj95iehxQ9yZxbQLuwZaOZfUyY8O66nsXaapnSSSUc7CRoaiYDK5jEf
 7tq8zrRP77Mzb7ZjIYiBiM3t/moG0s24/Jwvk6EpnnMGoImWZTWoWMMLKJ95B/UdlppOStZbJjc
 3jJmEhkdfjYsaMH0eEZAivMYyGpqD6/GENd6QNHgzKVTtl/3CPKij3JTNjTmk4wXJEV5OySgpyB
 QjrR9VYyg4JWP62/KBL38SBjQZsMR+E=
X-Google-Smtp-Source: AGHT+IFIkFw3PYuQSRGOeY3smGskUFWUaNt6tqU3WnBSa5rw2K6V79lZApDfWv9e5mBxOEb5AZoaUA==
X-Received: by 2002:a05:6e02:5a7:b0:3a7:e452:db5 with SMTP id
 e9e14a558f8ab-3ce3aa546admr88470625ab.15.1736610872835; 
 Sat, 11 Jan 2025 07:54:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b61322csm1588158173.57.2025.01.11.07.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:54:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:54:31 -0700
Message-Id: <20250111155431.2859360-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736610874; x=1737215674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VyuHVYwZmC1AjgPYl11P0/Hvd99/gPO6pz/dmshAmqk=;
 b=dB3pEK1VKzniFX5fuE+CjWV9UCuXzKYvkbjQr1IVVuoWd3EtthqyVn7V0QXG/X5gro
 aoQOhDYjjYWHMgn8MyJVO72sZ6nynkeInm9iPV7CO6DNEW26eqFH969DaZKsXKuGa3b2
 ACe+UWqF5qSnFJ1K254a48+9BHspoh5OpZqke9pHmnuIVLr448/H5Vfu4LqjMAtVrImL
 Wl2pd9mpWFcWB9FYUCEy3thcIab/KdbHXeOxEyl+nLZoaBkluiuGB7C2nUEfxKhMsWe7
 UUmZDg7rYZpLoaJeSjO/KmCHZAY07wVJ7SBYfS+wabuXVjPk5xWEZmuZexlfyLD6x6s/
 vGWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dB3pEK1V
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.8.3
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 09b8508efd..8be892f221 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  e677f59321fd2ffa9969f586a10c4341  pymodbus-3.8.2.tar.gz
-sha256  c57e41662cb7c26830f2f0e0166ffe2fe08ffd8749e0ce0a56f3d9f4bdc2a5c6  pymodbus-3.8.2.tar.gz
+md5  60f37920f3fe9c178dad2d618d4c7794  pymodbus-3.8.3.tar.gz
+sha256  d886186bf7c3cc140f17e830919c23e4cc88334fbb91d6e5e1d7dd05860fe2c8  pymodbus-3.8.3.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index f0cf8cca0d..e21c5c6a90 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.8.2
+PYTHON_PYMODBUS_VERSION = 3.8.3
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/49/99/375ce7b037e89ebaf55a55e219ffbf83efdcc0b93a9d39a71d6a1f848e57
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/f7/c7/95ad9774e7ba8547f52d657b09fee7fa02d87532866f561c6d2bb9068b8c
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
