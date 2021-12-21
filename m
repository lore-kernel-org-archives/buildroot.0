Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EFE4090C;
	Tue, 21 Dec 2021 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzqxpFlAzc1R; Tue, 21 Dec 2021 12:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA1740923;
	Tue, 21 Dec 2021 12:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB5E1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF5660ECB
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vs57dfGhykCZ for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 12:57:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3C6160AFF
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 12:57:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v7so19449508wrv.12
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVwWo10Fp5mPu463RO0qDXnWArTWRizuPswKSEQ01ro=;
 b=bDZlsAdhqA4hqumL4uLQzF+2sgJDNN1AhM9/dk8zNFNysuvZRTBrkBfXNVVuQ8pz8w
 n37K1Nulgk0e7NcJXFkyj/n6RKBXc5XVQ0VsD61zyg9ZO0egfQmPl4XzYI83NG6c4CXz
 zrsvDzgXGpbtW0CC30qGF7t551EGjbu961jml84nAmVaC9uYTebvpz69yaK7XGr76Ugr
 94NAwC7RBuHR/xYI24vGPRT9mDFL1P07wWrcQhStZXgx0t0d0EI/0xoJbeQiZDNHPLqh
 nOYAL040nNsPmymlZJW0KRALUbaiL2d3rSZcA7zU6WB2x5bdUQF/G20JeT+3NCxf0n9+
 bzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVwWo10Fp5mPu463RO0qDXnWArTWRizuPswKSEQ01ro=;
 b=1JWJx0qIFcFai/EaEs7utDQWofAx3gHVSsJuo8Fw84zhhnN/52NWS5i7Wz+9JkxrCw
 d8vb4zrMsh3gw8OVVLlin0228bHYFaKE90/ZVGIyk+gltMbUSG4wawUx1IiHaysf2BtC
 A1DIEXW9+ioLwDxtU/Q9Ef3JqCJ6/LcqhRyuISLVb1bick+3H6BDo2klEga68HksRvUO
 l3n+1EYNdusAG7qDPlxYQABAAb2AFQJOT91MkDPcB2AOhJJhfpH7e+FvTA5Cqnddwnv8
 1jJiWBcD0Z/Lji5dQnzbMGQibOdcaSTgr1pnrLlfSqtQLY/8EdIz4D0xdOQzdLK+E9Oi
 exdQ==
X-Gm-Message-State: AOAM531vteB94egb+0pGrFj/BD90EEBlZVw+8og/Kt5/YOBdqbP0zIgA
 mhmHvcQkPyQ0Oe8+QIPpzG7HNuPIGkvKKw==
X-Google-Smtp-Source: ABdhPJz+Yzz3OBI4HkSI2lLLHTmVy+lJCE6u1UsV+hgT0Ne+vTkIZyoZJLR7TjMNvKU92WvZHKmhxw==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr2511775wrr.465.1640091468915; 
 Tue, 21 Dec 2021 04:57:48 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id k19sm2265568wmo.29.2021.12.21.04.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:57:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 13:57:10 +0100
Message-Id: <20211221125710.28506-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/gupnp: bump to version 1.4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.4.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 9eb1eb467b..1825298f24 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.1.sha256sum:
-sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.3.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.1.sha256sum:
+sha256  899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c  gupnp-1.4.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 7ee67d3382..02d9b289e0 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.3
+GUPNP_VERSION_MAJOR = 1.4
 GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
