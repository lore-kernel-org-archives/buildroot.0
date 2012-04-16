From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 22:01:17 +0200
Subject: [Buildroot] [git commit] boost: cleanup
Message-ID: <20120416200221.794AB96A12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=581af082c517f77bb998da318a216ecef60480e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move common staging/target bjam arguments into BOOST_OPT.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/boost.mk |   20 ++++++--------------
 1 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8864bf9..8b8a3cf 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -45,6 +45,12 @@ else
 BOOST_FLAGS += --without-icu
 endif
 
+BOOST_OPT += toolset=gcc \
+	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
+	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
+	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
+	     threading=$(if $(BR2_PACKAGE_BOOST_MULTITHREADED),multi,single)
+
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
 # posix backend needs monetary.h which isn't available on uClibc
@@ -54,10 +60,6 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
-BOOST_LINK = $(if $(BR2_PREFER_STATIC_LIB),static,shared)
-BOOST_MULTI = $(if $(BR2_PACKAGE_BOOST_MULTITHREADED),multi,single)
-BOOST_VARIANT = $(if $(BR2_ENABLE_DEBUG),debug,release)
-
 BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
 
@@ -70,11 +72,6 @@ endef
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -q -d+2 \
 	--user-config=$(@D)/user-config.jam \
-	toolset=gcc \
-	variant=$(BOOST_VARIANT) \
-	link=$(BOOST_LINK) \
-	threading=$(BOOST_MULTI) \
-	runtime-link=$(BOOST_LINK) \
 	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
 	--layout=system install )
@@ -83,12 +80,7 @@ endef
 define BOOST_INSTALL_STAGING_CMDS
 	(cd $(@D) && ./bjam -d+2 \
 	--user-config=$(@D)/user-config.jam \
-	toolset=gcc \
-	variant=$(BOOST_VARIANT) \
-	link=$(BOOST_LINK) \
-	threading=$(BOOST_MULTI) \
 	$(BOOST_OPT) \
-	runtime-link=$(BOOST_LINK) \
 	--prefix=$(STAGING_DIR)/usr \
 	--layout=system install)
 endef
