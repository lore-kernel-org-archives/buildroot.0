Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E92C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A32415E3;
	Tue, 13 Sep 2022 14:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A32415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaXPnSFTiqM2; Tue, 13 Sep 2022 14:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA67415B9;
	Tue, 13 Sep 2022 14:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA67415B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B953C1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9455260E90
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9455260E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnBdNYf-kpnw for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99346606EC
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99346606EC
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:55:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so28066239ejb.13
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 07:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=GNBGKYoWeb0uiWf5XxntXJ5puE7Bhnyd6IHm8gRrckY=;
 b=qa/2bcU2m7tckz7eOfasZmnMHbT/jzx+nQI87MhQH5oGxeF9YBjIvK1AMxVTzfO2MA
 kCTpvogADYdksA5HP/XiBXzlOqj1AtWFJQtMCjQdDrfBxs/Dyi7Upon2drn7Yl5umfI0
 6xs6/6N6YgHiWOztKSri8MUfS6EaFpflfQhqnf+982qpPPc7gIIgeOGfUck1FoDcUBTn
 GD0+1DEeK/lX9dSQo4Xdu+hAT5EsNQjLwyDq8w5657DLvXYplrz73y6LWgffrBZ2y6hJ
 1WtOOFE14pWxj7PGut+0rI2W7c0ves+azS3+TF04a3FdUdK7D/2aI0H7HfT93n0sTAtt
 iHzg==
X-Gm-Message-State: ACgBeo3kqDGRPT+bG91nwyfY/YCBVYVC9crp8mKT5a5ijnsUKgFOQpOU
 7nB1BhRNM2gIM1tQmc8tZsPmX1tSKSo=
X-Google-Smtp-Source: AA6agR6rnE9hYiZoH8dqZEFWxEKiTOwqRjlHaB689CKgLvkQgDitR8n1MWBC8iwQ+orWnUWkqtqAQw==
X-Received: by 2002:a17:906:730b:b0:77f:9688:272f with SMTP id
 di11-20020a170906730b00b0077f9688272fmr4305071ejc.282.1663080950242; 
 Tue, 13 Sep 2022 07:55:50 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g7-20020a17090669c700b0077a11b79b9bsm6137397ejs.133.2022.09.13.07.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:55:48 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:55:41 +0200
Message-Id: <20220913145541.3567799-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=GNBGKYoWeb0uiWf5XxntXJ5puE7Bhnyd6IHm8gRrckY=;
 b=R+0g5BthY9e2qMKluRX748KyHpy5RHW/iGrriv2BwGA5k83vVOdr7LZoq5M0Iqz+j6
 mNGYAzSbPJ9TPQq60HvLvv89dib8AMVkApd62sb8r1MIkJJ7+lyDglPC4f9qv4d7ja2M
 bLUtR/e/Xe9PwezTWt625F/VqPO2k1pdOnpNldVLmOsCWoswBKaObNswbJ+BYVQ98I3I
 jK4LeR9MP+cB59uUJEcTADcR6cjNVNjno648blSVawW3HBjnNRfi8VSjSsE3PVyXgx1F
 Q0z7zDmFbFmxt3YoNud3emWRDZKuIt0brEqQtWPcw5RttVNNHzSiyA06WYWa1GNRwvWg
 ZrNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R+0g5Bth
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: fix test compilation (don't
 build the test suite)
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
 package/gdk-pixbuf/gdk-pixbuf.mk              |  2 +
 2 files changed, 55 insertions(+)
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
index 57e8bbd511..3ce0470540 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -19,11 +19,13 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
 GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dman=false
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
 	-Drelocatable=true \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
