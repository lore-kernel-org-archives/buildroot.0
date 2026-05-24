Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB78CD4F54
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 06:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5812180C7A;
	Sun, 24 May 2026 06:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdH20aCDXFCp; Sun, 24 May 2026 06:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383BA80C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779604657;
	bh=+/3e2JGrJmgvO42uZrFu0CkWTo4ldz9w1F0YwwSPsmM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nfgf3ZWsBWzbF1LrYXJIA8bqd5eNU7kwqH3G9BflzP8G7tEOlwFxo4/08folbgGPG
	 bjT2Gb/dHkmd2RwGNMwHbUER66frZDCoBi1MYfm/sw/BjA8lLkjWf7GEUoSVtDByQM
	 P1qGMeYyeCHGOSlAW3NCNrVvoJ2klzGoQUU0jORUXeQhF4XD/7B5lY9IWAzlGy1fw8
	 EFVsjfHC9tY3kR0jl4sUPblQmKOEG5kSa2Y01vfKJaRDj44S4vnvsUOazoE4Xqg1He
	 1JUqZD+oTyPM3jWNoAipYp0PyFByJO5UXaYo+9i4TIdnKu5bvYsJgkitsauG3+PDGN
	 WgglswUxkhLqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383BA80C5D;
	Sun, 24 May 2026 06:37:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25816265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 06:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B41A80C55
 for <buildroot@buildroot.org>; Sun, 24 May 2026 06:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IWexuphIzlw for <buildroot@buildroot.org>;
 Sun, 24 May 2026 06:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F0F380C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F0F380C34
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F0F380C34
 for <buildroot@buildroot.org>; Sun, 24 May 2026 06:37:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 742E5A4C115A;
 Sun, 24 May 2026 08:37:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47156)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wR2Sn-000000006Ir-1H0J;
 Sun, 24 May 2026 06:37:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 May 2026 08:37:29 +0200
Message-ID: <20260524063729.1193614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779604650;
 bh=gh3N9YmyYeshBLQRu5lv4SNRHKOvcw8kyLG1yyLxnk4=;
 h=From:To:Cc:Subject:Date:From;
 b=u1CuV4EkQ0Ji+QxsPZ/5RJb20QenxMeV3pVR5gTXbLuZrsm3c/osKRVrBdy93DLQO
 Rbe7FFo9h2Jh8Ooc4rquccUFwwCg7I6nnQZfEi5qF6e86Q8wx8Xcyqizm2d5nWqNPd
 ZOjIlpEDCMGzgFTrPiAmOqrR+hZ+kd7KiKIBKbCtnKGo1sV1DgMAevaR46IIsLqOSd
 ZTRml7JKOZspV228lVKOWe+HAbtva04tr/6zF8AuKVUVikBtq+lrlmiuKlyh7en6wp
 LUzM1lGjBzElGman0tYKWKrDHoQHA1GRMywDT4zBxMDBCRY+/UGgAzv0q8sk6UdSmi
 4GgKNxt2vM/9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=u1CuV4Ek
Subject: [Buildroot] [PATCH 1/1] package/efl: re-add patches to fix
 drm-related build errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit c7a1b73f1758855e47c188c38617dd309b2c2428 removed
patches 0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
and 0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch.

This defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_EFL=y
BR2_PACKAGE_EFL_DRM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LUAJIT=y

is broken now during configure stage

output/build/efl-1.28.1/src/modules/ecore_evas/engines/drm/meson.build:6:18:
 ERROR: Unknown variable "engine_gl_drm".

which is fixed by former patch 0001.

Later a build error occurs which is fixed by former patch 0002.

The error was not yet caught by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...es-drm-meson.build-use-gl_deps-as-en.patch | 37 ++++++++++++++++++
 ...es-drm-meson.build-fix-gl_drm-includ.patch | 38 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
 create mode 100644 package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch

diff --git a/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
new file mode 100644
index 0000000000..dd6ac1ae25
--- /dev/null
+++ b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
@@ -0,0 +1,37 @@
+From 00833baac6935bd1e3e9856211bc165c5b02a7bd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 02:25:47 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
+ dependencies
+
+Meson trigger an error since "engine_gl_drm" variable doesn't exist.
+
+src/modules/ecore_evas/engines/drm/meson.build:10:2: ERROR: Unknown variable "engine_gl_drm".
+
+Instead use "gl_deps" as engine dependencies.
+
+Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075016/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index 58071010d0..0741d7fccd 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -3,7 +3,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
+ 
+ if get_option('opengl') != 'none'
+   config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
+-  engine_deps += [engine_gl_drm]
++  engine_deps += [gl_deps]
+ endif
+ 
+ engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
+-- 
+2.31.1
+
diff --git a/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
new file mode 100644
index 0000000000..e71a1705c0
--- /dev/null
+++ b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
@@ -0,0 +1,38 @@
+From a21e71cc2284a19a34c913aff757e656e3a8c14a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 01:01:00 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
+ directory
+
+The Evas_Engine_GL_Drm.h file is in "gl_drm" directory, not "drm".
+
+../src/modules/ecore_evas/engines/drm/ecore_evas_drm.c:23:11: fatal error: Evas_Engine_GL_Drm.h: No such file or directory
+   23 | # include <Evas_Engine_GL_Drm.h>
+      |           ^~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075004/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index 0741d7fccd..edda1abd71 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -6,7 +6,7 @@ if get_option('opengl') != 'none'
+   engine_deps += [gl_deps]
+ endif
+ 
+-engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
++engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'gl_drm'))
+ 
+ shared_module(mod_full_name, engine_src,
+   include_directories : config_dir + [engine_include_dir],
+-- 
+2.31.1
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
