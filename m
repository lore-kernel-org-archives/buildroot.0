From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 12 Oct 2016 20:42:47 -0700
Subject: [Buildroot] [PATCH 3/3] inadyn: bump to version 2.0
In-Reply-To: <20161013034247.21603-1-bluemrp9@gmail.com>
References: <20161013034247.21603-1-bluemrp9@gmail.com>
Message-ID: <20161013034247.21603-3-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/inadyn/Config.in   |  2 ++
 package/inadyn/inadyn.hash |  4 ++--
 package/inadyn/inadyn.mk   | 14 +++++++++++---
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a23c78..bd85c3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1260,6 +1260,7 @@ F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
 
 N:	Ryan Coe <bluemrp9@gmail.com>
+F:	package/inadyn/
 F:	package/libite/
 
 N:	Ryan Wilkins <ryan@deadfrog.net>
diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 65f6851..55894ae 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_INADYN
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBITE
 	bool "inadyn"
 	depends on BR2_USE_MMU # Uses fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 940bd16..a4e60c9 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,2 +1,2 @@
-# From https://github.com/troglobit/inadyn/releases/download/1.99.12/inadyn-1.99.12.tar.xz.md5
-md5	a620c9eab9cd31c8923e7264b08376f3	inadyn-1.99.12.tar.xz
+# Locally computed
+sha256	763c53eb3856decfe8b921cab8a54b428b079a62264fbcf6c89690713d63529a  inadyn-v2.0.tar.gz
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index cf071da..4885831 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.99.12
-INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/$(INADYN_VERSION)
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
+INADYN_VERSION = v2.0
+INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING
+INADYN_AUTORECONF = YES
+
+# Needed for autoreconf to work properly, see ./autogen.sh
+define INADYN_FIXUP_M4_DIR
+	mkdir $(@D)/m4
+endef
+INADYN_POST_EXTRACT_HOOKS += INADYN_FIXUP_M4_DIR
+
+INADYN_DEPENDENCIES += host-pkgconf libconfuse libite
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 INADYN_CONF_OPTS += --enable-openssl
-- 
2.9.3
