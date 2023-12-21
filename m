Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCE6C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 10:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DDB54379B;
	Thu, 21 Dec 2023 10:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DDB54379B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duEL7ivi0Lil; Thu, 21 Dec 2023 10:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08CE04379D;
	Thu, 21 Dec 2023 10:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08CE04379D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1B411BF38B
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 10:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 276A0404CB
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 10:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 276A0404CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEE7ydNeShQK for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 10:43:25 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E48E402B9
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 10:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E48E402B9
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3365f1326e4so533944f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 02:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155402; x=1703760202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16MHQ3APeJgv0qSsLEV0LyVsM8hkkXjLikRiK8Ab5CQ=;
 b=Xpxig4OB5SctFJz9Kf/REjgZFGjyl1FVRXHJK4Gi3wq63Wexp2rdu32gbhT+4dE9xf
 r2rvAPqHYIpKKgQ+syXnjL6KNnUTS7EOsO3MJc1wL6CR+kfHwEeVjjpaMP5OW4oP6DTT
 C6JwKhjgeJS8pc3sG5+Fq7TCq5pYTVorq4C0ceWdZ5RqPFqOxwQVYw5+feZYde/5gJ3J
 z0AlI7vPG2AwcZlluirbw+V4oF7BzzR21mqHJ/0WLBjSwweA2yaRAhCCGrcSEUKXNI+R
 dUAhLNpKKpYMb5yr2mnMVTUaqKPBb48NGusNuwFhlwkmG2W0t5aAfN705A9DzV+sEfbQ
 D/zQ==
X-Gm-Message-State: AOJu0YwMwWN7AdQFdF6fFrvNnhAzhz9wOA+TGpTEdEr/Wp9115DhseQx
 qMAU+hZrXE1iiMBhoaOSjYTYkfdlbugAQ82udXpjlg==
X-Google-Smtp-Source: AGHT+IGPC7h2pt6E7QNtyAn5IFqz4DMkojr9mpJTSTN0msMB+jCrrZc6PO69RCsUPK0McoWg9Re5ug==
X-Received: by 2002:a05:6000:1281:b0:336:8b69:79ba with SMTP id
 f1-20020a056000128100b003368b6979bamr247313wrx.10.1703155402484; 
 Thu, 21 Dec 2023 02:43:22 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6e90000000b0033667867a66sm1717739wrz.101.2023.12.21.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:43:22 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 11:42:48 +0100
Message-Id: <20231221104248.1332175-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703155402; x=1703760202;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=16MHQ3APeJgv0qSsLEV0LyVsM8hkkXjLikRiK8Ab5CQ=;
 b=vUBRR3aBg1TxhkBmQHz8YaPM7MRVnxqfyy8jVHAsFxcaZtQIPA/7BvJMfV1SqCyoLU
 ODpe4MCfp9znovFAAMIFvlciHiuLFUtZAP3Bd3tgMglSeL2BW2RNZjCM6nv6uYbQT/xc
 EKKnHXNZ9MXcEfo0Dx4ivKg4ok5+MIN+9d/YKXQxaVMPCQlC3CzDI05CSpZutPHn5eFI
 uNbnwXEfjXD8O2i2fJiy3a7uv07b1CCFfsQio3AD9Rx5YE2fu4zGoI0tyBc2i+8IhRLZ
 Gb7OklOnY7EFRHMJ2cZiElcGdgdRSUVjxs8RlejCsrovtf2gW14aBICLv9kbO1VmwR03
 MH1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vUBRR3aB
Subject: [Buildroot] [PATCH] package/meson: bump version to 1.3.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, bernd@kuhls.net,
 stsp2@yandex.ru, james.hilliard1@gmail.com, romain.naour@gmail.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The meson upgrade from 1.1.1 to 1.2.0 have been reverted
because host-qemu (version v8.0.3) was searching
libraries in the build machine instead of buildroot host
directory [1].
$ grep -r LINK_ARGS  * | grep "\-L/usr"
build.ninja: LINK_ARGS =
    -L/usr/lib/gcc/x86_64-linux-gnu/10 \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../../lib -L/usr/lib \
    -L/lib/x86_64-linux-gnu \
    -L/lib/../lib \
    -L/usr/lib/../lib \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../.. \
    -L/lib \
    -I/[...]/host/include \
    -L/[...]/host/lib \
    -I/[...]/host/include/libfdt \
    ...

Upgrading qemu to version v8.1.0 solves the problem:
$ grep -r LINK_ARGS  * | grep "\-L/usr"
build.ninja: LINK_ARGS =
    -I/[...]/host/include \
    -L/[...]/host/lib \
    -I/[...]/host/include/libfdt \
    ...

Those two tests were done with the same buildroot version
(2028.08) on the same machine were the bug appeared. Using,
git bisect, in this environment, it was found that the
problem was fixed in qemu by the commit [2].

Thus, it is possible that the problem was introduced by
improper use of meson by qemu <= v8.0.3. Also, meson has
been updated to version 1.2.0 and 1.3.0 in yocto and it
doesn't seem to create any issue. [3]

The original problem is no longer present and some
projects require meson >= 1.3.0 (e.g. mesa3d with
rusticl).

The patch that adds the pkg_config_static property has
been rebased.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
[2] https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9
[3] https://github.com/yoctoproject/poky/commits/master/meta/recipes-devtools/meson

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 ...dencies-base.py-add-pkg_config_stati.patch | 29 ++++++++++---------
 package/meson/meson.hash                      |  4 +--
 package/meson/meson.mk                        |  2 +-
 support/misc/cross-compilation.conf.in        |  2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 8e15d3210c..49a0ef93dc 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 3d6a2db2270346236dd6247e0648ea0c949ba468 Mon Sep 17 00:00:00 2001
+From 59934e2116e025ecfe23baf6febc4a0eb85f60cd Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -20,24 +20,25 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Rebased on 0.57.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[rebased on 1.3.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
- mesonbuild/dependencies/pkgconfig.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ mesonbuild/dependencies/pkgconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
-index 1e8d9132e..d902ba215 100644
+index e86206b88..94888657d 100644
 --- a/mesonbuild/dependencies/pkgconfig.py
 +++ b/mesonbuild/dependencies/pkgconfig.py
-@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
-         env = None
-         libcmd = ['--libs']
- 
--        if self.static:
-+        if self.static or \
-+            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
-             libcmd.append('--static')
- 
-         libcmd.append(self.name)
+@@ -169,7 +169,7 @@ class PkgConfigCLI(PkgConfigInterface):
+             env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
+         args: T.List[str] = []
+         args += self._define_variable_args(define_variable)
+-        if static:
++        if static or (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
+             args.append('--static')
+         args += ['--libs', name]
+         ret, out, err = self._call_pkgbin(args, env=env)
 -- 
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cb36b674fa..8678ba5985 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
-sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.3.0/meson-1.3.0.tar.gz.asc
+sha256  4ba253ef60e454e23234696119cbafa082a0aead0bd3bbf6991295054795f5dc  meson-1.3.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 503aca8c25..eec4c908f6 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.1.1
+MESON_VERSION = 1.3.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 3c5812b131..21cec10b82 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -10,7 +10,7 @@ ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
 fortran = '@TARGET_FC@'
-pkgconfig = '@PKGCONF_HOST_BINARY@'
+pkg-config = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
