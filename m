Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4DBC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7B540323;
	Sun, 11 Feb 2024 15:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FkxSW6dhIYM; Sun, 11 Feb 2024 15:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3EC403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3EC403CA;
	Sun, 11 Feb 2024 15:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 378161BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24AE14076E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgQmBceCN7Ij for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6F8340772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F8340772
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F8340772
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:44:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-410cb93185dso1856065e9.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 07:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707666245; x=1708271045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uA9YzfcDAELFacJ2L+qcBWxAvzFke3pM0NyBiefDDdE=;
 b=OCYrTYcj0acwgzkEbH6QqAXQ+t5aN0C5obtkdfOZB/FEzsq7qilc3WmBTOXYi11jYL
 9n8EYWpbXRY005WDmmguO+i+MP+B050NOJpR8SxJhKA4hS2XMkANVqMQj4VDosd6Shib
 BX6mJVKBGaKqXZIDraguwKz/XC/VfJw9MqeTzNTQqcx4Zg6+JKWPc0zxy/dpkcQc1dc6
 cL9mt88InVY6Lm+eY1RusOYKOwlUKvSjkwh5mNEi5CEf5PLPKxmEgm/6D57xv6LZwF1r
 1c/BdCeracO3yebLCuhXDktVdYgIfYfuz8SBEAu8i2rXs0lC9pTi7cm6kPOp0f0+PXuf
 FXCg==
X-Gm-Message-State: AOJu0YyaueB6AYg27inMZRenBequQuMb0/7c1bVpXtrpeDhPb4AOAT1l
 SbtlrxZEIZ81UUT6NWkxONzpUvvb3wZ8UbkXnrTueFfX8IBR7sepBwaT5ROaYSE=
X-Google-Smtp-Source: AGHT+IHqp/rsGUlrf7dKesWCeYvNdBXXX17M2H3+1haHmWbvzwMUZwwkeOMZQtJj7usEGkMPRfOB7Q==
X-Received: by 2002:a05:600c:1c14:b0:40e:4806:f436 with SMTP id
 j20-20020a05600c1c1400b0040e4806f436mr3836630wms.3.1707666244368; 
 Sun, 11 Feb 2024 07:44:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b0033b60bad2fcsm4470384wrw.113.2024.02.11.07.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 07:44:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:44:01 +0100
Message-ID: <20240211154401.5516-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707666244; x=1708271044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uA9YzfcDAELFacJ2L+qcBWxAvzFke3pM0NyBiefDDdE=;
 b=H6tvVaNlnAdLJ92uMYFsgvrBcU4p8wnnnWP5yYVR67vo4ePDf8m4AqveTkA1YolKEo
 EtVUb++NUBwnqv1vWxABJ3BOWEUT8smFqsR1MMD4me5SRQ22LobGQ3i2hFOkWfH9wii5
 +w1wuMhR+CbnzIFu4sQWLVAyVD8IYCDwRqgrG1cqqvqgDh6O4ZXBoMI33OS9Q895PUIH
 cRBe8KOI4rHtotMiav/tB1UovNZsJmL0dDd5qkiwFM4qI1BvtCRRHIXE3oqnWV9UQmXk
 4aG0yGwNqCksrmwYjG+71yIOz/V0C/uY/LG3bU4ICQEogPIWsx0tPOl7gXG9GFYfDMCk
 j/3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H6tvVaNl
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: fix static build
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

Fix the following static build failure raised, at least, since bump to
version 2.42.10 in commit cd2757bd76d2bc2411e67a27a25b8ab55d40bdb7:

FAILED: gdk-pixbuf/gdk-pixbuf-csource
/home/autobuild/autobuild/instance-9/output-1/host/bin/mips-buildroot-linux-musl-gcc  -o gdk-pixbuf/gdk-pixbuf-csource gdk-pixbuf/gdk-pixbuf-csource.p/gdk-pixbuf-csource.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group gdk-pixbuf/libgdk_pixbuf-2.0.a -lm /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libglib-2.0.a -pthread /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libpcre2-8.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libffi.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linu
 x-musl/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libblkid.a -Wl,--end-group
/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/12.3.0/../../../../mips-buildroot-linux-musl/bin/ld: gdk-pixbuf/libgdk_pixbuf-2.0.a(io-png.c.o): in function `png_simple_error_callback':
io-png.c:(.text+0xf8): undefined reference to `png_get_error_ptr'

Fixes:
 - http://autobuild.buildroot.org/results/e194d8f90caed7ceefd200d4e40d5fa5b3567d03

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-pixbuf-meson.build-fix-static-build.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gdk-pixbuf/0001-gdk-pixbuf-meson.build-fix-static-build.patch

diff --git a/package/gdk-pixbuf/0001-gdk-pixbuf-meson.build-fix-static-build.patch b/package/gdk-pixbuf/0001-gdk-pixbuf-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..44fff9b66d
--- /dev/null
+++ b/package/gdk-pixbuf/0001-gdk-pixbuf-meson.build-fix-static-build.patch
@@ -0,0 +1,38 @@
+From 02cb9c96528a756c346aae59facb8bb7a18463c4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Feb 2024 18:32:06 +0100
+Subject: [PATCH] gdk-pixbuf/meson.build: fix static build
+
+Add included_loaders_deps to dependencies of gdkpixbuf_dep to avoid the
+following build failure when building statically:
+
+FAILED: gdk-pixbuf/gdk-pixbuf-csource
+/home/autobuild/autobuild/instance-9/output-1/host/bin/mips-buildroot-linux-musl-gcc  -o gdk-pixbuf/gdk-pixbuf-csource gdk-pixbuf/gdk-pixbuf-csource.p/gdk-pixbuf-csource.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group gdk-pixbuf/libgdk_pixbuf-2.0.a -lm /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libglib-2.0.a -pthread /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libpcre2-8.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libffi.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-lin
 ux-musl/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-9/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libblkid.a -Wl,--end-group
+/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/12.3.0/../../../../mips-buildroot-linux-musl/bin/ld: gdk-pixbuf/libgdk_pixbuf-2.0.a(io-png.c.o): in function `png_simple_error_callback':
+io-png.c:(.text+0xf8): undefined reference to `png_get_error_ptr'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e194d8f90caed7ceefd200d4e40d5fa5b3567d03
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/162
+---
+ gdk-pixbuf/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
+index a11926eee..450484d68 100644
+--- a/gdk-pixbuf/meson.build
++++ b/gdk-pixbuf/meson.build
+@@ -269,7 +269,7 @@ endif
+ gdkpixbuf_dep = declare_dependency(
+   link_with: gdkpixbuf,
+   include_directories: root_inc,
+-  dependencies: gdk_pixbuf_deps,
++  dependencies: [ gdk_pixbuf_deps, included_loaders_deps ],
+   sources: [ gdkpixbuf_enum_h, built_girs ],
+ )
+ meson.override_dependency('gdk-pixbuf-2.0', gdkpixbuf_dep)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
