From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:21 +0100
Subject: [Buildroot] [PATCH 6 of 9] libdnet: automatically enable python
 bindings if python is enabled
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <6531e80fd63bde5839ec.1391343081@argentina>
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
 package/libdnet/Config.in  |  13 -------------
 package/libdnet/libdnet.mk |   2 +-
 2 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -4,16 +4,3 @@ config BR2_PACKAGE_LIBDNET
 	  libdnet - simplified interface to low-level networking routines.
 
 	  http://libdnet.sourceforge.net/
-
-if BR2_PACKAGE_LIBDNET
-
-config BR2_PACKAGE_LIBDNET_PYTHON
-	bool "libdnet python module"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  dnet module for python
-
-comment "dnet module for python requires python package"
-	depends on !BR2_PACKAGE_PYTHON
-
-endif
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -14,7 +14,7 @@ LIBDNET_CONF_OPT = \
 	--with-gnu-ld \
 	--with-check=no
 
-ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBDNET_DEPENDENCIES = python
 LIBDNET_CONF_OPT += --with-python
 LIBDNET_MAKE_OPT = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
