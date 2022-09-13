Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE22C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE1560EAB;
	Tue, 13 Sep 2022 14:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE1560EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeMY_71ZnM5f; Tue, 13 Sep 2022 14:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523FA60EA5;
	Tue, 13 Sep 2022 14:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523FA60EA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068B31BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D587440A90
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D587440A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4v7CuiL4DS5 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE0B401CA
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE0B401CA
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:46:43 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z21so17971626edi.1
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=gDH6xw+c6Fe9Wov4xvvPatb+n2MvpfY3IXgNsx/Xi6s=;
 b=YxrAkjKXVqe2KQdBIqvMfR1vf8UjGeoQQJ8zOc7AIOSeq7EZGgxt20YpXV0xFQ4iqU
 CSmE1x9x2qOeADuiebQocm1JfBKqZJYrUJsOd9UZf5w6K6WY4l7E/3cIAOK1YHZrqa/h
 OGZend97bVltdnn9b74vf2OEUXiYhFQcVyUyOFXt+ZC0DjxI60/2d2IsgJegDrBzjwch
 Bk4w+nddfVKw2ue3VobLGm1vQ8nyPVuJAnSKQhRmzf2+4RWHiLWqleqw5zF50utxY6hH
 Vx9jqS4cBNESKP1jaiWUzUnGU51ZQYNf6SxQZPIl7NvHQLJMTsGq8QB1srcbEq39b2KS
 B32g==
X-Gm-Message-State: ACgBeo2IBQP3runrhGR+WYrgrOohhASo0P0tQ7vzTliz5fHSCfJgKiyZ
 dH35FHidxswGTZk61Qu0U/S6xmo3tDQ=
X-Google-Smtp-Source: AA6agR5ZcDbnjaEY+602zXJKLD/CPQqUyaju4/SBZ6TXttloQIFAJFjX6FIPU5K/b7+JnvYDx6JhUQ==
X-Received: by 2002:a05:6402:138f:b0:43d:8ed5:c841 with SMTP id
 b15-20020a056402138f00b0043d8ed5c841mr26615620edv.27.1663080395492; 
 Tue, 13 Sep 2022 07:46:35 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a0564022b8c00b0044dde9244fdsm8137878edb.8.2022.09.13.07.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:46:34 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:46:30 +0200
Message-Id: <20220913144630.3562793-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=gDH6xw+c6Fe9Wov4xvvPatb+n2MvpfY3IXgNsx/Xi6s=;
 b=RwI5K4dpY9bbAoKpRT5ckzAjhUgWBGd9Sp+k5Glr0DQO7cdxTMiYTkV5b+d31UhQ/b
 YgEBAtwnfvoTsEG32wPquJAilywmxZP8jDeqx7SgSpEBxNIYOW6oVvSFuJNYz1+b+hVI
 4yOW9LUUZqkRll2Um46hFzmu4azZlT9I6niy0YKD6QhaE5tqGhymoUU9k2sILgaEfcDU
 OHNy9kowGRaHRgZJn3UQ1tLcIZdhJtuYE0TEm4D/PJL/+6QliUQ0rCoCTNugtayyoGMX
 gki0wgTA0PBNqXRFuuYIJ1oxcKtULQNOIPvQCN9N9nMiWxbEVsOS2CSDyeXpqrNKa8wV
 zb0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RwI5K4dp
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: fix test compilation
 (disable tests)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Not needed + breaks compilation on some platforms.

Patch is part of 2.42.9, so can be dropped with the next minor/major bump.
https://github.com/GNOME/gdk-pixbuf/commit/801eef111df624f4377baed9a90c94b6a2d4340c

```
[179/246] Generating tests/resources.c with a custom command
FAILED: tests/resources.c
/buildroot/output/host/bin/python3 /buildroot/output/build/host-gdk-pixbuf-2.42.8/build-aux/gen-resources.py --glib-compile-resources=/buildroot/output/host/bin/glib-compile-resources --pixdata=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/gdk-pixbuf-pixdata --loaders=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/loaders.cache --sourcedir=/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests --source ../tests/resources.gresource.xml tests/resources.c
failed to load "/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png": Couldn?t recognize the image file format for file ?/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png?
../tests/resources.gresource.xml: Child process exited with code 1.
```

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 .../0001-meson-add-build_tests-option.patch   | 53 +++++++++++++++++++
 package/gdk-pixbuf/gdk-pixbuf.mk              |  6 ++-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 package/gdk-pixbuf/0001-meson-add-build_tests-option.patch

diff --git a/package/gdk-pixbuf/0001-meson-add-build_tests-option.patch b/package/gdk-pixbuf/0001-meson-add-build_tests-option.patch
new file mode 100644
index 0000000000..8a87518d13
--- /dev/null
+++ b/package/gdk-pixbuf/0001-meson-add-build_tests-option.patch
@@ -0,0 +1,53 @@
+From 5554eeeec41c5b39b0041fa18b27a39fbc3e2b6a Mon Sep 17 00:00:00 2001
+From: Jason Francis <jafrancis999@gmail.com>
+Date: Tue, 10 May 2022 11:53:15 -0400
+Subject: [PATCH] meson: add build_tests option
+
+(cherry picked from commit 801eef111df624f4377baed9a90c94b6a2d4340c)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ meson.build       | 5 ++++-
+ meson_options.txt | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fe4bfaad4..db9a390e8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -414,7 +414,9 @@ subdir('gdk-pixbuf')
+ subdir('po')
+ 
+ if not meson.is_cross_build()
+-  subdir('tests')
++  if get_option('tests')
++    subdir('tests')
++  endif
+   subdir('thumbnailer')
+ endif
+ 
+@@ -446,6 +448,7 @@ summary('Introspection', build_gir, section: 'Build')
+ summary('Documentation', build_docs, section: 'Build')
+ summary('Manual pages', get_option('man'), section: 'Build')
+ summary('Relocatable', get_option('relocatable'), section: 'Build')
++summary('Build tests', get_option('tests'), section: 'Build')
+ summary('Installed tests', get_option('installed_tests'), section: 'Build')
+ 
+ summary('prefix', gdk_pixbuf_prefix, section: 'Directories')
+diff --git a/meson_options.txt b/meson_options.txt
+index c12179c5e..0ea94eb47 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -41,6 +41,10 @@ option('native_windows_loaders',
+        description: 'Use Windows system components to handle BMP, EMF, GIF, ICO, JPEG, TIFF and WMF images, overriding jpeg and tiff.  To build this into gdk-pixbuf, pass in windows" with the other loaders to build in or use "all" with the builtin_loaders option',
+        type: 'boolean',
+        value: false)
++option('tests',
++       description: 'Build the test suite',
++       type: 'boolean',
++       value: true)
+ option('installed_tests',
+        description: 'Install the test suite',
+        type: 'boolean',
+-- 
+2.37.2
+
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 57e8bbd511..b0e07b0287 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -20,14 +20,16 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
 	-Dinstalled_tests=false \
-	-Dman=false
+	-Dman=false \
+	-Dtests=false
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
 	-Drelocatable=true \
-	-Dman=false
+	-Dman=false \
+	-Dtests=false
 
 ifeq ($(BR2_STATIC_LIBS),y)
 GDK_PIXBUF_CONF_OPTS += -Dbuiltin_loaders=all
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
