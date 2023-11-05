Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7AC60A5E;
	Sun,  5 Nov 2023 02:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7AC60A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUt3fIR7uwHH; Sun,  5 Nov 2023 02:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C5160B46;
	Sun,  5 Nov 2023 02:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C5160B46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A270A1BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77FD54189D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FD54189D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwkNNZZRNcsT for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:37:11 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21B2641877
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B2641877
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35749078a59so11281905ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699151830; x=1699756630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ycyY8C+BE5+IBc6ItiqLfg2+wpXrpsaPyj3/gxxOj8=;
 b=c7dsx3VF54DVvM5sTxSmhreYtdzSqrHBTKY+HqTeWF+FMImyhU61O3c3/9he2Nz6gT
 PySWXp4r9AryviRDxXMqj6t5CTuMdinv++L0VUolWmToZbxcCZcilhNmcilXyyV9ejPF
 xq+L6bBgoblPXI+aUry/w72tkvNLiSzU+NbSaklyVjIFYDpvlFEIwHC7KTaPeJgSNhOt
 pg9jxXyU7Qdli6jC/GDGJPjU6yUVNGl5Fd2unErGDnL/aoRMvnPMNM/WI84MwiSBe4ND
 LEGG6O1sVnTcRNwvhMro+HzGFPkGZkC3lC45OsFv7qrHV1JNplkgUS8BaphmuPF+E+ok
 9hyA==
X-Gm-Message-State: AOJu0YyMz1Q+RUGWY2aHRP0siR1C3WUeo0S1Sx7LdYPV2QA5h5QKOvZ9
 JRy8NFOTg6NPawAJhN5swoAmiowasiU=
X-Google-Smtp-Source: AGHT+IG+dT+40ZrEXzalYU9V8awTbXsvNRUoGa9dmOCnfFgmkWFvpey7iuuS+REGOt49uwoj6mD3tg==
X-Received: by 2002:a05:6e02:1beb:b0:359:6af2:67bb with SMTP id
 y11-20020a056e021beb00b003596af267bbmr6972607ilv.23.1699151829449; 
 Sat, 04 Nov 2023 19:37:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 c8-20020a92c8c8000000b003506f457d70sm1598409ilq.63.2023.11.04.19.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:37:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:37:07 -0600
Message-Id: <20231105023707.2759107-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699151830; x=1699756630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ycyY8C+BE5+IBc6ItiqLfg2+wpXrpsaPyj3/gxxOj8=;
 b=OkG8sptaOZmSSj1vZYV1jcJrJudBOFPiUsgGohQH83a3ZQ51Nlc8ZGRK6kYSJY2utW
 NhNSfRQU46XEUySEu60dJuHQ5pxmqKZvd2WQMh/SxTxFkckZQold5/tj717PkSBmcXy2
 MaO4DERlXKI9ESbusonw4NYmif+7Nu0S5Fe+oru29j+3hOUuxeevBskqDnRb34h/n9J+
 m8XHaelN8OrzFILyrPEDdchdtd5sD9Nr4pSDQaBHktujyvqbWov0pouylxfeYLSd7J1e
 aotlZBM7fXoQ1uj0y4xvRkWOu02gR5nUpOsYT5BrBMp9etcBQIBB2bqi9Q1NULn2fZsQ
 HXHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OkG8spta
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.5.1
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
index 70c35ca864..42ed828d53 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  74512376482be8a6af10596a63b6d254  cbor2-5.4.6.tar.gz
-sha256  b893500db0fe033e570c3adc956af6eefc57e280026bd2d86fd53da9f1e594d7  cbor2-5.4.6.tar.gz
+md5  b44037904de5b0f833020bfe01f741ca  cbor2-5.5.1.tar.gz
+sha256  f9e192f461a9f8f6082df28c035b006d153904213dc8640bed8a72d72bbc9475  cbor2-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index a2fcd73b74..5040301867 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.6
+PYTHON_CBOR2_VERSION = 5.5.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/69/de486293f5211d2e8fe1a19854e69f2811a18448162c52b48c67f8fbcac3
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d6/37/a0a75c2cae532ecb155d05edc1fbbe54fa3957e86f875a38542f87e1379c
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
