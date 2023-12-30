Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F71C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 22:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B2C404A1;
	Sat, 30 Dec 2023 22:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B2C404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0BhWj0T1LR9; Sat, 30 Dec 2023 22:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3688240253;
	Sat, 30 Dec 2023 22:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3688240253
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB3631BF487
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 22:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA26E40253
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 22:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA26E40253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xig48gKaoY5v for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 22:09:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E1D5400FE
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 22:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1D5400FE
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5f40ce04so31262845e9.2
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 14:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703974155; x=1704578955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C+CbIbxIXd8wXlHfhLILgGwC14XoEy2Bj6RwLwp28to=;
 b=AzdtcrpuG2GgH/1MY6PzBCLavkkiRsVtl8WCLK3ewc0x3h8o/M2oTjRhU7aLw9l6Dy
 ESbpblaa82SZhLFi+1kuL+e6RMKRw/0NfKOIN1Iky8zXlw7EVMTxHuEak0JlEXteNo09
 OEHoC9vasrRP5RH+m8Ko9kVdzGgTzKNvRE7SEPEFQRjUobWDqlYGd1vlDUG1Ehv+Zyy7
 iM+0g30rHz9Exg6EUlkV6kPUgCrWDrlM9huKj/vi2LXvjDzzCZAAcCG/VPhfLlPzWnTN
 zRZzzpWnwX/ucB2C3ot2CN1xHtffeYkFAwph2vHDMEB16oH+GtNwcBruJtY0i3xiapR2
 +8jg==
X-Gm-Message-State: AOJu0YyZyTSLJBazTKMoDwvAyNSeDWifnYtgyO41hrhIQ0dQpFD+5x5E
 w197pexcsuQhV9U1Tgtb+pOakaTuaFg=
X-Google-Smtp-Source: AGHT+IHUv4d7K9gFKPDYdkM2NwYnQsDF/8cX97bx3eo/v04PyN4F3450fUMkkiXLPFqziKFl1KYNdw==
X-Received: by 2002:a05:600c:1e24:b0:40d:8545:13d8 with SMTP id
 ay36-20020a05600c1e2400b0040d854513d8mr285415wmb.72.1703974155317; 
 Sat, 30 Dec 2023 14:09:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b0040d725a9967sm7737069wmo.11.2023.12.30.14.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 14:09:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 23:09:11 +0100
Message-ID: <20231230220911.1447212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703974155; x=1704578955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C+CbIbxIXd8wXlHfhLILgGwC14XoEy2Bj6RwLwp28to=;
 b=jZkABSQGSwNnVruEnApPtidDBRZAoxBNZ8/cp/6/UY3EkyjIUBn14iXvBYx5wkOAHG
 K9tOotiLp82XAIOt2nihxBs+8x97UGBNc+bozSdm+02bq7/2xTY+3pDphI8YccXd2GsF
 vv+K3RvnkGp4Gcc0gB7xAxZdimnhnheqt64/ru9/lb9GKF4q0tSRI0yZKxzP9gCWDFCa
 9Qi4hUP2C4oOZaA4BTk+Xoy7QLKcoZm2MdF2hAsZi+CiWQDO5L/sCbt4NKw4t10IEnVK
 9R25ll/HDapjZj1yGl+JF1xu7eMdYVPdAuVx8FZU78Lq+Jjmq1i6lEX7bFl2wev8vL57
 vltQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZkABSQG
Subject: [Buildroot] [PATCH 1/1] package/rhash: bump to version 1.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

build-shared has been replaced by "build" with
https://github.com/rhash/RHash/commit/851d459dbf530b7e1f64d4140d3c314ad054c70a

https://github.com/rhash/RHash/releases/tag/v1.4.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rhash/rhash.hash | 6 +++---
 package/rhash/rhash.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index 355b5c275b..4e03de8722 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.3/
-sha1  6e698e6d5b13aeac55076d6a53dc4dab55f2114e  rhash-1.4.3-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.4/
+sha1  feaee551aec9cc9a303a45aa8c864f97ece9ed2d  rhash-1.4.4-src.tar.gz
 # Locally calculated
-sha256  1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e  rhash-1.4.3-src.tar.gz
+sha256  8e7d1a8ccac0143c8fe9b68ebac67d485df119ea17a613f4038cda52f84ef52a  rhash-1.4.4-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 1f7456e4e7..99762ec0c7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.3
+RHASH_VERSION = 1.4.4
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
@@ -36,13 +36,13 @@ define RHASH_CONFIGURE_CMDS
 endef
 
 ifeq ($(BR2_SHARED_LIBS),y)
-RHASH_BUILD_TARGETS = lib-shared build-shared
+RHASH_BUILD_TARGETS = lib-shared build
 RHASH_INSTALL_TARGETS = install-lib-shared install-so-link
 else ifeq ($(BR2_STATIC_LIBS),y)
 RHASH_BUILD_TARGETS = lib-static
 RHASH_INSTALL_TARGETS = install-lib-static
 else
-RHASH_BUILD_TARGETS = lib-static lib-shared build-shared
+RHASH_BUILD_TARGETS = lib-static lib-shared build
 RHASH_INSTALL_TARGETS = install-lib-static install-lib-shared install-so-link
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
