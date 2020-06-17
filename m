From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:01:20 +0200
Subject: [Buildroot] [git commit] package/openjdk: install header files to
 staging
Message-ID: <20200617195945.8A04981352@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9815f143ff31816329c02d6449ad253fe3af8963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These files are necessary for C or C++ programs to use the native java
interface (JNI.)

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/openjdk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index f3a4a616eb..22c9a777b5 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -20,6 +20,7 @@ endif
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
+OPENJDK_INSTALL_STAGING = YES
 
 # OpenJDK requires Alsa, cups, and X11 even for a headless build.
 # host-zip is needed for the zip executable.
@@ -145,6 +146,12 @@ define OPENJDK_INSTALL_TARGET_CMDS
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
 
+define OPENJDK_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/jvm
+	cp -dpfr $(@D)/build/linux-*-release/jdk/include/* \
+		$(STAGING_DIR)/usr/include/jvm
+endef
+
 # Demos and includes are not needed on the target
 ifeq ($(BR2_PACKAGE_OPENJDK_FULL_JDK),y)
 define OPENJDK_REMOVE_UNEEDED_JDK_DIRECTORIES
