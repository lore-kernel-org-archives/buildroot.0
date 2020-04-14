From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:22 -0500
Subject: [Buildroot] [PATCH v3 2/8] package/libsemanage: bump version to 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Other changes:
  - Remove the Python2 check, as 3.0 has removed support for Python2.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v3
 - Matt switched over the versioning to use dates
---
 package/libsemanage/libsemanage.hash |  5 +++--
 package/libsemanage/libsemanage.mk   | 20 +++++++-------------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 871ed192c4..3090847686 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,6 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 2576349d344492e73b468059767268dec1dabd8c35f3c7222c3ec2448737bc1c libsemanage-2.9.tar.gz
+# Generated locally as upstream releases in artifact
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d libsemanage-20191204.tar.gz
 
 # Hash for license file
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 libsemanage/COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index fd90346049..0bd529f876 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.9
-LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEMANAGE_VERSION = $(LIBSELINUX_VERSION)
+LIBSEMANAGE_SITE = $(LIBSELINUX_SITE)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
-LIBSEMANAGE_LICENSE_FILES = COPYING
+LIBSEMANAGE_LICENSE_FILES = $(LIBSEMANAGE_NAME)/COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
 LIBSEMANAGE_INSTALL_STAGING = YES
 
+LIBSEMANAGE_SUBDIR = $(@D)/$(LIBSEMANAGE_NAME)
+
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 define LIBSEMANAGE_BUILD_CMDS
@@ -31,7 +33,8 @@ HOST_LIBSEMANAGE_DEPENDENCIES = \
 	host-libsepol \
 	host-libselinux \
 	host-bzip2 \
-	host-swig
+	host-swig \
+	host-python3
 
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
@@ -39,19 +42,10 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
 	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
-else
-HOST_LIBSEMANAGE_DEPENDENCIES += host-python
-HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
-	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
-endif
 
 define HOST_LIBSEMANAGE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) all
-- 
2.17.1
