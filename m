From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:38:14 +0200
Subject: [Buildroot] [git commit] shellinabox: fix build on musl
Message-ID: <20160804203840.2B52B7FB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35ccd358b304413229fc2e32f1318426cbb23a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the build of shellinabox with the musl C library,
which requires two changes:

 - A patch to include <sys/ttydefaults.h>, which is needed to get the
   definitions of TTYDEF_*

 - A hack to workaround what seems to be a problem in musl itself (musl
   does #define utmp utmpx, which causes some symbol conflicts down the
   road). Since anyway the utmpx implementation is just a set of stubs
   in musl, we simply make shellinabox believe that <utmpx.h> is not
   available by passing the appropriate variable. The musl issue has
   been reported at http://www.openwall.com/lists/musl/2016/08/04/8.

Fixes:

  http://autobuild.buildroot.net/results/1847cab964957da3c9bf4911a5ad3602b3c82431/

Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0002-launcher.c-include-sys-ttydefaults.h.patch | 27 ++++++++++++++++++++++
 package/shellinabox/shellinabox.mk                 |  6 +++++
 2 files changed, 33 insertions(+)

diff --git a/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch b/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch
new file mode 100644
index 0000000..caa5456
--- /dev/null
+++ b/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch
@@ -0,0 +1,27 @@
+From c8d9df500b1ca83ad6da9b6055549adaba6ee0d3 Mon Sep 17 00:00:00 2001
+From: Olivier Singla <olivier.singla@gmail.com>
+Date: Thu, 4 Aug 2016 22:05:08 +0200
+Subject: [PATCH] launcher.c: include <sys/ttydefaults.h>
+
+This include is needed to get the definition of TTYDEF_*.
+
+Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
+---
+ shellinabox/launcher.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/shellinabox/launcher.c b/shellinabox/launcher.c
+index 2bac171..c8ba6cb 100644
+--- a/shellinabox/launcher.c
++++ b/shellinabox/launcher.c
+@@ -66,6 +66,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <sys/utsname.h>
++#include <sys/ttydefaults.h>
+ #include <termios.h>
+ #include <unistd.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index e4e0b06..1173ef7 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -20,4 +20,10 @@ SHELLINABOX_CONF_OPTS = \
 	--disable-runtime-loading \
 	--enable-ssl
 
+# musl's implementation of utmpx is a dummy one, and some aspects of
+# it cause build failures in shellinabox
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+SHELLINABOX_CONF_ENV += ac_cv_header_utmpx_h=no
+endif
+
 $(eval $(autotools-package))
