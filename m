Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5209C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 13:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A50D410BE;
	Sun,  7 Aug 2022 13:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A50D410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YnR2G2SGSe_u; Sun,  7 Aug 2022 13:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC9F410C6;
	Sun,  7 Aug 2022 13:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AC9F410C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECDE1BF3CD
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D69410C6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D69410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qetdr29dukpp for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 13:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D383D410BE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D383D410BE
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 13:54:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a11so3570820wmq.3
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 06:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SY7q887inaboZyZHfqvOXj4zTqwSo8pFEJuREsNmEyE=;
 b=0vP6oqpS7eQ75inkcts6QBumRdmcedX4mHb+GksZnfntiVeTutZDej2JretkH+buE1
 eVE6/hbdZRQHByo/LDrFFgTG/DtCYUB6M+7Z9ydSTpH99+tK8uE2TGdEpqdYME+vVHqQ
 918BHX6rLGZ6e9sqICMOmzYLUEuwhKMpjBe8gZ1FtUYyQvNYC+hDXwP1Y2nC8rCaWDCM
 9dnSh9AJqOxfo0O4aGI5FtzDvHhNXzktbxT2cp7wEBRP2+iDvTuMds5wB3SVUfnfjoP/
 bAbLn12oDtCkeeCaDiIJ6SwzVaeX9TsaMXDan2+kV/w2qCIHKOCiZlU78YcQbUEd2zDY
 sLnA==
X-Gm-Message-State: ACgBeo0NEXWUmPR8QbkNVpyq/JYRNwyuIhyrHsY4cg9/95KqodPC7+PT
 4SCnBQ03feqhXyAUwcacyn6xmBhb6go=
X-Google-Smtp-Source: AA6agR6daFZJ3uyawXXQmWNKjaazEI93wfykpYe7u2UgiIS3I0+3t98b72hxRzbDxwoDvtHrXfC3kA==
X-Received: by 2002:a1c:cc0f:0:b0:3a5:333:310d with SMTP id
 h15-20020a1ccc0f000000b003a50333310dmr10012883wmb.122.1659880458517; 
 Sun, 07 Aug 2022 06:54:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a5d52cd000000b0021d7fa77710sm8986921wrv.92.2022.08.07.06.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 06:54:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 15:53:57 +0200
Message-Id: <20220807135357.3940300-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=SY7q887inaboZyZHfqvOXj4zTqwSo8pFEJuREsNmEyE=;
 b=YkIKG/JskmIlSyhYChf+oUYCukmdGUeuisfNfGyeOfAcCMLWm1PohgE+PouUW2G9wR
 qkqMrn+KL4d1aSkWlI4aEi8FYM/OI0p/f3f8Tk5TTWaLKRjK1lGHUB4ShohpWipmGi/B
 zdiiCAG6fbTMOL6qNgvfKjPPXa+nfhdCwUcT9Jv4CGsFTd7MHAV+07Fbzq2AFgajG7km
 jQs6IifUo3LAAhvMtEkSyOQuopX3USorM07xlczNHDWDlgpt1N08qt5Twr3ge9PAGicm
 ngo8OEhEir/H3RY+8wRsvNtT6ntiveROEcZmJ0h8eqwckdWKXTrKc1ggNSWLv3jtpgEB
 FyxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YkIKG/Js
Subject: [Buildroot] [PATCH 1/1] package/waffle: bump to version 1.7.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
wayland to version 1.20.0 in commit
f94ba5c31cf7f863e6fae996fc042a56e20118f3 thanks to
https://gitlab.freedesktop.org/mesa/waffle/-/commit/71d46212a9d23a951d5d38f0bfd1cdf1194c8c8e
and
https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_get_version'
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_marshal_flags'

https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.7.0
https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.3
https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.2

Fixes:
 - http://autobuild.buildroot.org/results/1fb1540b0ae6037140f386f44d6e17735f0674c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lags-from-.pc-files-to-waffle-cflags.patch |  2 +
 ...yland-fix-build-against-version-1-20.patch | 59 +++++++++++++++++++
 package/waffle/waffle.hash                    |  4 +-
 package/waffle/waffle.mk                      |  6 +-
 4 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 package/waffle/0002-wayland-fix-build-against-version-1-20.patch

diff --git a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
index 126aa93300..b2a1294f24 100644
--- a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
+++ b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
@@ -12,6 +12,8 @@ since CFLAGS defined by pc files are not used.
 EGL_NO_X11 is defined in CFLAGS from egl.pc.
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/111]
 ---
  src/waffle/CMakeLists.txt | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
new file mode 100644
index 0000000000..d3b66180ec
--- /dev/null
+++ b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
@@ -0,0 +1,59 @@
+From 2c33597245bb74f19104f0a858cd40e80b26991d Mon Sep 17 00:00:00 2001
+From: Philipp Zabel <p.zabel@pengutronix.de>
+Date: Fri, 17 Dec 2021 13:46:40 +0100
+Subject: [PATCH] wayland: fix build against version 1.20
+
+Wayland 1.20 introduces two new symbols wl_proxy_marshal_flags and
+wl_proxy_marshal_array_flags, which need to be wrapped as well.
+
+Closes: https://gitlab.freedesktop.org/mesa/waffle/-/issues/76
+Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
+[Retrieved from:
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/waffle/wayland/wayland_sym.h     | 18 ++++++++++++++++++
+ src/waffle/wayland/wayland_wrapper.h |  2 ++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/src/waffle/wayland/wayland_sym.h b/src/waffle/wayland/wayland_sym.h
+index 3d48625..4c6ac8d 100644
+--- a/src/waffle/wayland/wayland_sym.h
++++ b/src/waffle/wayland/wayland_sym.h
+@@ -26,3 +26,21 @@ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor,
+ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned,
+                    (struct wl_proxy *proxy, uint32_t opcode,
+                     const struct wl_interface *interface, uint32_t version, ...))
++
++WAFFLE_WAYLAND_SYM(struct wl_proxy *,
++                   wl_proxy_marshal_flags,
++                   (struct wl_proxy * p,
++                    uint32_t opcode,
++                    const struct wl_interface *interface,
++                    uint32_t version,
++                    uint32_t flags,
++                    ...))
++
++WAFFLE_WAYLAND_SYM(struct wl_proxy *,
++                   wl_proxy_marshal_array_flags,
++                   (struct wl_proxy * p,
++                    uint32_t opcode,
++                    const struct wl_interface *interface,
++                    uint32_t version,
++                    uint32_t flags,
++                    union wl_argument *args))
+diff --git a/src/waffle/wayland/wayland_wrapper.h b/src/waffle/wayland/wayland_wrapper.h
+index 4af2f64..6addf4f 100644
+--- a/src/waffle/wayland/wayland_wrapper.h
++++ b/src/waffle/wayland/wayland_wrapper.h
+@@ -65,5 +65,7 @@ struct wl_display;
+ #define wl_proxy_marshal (*wfl_wl_proxy_marshal)
+ #define wl_proxy_marshal_constructor (*wfl_wl_proxy_marshal_constructor)
+ #define wl_proxy_marshal_constructor_versioned (*wfl_wl_proxy_marshal_constructor_versioned)
++#define wl_proxy_marshal_flags (*wfl_wl_proxy_marshal_flags)
++#define wl_proxy_marshal_array_flags (*wfl_wl_proxy_marshal_array_flags)
+ 
+ #include <wayland-client-protocol.h>
+-- 
+GitLab
+
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index 84821312c1..8968dd6fd3 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,3 +1,5 @@
+# From https://gitlab.freedesktop.org/mesa/waffle/uploads/42030b1cc0f81fd738152104e1811919/waffle-1.7.0.sha256sums
+sha256  69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3  waffle-1.7.0.tar.xz
+
 # Locally calculated
-sha256  234e65bdd2dd8f7d3bc8e9ad1a7cc80fce78a1deed3a04fe7f1d2c2edac0cd8a  waffle-v1.6.1.tar.bz2
 sha256  630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 3340dc1c60..87d44c4217 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = 1.6.1
-WAFFLE_SOURCE = waffle-v$(WAFFLE_VERSION).tar.bz2
-WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$(WAFFLE_VERSION)
+WAFFLE_VERSION = 1.7.0
+WAFFLE_SOURCE = waffle-$(WAFFLE_VERSION).tar.xz
+WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/uploads/9eaadda4ec2ed1d8a26ddefd2cfd16be
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
