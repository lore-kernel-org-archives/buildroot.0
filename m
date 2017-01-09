From: James Knight <james.knight@rockwellcollins.com>
Date: Mon,  9 Jan 2017 09:08:17 -0500
Subject: [Buildroot] [PATCH v2 1/1] rpm: disable static build support
Message-ID: <20170109140817.10184-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The RPM package requires dynamic linking support (dlfcn.h) for its
capabilities related to plugins (and possibly more). The following
commit adds a dependency to !BR2_STATIC_LIBS.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - Cleanup commit message (suggested by Yann E. MORIN [1]).

Indirectly fixes:

  http://autobuild.buildroot.net/results/139/1394a6e43529a3969572912dcbdd5606770beeeb/
  http://autobuild.buildroot.net/results/f4f/f4f8d21e70fcd79668847407586db2bf3e56feb5/
  http://autobuild.buildroot.net/results/80e/80e40419d657ee16b4d38f08d894822e532ab63d/
  http://autobuild.buildroot.net/results/f36/f368e1e7310a3cf8266fd351b8b76496868af7e7/

A series of dependent libraries will not be tested for and built with
correctly. For the above autobuild errors, the explicit issue is testing
for libmagic support. Since libmagic and libz are statically built,
attempts to perform an autoconf test for libmagic will fail since it
does not have decompression symbols defined. RPM package isn't aware of
private libmagic dependencies since the dependent library does not
provide a pkg-config meta information [2].

[1]: https://github.com/rpm-software-management/rpm/pull/118
[2]: https://patchwork.ozlabs.org/patch/712214/
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
-- 
2.8.4.windows.1
