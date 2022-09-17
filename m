Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087ACC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76A2813F8;
	Sat, 17 Sep 2022 20:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76A2813F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4kTQmaTH1Mk; Sat, 17 Sep 2022 20:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9B2843B9;
	Sat, 17 Sep 2022 20:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9B2843B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226DC1BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22EF4011F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22EF4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i35fhwQsQTox for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:38:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E622B40119
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E622B40119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:38:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso1866806wms.5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=joLjFW6WhTQjQAVbRJnM2XcWsLhwJUmPT4FtDmcyCRE=;
 b=n44O39zV2chNyK1eVo5Y8q+jXogshzuoBIJg8kdeABRrjyboncZJ6MexmjD+jW1zkN
 3L6OGxitQ5MolEe90emu9zoGdVpCz7BzdlWMyVabSNTT151Gm0z5TjgykwNw7ZICu9zE
 5t00QPK6wW9hU2mBwgSvmohGPWp7nDHLp0sIZcjuE9hROJski0z3llZJ50jImS2qOq9U
 tLhmbL31J+xxoYhz1Ww9sE887T08Uh57fIQ/eulVphY1JfUHDJVUVRHcbilqAlp2EtxC
 3ODtrNDxw09Fy5ekwflPtWj3BhOciotTObfZdbYH9HP+pIZMweJS2i+axWNrk0iLR6+y
 K9dA==
X-Gm-Message-State: ACgBeo3pr/ypgvttmi93YV9dXX1NAruJOUda9iMdVLYTsCYr65mGOfVV
 9QREmCOuafykoF1dEa3Pw+TDq96xyts=
X-Google-Smtp-Source: AA6agR7WRC44VloAf+TMApXqCzhcK7uddZ6vBKdlpp9mf8Z2GrDJhCX2rG8iZTT0/9U2+AgHtm9qgA==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr14481583wmn.79.1663447098635; 
 Sat, 17 Sep 2022 13:38:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bv24-20020a0560001f1800b0021eed2414c9sm8883689wrb.40.2022.09.17.13.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 13:38:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:38:16 +0200
Message-Id: <20220917203816.213152-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=joLjFW6WhTQjQAVbRJnM2XcWsLhwJUmPT4FtDmcyCRE=;
 b=EyCLoGa+Xr7kkqa+gnNH6SwSitejUz5yGY+qYFY2IdB+EysaeUyroM2BvI/05+iMim
 GWoDjTRrOm72XSpLv48TLS2pS8vdDhcTsoQFkm7p423cU2gc+3R1oTAtNQqZiCRkKFvk
 nnNk8Xi0nKZDvaxZ6RWqeldhzQN5PF7V/g8NPMA/VLlv+2EBuoApj/kmce3OAeX+shgq
 6Ep4wXaM/cyy0dqzEE3Xs2vmWYtfc/gseYEj0axxVG3IE2so190QXHuLIEhjFMUZ/1ne
 VmNU4aBmULn6N6SaA9S2htZQabBwi9VoulwcmVYuekYtZV6Y/IDbSJxNVeGWIBTIAP8l
 8+kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EyCLoGa+
Subject: [Buildroot] [PATCH 1/1] package/dracut: bump to version 057
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kernel tarball is not provided anymore:
https://github.com/dracutdevs/dracut/issues/1850

https://github.com/dracutdevs/dracut/blob/057/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 3cda736856..34db6af23b 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4baa08206cceeb124dbf1075a0daf774b5a8f144ce2e01d82a144af3020fd65b  dracut-055.tar.xz
+sha256  24f149d683d188c0d25756529b7d1e5cd6be8028e0c1043110f303d0d706757d  dracut-057.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 2b6a144aac..742a073a36 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 055
-DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
-DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut
+DRACUT_VERSION = 057
+DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
