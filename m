From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:20 +0100
Subject: [Buildroot] [PATCH 5 of 9] alsa-lib: automatically enable python
 bindings if python is enabled
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <31daed037a4dabdb6466.1391343080@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For packages with optional python bindings, these bindings can be enabled
automatically when python is enabled. There is no need for explicit
configuration options, unless there is a very good reason to do so.

No legacy option was enabled as there is no impact on users that had the
original explicit symbol enabled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/alsa-lib/Config.in   |  9 ---------
 package/alsa-lib/alsa-lib.mk |  2 +-
 2 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -20,15 +20,6 @@ comment "alsa-lib needs a toolchain w/ t
 
 if BR2_PACKAGE_ALSA_LIB
 
-config BR2_PACKAGE_ALSA_LIB_PYTHON
-	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Add python support for alsa-lib.
-	  Python will be built and libpython will be installed
-	  in the target directory
-	  http://www.alsa-project.org/
-
 menu "ALSA lib selection"
 
 config BR2_PACKAGE_ALSA_LIB_DEVDIR
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -57,7 +57,7 @@ ifeq ($(BR2_avr32),y)
 ALSA_LIB_CFLAGS += -DAVR32_INLINE_BUG
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 ALSA_LIB_CONF_OPT += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
