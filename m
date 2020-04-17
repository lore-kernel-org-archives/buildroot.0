From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:16:15 +0200
Subject: [Buildroot] [git commit] package/libsemanage: bump version to 3.0
Message-ID: <20200417203421.6F4658F030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5199804621fdf1cb70fee71823eba5b4b4ac1164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Remove the Python2 check, as 3.0 has removed support for Python2.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsemanage/libsemanage.hash |  2 +-
 package/libsemanage/libsemanage.mk   | 20 +++++---------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 871ed192c4..85dafeb44d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 2576349d344492e73b468059767268dec1dabd8c35f3c7222c3ec2448737bc1c libsemanage-2.9.tar.gz
+sha256 a497b0720d54eac427f1f3f618eed417e50ed8f4e47ed0f7a1d391bd416e84cf libsemanage-3.0.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index fd90346049..deba5fafcd 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.9
-LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEMANAGE_VERSION = 3.0
+LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
@@ -31,27 +31,17 @@ HOST_LIBSEMANAGE_DEPENDENCIES = \
 	host-libsepol \
 	host-libselinux \
 	host-bzip2 \
-	host-swig
+	host-swig \
+	host-python3
 
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
-	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
-HOST_LIBSEMANAGE_MAKE_OPTS += \
+	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf \
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
