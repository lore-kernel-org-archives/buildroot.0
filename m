From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Dec 2010 21:33:46 +0100
Subject: [Buildroot] [git commit master 1/1] infrastructure: only require
	download tools when needed
Message-ID: <20101227203414.14A958EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=960d268b25f61c407056c2eba946612a38d7de9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having to require svn, git or bzr unconditionally, only
require them when one package needs them to be downloaded.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in            |   14 ++++++++++++--
 toolchain/dependencies/dependencies.mk |    7 +++++++
 toolchain/dependencies/dependencies.sh |    2 +-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 428dbcb..c4a1cf8 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -504,9 +504,19 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # configuration
 
 ifeq ($$(BR2_PACKAGE_$(2)),y)
+
 TARGETS += $(1)
-endif
-endef
+
+ifeq ($$($(2)_SITE_METHOD),svn)
+DL_TOOLS_DEPENDENCIES += svn
+else ifeq ($$($(2)_SITE_METHOD),git)
+DL_TOOLS_DEPENDENCIES += git
+else ifeq ($$($(2)_SITE_METHOD),bzr)
+DL_TOOLS_DEPENDENCIES += bzr
+endif # SITE_METHOD
+
+endif # BR2_PACKAGE_$(2)
+endef # GENTARGETS_INNER
 
 ################################################################################
 # GENTARGETS -- the target generator macro for generic packages
diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index 89ffd88..13604f0 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -10,9 +10,16 @@ ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=sstrip_host
 endif
 
+# Remove duplicate entries from $(DL_TOOLS_DEPENDENCIES)
+DL_TOOLS = \
+	$(findstring svn,$(DL_TOOLS_DEPENDENCIES)) \
+	$(findstring git,$(DL_TOOLS_DEPENDENCIES)) \
+	$(findstring bzr,$(DL_TOOLS_DEPENDENCIES))
+
 dependencies: $(DEPENDENCIES_HOST_PREREQ)
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
+		DL_TOOLS="$(DL_TOOLS)" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index a152d4b..c5552ca 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -132,7 +132,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn unzip ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.7.2.2
