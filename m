Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A9DC433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C3640147;
	Fri, 21 Oct 2022 22:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C3640147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItXjI5qCAvRi; Fri, 21 Oct 2022 22:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B31409BC;
	Fri, 21 Oct 2022 22:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B31409BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9571BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE17683A47
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE17683A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn_vqQoCm69B for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25AA83478
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25AA83478
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:44:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so3053994wmb.0
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KBd5nUFhgdH5dpUzAg5IMTlrsTaf9hz2HP5w6d0px2w=;
 b=u7AvsZ470eipFx9ceELqLRVTCnIHiGdPFrnjzWia2qaHKMbIe3qhEZ6pCgfqrdC26r
 tsZDm9lz5ZxmoU9y2Jxe/yAfKzJ/PjVHxorZg1bA0TSb607ZxLg8tN9VgwHTQc6lAor3
 ubzghUpsfj8wLDUY/HufvsUB5OZtzB+kR0ybUh0WPnA7KOfyv9rXUMaUuph/16ujdtO7
 4tt6JxXClVhBMQS8k4R4oh9EVN/r3zpSRabrhs7BIO3BDsHh5+/me7JQ5Y3XR2aayfLt
 Hn9CLcS4yeYa4LauE6fljygfT7achyA1Ka+G7dRsBancA6kuFepl448ymkdd650F+lRN
 /Q6A==
X-Gm-Message-State: ACrzQf1QcOHj4GvJjkLTklm2Frm0hhVKvMv/e5TEWY4JWBs8TqymFnjL
 WFpZb2PIVDuutHib+OjR2eWMH7FjUS0=
X-Google-Smtp-Source: AMsMyM6DJkPbX8QXh9mUVNLEewyl4ex/A5h9NRb/nC+Nsb0zqVu3nPpeMGBn+e5QZMu1YN0K5O/5+A==
X-Received: by 2002:a05:600c:88a:b0:3c5:c9e3:15cc with SMTP id
 l10-20020a05600c088a00b003c5c9e315ccmr14716943wmp.67.1666392242349; 
 Fri, 21 Oct 2022 15:44:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 iv13-20020a05600c548d00b003b4fdbb6319sm844251wmb.21.2022.10.21.15.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:44:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:43:57 +0200
Message-Id: <20221021224357.129675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KBd5nUFhgdH5dpUzAg5IMTlrsTaf9hz2HP5w6d0px2w=;
 b=gzboTTHxS9YSWIeqdUwbC96NobG6qO6D/Z7z1hJxGU+heERUe5YPi1Cys9fwrUX1SK
 e7jcJK6eJpcn1uEEW3sWLlS8+v/PJWqB09QaSBzN1+Ubrqn/ouSZz3HXN8mvjrOKj0pR
 4bRdQ9ogfJUowUhmqxYsS8SYJIGGJSbsNcZEO7gHaV4eVuNzwgGjZE8CfcZpB2oUAP1o
 X4Zr0NfevMMeMWowzVYhfG8SXXnXPIqYuph+HRxBTYrhKDFNuFTl8yjGaKAslvX1YElF
 v/Sr46nnCLEExO4qJI6S90y2pTWrvktYEPHi001NtA+yvbmQEkHQq6xRtvze/UT76Eja
 Ufdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gzboTTHx
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bump to version 0.17
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://lists.x.org/archives/xorg-announce/2022-October/003226.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-pciaccess.pc.in-add-Libs.Private.patch | 28 -------------------
 package/libpciaccess/libpciaccess.hash        |  7 ++---
 package/libpciaccess/libpciaccess.mk          |  4 +--
 3 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch

diff --git a/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch b/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
deleted file mode 100644
index e520dd03d8..0000000000
--- a/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e1f9fc0a11559c1200005c4bfe34cd217ec117b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Oct 2019 19:03:32 +0200
-Subject: [PATCH] pciaccess.pc.in: add Libs.Private
-
-Add Libs.Private in pciaccess.pc.in so applications that wants to link
-statically with pciaccess will know that they have to link with its
-dependencies such as -lz
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/xorg/lib/libpciaccess/merge_requests/10]
----
- pciaccess.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pciaccess.pc.in b/pciaccess.pc.in
-index 706c5f7..c2da3d9 100644
---- a/pciaccess.pc.in
-+++ b/pciaccess.pc.in
-@@ -8,3 +8,4 @@ Description: Library providing generic access to the PCI bus and devices.
- Version: @PACKAGE_VERSION@
- Cflags: -I${includedir}
- Libs: -L${libdir} -lpciaccess
-+Libs.Private: @PCIACCESS_LIBS@
--- 
-2.23.0
-
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 2082be7d04..27ec59a452 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,7 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003014.html
-md5  b34e2cbdd6aa8f9cc3fa613fd401a6d6  libpciaccess-0.16.tar.bz2
-sha1  ffaa13f2df5f822da1089b55223b217c142ef919  libpciaccess-0.16.tar.bz2
-sha256  214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489  libpciaccess-0.16.tar.bz2
-sha512  2f250048a270dfc0823d4bdd613aa272c58a80eaafd922850f56c4b6f7a45a263ed4cf521b52b49f04484ea44ebefb7407d079aa058318a5751ffb181e38fed1  libpciaccess-0.16.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003226.html
+sha512  8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47  libpciaccess-0.17.tar.xz
 # Hash for license file:
 sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index d9a3a4e481..68d46b7f50 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.16
-LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
+LIBPCIACCESS_VERSION = 0.17
+LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
 LIBPCIACCESS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
