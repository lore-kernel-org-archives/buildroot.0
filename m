From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:34:39 +1300
Subject: [Buildroot] [git commit] rpm: disable static build support
Message-ID: <20170124103455.74A6A81EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc89b6f39f73bd4dd937f2089cbbcff7d0d82277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RPM package requires dynamic linking support (dlfcn.h) for its
capabilities related to plugins (and possibly more). The following
commit adds a dependency to !BR2_STATIC_LIBS.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 8b7705d..9b4c8a7 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,10 +1,11 @@
-comment "rpm needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rpm needs a toolchain w/ dynamic library and threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
