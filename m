Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CFFFC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FAF600BB;
	Sat, 14 Sep 2024 22:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OWEWFWza4NN; Sat, 14 Sep 2024 22:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B046605D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B046605D5;
	Sat, 14 Sep 2024 22:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C30D1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B48F605D5
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xRlLtzyuL8A for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68085600BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68085600BB
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68085600BB
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:54:07 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82ab349320fso120844639f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726354446; x=1726959246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TQKd4uBxtB8z9VEskoxuSBUN0kgwk7HileJ6x0sEcY=;
 b=A7bN+6XpNpENuJrHauwF/k/BlFEpBzG6rswvd0G0rMembPVP1HnEsFXD30/asWRBnD
 u141bPWdsddLoF7SABrmv2DJjjI55qulnrKLggCqoxXIO1jkn7VIF9Z4plVQMVwUOePQ
 ebIE5AHYCRTTaAb6Bo41VhVLnk+e5trc4M2fZexsoHCJ4o698bqtFMVYXYz6tE4azyx0
 WxwjHw1HmDDdwAglyJySEGdmZaX2/69rsAHQcdxXFAvxF8VZutKMUOyap/kKP7JTRA6K
 SBZyFMtKcYHZgclrhZXMNV55KNzERRj2Y+JZHU+vtLXIE+dUZeerLMv3OgmMDrGzQGgZ
 rpcA==
X-Gm-Message-State: AOJu0YxWjVa4cplSvFX0L6yWa3dW2D9ntHE0ixBBKpHT4cQD3Simzggu
 2ZG0XOQ2IzhCdg0tsys53p/wySOJGTRcnjdQWY7YMFi/Lmn1xpZKW/rpmg==
X-Google-Smtp-Source: AGHT+IGDQcoCPRU1Sj+eDhun+M3+V9vCJ8MdyureCncDeAUwK+aQRApeN9tfkX2bk1Ppq+iaxWXQfg==
X-Received: by 2002:a05:6602:3fc8:b0:82d:581:8860 with SMTP id
 ca18e2360f4ac-82d1f9481d8mr1091580239f.12.1726354445905; 
 Sat, 14 Sep 2024 15:54:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d15esm611907173.77.2024.09.14.15.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:54:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:54:03 -0600
Message-Id: <20240914225403.1370382-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726354446; x=1726959246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5TQKd4uBxtB8z9VEskoxuSBUN0kgwk7HileJ6x0sEcY=;
 b=TPwK58fwjrxzudUvgp/q2+GBTDM+w5YawPW5e8InTclDpoTXX8Vrc8Ufwd5l3lN07V
 ZzalUwX0hSP9avshUuR886EGTsOgAAdu/Gn1E3fQCE+PqHT9hutNnEU9uEUlaM3H8Z5q
 tXZHWHasVTkkSfcuzVp/lF3E/6DeLt+yibfKonT/C/En/Ffbcdaf1fIHD4Zc0OEP553w
 sREz+6WfDDD5PbOQj19lKPavp+Mg3Sxu8qjI4oczur1FgaxJO2iHiZJZQ8UgFgI1ioOV
 wtCyhcC9EWh6/HtA6N9f8DQfhaot/CcBEKY9e8oe6VC88bn+yx013epG4QPAjaGaD9H/
 TyPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TPwK58fw
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.6.4
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
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 42ed828d53..7831f36118 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  b44037904de5b0f833020bfe01f741ca  cbor2-5.5.1.tar.gz
-sha256  f9e192f461a9f8f6082df28c035b006d153904213dc8640bed8a72d72bbc9475  cbor2-5.5.1.tar.gz
+md5  a6e5932eb719e0e429792faf326023b1  cbor2-5.6.4.tar.gz
+sha256  1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f5b108793f6983e  cbor2-5.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 423670047e..36e7197164 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.5.1
+PYTHON_CBOR2_VERSION = 5.6.4
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d6/37/a0a75c2cae532ecb155d05edc1fbbe54fa3957e86f875a38542f87e1379c
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/fe/da/6e62e701797c627e8d8cb3d5cc0cdcb6f4a876083386ee1b1a35321fdac7
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
