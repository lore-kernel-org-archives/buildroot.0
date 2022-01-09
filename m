Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C37FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65C860792;
	Sun,  9 Jan 2022 15:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqMJrABsk8Vy; Sun,  9 Jan 2022 15:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FAD360B98;
	Sun,  9 Jan 2022 15:49:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7441BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2C04028B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XwzJm5qGHwd for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412BB40273
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A69582AA2; Sun,  9 Jan 2022 15:43:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:48:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a51177af14a2ddaa6431bb7fc618fe138b59b72
X-Git-Newrev: a2e1a39a203c5476fb464d8ec164a9c6b0fc4aa0
X-Patchwork-Hint: ignore
Message-Id: <20220109154316.6A69582AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: bump to version 1.48.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2e1a39a203c5476fb464d8ec164a9c6b0fc4aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed since
https://gitlab.gnome.org/GNOME/gvfs/-/commit/eee4bb846038e4440ffc8a591869974639c72bb0)

https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.48.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-meson.build-fix-linking-with-libmetadata.patch | 78 ----------------------
 package/gvfs/gvfs.hash                             |  4 +-
 package/gvfs/gvfs.mk                               |  2 +-
 3 files changed, 3 insertions(+), 81 deletions(-)

diff --git a/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch b/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
deleted file mode 100644
index 3ee4a28e94..0000000000
--- a/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 731256d7517f0d9cf0b999bb22f864080d5e8690 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 18 Jul 2020 10:00:50 +0200
-Subject: [PATCH] meson.build: fix linking with libmetadata
-
-libmetadata is built as a static library and depends on libgvfscommon so
-change the dependencies order to put libgvfscommon_dep after
-libmetadata_dep or gvfsd-metadata will fail to link on:
-
-FAILED: metadata/gvfsd-metadata
-/home/naourr/work/instance-3/output-1/host/bin/arm-none-linux-gnueabi-gcc  -o metadata/gvfsd-metadata 'metadata/45447b7@@gvfsd-metadata@exe/meta-daemon.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group common/libgvfscommon.so metadata/libmetadata.a /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgio-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgobject-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libglib-2.0.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../common:$ORIGIN/' -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/common -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/metadata
-metadata/libmetadata.a(metatree.c.o): In function `safe_open':
-metatree.c:(.text+0x9c8): undefined reference to `gvfs_randomize_string'
-collect2: error: ld returned 1 exit status
-
-Apply this change in the whole source code and not only for
-gvfsd-metadata to avoid any other build failures.
-
-Fixes:
- - http://autobuild.buildroot.org/results//fa892c41b6b9285839a0164b000e37fb04dcc194
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/92]
----
- client/meson.build   | 2 +-
- metadata/meson.build | 5 +++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/client/meson.build b/client/meson.build
-index 8f57d0d3..1d251481 100644
---- a/client/meson.build
-+++ b/client/meson.build
-@@ -33,8 +33,8 @@ sources = uri_parser_sources + uri_utils + files(
- 
- deps = [
-   gio_unix_dep,
--  libgvfscommon_dep,
-   libmetadata_dep,
-+  libgvfscommon_dep,
- ]
- 
- cflags = [
-diff --git a/metadata/meson.build b/metadata/meson.build
-index 4e120d18..5699e6f2 100644
---- a/metadata/meson.build
-+++ b/metadata/meson.build
-@@ -72,8 +72,8 @@ libmetadata_dep = declare_dependency(
- )
- 
- deps = [
--  libgvfscommon_dep,
-   libmetadata_dep,
-+  libgvfscommon_dep,
- ]
- 
- if enable_gudev
-@@ -105,8 +105,8 @@ if enable_devel_utils
-       app + '.c',
-       include_directories: top_inc,
-       dependencies: [
--        libgvfscommon_dep,
-         libmetadata_dep,
-+        libgvfscommon_dep,
-       ],
-       c_args: cflags,
-     )
-@@ -119,6 +119,7 @@ if enable_devel_utils
-       include_directories: top_inc,
-       dependencies: [
-         libmetadata_dep,
-+        libgvfscommon_dep,
-         libxml_dep,
-       ],
-       c_args: cflags,
--- 
-2.27.0
-
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 2ee945e710..f4a5364f1f 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.44/gvfs-1.44.1.sha256sum
-sha256  50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46  gvfs-1.44.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
+sha256  b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2  gvfs-1.48.1.tar.xz
 
 # Hash for license file
 sha256  45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4  COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index fc77e8e1aa..4174592455 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.44
+GVFS_VERSION_MAJOR = 1.48
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
