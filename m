Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA11C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD2440133;
	Thu, 11 Jan 2024 06:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD2440133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FITSMCcJGpRY; Thu, 11 Jan 2024 06:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A132043809;
	Thu, 11 Jan 2024 06:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A132043809
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF73D1BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87419611F7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87419611F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-vyJlulhKAq for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:50:14 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF61060F5D
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF61060F5D
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7bc32b04d16so210182639f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704955813; x=1705560613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMGJJcOQGshoggv1gk6NYcxiIoasmFI+KoPliFQ6eIA=;
 b=KPh7Uwh7toA6WDNRgXMKw4v06IOwL7jpeg+e77vlglD+DffBwEZSko/nBDQObTW0RG
 ceuKmIc1uqf81700U4ptyoFoAT1As8R5mkgBgmDFltDP87ipvRvW42tzqLpwaAgkMaBZ
 U9MNmjRuFsOwT5mVPm/tZeJbGgxjz5nNUx5kAbUkCh2WqKrQx0DjZhW3hIANS6cn22ZL
 r5GP/67vPc3YBTycLYsDo0NUPq/ok9FXnWTtDILnoTiynhfdTspX1GD8iSxNLXMG6c6j
 os9hfWZbde1j/iNUmDTXKmZyz7ogA8bMjXb3kbgl8uN+TKSHt0a+fgSvKIQopigekAHn
 rlAg==
X-Gm-Message-State: AOJu0YwZtD7HBCtAepDt4PqrRbWJbVRb9OTY2tUkV8CmXCiet/A0krdV
 qIo4MCYcfpPn365ZfBkRt6C60baYaPR8bA==
X-Google-Smtp-Source: AGHT+IFth9Lorp8fgbXZVpwYIO/ZvDG8rETtMa6a8LF1pbXBd9zf/7izbEAclfQnU8jU/jjbPj2zeA==
X-Received: by 2002:a05:6e02:1071:b0:35f:fccc:ac7a with SMTP id
 q17-20020a056e02107100b0035ffcccac7amr721299ilj.35.1704955813417; 
 Wed, 10 Jan 2024 22:50:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a056638618700b0046e4a8367c0sm144321jab.140.2024.01.10.22.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:50:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:50:11 -0700
Message-Id: <20240111065011.3057364-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704955813; x=1705560613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UMGJJcOQGshoggv1gk6NYcxiIoasmFI+KoPliFQ6eIA=;
 b=TKMt8jD6dr1esb/FUq4sUiIKf2awpfatUB6EcsMEuIetA934ETqaeF9ndpoPeRfs13
 T6a4cK0GVrM3jy3n1215H5o1T9AHu9+EtWe1+hRXODktiQDb2zPUZWoKpF+DHA4InvI/
 hH48X/J+Avpk2XwqKzakiqSfatuCUqwzlwUPwe1NozX3NjL03dbUOUqApj0Fj49aRp9l
 pPwEqgiEF70afdEDdQJ8D/VrEyeoV3utuhHvYTOG3CwA1MnIZQNjOx3mjwbKtjNt08+r
 XxgvXTduBa1GVnva8jb0jBLc6plrXfSnG8+9+5t2pQmvAT2p1ZHCDqRUXUQC4w185JTC
 Zq0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TKMt8jD6
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.19.2
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
index a8b946b2c4..9f96f99bf4 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  ecd07fca7a7fa0bcc9acdf9d82e41eb1  simplejson-3.18.1.tar.gz
-sha256  746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa  simplejson-3.18.1.tar.gz
+md5  3b334627d870a3c849e1322d18a7bfe7  simplejson-3.19.2.tar.gz
+sha256  9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c  simplejson-3.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 5782626387..d5ba3948b7 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.18.1
+PYTHON_SIMPLEJSON_VERSION = 3.19.2
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0f/a0/79d2bec499cb53678bc20d41f9706ca02777f0876efa9b29a69fb3d55dfd
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/79/79/3ccb95bb4154952532f280f7a41979fbfb0fbbaee4d609810ecb01650afa
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
