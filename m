From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  4 Mar 2015 08:06:22 +0100
Subject: [Buildroot] [PATCH v2] kmod: needs largefile
Message-ID: <1425452782-10909-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---

Notes:
    v2:
     - Add sob line

 package/kmod/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 8703e82..745c9e2 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_STATIC_LIBS && BR2_LARGEFILE
 	help
 	  handle kernel modules
 
@@ -16,3 +16,6 @@ config BR2_PACKAGE_KMOD_TOOLS
 	  modinfo, modprobe, rmmod).
 
 endif
+
+comment "kmod needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
-- 
2.3.1
