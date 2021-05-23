From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 14:27:59 +0200
Subject: [Buildroot] [git commit] package/pipewire: needs dynamic library
Message-ID: <20210523115913.C2017872F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02656c30c9e488181705908be9040b01943e786f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 0.3.26 in commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9, pipewire needs dynamic library
support for at least spa plugins (which can be disabled) and spa tools
(which can't be disabled)

Fixes:
 - http://autobuild.buildroot.org/results/ea05fa6ca39b1ac55e301e5c11d3a62080d36e9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 851312a1a1..b6809c228e 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
@@ -40,7 +41,7 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ threads, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, threads, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
