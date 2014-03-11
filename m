From: Uwe Kindler <uwe_kindler@web.de>
Date: Tue, 11 Mar 2014 16:38:32 +0100
Subject: [Buildroot] [PATCH] boost binary names layout configuration
Message-ID: <531F2DF8.3080502@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following patch adds support for configuration of boost binary names 
layout. We have a cross platform library that uses boost. On Windows it 
is not possible to build boost with system layout and we have to use 
tagged layout. Also for Ubuntu we use tagged layout and therefore it 
would be great to have the option to use tagged layout for buildroot.


  package/boost/Config.in | 28 ++++++++++++++++++++++++++++
  package/boost/boost.mk  | 14 +++++++++++---
  2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 68c3909..3ccb659 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -16,6 +16,34 @@ config BR2_PACKAGE_BOOST

  if BR2_PACKAGE_BOOST

+choice
+    prompt "Layout"
+    default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+    help
+      Selects the layout of boost binary names
+
+config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+    bool "system"
+    help
+      Binaries names do not include the Boost version number or the 
name and
+      version number of the compiler.
+
+config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
+    bool "tagged"
+    help
+      Names of boost binaries include the encoded build properties such as
+      variant and threading, but do not including compiler name and 
version, or
+      Boost version. This option is useful if you build several 
variants of
+      Boost, using the same compiler.
+
+config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
+    bool "versioned"
+    help
+      Names of boost binaries include the Boost version number, name and
+      version of the compiler and encoded build properties.
+
+endchoice
+
  config BR2_PACKAGE_BOOST_CHRONO
      bool "boost-chrono"

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7aab614..05e7cf6 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -82,6 +82,14 @@ endif
  BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst 
$(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
  BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), 
--without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))

+ifeq ($(BR2_PACKAGE_BOOST_LAYOUT_SYSTEM),y)
+BOOST_LAYOUT = system
+else ifeq ($(BR2_PACKAGE_BOOST_LAYOUT_TAGGED),y)
+BOOST_LAYOUT = tagged
+else
+BOOST_LAYOUT = versioned
+endif
+
  define BOOST_CONFIGURE_CMDS
      (cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
      echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : 
<cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > 
$(@D)/user-config.jam
@@ -99,7 +107,7 @@ define BOOST_INSTALL_TARGET_CMDS
      --user-config=$(@D)/user-config.jam \
      $(BOOST_OPT) \
      --prefix=$(TARGET_DIR)/usr \
-    --layout=system install )
+    --layout=$(BOOST_LAYOUT) install )
  endef

  define HOST_BOOST_BUILD_CMDS
@@ -114,7 +122,7 @@ define HOST_BOOST_INSTALL_CMDS
      --user-config=$(@D)/user-config.jam \
      $(HOST_BOOST_OPT) \
      --prefix=$(HOST_DIR)/usr \
-    --layout=system install )
+    --layout=$(BOOST_LAYOUT) install )
  endef

  define BOOST_INSTALL_STAGING_CMDS
@@ -122,7 +130,7 @@ define BOOST_INSTALL_STAGING_CMDS
      --user-config=$(@D)/user-config.jam \
      $(BOOST_OPT) \
      --prefix=$(STAGING_DIR)/usr \
-    --layout=system install)
+    --layout=$(BOOST_LAYOUT) install)
  endef

  $(eval $(generic-package))

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140311/a1cd7f6a/attachment.html>
