Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A5C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3EE817A3;
	Mon,  9 Jan 2023 05:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3EE817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXN9BR5F4hSn; Mon,  9 Jan 2023 05:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9A881775;
	Mon,  9 Jan 2023 05:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9A881775
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 401FE1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1809660B20
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1809660B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WjScd3pAlox for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 323B460AED
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 323B460AED
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:37:58 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d10so4414019ilc.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTPNQNQNo6hB9YGqzA6/afFkIQhTE1vPZcVID+rC7Ks=;
 b=wO80CNpY6GSuX++KVn7yYX4wLvZnT1l5myVVv0XoLRDsyuENsydF8Xsukff7HKqi6g
 rE4QJOccoIRrJBMI2UWzFgIEtXdlW1NChaBNlFf2XBUSw40TO/Ou4VaYUA+ILrm/h1f+
 ZkA23tU20pPK33k9TOMhXZpxQ6JA0NFCCzwCEWt1oyyGuJv2pvjOuNNQ/bAk1n2orjhn
 IqeaJcolBmf9qZ42q7I9+SzdH0KoUPDRrIf9ZOy0Fy2Ueep/0t361cmYlR0LNMnIcuwg
 MtpkDIexDT7mtE6+NWERe3Ia70JOlDDcbuv4odxoGgib0ioIXLPoC3ki96m2QRnIyDlk
 jTzQ==
X-Gm-Message-State: AFqh2krqqxvx0DqLaqzC1mP1+vS4pUiXgtRHA6fbqU5GLmcTWrJ4PRsd
 JWD2QgUZj7j8AnTWHkVqeOWaRzepY4AS7KBd
X-Google-Smtp-Source: AMrXdXsoJuhhBPI7oYl4yrn+l8QIh5F3Sor00+MlhHRig7RsbXhGNYZhsX1Xg8kgXrTG/H9n2qA0rA==
X-Received: by 2002:a05:6e02:103:b0:30b:e570:57d8 with SMTP id
 t3-20020a056e02010300b0030be57057d8mr51948873ilm.8.1673242677126; 
 Sun, 08 Jan 2023 21:37:57 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y6-20020a92d0c6000000b0030014a5556bsm2469878ila.69.2023.01.08.21.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:37:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:37:55 -0700
Message-Id: <20230109053755.2692156-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTPNQNQNo6hB9YGqzA6/afFkIQhTE1vPZcVID+rC7Ks=;
 b=ijbYnYvlJiVZGAgcacDzoszaL9lqx8GVX0fbbXLZR/58vy7zBMkP6EeJelP4rcIBuU
 OicgsRmumnGLMXx7n0bcsd8kGfyKN3wTztOJ04MuwrHv9PORXATTDJr1jmdzebjam2bY
 Kq7lJoto4QGNYJ89aWkZR9YiVmcU1eBDdfrMlPRNv1c/HxDehMXe257NWoJOEVia+m0K
 0b7PjcmcSDJbQMsKR+9GEH+mVQjUj1PMmT0mGjPkbfXvQ3PNt1VfUxveDFVfDXc8XZjZ
 Qzp5aC3RxQ49M5K5heVM5s8G9WpGvihTgT4YWcDx/njbNHuW/UMUonykyqUpgC65TJq8
 kt+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ijbYnYvl
Subject: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to version
 0.7.0
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
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 400e380b5d..0ae6cf1d4e 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  67114f5e59c6d5b45fe2b38c128c2140  pyspnego-0.6.3.tar.gz
-sha256  6060a0e683171090adcf92c9d319ddd334f15117fa199a703d8c9bd094d9f6c0  pyspnego-0.6.3.tar.gz
+md5  93ab1a088d65e6a7c97efdb567ba37b0  pyspnego-0.7.0.tar.gz
+sha256  da78096fd7c9f40e716f6fbe3e30d913103d75fd676f839f98fc3a6fee92fbe3  pyspnego-0.7.0.tar.gz
 
 # Locally computed
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 0910c57b7d..2fbb779d98 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.6.3
+PYTHON_PYSPNEGO_VERSION = 0.7.0
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/ba/13/7b4e7dcff1eb24a13e0a631a4b49eab361678e4490d691c03253ae736da4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/97/f3/bdf3cd5f4c5a1bf9e1d4bb771c133850ee08241c18cafd90a6d872937a9f
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
