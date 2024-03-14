Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE950C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98408400FF;
	Thu, 14 Mar 2024 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivHAJBC7Z5ny; Thu, 14 Mar 2024 21:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912CB402D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912CB402D7;
	Thu, 14 Mar 2024 21:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB251BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7B9606A3
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQBugt0f8H8Q for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82C7B605F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C7B605F6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82C7B605F6
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:51:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-413f2366ef5so7222065e9.3
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 14:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710453115; x=1711057915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F95iovcH+h4r0hjb2dph6ZTTxEecRX3sX1eCtdXu4h4=;
 b=Zi2Bv3iU4N2rtVT0LDNePx9nDBrpndnQMqYgGV9H1VchYo/2ic/7Inp4DETZ7wV7z3
 PXpKOCa7ik8gRSTGs58fWyX1/mouvVO7AMe0vjhDRD0plPioZp1qJd/ItBE/VtsYkYqt
 Czw2kMWp1lxfOWBT3B7rFatjq/HzTr/rA3cWlcuIwiOx4qUeG2ulMycW2ZMawupM/LDP
 QmuZLiuyTDHBV9XHIcbCiG6ZvPW4A8eR9pblya3Z9WhhCOdYoSXfQr8Sy6hpRQSTfBvM
 srpPyeSHbMFmPNvi6IOVj/Y80a4fMOa3vhbaaw19PhGiyPKZB4PyKU3D6A2ZF/KHR8Eo
 vC7w==
X-Gm-Message-State: AOJu0Yx8LTcYlT0e8UNH16WIlP8XrctT2VgV8iVbX2SWJ4q40F1C1xEu
 lImnNrz/vaY+AlGnsplD5KEIsRRJUGWwIfHJXUr5fZCimpDkkXoecIjUMNWR
X-Google-Smtp-Source: AGHT+IEWwM9xR6ym0fvhG9cP/Gn00z9sVcvnu3y0G8cAycD78eta82XI3KjyQXRihuRX9lHLOJkVqg==
X-Received: by 2002:a05:600c:a007:b0:413:f5d1:b278 with SMTP id
 jg7-20020a05600ca00700b00413f5d1b278mr1832389wmb.33.1710453114614; 
 Thu, 14 Mar 2024 14:51:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 je20-20020a05600c1f9400b00413e6af1bd5sm3510762wmb.47.2024.03.14.14.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 14:51:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:51:52 +0100
Message-ID: <20240314215152.428462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710453115; x=1711057915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F95iovcH+h4r0hjb2dph6ZTTxEecRX3sX1eCtdXu4h4=;
 b=E9wgtlnlpez61n0Jp73nc8/1H5ko8/6hynjXYXov8Y+I+FPmNNE+qeUq8Sxpc3VUZQ
 J5tN6VUZTHp9JobAOE58ersMnvDUNad5Yx0SNyS82Ws+wYzhzysXwkonViGRDgxTQlA4
 HWM7NiQZV7ax5bkNsL71tHkIaHcDoXPM+IJWzCmNUtm7DTaMadiQV5sMtDwM05XG9Zjb
 ERvWmJWA8RR0q9a+xof9zcpHDi69n4LQJR+uCJC27lsKaLbafj0jN4Gt5tNv5hJRl30P
 3SoLZ2HM/0fgZQKXKL7vY6ymZit0xdJj4Gq66BgpQyp04cyY8S96pcOVHfSKQtxJmV6B
 2wLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E9wgtlnl
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bump to version 0.18
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of COPYING (update in year with:
  https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/cde74b51014053175497ac75cbaea10d6184ab57)
- Switch to meson-package

https://lists.x.org/archives/xorg-announce/2024-February/003453.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpciaccess/libpciaccess.hash | 6 +++---
 package/libpciaccess/libpciaccess.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 27ec59a452..4662314509 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003226.html
-sha512  8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47  libpciaccess-0.17.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003453.html
+sha512  54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd  libpciaccess-0.18.tar.xz
 # Hash for license file:
-sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
+sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 525a3bcd02..04f3e2083b 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.17
+LIBPCIACCESS_VERSION = 0.18
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
@@ -13,10 +13,10 @@ LIBPCIACCESS_INSTALL_STAGING = YES
 LIBPCIACCESS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBPCIACCESS_CONF_OPTS += --with-zlib
+LIBPCIACCESS_CONF_OPTS += -Dzlib=enabled
 LIBPCIACCESS_DEPENDENCIES += zlib
 else
-LIBPCIACCESS_CONF_OPTS += --without-zlib
+LIBPCIACCESS_CONF_OPTS += -Dzlib=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
