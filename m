Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF344C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B27A60E48;
	Mon,  8 Aug 2022 15:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B27A60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLc4Td0yRuw4; Mon,  8 Aug 2022 15:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74FBA60B00;
	Mon,  8 Aug 2022 15:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74FBA60B00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97DE71BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 730688254D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730688254D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fm0OOnGJsCBa for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 314CB81DB2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 314CB81DB2
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:14:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h13so11266654wrf.6
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 08:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FOFtfPbMzDaYIBI9Aj2N6PwmaA+dH718c2jAJZlfluo=;
 b=BWxmXj6cyx7or/fuvglitommO+MLgI3Pu3moO5+2mELWjuKeEKUshD06wtA65IGCWY
 Ka+YWn3z6oc6OXxB0312SlenNIDx35FLhH8Xp0hUThZu19mkdUj6Ms2uStYGSqmYKI8M
 rmdn4u/dRZWJmsFGk9YyBdvoCCQvq/gphoFmuy416P85nXNNnMRzLm1AT5N7WgY2vyfN
 ktQIF677umgQz87vRK4gx351ReEjTGzE3p3QW2tudv1pNxG7ypcw/t6L5DvthNL3gfKN
 PX31KqWG5xWoxjIwGJlf+KSGNZ7bG/W9OExF15k0SrgcnPk2DL9GkAZA+r+EgvcqM7Um
 b79w==
X-Gm-Message-State: ACgBeo2lecgJFhPxz0gKB/zA+C1EOnGzOO2y3fj+el6BNGGcxiihiuZ4
 TUx6o6ZQmGxIGl1OKAv+y8A4rvsqvLU=
X-Google-Smtp-Source: AA6agR7czzEh7IQz6AejuqnRldOBdbZqz8ZWkG0tFOY9QZP0EjdWMUBBGHfvdlf1byiUuMsoggOMhA==
X-Received: by 2002:adf:f804:0:b0:21e:de03:b64f with SMTP id
 s4-20020adff804000000b0021ede03b64fmr11045468wrp.543.1659971662169; 
 Mon, 08 Aug 2022 08:14:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adff051000000b002217e3f41f1sm7551628wro.106.2022.08.08.08.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:14:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:14:02 +0200
Message-Id: <20220808151402.1694762-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
References: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FOFtfPbMzDaYIBI9Aj2N6PwmaA+dH718c2jAJZlfluo=;
 b=OIoO8ASL8h4/VOC8j3Wa3U5+1Auhjq9SOhSHhIkYqcZEVljMIVD8aZxB333aL4Bqb0
 D4onxE1vFWQ/9dEtQ/8t6Nn4XaAqzjuJ8IPCBu4rV+YipK14laepY39JeB5ctfSAS3tj
 KQVMp4oA/jnH04Q6pJxsZEKi2i8ctHhVuZPyP4RC2hNgaAe3YgyLjAae6v7uu+A35EUo
 OvQAbjKO2qgH2YL02oGGbqUSoYMPqQvwI06Vx7liEnHenOQpnjmNVUyKUr45A8h2hiV4
 YHWJhOame0FivYr+a2BhsIoQEjBgGhbRBLEfcJ7nfSWedZAif/Lkwsv6fpjeo1Z3AQG6
 DCZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OIoO8ASL
Subject: [Buildroot] [PATCH 2/2] package/sord: bump to version 0.16.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package and so drop patch

https://github.com/drobilla/sord/blob/v0.16.12/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-wscript-add-no-threads-option.patch  | 59 -------------------
 package/sord/sord.hash                        |  4 +-
 package/sord/sord.mk                          | 16 ++---
 3 files changed, 6 insertions(+), 73 deletions(-)
 delete mode 100644 package/sord/0001-wscript-add-no-threads-option.patch

diff --git a/package/sord/0001-wscript-add-no-threads-option.patch b/package/sord/0001-wscript-add-no-threads-option.patch
deleted file mode 100644
index 750ea8f4ad..0000000000
--- a/package/sord/0001-wscript-add-no-threads-option.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 82ab045a45c06187dca5e9d2a9a4003fcfbfa830 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 22 Feb 2022 21:22:31 +0100
-Subject: [PATCH] wscript: add -no-threads option
-
-Add -no-threads options to avoid the following build failure on embedded
-toolchains without threads support:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
-
-Fixes:
- - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/drobilla/sord/pull/3]
----
- wscript | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index fd8578e..d71d78c 100644
---- a/wscript
-+++ b/wscript
-@@ -35,6 +35,7 @@ def options(ctx):
-         {'no-utils':     'do not build command line utilities',
-          'static':       'build static library',
-          'no-shared':    'do not build shared library',
-+         'no-threads':   'disable threads',
-          'static-progs': 'build programs as static binaries'})
- 
-     opt.add_option('--dump', type='string', default='', dest='dump',
-@@ -55,6 +56,7 @@ def configure(conf):
- 
-     conf.env.BUILD_UTILS  = not Options.options.no_utils
-     conf.env.BUILD_SHARED = not Options.options.no_shared
-+    conf.env.ENABLE_THREADS = not Options.options.no_threads
-     conf.env.STATIC_PROGS = Options.options.static_progs
-     conf.env.BUILD_STATIC = (Options.options.static or
-                              Options.options.static_progs)
-@@ -124,7 +126,7 @@ def configure(conf):
-     conf.check_pkg('serd-0 >= 0.30.0', uselib_store='SERD')
-     conf.check_pkg('libpcre', uselib_store='PCRE', mandatory=False)
- 
--    if conf.env.HAVE_PCRE:
-+    if conf.env.HAVE_PCRE and conf.env.ENABLE_THREADS:
-         if conf.check(cflags=['-pthread'], mandatory=False):
-             conf.env.PTHREAD_CFLAGS    = ['-pthread']
-             if conf.env.CC_NAME != 'clang':
-@@ -160,6 +162,7 @@ def configure(conf):
-         conf,
-         {'Static library': bool(conf.env.BUILD_STATIC),
-          'Shared library': bool(conf.env.BUILD_SHARED),
-+         'Threads':        bool(conf.env.ENABLE_THREADS),
-          'Utilities':      bool(conf.env.BUILD_UTILS),
-          'Unit tests':     bool(conf.env.BUILD_TESTS),
-          'Debug dumping':  dump})
--- 
-2.34.1
-
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
index af175f91f0..ec5c88a43c 100644
--- a/package/sord/sord.hash
+++ b/package/sord/sord.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sord-0.16.8.tar.bz2.asc
-sha256  7c289d2eaabf82fa6ac219107ce632d704672dcfb966e1a7ff0bbc4ce93f5e14  sord-0.16.8.tar.bz2
+# https://download.drobilla.net/sord-0.16.12.tar.xz.sig
+sha256  fde269893cb24b2ab7b75708d7a349c6e760c47a0d967aeca5b1c651294ff9f2  sord-0.16.12.tar.xz
 sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index c06ef9c55c..9fcf98858a 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SORD_VERSION = 0.16.8
+SORD_VERSION = 0.16.12
 SORD_SITE = https://download.drobilla.net
-SORD_SOURCE = sord-$(SORD_VERSION).tar.bz2
+SORD_SOURCE = sord-$(SORD_VERSION).tar.xz
 SORD_LICENSE = ISC
 SORD_LICENSE_FILES = COPYING
 SORD_DEPENDENCIES = host-pkgconf serd
@@ -16,14 +16,6 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
 SORD_DEPENDENCIES += pcre
 endif
 
-SORD_CONF_OPTS += --no-coverage
+SORD_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SORD_CONF_OPTS += --static --no-shared --static-progs
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-SORD_CONF_OPTS += --no-threads
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
