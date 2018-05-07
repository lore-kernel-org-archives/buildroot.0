From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 May 2018 20:25:17 +0200
Subject: [Buildroot] [PATCH 2/5] package/stress-ng: bump version,
 fix to use system xattr header
In-Reply-To: <cover.1525717511.git.yann.morin.1998@free.fr>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
Message-ID: <e3aef063f700d64bcb91d0b139ebef0a834e85b3.1525717511.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/stress-ng/0001-xattr-from-libc.patch | 49 ++++++++++++++++++++++++++++
 package/stress-ng/stress-ng.hash             |  2 +-
 package/stress-ng/stress-ng.mk               |  3 +-
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 package/stress-ng/0001-xattr-from-libc.patch

diff --git a/package/stress-ng/0001-xattr-from-libc.patch b/package/stress-ng/0001-xattr-from-libc.patch
new file mode 100644
index 0000000000..0064b54470
--- /dev/null
+++ b/package/stress-ng/0001-xattr-from-libc.patch
@@ -0,0 +1,49 @@
+Use system <sys/xattr.h>
+
+The one from attr is no longer installed with latest version.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/Makefile.config b/Makefile.config
+index ee613273..136705cc 100644
+--- a/Makefile.config
++++ b/Makefile.config
+@@ -173,10 +173,10 @@ endif
+ endif
+ 
+ ifndef $(HAVE_XATTR_H)
+-HAVE_XATTR_H = $(shell $(MAKE) -f Makefile.config --no-print-directory $(HAVE_NOT) HEADER=attr/xattr.h have_header_h)
++HAVE_XATTR_H = $(shell $(MAKE) -f Makefile.config --no-print-directory $(HAVE_NOT) HEADER=sys/xattr.h have_header_h)
+ ifeq ($(HAVE_XATTR_H),1)
+ 	CONFIG_CFLAGS += -DHAVE_XATTR_H
+-$(info autoconfig: using attr/xattr.h)
++$(info autoconfig: using sys/xattr.h)
+ endif
+ endif
+ 
+diff --git a/stress-sysbadaddr.c b/stress-sysbadaddr.c
+index ed04b286..043c61d9 100644
+--- a/stress-sysbadaddr.c
++++ b/stress-sysbadaddr.c
+@@ -34,7 +34,7 @@
+ #endif
+ #endif
+ #if defined(__linux__) && defined(HAVE_XATTR_H)
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #endif
+ 
+ #include <poll.h>
+diff --git a/stress-xattr.c b/stress-xattr.c
+index e083de7a..625ae960 100644
+--- a/stress-xattr.c
++++ b/stress-xattr.c
+@@ -26,7 +26,7 @@
+ 
+ #if defined(__linux__) && defined(HAVE_XATTR_H)
+ 
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ 
+ /*
+  *  stress_xattr
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index e735439a7e..3802450175 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0e1d7733b35f594f7461dedbf836bd4966d0611da4cd4e85cde4804d2a425e6d	stress-ng-0.06.15.tar.gz
+sha256  a6f81dcc58d856e92136bcb8204f12e6070da4ae492d06df69b847d685d1bb11  stress-ng-0.09.26.tar.xz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 794e87554e..81ff4d736b 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.06.15
+STRESS_NG_VERSION = 0.09.26
+STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.14.1
