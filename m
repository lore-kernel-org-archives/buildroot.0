From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 12 Nov 2013 14:31:45 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
Message-ID: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/omniorb/Config.in  |    9 +++++++++
 package/omniorb/omniorb.mk |    8 ++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
index 6326688..22527fc 100644
--- a/package/omniorb/Config.in
+++ b/package/omniorb/Config.in
@@ -10,5 +10,14 @@ config BR2_PACKAGE_OMNIORB
 
 	  http://omniorb.sourceforge.net/
 
+if BR2_PACKAGE_OMNIORB
+
+config BR2_PACKAGE_OMNIORB_WITH_SERVICES
+        bool "COS Naming Service"
+        default y
+        help
+          omniORB COS Naming Service
+endif
+
 comment "omniORB needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 490ff93..cad50f8 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -24,6 +24,14 @@ OMNIORB_INSTALL_TARGET = YES
 OMNIORB_CONF_OPT += --disable-longdouble
 HOST_OMNIORB_CONF_OPT += --disable-longdouble
 
+define OMNIORB_ENABLE_SERVICES
+	$(SED) 's:SUBDIRS += lib:SUBDIRS += lib services:g' $(@D)/src/dir.mk
+endef
+
+ifeq ($(BR2_PACKAGE_OMNIORB_WITH_SERVICES),y)
+	OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ENABLE_SERVICES
+endif
+
 # omniORB is not completely cross-compile friendly and has some
 # assumptions where a couple host tools must be built and then
 # used by the target build.  The host tools generate code from
-- 
1.7.1
