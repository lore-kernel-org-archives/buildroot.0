From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Mar 2019 10:12:36 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: add custom configure
 options last
Message-ID: <20190301091158.5148481007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d69d9db3ce0ba59193edbe81d8299a2aee8c61a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows all options set by Buildroot to be overridden.

Signed-off-by: James Grant <james.grant@jci.com>
[Peter: drop original line as pointed out by Thomas]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 11c6684812..e71878a487 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -52,8 +52,6 @@ else
 # option '-no-avx512' (available for latest only)
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
-
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT5BASE_CONFIGURE_OPTS += -kms
 QT5BASE_DEPENDENCIES += libdrm
@@ -296,6 +294,9 @@ define QT5BASE_CONFIGURE_HOSTCC
 	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
 endef
 
+# Must be last so can override all options set by Buildroot
+QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
+
 define QT5BASE_CONFIGURE_CMDS
 	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
 	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
