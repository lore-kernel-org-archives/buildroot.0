Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B121C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A2B4056D;
	Sat,  2 Sep 2023 15:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A2B4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT9BRphZxvPZ; Sat,  2 Sep 2023 15:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E56D4054E;
	Sat,  2 Sep 2023 15:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E56D4054E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6831E1BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 419A14056D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419A14056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZzkj9uxQc77 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:53:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A4440547
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A4440547
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23313868D0; Sat,  2 Sep 2023 15:53:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:52:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 855f78edd40cc95f61f53cb8b01bf54c786fc74a
X-Git-Newrev: 39ae14faabb82703c2cee2ddf23e5925a0f0f251
X-Patchwork-Hint: ignore
Message-Id: <20230902155328.23313868D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: update optional
 opengl patch due to new glu dependency in util
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39ae14faabb82703c2cee2ddf23e5925a0f0f251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matrix-code from es2gears has been moved to util in version 9.0.0 [1]
so now es2gears is linked with mesa3d-demo libutil (idep_util).
But at the same time the dependency on glu (dep_glu) has been added
to libutil [2]. dep_glu requires opengl (FULL_GL) to build.

In order to keep the es2gears for egl only builds we have to
split the libutil files list to build readtex.c and showbuffer.c
only if opengl is available.

Add back dep_glu since it's used in util's meson.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/c33e2f731c2eab86bbad7b6a028f8a90ea40a00c
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/ef24aae22978d4d357340074ca9a1c04d9cf81e6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-demos-makes-opengl-an-optional-component.patch | 95 ++++++++++++----------
 1 file changed, 50 insertions(+), 45 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
index af929003db..72bf72719c 100644
--- a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
+++ b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
@@ -1,25 +1,44 @@
-From 9ec9f7b4d0ef5e799ca4cc5103163e4630d184d8 Mon Sep 17 00:00:00 2001
+From 5b45f98255b74589015d5cb0d8ca31d7169c9f34 Mon Sep 17 00:00:00 2001
 From: Julien Olivain <ju.o@free.fr>
 Date: Fri, 16 Sep 2022 22:30:59 +0200
 Subject: [PATCH] demos: makes opengl an optional component
 
 This patch is a port of [1] for the new meson build system.
 
+matrix-code from es2gears has been moved to util in version 9.0.0 [2]
+so now es2gears is linked with mesa3d-demo libutil (idep_util).
+But at the same time the dependency on glu (dep_glu) has been added
+to libutil [3]. dep_glu requires opengl (FULL_GL) to build.
+
+In order to keep the es2gears for egl only builds we have to
+split the libutil files list to build readtex.c and showbuffer.c
+only if opengl is available.
+
+Add back dep_glu since it's used in util's meson.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236
+https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042
+
 [1].
 https://git.busybox.net/buildroot/tree/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch?h=2022.08
+[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/c33e2f731c2eab86bbad7b6a028f8a90ea40a00c
+[3] https://gitlab.freedesktop.org/mesa/demos/-/commit/ef24aae22978d4d357340074ca9a1c04d9cf81e6
 
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 [Bernd: rebased for version 9.0.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Romain: fix egl only builds in util]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- meson.build         | 19 ++++++++++++-------
- meson_options.txt   |  1 +
- src/egl/meson.build |  5 ++++-
- src/meson.build     |  4 +++-
- 4 files changed, 20 insertions(+), 9 deletions(-)
+ meson.build          |  5 ++++-
+ meson_options.txt    |  1 +
+ src/egl/meson.build  |  5 ++++-
+ src/util/meson.build | 12 +++++++++---
+ 4 files changed, 18 insertions(+), 5 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index e1968fab..a15699d6 100644
+index 3e39b5a2..f27e1a18 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -39,7 +39,10 @@ add_project_arguments(
@@ -34,34 +53,8 @@ index e1968fab..a15699d6 100644
  
  dep_epoll = dependency('epoll-shim', required : false)
  dep_gles1 = dependency('glesv1_cm', required : get_option('gles1'))
-@@ -87,15 +87,17 @@
- 
- dep_threads = dependency('threads')
- 
--dep_glu = dependency('glu', required : false)
--# GLU is part of OpenGL.Framework
--if not dep_glu.found() and host_machine.system() != 'darwin'
--  _glu_name = 'GLU'
--  if host_machine.system() == 'windows'
--    _glu_name = 'glu32'
-+if dep_gl.found()
-+  dep_glu = dependency('glu', required : false)
-+  # GLU is part of OpenGL.Framework
-+  if not dep_glu.found() and host_machine.system() != 'darwin'
-+    _glu_name = 'GLU'
-+    if host_machine.system() == 'windows'
-+      _glu_name = 'glu32'
-+    endif
-+    dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
-+      required : dep_x11.found())
-   endif
--  dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
--    required : dep_x11.found())
- endif
- 
- dep_glx = dependency('glx', required: false, disabler : true)
 diff --git a/meson_options.txt b/meson_options.txt
-index ddadd2e3..f5405698 100644
+index 832b916a..c954a710 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,5 +1,6 @@
@@ -87,21 +80,33 @@ index d1846921..42bf8ecd 100644
  
  if dep_gles1.found()
    subdir('opengles1')
-diff --git a/src/meson.build b/src/meson.build
-index 39cac78d..7607c6de 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -20,7 +20,9 @@
+diff --git a/src/util/meson.build b/src/util/meson.build
+index b4fe614f..4420f28a 100644
+--- a/src/util/meson.build
++++ b/src/util/meson.build
+@@ -22,13 +22,19 @@ inc_util = include_directories('.')
  
- subdir('glad')
+ files_libutil = files(
+   'glinfo_common.c',
+-  'readtex.c',
+-  'showbuffer.c',
+   'trackball.c',
+   'matrix.c',
+ )
  
--subdir('util')
+-_deps = [dep_glu, dep_m]
++_deps = [dep_m]
 +if dep_gl.found()
-+  subdir('util')
++  files_libutil += files(
++    'readtex.c',
++    'showbuffer.c',
++  )
++  _deps += dep_glu
 +endif
- 
++
  if dep_glut.found()
-   subdir('demos')
+   files_libutil += files('shaderutil.c')
+   _deps += dep_glut
 -- 
-2.37.3
+2.41.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
