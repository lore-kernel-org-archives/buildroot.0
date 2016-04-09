From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  9 Apr 2016 23:14:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] ipmitool: fix musl build
Message-ID: <1460236490-16747-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches to fix musl build.

The first patch avoids the redefinition of wchar_t by using autoconf to check
for the type wchar_t. Patching configure.ac requires to set AUTORECONF = YES
and add a post extract hook to create some missing files needed by autorefonf.

The second patch adds missing header include of <linux/params.h> needed for the
macro EXEC_PAGESIZE defined in the Linux Kernel headers.

Both patch send upstream:
https://sourceforge.net/p/ipmitool/mailman/message/35004226/
https://sourceforge.net/p/ipmitool/mailman/message/35004225/

Fixes:
http://autobuild.buildroot.net/results/75f/75fd6f1be0271bb15078c62f3effdbb67ac07427/
http://autobuild.buildroot.net/results/cac/cacf8179a9c8142eef69562462d3c3b0b20c2879/
http://autobuild.buildroot.net/results/c10/c1045882947ff7150c750088ae1981bd99134c54/
http://autobuild.buildroot.net/results/6a7/6a770f8a3dddb15ba4d95555e74b198799278dcf/
.. and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
 - use autoconf to check for wchar_t instead of using non-standardized GNU C
   extension macro __WCHAR_TYPE__ (Arnout Vandecappelle)
 - improve commit messages

---
 .../ipmitool/0001-Avoid-wchar_t-redefinition.patch | 60 ++++++++++++++++++++++
 ...-Add-missing-linux-param.h-header-include.patch | 39 ++++++++++++++
 package/ipmitool/ipmitool.mk                       |  9 ++++
 3 files changed, 108 insertions(+)
 create mode 100644 package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
 create mode 100644 package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch

diff --git a/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
new file mode 100644
index 0000000..b782318
--- /dev/null
+++ b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
@@ -0,0 +1,60 @@
+From c6fe3990713fe3d2be7a285982a0690af93cc8a7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 2 Apr 2016 19:45:14 +0200
+Subject: [PATCH 1/2] Avoid wchar_t redefinition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The musl C library does not define _WCHAR_T. Use autoconf to check for wchar_t.
+
+Upstream status: Pending
+https://sourceforge.net/p/ipmitool/mailman/message/35004226/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac             | 2 ++
+ src/plugins/imb/imbapi.h | 7 ++++++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b92c8a4..71cb4d4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,6 +22,8 @@ AC_CHECK_HEADERS([stdlib.h string.h sys/ioctl.h sys/stat.h unistd.h paths.h])
+ AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/socket.h])
+ AC_CHECK_HEADERS([sys/byteorder.h byteswap.h])
+ 
++AC_CHECK_TYPES([wchar_t])
++
+ AC_C_CONST
+ AC_C_INLINE
+ AC_C_BIGENDIAN
+diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
+index 74975c6..b862445 100644
+--- a/src/plugins/imb/imbapi.h
++++ b/src/plugins/imb/imbapi.h
+@@ -35,6 +35,11 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  *----------------------------------------------------------------------*/
+ #ifndef	_WINDEFS_H
+ #define	_WINDEFS_H
++
++#if HAVE_CONFIG_H
++# include <config.h>
++#endif
++
+ #ifndef FALSE
+ #define FALSE   0
+ #endif
+@@ -46,7 +51,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #endif
+ #ifndef WIN32   
+ /* WIN32 defines this in stdio.h */
+-#ifndef _WCHAR_T
++#if !defined(_WCHAR_T) && !defined(HAVE_WCHAR_T)
+ #define _WCHAR_T
+ typedef long    wchar_t;
+ #endif
+-- 
+2.8.0
+
diff --git a/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch b/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch
new file mode 100644
index 0000000..f7600e2
--- /dev/null
+++ b/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch
@@ -0,0 +1,39 @@
+From 962dca75e973b498cb52761c2fbb9004af07ceaf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 2 Apr 2016 19:47:21 +0200
+Subject: [PATCH 2/2] Add missing linux/param.h header include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following build failure under musl:
+
+imbapi.c: In function 'MapPhysicalMemory':
+imbapi.c:109:19: error: 'EXEC_PAGESIZE' undeclared (first use in this function)
+ # define PAGESIZE EXEC_PAGESIZE
+
+Upstream status: Pending
+https://sourceforge.net/p/ipmitool/mailman/message/35004225/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/plugins/imb/imbapi.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/plugins/imb/imbapi.c b/src/plugins/imb/imbapi.c
+index a9f26e0..26b6c9e 100644
+--- a/src/plugins/imb/imbapi.c
++++ b/src/plugins/imb/imbapi.c
+@@ -95,6 +95,9 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <stdlib.h>
+ #include <fcntl.h>
+ #include <string.h>
++#ifdef __linux__
++#include <linux/param.h>
++#endif
+ #endif
+ #include "imbapi.h"
+ #include <asm/socket.h>
+-- 
+2.8.0
+
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 348d43e..55b307a 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -10,6 +10,9 @@ IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPM
 IPMITOOL_LICENSE = BSD-3c
 IPMITOOL_LICENSE_FILES = COPYING
 
+# Patching configure.ac
+IPMITOOL_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 else
@@ -27,4 +30,10 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
+# This is needed to make autoreconf happy
+define IPMITOOL_CREATE_MISSING_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog $(@D)/COPYING
+endef
+IPMITOOL_POST_EXTRACT_HOOKS += IPMITOOL_CREATE_MISSING_FILES
+
 $(eval $(autotools-package))
-- 
2.8.0
