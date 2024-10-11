Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC5D0EE19
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 17:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD44460A88;
	Fri, 11 Oct 2024 17:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZ1dGegzI3AW; Fri, 11 Oct 2024 17:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C82A4608D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C82A4608D6;
	Fri, 11 Oct 2024 17:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC4C71BF239
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A489384353
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-Xtu7dLn5eA for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 17:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B155D84347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B155D84347
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B155D84347
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 17:59:02 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-8369b14fb91so64670039f.3
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728669541; x=1729274341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KliTPnR3o3Pvai4Ds2GfnEFYzoAG21uVO2GEbYVm2UQ=;
 b=pwXIIIEsNVZS7/y3rMN+z+AyxUWDmpFdyzV5FGYmwUy6ZAZRR9JMOQm8UcVQmWd5p/
 uyiUPqspP6cFHC9gX9xs0o1ZjqXhyWh+Zr33f4PlPG5zzfz2EOAazXE+KT8a/v+mmfV7
 npSrDj61FaudppTj2pmHMKu1mXQygsrUWWoIaJEyJ2Ldx63vkThJEM8QXGJKJhWtI6Jo
 ISIRgHmpoz5L7J1Rj+zGdc8ZiSYneOx+JGc8V74KejYNfX5958DP8Nj/V5uSq7kWNCUu
 R3UqngwdtN/Z+KmzFsQATkCIwmQRfvl81CGfnrUC5r6kdxTUqgr6lwy1hE8vXWKFmSvX
 SOpw==
X-Gm-Message-State: AOJu0Yz0mpahYSmZasGZWpcVl661uq3FNSr9NlT30QreTXJi0iJwlTBq
 52hT3GEH2V0/gb6oLX/5QnWl8VtSGTH1blht4EWyqPmRwvsY9MsoLPEt5bnC
X-Google-Smtp-Source: AGHT+IGz+yRq3BdBTH/jFjBt0aLfSin5qo4A98te6js9yAmImHgRnJ1Al6ZxnWvjRoKWLbGL3pjoGw==
X-Received: by 2002:a05:6e02:2146:b0:3a0:9244:191d with SMTP id
 e9e14a558f8ab-3a3b5fb0529mr25361055ab.16.1728669541368; 
 Fri, 11 Oct 2024 10:59:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3afdae1besm8135815ab.14.2024.10.11.10.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 10:59:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 11:58:59 -0600
Message-Id: <20241011175859.2767194-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728669541; x=1729274341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KliTPnR3o3Pvai4Ds2GfnEFYzoAG21uVO2GEbYVm2UQ=;
 b=EFrqhxF8rrXZxstHAy3PqdgW94MVbPYKMiGK5i6XLoRok5qf0mYkTK6Ju9AmfkVZjI
 EGfmBLMJzx6n6Vb3f6VUKZDrtgNvG8NEzvpvbiKXnM9BSrnXHiQDKjPKOEbq/bV+5NN6
 XFDoiB9Nz6ri7XrLwjwDcva6z8nanoYeYD19UWuQo2P1zkBH7r7eAgFtXBYAcyWILEwc
 j494nZUhQUeKiftH3FoRgAWNjuQpCgYaUPUltk7DEueaCDiqpxSFbzR0V6HXH+cCeZrz
 0/vF0lXVkfvvXctgjUzcAvLwYcgDfRfe4RU5wODzwMCYUBs8pkWtph64mQSCZu5cv2K6
 4fVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EFrqhxF8
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.6.5
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
index 7831f36118..8c30bced20 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  a6e5932eb719e0e429792faf326023b1  cbor2-5.6.4.tar.gz
-sha256  1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f5b108793f6983e  cbor2-5.6.4.tar.gz
+md5  0804f5be872bcdbed12fb1314615b461  cbor2-5.6.5.tar.gz
+sha256  b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09  cbor2-5.6.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 36e7197164..9e410376fb 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.6.4
+PYTHON_CBOR2_VERSION = 5.6.5
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/fe/da/6e62e701797c627e8d8cb3d5cc0cdcb6f4a876083386ee1b1a35321fdac7
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/e4/aa/ba55b47d51d27911981a18743b4d3cebfabccbb0598c09801b734cec4184
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
