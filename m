From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:47:29 +0200
Subject: [Buildroot] [git commit] iprutils: bump version to 2.4.2 and update
	patches
Message-ID: <20140921174754.5291F9D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0611949495163af3dcf8eca72bdd5e27ae9e4753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../iprutils/iprutils-0001-Don-t-use-gettext.patch |   32 ++++++++++++++++++++
 ...low-CFLAGS-to-be-extended-from-the-enviro.patch |   31 +++++++++++++++++++
 .../iprutils/iprutils-01-dont-use-gettext.patch    |   30 ------------------
 .../iprutils-02-use-environment-cflags.patch       |   20 ------------
 package/iprutils/iprutils.mk                       |    2 +-
 5 files changed, 64 insertions(+), 51 deletions(-)

diff --git a/package/iprutils/iprutils-0001-Don-t-use-gettext.patch b/package/iprutils/iprutils-0001-Don-t-use-gettext.patch
new file mode 100644
index 0000000..a80cc87
--- /dev/null
+++ b/package/iprutils/iprutils-0001-Don-t-use-gettext.patch
@@ -0,0 +1,32 @@
+From 34fb0785f1d66ba1f79b470223426031f6258782 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 17 Sep 2014 17:48:54 +0100
+Subject: [PATCH 1/3] iprutils: Don't use gettext
+
+... since we don't have any translation.
+
+Based on the former patch by Jeremy Kerr.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ iprconfig.h |    4 +---
+ 1 files changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/iprconfig.h b/iprconfig.h
+index cad591a..4a1fa0d 100644
+--- a/iprconfig.h
++++ b/iprconfig.h
+@@ -11,9 +11,7 @@
+  *
+  **/
+ 
+-#include <libintl.h>
+-
+-#define _(string) gettext(string)
++#define _(string) (string)
+ #define __(string) (string)
+ #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
+ #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
+-- 
+1.7.1
+
diff --git a/package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch b/package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
new file mode 100644
index 0000000..dbfa008
--- /dev/null
+++ b/package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
@@ -0,0 +1,31 @@
+From 9a46afebdc63ba67cd95748f898969d6c622a129 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 17 Sep 2014 18:08:31 +0100
+Subject: [PATCH 1/2] iprutils: Allow CFLAGS to be extended from the environment
+
+We also remove -g, since we don't necessarily want to build with
+debugging symbols. Buildroot will add -g if needed.
+
+Based on the former patch by Thomas Petazzoni.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c4e2427..66c4942 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,7 +9,7 @@ CC = gcc
+ 
+ include version.mk
+ 
+-CFLAGS += -g -Wall $(IPR_DEFINES)
++override CFLAGS += -Wall $(IPR_DEFINES)
+ UTILS_VER = $(IPR_MAJOR_RELEASE).$(IPR_MINOR_RELEASE).$(IPR_FIX_LEVEL)
+ TAR = cd .. && tar -zcpf iprutils-$(UTILS_VER)-src.tgz --exclude .git --exclude CVS --exclude applied-patches --exclude series --exclude txt --exclude pc --exclude patches --exclude debug --exclude *~* iprutils
+ 
+-- 
+1.7.1
+
diff --git a/package/iprutils/iprutils-01-dont-use-gettext.patch b/package/iprutils/iprutils-01-dont-use-gettext.patch
deleted file mode 100644
index 8d3d5dd..0000000
--- a/package/iprutils/iprutils-01-dont-use-gettext.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0aa3952890e14f5447147ae4d0d37c515e4fefea Mon Sep 17 00:00:00 2001
-From: Jeremy Kerr <jk@ozlabs.org>
-Date: Fri, 26 Jul 2013 13:07:22 +0800
-Subject: [PATCH] iprconfig: Don't use gettext
-
-... since we don't have any translations.
-
-Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
----
- iprconfig.h |    4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/iprconfig.h b/iprconfig.h
-index 867b5ac..a9cdf5e 100644
---- a/iprconfig.h
-+++ b/iprconfig.h
-@@ -11,9 +11,7 @@
-  *
-  **/
- 
--#include <libintl.h>
--
--#define _(string) gettext(string)
-+#define _(string) (string)
- #define __(string) (string)
- #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
- #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
--- 
-1.7.10.4
-
diff --git a/package/iprutils/iprutils-02-use-environment-cflags.patch b/package/iprutils/iprutils-02-use-environment-cflags.patch
deleted file mode 100644
index 8eab450..0000000
--- a/package/iprutils/iprutils-02-use-environment-cflags.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Allow CFLAGS to be extended from the environment
-
-We also remove -g, since we don't necessarily want to build with
-debugging symbols. Buildroot will add -g if needed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -9,7 +9,7 @@
- 
- include version.mk
- 
--CFLAGS = -g -Wall $(IPR_DEFINES)
-+override CFLAGS += -Wall $(IPR_DEFINES)
- UTILS_VER = $(IPR_MAJOR_RELEASE).$(IPR_MINOR_RELEASE).$(IPR_FIX_LEVEL)
- TAR = cd .. && tar -zcpf iprutils-$(UTILS_VER)-src.tgz --exclude CVS --exclude applied-patches --exclude series --exclude txt --exclude pc --exclude patches --exclude debug --exclude *~* iprutils
- 
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 48934d0..53516b6 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION = 2.3.15
+IPRUTILS_VERSION = 2.4.2
 IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
 IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
