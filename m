Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE992C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30DC560AD2;
	Wed, 19 Oct 2022 21:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30DC560AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0958lhQxED5d; Wed, 19 Oct 2022 21:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED6260ADC;
	Wed, 19 Oct 2022 21:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED6260ADC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15CA41BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE94783F14
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE94783F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8D6pe8NPvZuP for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE5383F12
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DE5383F12
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:52:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so919298wmq.4
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ShvinL7zdDvjhGIBkk0V4llDJQ6i6gMrGm7hPfQXncA=;
 b=h5dgVzX2p6XUNX9ATExgx0t8gYgI5Q1AHZPKubvvkkwhAoFuVe3hOoM1gk1PaNFv5N
 O6GBZAUENKLVX85pIrISngBOTXP1B2/rgKC1rMp+2FGnvnP6Du79fxAqTk+2a1k/vDOm
 ypNAdC7MtwCtRjKjArcEpi9inj7zR5i2UgC2sXUn5EYwy8YmL9crsDIiQSAPeUfNu032
 bJ+t8IavU9UEnWKdVdUT9Vwbp4QcUH2nZg4kWdxf7vt7bth7jqLdIktO/YS4FbjWllce
 cAkkiLYNV3/6FT5gFnwIDBTeTTdJ9G1OFb1XsN2rEWb9TBk+SwnD7v8ggZ4aVvH/AzGj
 ayDg==
X-Gm-Message-State: ACrzQf1eMmbObdfyAEPOJNMOWUdO41lfa5YJmTgYA0wFZNilrVbrek1T
 lBSOGtVQExTAJMIJtPwLhQsdJ0EeYiU=
X-Google-Smtp-Source: AMsMyM4HXnavQnXhznAT7oHYI/mvfjhSK2cAU7mNwNzz1Thv8SnAZJwPSELFB/NPz0iU0uHDXG2xfw==
X-Received: by 2002:a05:600c:1d9c:b0:3c6:e471:73d1 with SMTP id
 p28-20020a05600c1d9c00b003c6e47173d1mr20613585wms.126.1666216324909; 
 Wed, 19 Oct 2022 14:52:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c028500b003c64c186206sm997237wmk.16.2022.10.19.14.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:52:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 23:52:01 +0200
Message-Id: <20221019215201.21248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ShvinL7zdDvjhGIBkk0V4llDJQ6i6gMrGm7hPfQXncA=;
 b=NoLGeQ3bQxiuyfK0Hq61UruKoxGnwTqoxyEfm5ci/2/zlBt2vZklG7n+XfCEB9hJQz
 DlKyx/TxH98KY0JInraDvXoMhOvYwX8DB3uJ6OmHYiudPed9JA3mQVUron/8bV/8ei6S
 XO0YyoFTBtCGdYR8rf2fdT3A8WGiQ30Z/i9U8qplhePwTPzfPSWkAYzHCmHI7CX3d8lF
 7WQeWtwz2kkgL9g62XIwnfwePoVCg6wRGmOxQOe2MsL06KOehXovNfQSbCSGMhGuTImQ
 BvN7ZKwPJIIEr8MQne1owONGElgv08PZc6aT43nvyfPdKZnH6mcsI4EqNGSFh64/izsM
 OB/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NoLGeQ3b
Subject: [Buildroot] [PATCH 1/1] package/acpid: bump to version 2.0.34
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

Drop second patch (source code was merged with
https://sourceforge.net/p/acpid2/code/ci/d0a058548d66fca8ae69438cd73ba8b00b6315b3
and moved with
https://sourceforge.net/p/acpid2/code/ci/5ec0bfe959b5e04f2af814b7377c34635fd86f6d)

https://sourceforge.net/p/acpid2/code/ci/2.0.34/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acpid/0002-add-missing-defines.patch | 40 --------------------
 package/acpid/acpid.hash                     |  6 +--
 package/acpid/acpid.mk                       |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 package/acpid/0002-add-missing-defines.patch

diff --git a/package/acpid/0002-add-missing-defines.patch b/package/acpid/0002-add-missing-defines.patch
deleted file mode 100644
index a85315911f..0000000000
--- a/package/acpid/0002-add-missing-defines.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Add missing MSG_CMSG_CLOEXEC
-
-Unpatched uClibc toolchains, even using the latest 0.9.33.2, do not
-have the MSG_CMSG_CLOEXEC definition. Even though the Buildroot
-internal toolchain backend has a uClibc patch to provide it, it
-doesn't apply to external toolchains. This patch provides the
-definition of MSG_CMSG_CLOEXEC.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libnetlink.h
-===================================================================
---- a/libnetlink.h
-+++ b/libnetlink.h
-@@ -7,6 +7,10 @@
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- 
-+#ifndef MSG_CMSG_CLOEXEC
-+#define MSG_CMSG_CLOEXEC 0x40000000
-+#endif
-+
- struct rtnl_handle
- {
- 	int			fd;
-Index: b/kacpimon/libnetlink.h
-===================================================================
---- a/kacpimon/libnetlink.h
-+++ b/kacpimon/libnetlink.h
-@@ -7,6 +7,10 @@
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- 
-+#ifndef MSG_CMSG_CLOEXEC
-+#define MSG_CMSG_CLOEXEC 0x40000000
-+#endif
-+
- struct rtnl_handle
- {
- 	int			fd;
diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index d5e5bcc14b..8da0101264 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5  b2f2ca633b30ae893c47981fa4d3b258  acpid-2.0.33.tar.xz
-sha1  b3e06c3f2213db8ee1a9024cf372fb30e2fab637  acpid-2.0.33.tar.xz
+md5  988c2e3fd5ba0ea4492d3ba7273af295  acpid-2.0.34.tar.xz
+sha1  9322112027e4aa5a8d1b97ec64ef1d150ff0f4fc  acpid-2.0.34.tar.xz
 
 # Locally computed
-sha256  0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8  acpid-2.0.33.tar.xz
+sha256  2d095c8cfcbc847caec746d62cdc8d0bff1ec1bc72ef7c674c721e04da6ab333  acpid-2.0.34.tar.xz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 5d5138baa3..4bd93068ad 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.33
+ACPID_VERSION = 2.0.34
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
