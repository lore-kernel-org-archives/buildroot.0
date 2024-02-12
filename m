Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF83BC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 01:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74C2040591;
	Mon, 12 Feb 2024 01:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8T2AX8EcKb1; Mon, 12 Feb 2024 01:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E1940B40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E1940B40;
	Mon, 12 Feb 2024 01:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7ACA51BF42C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 01:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 678A860F16
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 01:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XxGW4UWkgOB for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 01:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CF5D60F13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF5D60F13
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CF5D60F13
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 01:35:16 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7beda6a274bso112406939f.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707701715; x=1708306515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTEG/lGu4HbQleg6cDujyn4978SGLPaLlBseGM+JHXs=;
 b=NU14BURibFe6duIZqbpy/hoq33jfxMd2XlmE4mXqHgWcFEAml4WK2vs3lU5k9Bmpji
 B5tWJ3GFp9q39LmgAAeCsVJj3zNBvmNxrURnO7H4Epyixrtd/p69L6x2v6EBkw+LArfE
 ifL+iazeq4/wbSHh8SRk2r812Qyz+sL30XQ6kkhHE7wofiBlyJGMzQemW7yXx7n81xqq
 eNCoMyalSvCClJ8GFeHEfgWuYTF0ys7Hczg49FQzy9BxzQnjS2Mc7TNntnV23g15pXUK
 1aKuxvUGUaoTL2TtSM09nSokSn2mLxlsr6YHdadDI+DFvrvvFVe8/og27e0W10bGSvVd
 pudQ==
X-Gm-Message-State: AOJu0Yzel6nvJNK6DJWt+CGUu0wmr2rOJ/JQglrve2vR2IyZVqffjByB
 c2Y0Rd3A3dDyhfRgbO1N0/Xrxz0T89T8yjonASn1X/IxwCy1wJKk+G2iXrFBEHw=
X-Google-Smtp-Source: AGHT+IE89aX/fGRnNYxatwjGJHUWqEySpTUY4eV8q5XbQ+5pJc1FGTu+shloSMVe3jnAMOumYrdPlg==
X-Received: by 2002:a6b:c34b:0:b0:7c4:5740:3cb7 with SMTP id
 t72-20020a6bc34b000000b007c457403cb7mr4685209iof.9.1707701715613; 
 Sun, 11 Feb 2024 17:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EJFkKNSCiDjgjoOU3LS653f9Q+3dYCLGbWdqxYoiHau6ML/ncLJ0Q3Xm/lBY0DVHA6oXZMX/MzO8S/wL8PrAydbbh5xlqfWNKkCkUtB4FPi51b/mb4LI6NxEQ1s=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cp27-20020a056638481b00b0047140ce03casm1139289jab.22.2024.02.11.17.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 17:35:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:35:11 -0700
Message-Id: <20240212013511.1146354-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707701715; x=1708306515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTEG/lGu4HbQleg6cDujyn4978SGLPaLlBseGM+JHXs=;
 b=Uz0aOxJRC8iencnjE4rFBF7Bzm8jIY3g70JpM//2WehJ+ANZWNzRoCmPN0Fx4rnSiL
 KFCvthflu5maFPMqT2Tb3N0q6kjtTJ1YtOY5h5C+oFw2/6tRw/fGix9d9P68O5/OHI5J
 8lD53XcPVDYp/lkZVG4fzT9gfZ4gQw4n1AysapIuK8N2XpgcwYPgtNa4Gfn7p9Otj8SA
 Vkebfw14CW1C+hicnMusH5KAsqET9fX1ODBaXj9FEboUxC3Zu96jgF3U6u0JIK6hzLqF
 3SanwjafvGtB3qO8Y/EM3HSJO0DR0ZAu+cu7m+cDCfHDxFiWqDn7YACH2RJ8rvHB78KJ
 5fpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Uz0aOxJR
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 42.0.2
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

License hash changed due to dropping PSF license:
https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53

We now need to enable chacha support when building with libopenssl.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/Config.in                | 1 +
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 213aa24fa8..d12f040656 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index e083014750..43c458e274 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,6 @@
 # Locally calculated after vendoring
-sha256  405c9a6271e1a088ea0b432bc2094e2e8baadb2241e192ce9c73a7cc9793b127  cryptography-39.0.2.tar.gz
+sha256  44b00c8a646aeb0d2de5a385364115d1bd170880964c4844a7b568523f82bb61  cryptography-42.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
+sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 07c88ec3da..9e052f6376 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
+PYTHON_CRYPTOGRAPHY_VERSION = 42.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/0f/6f/40f1b5c6bafc809dd21a9e577458ecc1d8062a7e10148d140f402b535eaa
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
