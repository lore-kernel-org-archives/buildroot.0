From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:29:54 +0100
Subject: [Buildroot] [git commit] kmod: needs largefile
Message-ID: <20150304183008.5A31B803E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b185834163ea259b6b24c8bb65a876421282648
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 20 it requires largefile support.

http://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=481ad14550087c77c9df6d117c7a975a38a4ad33
 - Disable --disable-largefile. We already had possible bugs in the
   index implementation if this were passed. It's now fixed, but it's
   never tested. Disable it.

Fix build failure:
configure: error: --disable-largefile is not supported by kmod
package/pkg-generic.mk:172: recipe for target 'output/build/kmod-20/.stamp_configured' failed

Fixes:
http://autobuild.buildroot.net/results/f662d9230e4bc2da7dc56a2ffd493cc37254d377//
http://autobuild.buildroot.net/results/233ec8ee346e15d41658cffc6bbb4a6c9dd46746//

[Thomas:
 - use two separate 'depends on' conditions for BR2_STATIC_LIBS and
   BR2_LARGEFILE, like we do in most packages.
 - take this opportunity to also indicate the dependency on dynamic
   library in the comment, which was missing until now.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 8703e82..8d8a993 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_LARGEFILE
 	help
 	  handle kernel modules
 
@@ -16,3 +17,6 @@ config BR2_PACKAGE_KMOD_TOOLS
 	  modinfo, modprobe, rmmod).
 
 endif
+
+comment "kmod needs a toolchain w/ largefile, dynamic library"
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
