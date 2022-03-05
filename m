Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A3CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 17:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3976A60AAA;
	Sat,  5 Mar 2022 17:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIcVNGuIOJxI; Sat,  5 Mar 2022 17:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A2C606E7;
	Sat,  5 Mar 2022 17:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B83EC1BF427
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1673402FE
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 17:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bXsGWUfiT7c for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 17:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F9D6401F8
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 17:39:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i8so17117505wrr.8
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 09:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mGSA7UEMT33O1cJeOAuFNuOluMcqDr5TyVlLOJmvAM=;
 b=oq5bJk9OUkfKyJLwoTI3EIPuyybsS2orcAjysVozm3KyfIt5KsNt9ZZpx0GyyXOKPy
 a2Ks4f927vtSxBSZ4dTy2sr8lq9GMIOwIxRUAUUMJxEakOolex7csaadM63NDrq9H5g9
 CDbq/sVTsPiBaLkXC7GJeopSI4x5FtBMuJW0kglK/bgGEb5yJpwIIYXIVt4A70SJ1gxq
 V+fguae1RC6JHCNOfM9s8uGusAwCO1jmg1UR/5HxvhxeZZjyDF8P8uOLLItLlz8d7NaB
 fkeJWEH2pwRTGAtt/JHtCRrUKUk/VFf15rGE6SC2GyyRQtmZPWbflIAQ0Rz2NNzlSzJM
 84Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mGSA7UEMT33O1cJeOAuFNuOluMcqDr5TyVlLOJmvAM=;
 b=hwcMy3nghhENbmATDuee9LZPcazvt20eZzpZx4rtWTNrxlQvhMC/1+W435X0WWgyyW
 S9HeEH+PcY8cbfwQ/IlP9ZDv3d85nLAmLdf1dtOfMemT5CLIMm+Yz6v9/KWHWuvljQvP
 nwRo47Yu+pfLiU6a2i6pEpZuoqwd2C/NBpUwXDmeAw5T50UQ8ywvPGbnh4XzuAMz5VuU
 J5mQZgJzGCdoQ/V4vss1v9Z5IRX296CqWaxJ+i2v35kIOSZMpzwNHZODTO2z80F3ajHr
 4jhvjo2GzxFVIt5rQEAWG8GtJa8zmpqn+d1qcZxE5KeEY1nrg42GkfDx/e3aVhBP9Gl4
 GLQg==
X-Gm-Message-State: AOAM532bVMJrJLVXs7r4cmdNV4ajsrszxP512e2BN4GJFd8gJcKLGVNX
 +MJXOzIMMMIMekX/XPsuBz+TLuiNSak=
X-Google-Smtp-Source: ABdhPJzO5LmlKKA1b0qQ1WyyCStMxJjLgs0dnsnqBBF2xkEk6pU8U3cQqekk4oQWlGmUgJ3vpvwo2A==
X-Received: by 2002:a5d:43c9:0:b0:1f0:5f6a:30a0 with SMTP id
 v9-20020a5d43c9000000b001f05f6a30a0mr2898171wrr.274.1646501993261; 
 Sat, 05 Mar 2022 09:39:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b00386bb6e9c50sm14412846wms.45.2022.03.05.09.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 09:39:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Mar 2022 18:39:13 +0100
Message-Id: <20220305173913.229445-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.7
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

This release relaxes the fix to CVE-2022-25236 (introduced with release
2.4.5) which some of you have been waiting for, due to related
incompatibilities.

https://blog.hartwork.org/posts/expat-2-4-7-released
https://github.com/libexpat/libexpat/blob/R_2_4_7/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 0d9f60931f..26f1098b7a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.6/
-md5  22a30c888752fdda9f8dd1b7281c54b0  expat-2.4.6.tar.xz
-sha1  26e223c4795c242814b0e3299a5027c22b9dc733  expat-2.4.6.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.7/
+md5  75a1f475e30281a00cb6f083ea481159  expat-2.4.7.tar.xz
+sha1  032ceaa11cd791d4bc622bbf0d835b8766207796  expat-2.4.7.tar.xz
 
 # Locally calculated
-sha256  de55794b7a9bc214852fdc075beaaecd854efe1361597e6268ee87946951289b  expat-2.4.6.tar.xz
+sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.7.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index c481b5c225..b29b0e1d26 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.6
+EXPAT_VERSION = 2.4.7
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
