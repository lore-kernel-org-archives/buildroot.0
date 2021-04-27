From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Apr 2021 08:52:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: needs gcc >= 5
Message-ID: <20210427065201.1162637-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

spa (i.e. plugins which can be disabled but also tools which can't be
disabled) fails to build on gcc 4.8 since bump to version 0.3.26 in
commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

In file included from ../spa/include/spa/pod/builder.h:34:0,
                 from ../spa/include/spa/param/audio/format-utils.h:34,
                 from ../spa/plugins/audioconvert/test-audioadapter.c:36:
../spa/include/spa/utils/hook.h:57:50: error: initializer element is not constant
 #define SPA_CALLBACKS_INIT(_funcs,_data) (struct spa_callbacks){ _funcs, _data, }
                                                  ^

Fixes:
 - http://autobuild.buildroot.org/results/e7a36ec7166a287667572e5140685e6371a9f107

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index ff26e4e361..851312a1a1 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
@@ -39,6 +40,7 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ threads"
+comment "pipewire needs a toolchain w/ threads, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.30.2
