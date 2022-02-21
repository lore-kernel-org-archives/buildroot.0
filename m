Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB9FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B4181347;
	Mon, 21 Feb 2022 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYlA6Pzk0Rnr; Mon, 21 Feb 2022 21:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C1081335;
	Mon, 21 Feb 2022 21:39:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB22C1BF3AB
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9782C403B9
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDsu4TCqsYEy for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 21:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ABE8400D6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645479574;
 bh=qVt/dfT4PwxegbTROa6mQGzrHQ5/vRYMKzw8RDL39M8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=O5lZlIEXtD1BH6Ccq7OpuM0P64JhVjrSG7nbllUZAvGyz34nooszbt1mWUmPVPM+P
 RSvukn4ww9QiSKBNLQCZl0A0dSDZa3mBZJhmsbmqW/F4MCpOfUIECzOCW5a9a+CmTY
 riPU0buqNjcGF5XdqCTUB+Uk3qt+m5J7CHuCDeBU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.189]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQvCv-1nZGi121UV-00NyWm; Mon, 21 Feb 2022 22:39:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 22:39:33 +0100
Message-Id: <20220221213933.457-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:PH7CKEQVB0p2ESIknyQQCGzkpSqTMI5w9TM2u7trOiV4VHbRx5D
 agr76+QubHXBjFiWykwzJ2jf+O4oQWh0+T1X3DJsN+8LfSLRi6yOcF3g2BVB7qCqUqSILvu
 pVe1/+DLVFsX5Yjj8UM+o+4H4G8JsbSrt1pS+fs1YoFq908QIxdR7N3tPnyfFkw3i+kH9IY
 FbVBXRVjfqBYTQsAdvldQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C44LP20T/E0=:dbWk5JmxvDl7IqavRH2cnj
 U3OZnw7m7c6oQkfY1VsSwYlA+6SlRVGBC1wvTR5tMYhBMfNgRPRrS1dzJK0fxBkTpoDcGK0yN
 z9xFWgSA4iLWnRZ0Kx2xfo0Ra56fXlacsCPpgRfyNAoUyifc2BQvwnu2c2gPgCY9MhbZi71yY
 G0uShmE79R9A006TYkoEtS2Z/dpFlyl/zJk4AelA8zrzSKY4RbGCDvmE7EQJu6laoSt9AFhWk
 gEdR5RUX+/uHWTH1Z4EgYiEX/eBZYjC/V6GptzrjY1M61s9v6YsMWyV8dRxlTep9xcUb8KBEN
 KCZq+OPIPuHKJso+JJmeqosGQ4e+SFX+xOtFJDdGUytWht2L4fG5WUVE0zUTXVyyuZCLdINZo
 A6pI1FG30+/x1XDDcCasR0+SeKtqj0/nLtY+B5iBy0YMaLgLU9ehIFrnU6kP6pjwN1m4ZFyCr
 SQeBFPJKHWVi2tNYN3W6kJkpQmQIFAxnDsXw1WP5QJmoT8a5hKuzif/lG0w1bQH96Umdr9xFc
 O9meqhyP6Zc22EVK+cBMrHa9rT9vlC1CNYBb60ZR2Rt1rV8X4Dvx5QPpQW/IJ2yp6BQtdAXld
 bDGBa8cuKRU684d8NVJ7YJegy4+URtCFuhJ4HxpUfp2d6zOfjrSdvfYVJQCDcWbDKTKBQuHsT
 HUDkS7DDyb2FuX/ilUYM1MuW4RXBcJihh0LRPtIKl9yrAGezwIbYYSxRgeQf5j3iZXVLwNWQ4
 oejziwcFe6L8nXIP5NGpZjWDwSx65NU9GuM9ze0UFIvO9kIYVI2nnKDEteWJMeTqSn13h18mh
 srd8SWmtb3pfyihobzlDQxSQ7u8DjLFHYskyrYqool3lZ4x+pVmBtze9gmNBdKP7sWadQNsdA
 BGySoHEPBRKTT9wpftWdTlNKaEfxrgLs2yAAAtn/Lz/RFouQG7TPJ7jA0AieVidq60fC2HMrs
 VX8T7pdazTXS24GnS01wlQBPAQ7vW58f7R+nbgvZk0G4PCKeEiORo5GOzeII7bsMxVQ63NRSy
 lixuZrkhRu0DAJED2Q9OCUHFWkkrPyCkn8Xh1D6UPKhx+uj4TmVJPx5xNPXt8yacHu6kYueGL
 JZNFLbL93VBoXc=
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.20.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change site URL to new gitlab.freedesktop.org location
- change hash from upstream provided to locally computed (and drop sha512)

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042111.html
[2] https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.20.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 5 ++---
 package/libinput/libinput.mk   | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f18a727810..d1c7cfb104 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
-sha256  3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068  libinput-1.19.3.tar.xz
-sha512  f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298  libinput-1.19.3.tar.xz
+# Locally computed
+sha256  6c1f97892a7d599f97349e5e7c1239901fe00edcd4f6289f410034d5dc06cc85  libinput-1.20.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2f9c639c22..b814e3416d 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.3
-LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
-LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
+LIBINPUT_VERSION = 1.20.0
+LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
+LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
