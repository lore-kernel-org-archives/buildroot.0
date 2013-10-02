From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 22:31:24 +0200
Subject: [Buildroot] [git commit] make clean: improve when no .config present
Message-ID: <20131002214311.AB7849B8F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb33517511f5c6e173bfdb0d84bcb6e21240b387
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'make clean' recipe is using variables that are not defined without
.config file, causing only a partial cleanup when the .config file is
accidentally deleted.

This patch moves those variables that do not depend on values from .config
outside the BR2_HAVE_DOT_CONFIG check, so that 'make clean' is much more
similar with and without .config.

Since HOST_DIR is determined from BR2_HOST_DIR in .config, the host
directory cannot be cleaned correctly without making assumptions, if no
.config is present.  However, to cover most people's use cases, we assume
the default value of $(BASE_DIR)/host in this specific case.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |   48 ++++++++++++++++++++++++------------------------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index cd3dc0d..c170ca2 100644
--- a/Makefile
+++ b/Makefile
@@ -91,6 +91,30 @@ EXTRAMAKEARGS = O=$(O)
 NEED_WRAPPER=y
 endif
 
+# bash prints the name of the directory on 'cd <dir>' if CDPATH is
+# set, so unset it here to not cause problems. Notice that the export
+# line doesn't affect the environment of $(shell ..) calls, so
+# explictly throw away any output from 'cd' here.
+export CDPATH:=
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
+$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
+
+BUILD_DIR:=$(BASE_DIR)/build
+STAMP_DIR:=$(BASE_DIR)/stamps
+BINARIES_DIR:=$(BASE_DIR)/images
+TARGET_DIR:=$(BASE_DIR)/target
+# initial definition so that 'make clean' works for most users, even without
+# .config. HOST_DIR will be overwritten later when .config is included.
+HOST_DIR:=$(BASE_DIR)/host
+
+LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
+LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
+LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
+LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
+
 BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -184,17 +208,6 @@ unexport DESTDIR
 # Causes breakage with packages that needs host-ruby
 unexport RUBYOPT
 
-# bash prints the name of the directory on 'cd <dir>' if CDPATH is
-# set, so unset it here to not cause problems. Notice that the export
-# line doesn't affect the environment of $(shell ..) calls, so
-# explictly throw away any output from 'cd' here.
-export CDPATH:=
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
-$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
-
-BUILD_DIR:=$(BASE_DIR)/build
-
-
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 ################################################################################
@@ -262,21 +275,8 @@ HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 
-# stamp (dependency) files go here
-STAMP_DIR:=$(BASE_DIR)/stamps
-
-BINARIES_DIR:=$(BASE_DIR)/images
-TARGET_DIR:=$(BASE_DIR)/target
 TARGET_SKELETON=$(TOPDIR)/system/skeleton
 
-LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
-REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
-LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
-LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
-LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
-LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
-LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
-
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
 TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
