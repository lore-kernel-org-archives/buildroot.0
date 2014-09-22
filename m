From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:27:22 +0200
Subject: [Buildroot] [git commit] swig: add swig2.0 -> swig symlink
Message-ID: <20140922172853.E2DBF9D74D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03ecca90d38448491f106c6555905de0d904fab0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cmake detection script provided with cmake will first look for a
binary called swig2.0 then for a binary called swig.

host-swig only installs a binary called swig, but if the host
distribution has instaled a binary called swig2.0, it will be
preferred over our swig, which isn't great. This patch creates a
symlink swig2.0 -> swig to prevent this from happening.

[Thomas: add comment in the code and improve the commit log]

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swig/swig.mk |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index e9ef521..3558f9a 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION = 2.0.12
+SWIG_MAJOR = 2.0
+SWIG_VERSION = $(SWIG_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPT = \
@@ -14,4 +15,19 @@ HOST_SWIG_CONF_OPT = \
 SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
+# CMake looks first at swig2.0 and then swig. However, when doing the
+# search, it will look into the PATH for swig2.0 first, and then for
+# swig. While the PATH contains first our $(HOST_DIR)/usr/bin, it also
+# contains /usr/bin and other system directories. Therefore, if there
+# is an installed swig2.0 on the system, it will get the preference
+# over the swig installed in $(HOST_DIR)/usr/bin, which isn't nice. To
+# prevent this from happening we create a symbolic link swig2.0 ->
+# swig, so that our swig always gets used.
+
+define HOST_SWIG_INSTALL_SYMLINK
+	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
+endef
+
+HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
+
 $(eval $(host-autotools-package))
