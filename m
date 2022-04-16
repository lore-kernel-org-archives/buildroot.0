Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AD2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF9960AD4;
	Sat, 16 Apr 2022 15:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brhjsx5fiRyA; Sat, 16 Apr 2022 15:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5822C60AC4;
	Sat, 16 Apr 2022 15:08:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACBFD1BF57F
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 15:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 996E9417CB
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIh5zqhUgRj7 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 15:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77DCB417CA
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 15:08:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i20so13720372wrb.13
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4dgqM1iuk11vhJBFFrTavqvjcHB+QYLYTUWT38elZgE=;
 b=ovj7FqMX9T1Hhk/DyH/LwPu43iyEr9Qy7gHJgtYcP0D0tmCzciFIpgkfBwMFJgmKSK
 M4MR2aiH8vhzEY0eTAEpij7r58+BeIKWUn0n4DtutUfv7gJbRCcu2vadvnMfDMtXSamk
 /azfMdrxYn5q2/hQmvY2Pj/lvSF7NC8Ytjuck8DEYyRvpPEzIKeF0UtWlz4Lv5KU1iJI
 Oi+nLaevbDh8wSBnuMIMqT6Flbl4RyyLZ86SQVlMYfaZkdo/UbuyAs9mwUnI1nEGkQQ3
 wo/4/fzjnRTqApSfncFQ3zwoT3sKqkTx10DWFzIaqfRJSjdKguU0y4ukd21KB3bA99sY
 Ebxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4dgqM1iuk11vhJBFFrTavqvjcHB+QYLYTUWT38elZgE=;
 b=zBftGySPsEasW3ErVwyvefzW77yGvHqtJH1TKlN1Y5Cngrz+8qU6gqUpu4T67cNFkd
 LGTSo0lM78nTHilUuHQJt4LjYABN8jTOUXiMACWcqVW3pLkF/kv58h8WV5cG7aaCX6nL
 NZ0nGJcIPay9h62Y84s0X7Jwxi/cmpP7/HJz8HRjVSkRsi1OZdTX/0dTlDbCcTGJz/YH
 GfBQQCAy+GR/uZRGtgzsfZ9pqg6vLe+PoKTjOmaSAvSiSOBedeGEIziFsauWz+/tw9ZW
 A7Pi2yYLN7Q854PHlkRnL5hyOE+s0JbK5mOpRil6kqJ60c8/K/UWeevfbwpd8DwkyPAt
 caRw==
X-Gm-Message-State: AOAM531dlyvmI1G/sO9qJUu8SG1jjgmTTf2gRYORNqgrfhKQc4UftYr7
 mCHleU/e4E3CW+i4IawgHK6pRZLeZXI=
X-Google-Smtp-Source: ABdhPJxbB8rzxYkgRadFM7wndyweBNZmX93WrJnNDf7Vvq470RsL7n9Bs+jVKI9KrYfiJaz5tPl34g==
X-Received: by 2002:a5d:4143:0:b0:207:a9c0:d142 with SMTP id
 c3-20020a5d4143000000b00207a9c0d142mr2780690wrq.510.1650121679330; 
 Sat, 16 Apr 2022 08:07:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6b82000000b0020a7e34ef20sm3672297wrx.47.2022.04.16.08.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 08:07:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 17:06:04 +0200
Message-Id: <20220416150604.1965916-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: bump to version 2.14
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure on or1k and microblazeel:

In file included from handler.c:20:
handler-unix.c: In function 'sigsegv_handler':
handler-unix.c:194:28: error: 'struct vma_struct' has no member named 'is_near_this'
  194 |                       : vma.is_near_this (addr, &vma))
      |                            ^

https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=NEWS;h=4d012f8b6cd9b2c1eccbf266a10aae56b0e79978;hb=9ad117adabd223b79e037575e071855c2b8b35c0
https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=ChangeLog;h=c52b227aae190ba9b161282efaa5f33cb4a127f9;hb=9ad117adabd223b79e037575e071855c2b8b35c0

Fixes:
 - http://autobuild.buildroot.org/results/c693fafb8f1f68be30a281313fb1f0890cc08b1e
 - http://autobuild.buildroot.org/results/ecde11129d102e3321b2aaef407697c29311c705

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigsegv/libsigsegv.hash | 4 ++--
 package/libsigsegv/libsigsegv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index c827e6b866..13978da398 100644
--- a/package/libsigsegv/libsigsegv.hash
+++ b/package/libsigsegv/libsigsegv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz.sig
-sha256  be78ee4176b05f7c75ff03298d84874db90f4b6c9d5503f0da1226b3a3c48119  libsigsegv-2.13.tar.gz
+# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.14.tar.gz.sig
+sha256  cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295  libsigsegv-2.14.tar.gz
 # Locally calculated
 sha256  8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde  COPYING
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 87a5d7a124..98bcd55c8c 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGSEGV_VERSION = 2.13
+LIBSIGSEGV_VERSION = 2.14
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
