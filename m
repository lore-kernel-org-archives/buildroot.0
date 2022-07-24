Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18F78332A;
	Sun, 24 Jul 2022 09:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B18F78332A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSEC_y3AQzMN; Sun, 24 Jul 2022 09:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B077B832DC;
	Sun, 24 Jul 2022 09:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B077B832DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B483E1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 892EC4174A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892EC4174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPbAptlOWtZ6 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:37:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCDC416E8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CCDC416E8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:37:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7598271wmb.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdJ26L/K4RpY59IYfpsvc+dCfxLMh21AVQrDv+gyCBw=;
 b=LRe0MyJDb5Kdk9C5G+Q7HkJjwfMuKyYhb30jajk1kh+Dc4ipH8kBY2pzVD8BEbbmIM
 COIaPT83HO1+awe9hxR3mqGlIvoALZK3uKNhL3xLqR8z9YlMRhSJIVjd62okXj5GVXRo
 /CvFZuVIyK4PzAF9IQ7vkz+boliiqte34QtQ87ZnphVN37835slxriMFwaoodcYtchgG
 glatDbvAMZ8AYeJDaoFq+IrYNgjVXdV/kVZzGsCUyTJ0SlSRamxU2nN4RQ2771c8VO7z
 4B0aJ16L5HhrQuCI6FKP2HQAz+kBV/ISH4hK2YuAKaeP15E0EUKWQaIQsGoxnFs2MscW
 mY1A==
X-Gm-Message-State: AJIora+dB3Q+nc2vf5DpWvzf9ZHm09HVs6C6btB3JY9eA6fA24m1fmaD
 OUtinXB4VBDBc+zkmkuvQKQokg8QEf8=
X-Google-Smtp-Source: AGRyM1tBY1wcRHYJFvHB6diYD/JJxrgXHUQ3nlFFiVA8sTXBpfe040/rflbPcsRU/wcjh2CryP3oBg==
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id
 l7-20020a05600c4f0700b003a322777064mr5008627wmq.181.1658655463031; 
 Sun, 24 Jul 2022 02:37:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k66-20020a1ca145000000b003a2fdde48d1sm10440666wme.25.2022.07.24.02.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 02:37:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:37:39 +0200
Message-Id: <20220724093739.93406-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdJ26L/K4RpY59IYfpsvc+dCfxLMh21AVQrDv+gyCBw=;
 b=VBLPS3mIUquDQBACo0MA4wFizEMqpZ3jIdUFQgTBIOuWZ0wScZBJ1be2Dc0tJPgSCz
 R+yntTzTSD7W38tKDv0Tdyd/1H9PYnZb0vp+c2FrYIkRea22uGMW0m1XzrBcA5bVgxme
 OGZibKLxJP59CT34HwA6IizZpWn2fzvVm00XQd4WEcIwlJY1I7Dxs9KzZZgarL9M6smE
 e/u2VNZeIkGGpmFOWoK+fM3/NpX77IHctqYTX1Y1tFTvMk/pLvvosfcHnjVn2Yp2C94r
 KLtQiIZpLvZbeNFv3FRXCtlHn1fE3A9hVbL4GQOAGpbl87xiA9N4XN9BrUdCkzL1khGY
 vCtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VBLPS3mI
Subject: [Buildroot] [PATCH 1/1] package/libvdpau: bump to version 1.5
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
Cc: Damien Lanson <damien@kal-host.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/vdpau/libvdpau/-/tags/1.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvdpau/libvdpau.hash | 2 +-
 package/libvdpau/libvdpau.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 653657322a..ac974902d0 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4258824c5a4555ef31de0a7d82b3caf19e75a16a13949f1edafc5f6fb2d33f30  libvdpau-1.4.tar.bz2
+sha256  a5d50a42b8c288febc07151ab643ac8de06a18446965c7241f89b4e810821913  libvdpau-1.5.tar.bz2
 # Locally computed
 sha256  ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index ae2f388855..67ffdf17c1 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.4
+LIBVDPAU_VERSION = 1.5
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
 LIBVDPAU_SITE = \
 	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
