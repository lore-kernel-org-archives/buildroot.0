From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jul 2020 12:19:09 +0200
Subject: [Buildroot] [PATCH v4,1/1] package/zbar: bump to version 0.23.1
Message-ID: <20200728101909.2723100-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add new NLS dependency as well as a patch to fix a build failure
  without it
- Drop host-gettext (not needed since autoreconf was dropped with
  8729c4ef881b02ff85b7645b0ad309d6ae44fccf)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4 (after review of Yann E. Morin):
 - Report license issue about gettext.h and retrieve upstream patch:
   https://github.com/mchehab/zbar/issues/98

Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Drop host-gettext dependency

Changes v1 -> v2:
 - Correctly pass TARGET_NLS_LIBS to ZBAR_CONF_ENV

 ...zbarcam-zbarimg-get-rid-of-gettext-h.patch | 45 +++++++++++++++++++
 package/zbar/zbar.hash                        |  4 +-
 package/zbar/zbar.mk                          | 10 ++---
 3 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch

diff --git a/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch b/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
new file mode 100644
index 0000000000..009fd5f96f
--- /dev/null
+++ b/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
@@ -0,0 +1,45 @@
+From a133aea7880bbb56d75535e534716d0e16a3b61a Mon Sep 17 00:00:00 2001
+From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+Date: Tue, 28 Jul 2020 09:47:03 +0200
+Subject: [PATCH] zbarcam, zbarimg: get rid of gettext.h
+
+This doesn't seem to be needed at all for translations to
+work. Also, gettext.h uses a different license. So, let's get
+rid of it.
+
+Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+[Retrieved (and updated to remove gettext.h which is not in the
+tarball):
+https://github.com/mchehab/zbar/commit/a133aea7880bbb56d75535e534716d0e16a3b61a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zbar/gettext.h    | 294 ----------------------------------------------
+ zbarcam/zbarcam.c |   1 -
+ zbarimg/zbarimg.c |   1 -
+ 3 files changed, 296 deletions(-)
+ delete mode 100644 zbar/gettext.h
+
+diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
+index f7ea281..ad30101 100644
+--- a/zbarcam/zbarcam.c
++++ b/zbarcam/zbarcam.c
+@@ -35,7 +35,6 @@
+ #include <zbar.h>
+ 
+ #ifdef ENABLE_NLS
+-#include "../zbar/gettext.h"
+ # include <libintl.h>
+ # define _(string) gettext(string)
+ #else
+diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
+index 0796fd8..d05d832 100644
+--- a/zbarimg/zbarimg.c
++++ b/zbarimg/zbarimg.c
+@@ -40,7 +40,6 @@
+ #include <zbar.h>
+ 
+ #ifdef ENABLE_NLS
+-#include "../zbar/gettext.h"
+ # include <libintl.h>
+ # define _(string) gettext(string)
+ #else
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index eae5b7ebf5..4277091892 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e99fb8f3be85a76fe24784ad67fecb2da3a02b1e432696b05eefe212d448ad2e zbar-0.23.tar.bz2
-sha256 44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1 LICENSE.md
+sha256  dad260b47ef887a639e840a89e5e6e132217b6bba2a8473565d1f459bcb97c1f  zbar-0.23.1.tar.bz2
+sha256  44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1  LICENSE.md
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 0550f3e23f..f75741ded9 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,17 +4,17 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 0.23
+ZBAR_VERSION = 0.23.1
 ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE.md
 ZBAR_INSTALL_STAGING = YES
-ZBAR_DEPENDENCIES = libv4l jpeg
-# add host-gettext for AM_ICONV macro
-ZBAR_DEPENDENCIES += host-gettext
+ZBAR_DEPENDENCIES = libv4l jpeg $(TARGET_NLS_DEPENDENCIES)
 # uses C99 features
-ZBAR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+ZBAR_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
+	LIBS=$(TARGET_NLS_LIBS)
 ZBAR_CONF_OPTS = \
 	--disable-doc \
 	--without-imagemagick \
-- 
2.27.0
