From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 16:29:22 -0700
Subject: [Buildroot] [PATCH 4/4] package/openjdk: add support for building
 the full jdk
In-Reply-To: <20200417232922.3762195-1-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
Message-ID: <20200417232922.3762195-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Some users may require the full JDK on the target to debug or compile programs.
This change is relatively trivial to add.

To install the full JDK, do the following:
  - Add a new entry in package/openjdk/Config.in with the variable
    BR2_PACKAGE_OPENJDK_FULL_JDK

  - Check for this variable in openjdk.mk, if it is selected set the following
    variables:
      OPENJDK_INSTALL_DIR = jdk
      OPENJDK_MAKE_TARGET=jdk-image
    Otherwise, set the variables to jre and legacy-jre-image respectively.

  - change legacy-jre-image to $(OPENJDK_MAKE_TARGET) in the OPENJD_BUILD_CMDS
    define.

  - Change jre/* to $(OPENJDK_INSTALL_DIR)/* in the OPENJDK_INSTALL_TARGET_CMDS
    define

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/Config.in  |  7 +++++++
 package/openjdk/openjdk.mk | 12 ++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 61294ec49f..158f3031c3 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -49,6 +49,13 @@ config BR2_PACKAGE_OPENJDK
 
 if BR2_PACKAGE_OPENJDK
 
+config BR2_PACKAGE_OPENJDK_FULL_JDK
+	bool "Build the full JDK"
+	help
+	  Install the full JDK instead of just the run time.
+	  Selecting this option will increase the file system by
+	  approximately 110M.
+
 choice
 	prompt "openjdk variant"
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 19e71e98b2..e8803f3cb5 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -46,6 +46,14 @@ OPENJDK_JVM_VARIANT = zero
 OPENJDK_DEPENDENCIES += libffi
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJDK_FULL_JDK),y)
+OPENJDK_INSTALL_DIR = jdk
+OPENJDK_MAKE_TARGET=jdk-image
+else
+OPENJDK_INSTALL_DIR = jre
+OPENJDK_MAKE_TARGET=legacy-jre-image
+endif
+
 # Because jre/lib has a modules file, installation on a system with a merged
 # /usr directory, and a built Kernel before OpenJDK, the following error
 # occurs: "cp: cannot overwrite directory '/usr/lib/modules with non-directory"
@@ -117,14 +125,14 @@ endef
 # Make -jn is unsupported. Instead, set the "--with-jobs=" configure option,
 # and use $(MAKE1).
 define OPENJDK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) legacy-jre-image
+	$(TARGET_MAKE_ENV) $(OPENJDK_CONF_ENV) $(MAKE1) -C $(@D) $(OPENJDK_MAKE_TARGET)
 endef
 
 # Calling make install always builds and installs the JDK instead of the JRE,
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
+	cp -dpfr $(@D)/build/linux-*-release/images/$(OPENJDK_INSTALL_DIR)/* \
 		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../../$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
-- 
2.25.2
