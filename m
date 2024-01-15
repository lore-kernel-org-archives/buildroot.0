Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F815C4707C
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54801834FE;
	Mon, 15 Jan 2024 21:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54801834FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuRdNSIIjX79; Mon, 15 Jan 2024 21:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B6C83396;
	Mon, 15 Jan 2024 21:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B6C83396
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 639051BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C1E661122
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1E661122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nes83qEf2KA9 for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:34:35 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17824610AC
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17824610AC
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so46146395e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354472; x=1705959272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnE6uG6DqeOUIna8TMfe71VSebm9D69zEnVe2J/85+s=;
 b=rzIj61JzKNoEZAgDkUd/AhVcF0X/PKQeRvw/jOBbd9N0E3ngQ0FbXbytY1sonuNTYd
 PhYyhHiUVxkO+AmV7D7i8GDw6ZXWzCb23w+Yirjbkj68CoJsK3a/TPPTJ1xUmo42lfb9
 K9tzA+1ZnWmASClCAzOfUGQayx912SaE4Hxp4nZ99TqrC+ZZiVrJzo8QcmvOFpufTWho
 vYXujn++HPEi55YMwNL306QAMZj1sogdYYXNNQxd2QchrD/MFAD814g/K0l8J1C5Vc+m
 h+fcnuZtfz4XPicwmDXGQ4hCkoWE2wDCenu9jXsf9EJTT4C4B9GazyPuLDlxqcRXEeaa
 lciw==
X-Gm-Message-State: AOJu0YyU9Uy98S2ulPOs0CnkDyo4Ucm2Tf57gK7njNjzTaGkyYFWjCvy
 um6ZfmCDG7kbGbYeS9VrRAz6UEYz8Q8=
X-Google-Smtp-Source: AGHT+IECKEoxbLdpr5fcbZNEgFwUuEpclu9+zz4+WXfJq9yJLTDkwdA1viIur+OfNwpCe3fPEqxPOg==
X-Received: by 2002:a05:600c:91e:b0:40e:4a5d:59f8 with SMTP id
 m30-20020a05600c091e00b0040e4a5d59f8mr3267616wmp.42.1705354472344; 
 Mon, 15 Jan 2024 13:34:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fb11-20020a05600c520b00b0040e76228042sm5847121wmb.35.2024.01.15.13.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:34:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:34:15 +0100
Message-ID: <20240115213415.17439-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
References: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354472; x=1705959272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnE6uG6DqeOUIna8TMfe71VSebm9D69zEnVe2J/85+s=;
 b=a6DR6WQsQBw6h9SqwYUKXw1SsU54Wtjo7p43WEje5itdNjir7rvi3xt5XE+LaN4wJX
 LB+PSXk7IrksYcP3eamI9y1s1GFlAqml2OZGwX/5MavdmZjXi3e9H7mGaVs8/cFa0g+O
 4U//CI7uGilpPOm0fli8eecgnKWnCL63ufw2MtfQ+PeWQcfJg3Bq00+XBQzLLWbLlJfK
 WAd+Rfli628cRikJxBfKx76iKvznCDyIv1AkFsULO1sybjhbijcwjTTl/9l61A094bS9
 qCcul94l6LxK5jb9ZodGsdiwpHcwqMwupAcjOwF6ZXK3E8ZgV0UOUrJU7gofYOqq/iJq
 TubQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a6DR6WQs
Subject: [Buildroot] [PATCH 2/2] package/attr: affected by gcc bug 101766
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

attr is affected by gcc bug 101766 since version 1.5.2 and
https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=11b9069098b4d4c23efb06c9457a085b784354d4
resulting in the following build failure on microblaze since commit
b31b91296e7f985b909f104f06a098adddef1fea:

libattr/syscalls.c:133:10: error: symver is only supported on ELF platforms
  133 | # pragma GCC visibility pop
      |          ^~~

Fixes:
 - http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acl/Config.in     | 4 ++++
 package/attr/Config.in    | 4 ++++
 package/systemd/Config.in | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 92f2251878..132c6e8ad3 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACL
 	bool "acl"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
 	select BR2_PACKAGE_ATTR
 	help
 	  POSIX Access Control Lists, which are used to define more
@@ -8,3 +9,6 @@ config BR2_PACKAGE_ACL
 	  This package also provides libacl.
 
 	  http://savannah.nongnu.org/projects/acl
+
+comment "acl needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/attr/Config.in b/package/attr/Config.in
index 554772b75d..b9d9f57d8f 100644
--- a/package/attr/Config.in
+++ b/package/attr/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_ATTR
 	bool "attr"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766
 	help
 	  Commands for Manipulating Filesystem Extended Attributes.
 	  This package also provides libattr.
 
 	  http://savannah.nongnu.org/projects/attr
+
+comment "attr needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 859332d9e4..f0f92b78b0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -451,6 +451,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_SMACK
 	help
@@ -463,6 +464,9 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and
 	  manages security labels for sockets.
 
+comment "SMACK support needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
+
 config BR2_PACKAGE_SYSTEMD_SYSEXT
 	bool "enable sysext support"
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
