Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2127AC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 07:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82E1E4040D;
	Sat, 29 Oct 2022 07:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E1E4040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtZV0alM45QT; Sat, 29 Oct 2022 07:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9C1C40297;
	Sat, 29 Oct 2022 07:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C1C40297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F46A1BF59E
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 07:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E38813B1
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 07:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E38813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOZ1R6jd2yc0 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 07:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD222813AB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD222813AB
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 07:55:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w14so9229998wru.8
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 00:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7TojRUhgpPpLrLjedhe+oRnnrKETi1Eh3aYmDa5y+A=;
 b=wdBWA4DrWSNGIOkB8R/bDSlyPyNmOTfzou77wyYN/88NWHYHkTdWDnPxiQJ1m4i/wC
 umXBcUx0j/qRMYixryPVuXqZdLFBfSIAShRwVPJaVMDTp2QtD+WwJTIW+W5A89GW/bf1
 Wz20oE07QTcH7oaDsxTVLruqegY/XBiS8SC4TMd9HtG5mFfWDm0qJjn9giNxzRLZ9GWm
 MyVnghhMabVDE86IOBgaUXU3M0HhBhlp1GUy2qlOukdWV7Qa4+Jq0ou0VOSaYZ6jKYMb
 1FhGRvFgA3IVmXrVQ3kC4zVL1g+n1anYsQMIz379wHFZwr8O8aWdkgkd9QaMY0xCjlyx
 WSpA==
X-Gm-Message-State: ACrzQf3FxFp/9TyDGNWTIhT4odjzplJZnqmtDjKwNF7P+lGUicQwxnRp
 pIDJmcq0Xv1i0ke4hNxPABlGhwXTnos=
X-Google-Smtp-Source: AMsMyM4YJK1gxx2dN5/xSaJavbFA4rWhp5qCZu0aWLsyroa8iOtYIyg4tOpw122uCDmsm+uCTP4pyQ==
X-Received: by 2002:a5d:5c13:0:b0:236:5575:a3fd with SMTP id
 cc19-20020a5d5c13000000b002365575a3fdmr1690783wrb.475.1667030114608; 
 Sat, 29 Oct 2022 00:55:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 cc6-20020a5d5c06000000b002364835caacsm791447wrb.112.2022.10.29.00.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:55:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 09:55:11 +0200
Message-Id: <20221029075511.6599-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7TojRUhgpPpLrLjedhe+oRnnrKETi1Eh3aYmDa5y+A=;
 b=JnATTpvlBmn0LlZln2ovZqVpxNKX9tgXwvxpQUIA4p/M8iKO5FSFohrz5dFhkkRCKw
 2hCrXJc+0lAeaQS3poYZqKaSsL9ZmV/ypkFavrOsi5ha1dmCav6ID3sZHYIw3NVJWO8a
 sPBTxWqa5h8rlwTIMe//OaIzZaSKd/mRr8YtxCF+Skcx5rxEcAmCpmS4OBYJj+DxTdfF
 a3teoWm+ptkwmJmihTWYcf96fS6ZVnCY+izqcjCoTu5lx6oWXXAR0FHrN7hlqK7M/+Iw
 WlNXK3ZZpt+fB9KP7hpVRsHbFflzsaqhz6dyb1B9hZHG67kd3nmabYb+xO8A2cgXeRqJ
 xRog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JnATTpvl
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump to version 2.4.7
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

https://github.com/wolkykim/qlibc/releases/tag/v2.4.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qlibc/qlibc.hash | 2 +-
 package/qlibc/qlibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
index 5cd6e1860f..9b2af1a4e3 100644
--- a/package/qlibc/qlibc.hash
+++ b/package/qlibc/qlibc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd98c19f96c0d374adb69c99627c80cf967b5e860c8a4f28c13fa1b0d652a06e  qlibc-2.4.6.tar.gz
+sha256  ddb27da8ee6f3bf558e5d1d21d3d392c8a6f12d25767c5f70f4e757d814900c9  qlibc-2.4.7.tar.gz
 sha256  7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 3996bb3706..838ba68746 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QLIBC_VERSION = 2.4.6
+QLIBC_VERSION = 2.4.7
 QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
