From: Martin Bark <martin@barkynet.com>
Date: Thu, 25 Feb 2016 13:23:32 +0000
Subject: [Buildroot] [PATCH 1/4] package/iputils: removed dependency on
	openssl
Message-ID: <1456406615-7324-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iputils does not have to be built with openssl so remove selecting
BR2_PACKAGE_OPENSSL and make the dependency optional

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/iputils/Config.in  | 1 -
 package/iputils/iputils.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 40580d2..c83e414 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
-	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_MMU # fork()
 	help
 	  This package is set of small useful utilities for Linux networking.
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 6392dec..953f1f5 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -16,7 +16,6 @@ IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
-IPUTILS_DEPENDENCIES = openssl
 
 # Build after busybox so target ends up with this package's full
 # versions of the applications instead of busybox applets.
@@ -34,6 +33,13 @@ else
 IPUTILS_MAKE_OPTS += USE_CAP=no
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IPUTILS_MAKE_OPTS += USE_CRYPTO=yes
+IPUTILS_DEPENDENCIES += openssl
+else
+IPUTILS_MAKE_OPTS += USE_CRYPTO=no
+endif
+
 define IPUTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
 endef
-- 
2.5.0
