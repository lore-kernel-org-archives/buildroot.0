Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B992CFC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AEC04060B;
	Sat, 14 Sep 2024 22:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukplJVTc9Lpk; Sat, 14 Sep 2024 22:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3167140624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3167140624;
	Sat, 14 Sep 2024 22:24:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A03E81BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5BB40607
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSMMbwhxpmvC for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 451B640257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451B640257
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 451B640257
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:24:19 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39f52e60a19so17993355ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726352658; x=1726957458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vzk3nw+nCxJnsAQtwoQ0czHGGAgTVmcExvuYg8tS3Iw=;
 b=Y4hzcPb8jJnz7JIK4bJYDFdgoAmuz9HhHw/zbqDz0lHYF/Um0e+ZDm7DW+Qb4RTIBX
 tbVwBeMokaNdnSeAyZjpus7bU1Nml4vS9yyivfjIaNu4E17UMcawLGEzDcZ7pSiCzMRO
 ZID1Nud39BvPVpliV1blt+2ybdiABMBbqEg5ArrBjwx74M3S4Yi/Dxvm3lp7dEhlO6ou
 OIqt5xoL70XSv4Y59eTOCemYOjZVsFNN8LphLRiKqhPDD1dX2jM3cLLoJacp0hORv8+G
 LiWkUH0wZt+WnsOEwSNZfTI/EqnYOWfVtXTxRm+TEaKs8hqPqyijnwPpsIyvhJKazvuz
 FuqQ==
X-Gm-Message-State: AOJu0Yxak0YA4NiWHW7K2DvNxvI6oI/bk6NvgNtIjLezp2fC1RFysObb
 aBwTpdt3tJz73lCWygQVC3vigEQvwoHBShclaD5M4tUmDfaepO1Hs9INRQ==
X-Google-Smtp-Source: AGHT+IHL0T6xyXIM8wVgvqp6TYrvtomFQIXqHQh/ahyWUpA8pplyVBIc9GdAko3I4sATULSaSobEsA==
X-Received: by 2002:a05:6e02:1c0d:b0:39d:300f:e8ff with SMTP id
 e9e14a558f8ab-3a0848c8e16mr111571025ab.6.1726352657854; 
 Sat, 14 Sep 2024 15:24:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10b8esm6687815ab.35.2024.09.14.15.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:24:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:24:15 -0600
Message-Id: <20240914222415.1349480-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726352658; x=1726957458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vzk3nw+nCxJnsAQtwoQ0czHGGAgTVmcExvuYg8tS3Iw=;
 b=GCxZZR4N0m33IZzm1ZMS9KMs/oE8fPk+BJajq8tZPuPK1vnaLn2i6pmODcl3oyTtR5
 vcWjh9APkSi53ZppKe3893PCpbJRY1g9LqoLyZhkHNXiyYB+skxOJ3UISHPMjjktqavw
 32wVzsv1oEyvI/acmUavrOCt0uwUrdbbJGCtqUqgi7xa+C2FrhwOCW1TQV25I5bEnXE3
 HqwYu6z+Cl36yERIr+Yhse6mDGhVtWJiINBcQFSnLX3u3LeZurjaL4RaO96VowtZzGZu
 SlZG24G6xKH4ci73lHmBREyhauPrkOP3jpQfGAfwRzyKcml/SmN/cY5lSaDJeGFINVug
 N1Mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GCxZZR4N
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version 0.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-async-timeout runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/Config.in         | 1 -
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
index 691450f86b..6c68c5b056 100644
--- a/package/python-bleak/Config.in
+++ b/package/python-bleak/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_BLEAK
 	bool "python-bleak"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_DBUS_FAST # runtime
 	help
 	  Bluetooth Low Energy platform Agnostic Klient.
diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 8462e19d39..577811b60a 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  5e27e052efc45b64da1a1f017610c561  bleak-0.21.1.tar.gz
-sha256  ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f  bleak-0.21.1.tar.gz
+md5  521fbbba851f4b6e9507ea27d06dc08b  bleak-0.22.2.tar.gz
+sha256  09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe  bleak-0.22.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 716b6327ed..4eabd3df75 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.21.1
+PYTHON_BLEAK_VERSION = 0.22.2
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/6a/c0/3aca655fa43b8ff5340d99fac4e67061f53f42f092fc847bdd0559d67846
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/03/76/733131e2935f4fcdc7a0dd47cbc5090e12d578297804fb0482575db43f3c
 PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
