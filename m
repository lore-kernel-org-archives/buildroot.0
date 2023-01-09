Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602F5C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 06:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF6360B91;
	Mon,  9 Jan 2023 06:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF6360B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6dhkWLTUVrO; Mon,  9 Jan 2023 06:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3458D60B57;
	Mon,  9 Jan 2023 06:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3458D60B57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89E8C1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6528960B57
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6528960B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rbHmJ0y-ISJ for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 06:01:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AC360B55
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72AC360B55
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 06:01:43 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h26so4428761ila.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 22:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wh/8wM+PVh5yIRXUH49uRo3qepBaVkCdJa8LaltGoWo=;
 b=SQ0R/JycYnCEQGiDWQi2W65jvlijaRLRckNMT0RDFKh65gwvPuDlGi8b8cGjBpgEy6
 utqCrVdwA98CBKRQs8TYs0KOl0BZVwio9kY47CWRDbsLu0Vfat8BprT3guHOXuUmEYOj
 Vnc99M3sP8uFKSzeNyqnSO7qHRp7TOJxi3JoZ9ZAjeWDtM6Kg1THXb+pniuZpIHqDWDf
 8M+PBQOFsot1cXOFBU96Is3UBa+8ggUCLK9LCXu8nPopUdEQFKn6l+2d47u3muGAFmf0
 jcicuDFu2UKy2mvPUYwKrMGJeAzEyRiQ6ZA7DWZz0qSfywEH7GblvwiuiLuRuzOP3Jd3
 en+g==
X-Gm-Message-State: AFqh2krq16qayk03Q53Q1ZdqBeheu38U4oZ1GyZYWmfesPGZanusRE6Z
 a52P8VfXK5nza0z9/H3xVM6NJOVJsybr3/jW
X-Google-Smtp-Source: AMrXdXv/J9/UUlAxkabx7OVxlXzmhPTjKpBGDHDK7JRJNBx4JcCGXlefzY/HqUXs4joet3up4LGSuA==
X-Received: by 2002:a92:da42:0:b0:303:1277:7c7b with SMTP id
 p2-20020a92da42000000b0030312777c7bmr41101422ilq.30.1673244102224; 
 Sun, 08 Jan 2023 22:01:42 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y13-20020a92d20d000000b002e85e8b8d1dsm2519446ily.5.2023.01.08.22.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:01:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 23:01:40 -0700
Message-Id: <20230109060140.2792558-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wh/8wM+PVh5yIRXUH49uRo3qepBaVkCdJa8LaltGoWo=;
 b=puqk3Fdv7nTNdNriGbiiZOenTyihgFb/hxjVgC0FPUtH2k8/SocH2uwGga/4AI5iD0
 kZeXWW6tmkUk+UqZZXXlnKa5uijxD/QEI2ZZap/KQ3YyUTaSdd+8H8OkGtkXKjXmY18y
 96xObvvcl24U7HLKyxHk6rXsDIpvBlL771mfKf/8k5KgjonC2ZiriE3hgkyEXqwaxaRW
 f7/huSECyNFqovU8smfdmgSPdjEoPRoTzesezND3Qad2Hq/FW0mRrPbiitfmZguMGqyg
 wA6sMtV8b+RBvLYhRyLJco+Q/JwxwW7A3CKem/lBW4tO7Kb2QN8ZCBQMleLAs3nhWON4
 vCRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=puqk3Fdv
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.18.1
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 1c99b87590..a8b946b2c4 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  83e24e662f024e06af2fffe698227da4  simplejson-3.18.0.tar.gz
-sha256  58a429d2c2fa80834115b923ff689622de8f214cf0dc4afa9f59e824b444ab31  simplejson-3.18.0.tar.gz
+md5  ecd07fca7a7fa0bcc9acdf9d82e41eb1  simplejson-3.18.1.tar.gz
+sha256  746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa  simplejson-3.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 1607d9c90c..5782626387 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.18.0
+PYTHON_SIMPLEJSON_VERSION = 3.18.1
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/17/3d/b8bfe1f40558f6a16f70c349adf97480dc71a7d11b2b1a5dc0824a87faa0
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0f/a0/79d2bec499cb53678bc20d41f9706ca02777f0876efa9b29a69fb3d55dfd
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
