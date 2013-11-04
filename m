From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 22:00:00 +0100
Subject: [Buildroot] [git commit] libnl: do not allow to build tools on
	static lib configs
Message-ID: <20131104211055.53D7E9BCBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=337a59d9e47772c89ecd1e4523e300e5e3c642ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the libnl tools requires the <dlfcn.h> header, which is not
compatible with static only builds. Therefore, this commit makes the
libnl tools option depend on !BR2_PREFER_STATIC_LIB.

Fixes:

   http://autobuild.buildroot.org/results/573/57340b9bd2db3a523836e02e01cba6f7c17c8ca7/build-end.log

[Peter: fix tools comment dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libnl/Config.in |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index fec10d3..1173278 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -6,11 +6,19 @@ config BR2_PACKAGE_LIBNL
 
 	  http://people.suug.ch/~tgr/libnl/
 
+comment "libnl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBNL
+
 config BR2_PACKAGE_LIBNL_TOOLS
 	bool "install tools"
-	depends on BR2_PACKAGE_LIBNL
+	# uses <dlfcn.h>
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Install binary tools.
 
-comment "libnl needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libnl tools need a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
+endif
