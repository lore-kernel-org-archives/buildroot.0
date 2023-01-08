Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C0C54EBE
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89E140169;
	Sun,  8 Jan 2023 19:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89E140169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvGuWI7BOWn1; Sun,  8 Jan 2023 19:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23F6240120;
	Sun,  8 Jan 2023 19:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F6240120
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63D451BF577
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A36760ABF
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A36760ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6I7LgCrHj89 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 19:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE3260A9D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EE3260A9D
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 19:15:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o15so4794119wmr.4
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 11:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n86cW8cMKikt5dTlV9Zfhkuh24mhnRN6ZV1qeEcmRpI=;
 b=laVXgJBlqUxrQuWx7c0l9mr9LEjl3JSee5d/gPT5CMdzCKhs+JzaWbMxc5+5qpgxeV
 svR/th5/Ae9QAr98nHw8nG3vw7ZKltQ8N++pp6W7VqsAVDkl4yi3xhz2AJBvBDZQXC9M
 EzbADbpUQDOOhFJq092cDeMyHm/ZtzvYUGg3oBOC70j5Ecg7qPaUt+NbmjySp0Dhr56n
 uxvjxB7eckB1LfYoNkwqnjvJYwi7oQ0cAdjBx+BSE6q3/YU/DCikbqKI95BA36oD/x6o
 pK6ZW+W1YVKbsMe9+feVa2DXw87smr59xTVQUpSwsNFR2saSwjzcM8kDlhixuSk0afNK
 WrlA==
X-Gm-Message-State: AFqh2kp1m2mD3GTZb/zrk8ph4te5IPCGFgD/Sx56jCJDCiRfBC1gL1Iv
 cQWFY+Awm8y8GFSl7qAIANpOAYMiEKY=
X-Google-Smtp-Source: AMrXdXvKB5VxlbPtPxhldKeBS1AP4Wl+0PmTlOXvK/HVJTtjOfAGUaD3rYM1T5feb9K3gFTtjdTOcQ==
X-Received: by 2002:a05:600c:18a3:b0:3d1:fcac:3c95 with SMTP id
 x35-20020a05600c18a300b003d1fcac3c95mr44953336wmp.34.1673205318753; 
 Sun, 08 Jan 2023 11:15:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003b492753826sm8497238wme.43.2023.01.08.11.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 11:15:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:15:14 +0100
Message-Id: <20230108191514.10360-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n86cW8cMKikt5dTlV9Zfhkuh24mhnRN6ZV1qeEcmRpI=;
 b=Jx/k4ZcFMX4pa8JvXMkJpTq3WsJHKHS53vg9il9uPbe77E1c8sTNEQcxQtQx0Y78DQ
 x1JjkETXzgrhh88s161s5sEYMEBliR2vUOR0Gou0CG0dL2qYeKOX6bC+L3WI3IUrEZDm
 UE5ko+Ib73c2bH+5ChvX7q1OHKET5WNVQlyoRKuArRpdB/aw60ORmlU60pn2t842KPAr
 SgSArlW+2P/gyG6diAH/2JJmdwyguSU/11mVCzxjhcHjfpqt4OY9P7s/yi4iPcFlAQ7Y
 FAwJcrDnI75tESCr0XynGeUsTTlCwwQzS/QV71WKlorlzYHxbeYV1hQhucLwx1zqu9mc
 sPqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Jx/k4ZcF
Subject: [Buildroot] [PATCH 1/1] package/crun: needs gcc >= 4.9
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

crun unconditionally uses atomic_bool when libgcrypt is found since
version 1.7.1 and
https://github.com/containers/crun/commit/40f66c0a74b8d918ecc7ae9228dca32a4fd71084
resulting in the following build failure with gcc 4.8 since commit
6987b92da510a8c8b9534a22506850c163d0f035:

src/libcrun/seccomp.c: In function 'calculate_seccomp_checksum':
src/libcrun/seccomp.c:374:3: error: unknown type name 'atomic_bool'
   static atomic_bool initialized = false;
   ^

Fixes:
 - http://autobuild.buildroot.org/results/924806ffd6d83cd6d8226577c3877b0b8ca2722d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index fa0894e126..45c86f0655 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_CRUN
 
 	  https://github.com/containers/crun
 
-comment "crun needs a glibc or musl toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+comment "crun needs a glibc or musl toolchain, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
