From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Apr 2016 18:46:22 +0200
Subject: [Buildroot] [PATCH v1 2/4] rpi-userland: bump version
In-Reply-To: <1461429984-12561-1-git-send-email-ps.report@gmx.net>
References: <1461429984-12561-1-git-send-email-ps.report@gmx.net>
Message-ID: <1461429984-12561-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove upstream commited patch:
  0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch

- fix compile errror (missing include for va_list with uclibc-1.0.14):
  0006-dtmerge-add-missing-include-for-va_list.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch | 27 -----------------
 ...6-dtmerge-add-missing-include-for-va_list.patch | 34 ++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  2 +-
 3 files changed, 35 insertions(+), 28 deletions(-)
 delete mode 100644 package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
 create mode 100644 package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch

diff --git a/package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch b/package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
deleted file mode 100644
index c218898..0000000
--- a/package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8894136ff80a8c6eeadf1799af59aa3aa7b87827 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 24 Jan 2015 19:44:50 +0100
-Subject: [PATCH] makefiles/cmake/vmcs.cmake: allow to override
- VMCS_INSTALL_PREFIX
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- makefiles/cmake/vmcs.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefiles/cmake/vmcs.cmake b/makefiles/cmake/vmcs.cmake
-index 0f8641b..cc70cca 100644
---- a/makefiles/cmake/vmcs.cmake
-+++ b/makefiles/cmake/vmcs.cmake
-@@ -9,7 +9,7 @@ INCLUDE(CPack)
- # Where shall we install?
- if (ANDROID)
-   SET(VMCS_INSTALL_PREFIX "/vendor/brcm/islands" CACHE PATH "Prefix prepended to install directories" FORCE)
--else()
-+elseif(NOT DEFINED VMCS_INSTALL_PREFIX)
-   SET(VMCS_INSTALL_PREFIX "/opt/vc" CACHE PATH "Prefix prepended to install directories" FORCE)
- endif()
- 
--- 
-1.9.1
-
diff --git a/package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch b/package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch
new file mode 100644
index 0000000..f028f67
--- /dev/null
+++ b/package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch
@@ -0,0 +1,34 @@
+From 1ffed0e8601afb7e65545bd545772edd0fccc404 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 23 Apr 2016 17:48:13 +0200
+Subject: [PATCH] dtmerge: add missing include for va_list
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes compile error with uclibc-1.0.14:
+
+  In file included from rpi-userland-52eca998aa43f278314579dba4798a3fe1da46c3/host_applications/linux/apps/dtmerge/dtmerge.c:32:0:
+  rpi-userland-52eca998aa43f278314579dba4798a3fe1da46c3/helpers/dtoverlay/dtoverlay.h:65:54: error: unknown type name ???va_list???
+                                     const char *fmt, va_list args);
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ host_applications/linux/apps/dtmerge/dtmerge.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/host_applications/linux/apps/dtmerge/dtmerge.c b/host_applications/linux/apps/dtmerge/dtmerge.c
+index 9243da1..2ac8d39 100644
+--- a/host_applications/linux/apps/dtmerge/dtmerge.c
++++ b/host_applications/linux/apps/dtmerge/dtmerge.c
+@@ -28,6 +28,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <libfdt.h>
++#include <stdarg.h>
+ 
+ #include "dtoverlay.h"
+ 
+-- 
+2.8.1
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index c0a0186..2312fcf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8369e390999f4a7c3bc57e577247e0dd502c51f7
+RPI_USERLAND_VERSION = 52eca998aa43f278314579dba4798a3fe1da46c3
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.1.4
