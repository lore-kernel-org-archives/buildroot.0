Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A343CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF3583F7D;
	Fri, 13 May 2022 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raEo-LdCegeQ; Fri, 13 May 2022 20:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4077C83F7A;
	Fri, 13 May 2022 20:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC7001BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA45040160
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2DRj1bdcig4 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5419400EA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:44:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so5331446wme.3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IrLPIXdc0lM83K0fV75jWtMppc3AZZXcZBV8twCXwX4=;
 b=IkNpng7bKvZyoRQ8xHFOdU/S2GF4Hc6mQ9eEBmVxddinI68Ot8Rcx+S0G+ipqMWRak
 lEOmPhUT7LHYnoyL9lsW89+WKFH2ISEZcqXop2+yu4PkHbrH+KfVqonDY68zrV4YqtZt
 mNAr4/gK0PWClAosqmBj5KPV+4LAfRmu/H/ElRc7YWa5c3mtvNPf4b/XOdo4fs1NiYsM
 hjvzg8/N3wZtXDfbK1TAM72CaYPp+vNHZ9u/0sp7c+1isYNH4yupvDb99SbIRvjeJ0/1
 /SQxnKLQ6EduMfqwXgyTjfX/RstcZyRbmAUzFf0zk19XRwXFD3fgbuL3H5t/xhjQXuVq
 sExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IrLPIXdc0lM83K0fV75jWtMppc3AZZXcZBV8twCXwX4=;
 b=rdThvzYtmgqD5jAyskj1xKmgfloqIOZqp9jvu1RouuaFsYhYQXGMEKbDOJT4cH5eRx
 gxnDGRDKgG5Ae0UbLTMewTN8+k/1Jd7rDTX6EEvL1FfIh+pO4YyCHbTGhIVjwf1l3w7L
 2mvKaL1xTURgCPwjEOKAv2knTIVV9I+gA5vMyWhse5kG94h6PdvP5/DqFLJ2IJ4eJ86t
 yQeye7feAVpBy+kU7Ht++/iy8CrCfrM/RVIF44c9tppakvqK2s45ygNZjDyviJOG5aSp
 8qn9TmV6JPXEdb9qX7M3Ru8reHW6FsU4qKFzVDUWryfTER6LNo4CAdaGyukmqQlp8Y5r
 E6fg==
X-Gm-Message-State: AOAM532RR4vQrK0lZPevKrBqjIaPOMNQbQrd2feXwDD0PRN9hYVO2q6z
 e2MKyq6BlIx2YZl+YJZF9GlnEMU3emY=
X-Google-Smtp-Source: ABdhPJxtMwrQEpv6nYa16HP4oaBi6DeZUzJYUGJCmQt1F/7UC7xty23tjppDJfSeNn6C1+1OGaIJoA==
X-Received: by 2002:a05:600c:501e:b0:394:8b0a:3ec9 with SMTP id
 n30-20020a05600c501e00b003948b0a3ec9mr6174104wmr.0.1652474685586; 
 Fri, 13 May 2022 13:44:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a7bc1c7000000b0039429bfebeasm6589406wmj.2.2022.05.13.13.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:44:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 22:42:34 +0200
Message-Id: <20220513204234.760410-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to version
 2.12.1
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security Issue:
 - Potential buffer overflow in pjsip_auth_create_digest()
   (GHSA-73f7-48m9-w662 a.k.a. CVE-2022-24754)
 - Denial-of-service in XML parsing due to an infinite loop
   (GHSA-5x45-qp78-g4p4 a.k.a. CVE-2022-24763)
 - Potential stack buffer overflow when printing SDP into a buffer
   (GHSA-f5qg-pqcg-765m a.k.a. CVE-2022-24764)
 - Potential out-of-bound read/write when parsing RTCP FB RPSI
   (GHSA-vhxv-phmx-g52q a.k.a. CVE-2022-24786)
 - Potential infinite loop when parsing WAV format file
   (GHSA-rwgw-vwxg-q799 a.k.a. CVE-2022-24792)
 - Potential heap buffer overflow when parsing DNS packets
   (GHSA-p6g5-v97c-w5q4 a.k.a. CVE-2022-24793)

https://github.com/pjsip/pjproject/releases/tag/2.12.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 74331ab6fb..b1ccdb2f37 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b3b94d9be4aba8f6d2d1cb164603e81b0a6ee17352f9e2ba5b58e325e610ca5a  pjproject-2.12.tar.gz
+sha256  d0feef6963b07934e821ba4328aecb4c36358515c1b3e507da5874555d713533  pjproject-2.12.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 32cfa8c53c..a3303d1e8a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.12
+LIBPJSIP_VERSION = 2.12.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.12.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
