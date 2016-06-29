From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 29 Jun 2016 15:06:39 +1000
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged defconfigs
In-Reply-To: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
Message-ID: <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 docs/manual/adding-board-support.txt |  3 ++
 docs/manual/appendix.txt             |  1 +
 docs/manual/merged-defconfigs.txt    | 60 ++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 docs/manual/merged-defconfigs.txt

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index f6d74ae..086a67e 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -24,6 +24,9 @@ savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
 directory, and rename it +<boardname>_defconfig+.
 
+It is also possible to create configurations by specifying differences from
+an existing configuration. See xref:merged-defconfigs[].
+
 It is recommended to use as much as possible upstream versions of the
 Linux kernel and bootloaders, and to use as much as possible default
 kernel and bootloader configurations. If they are incorrect for your
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 87a20bd..9abc37e 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -3,6 +3,7 @@
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
+include::merged-defconfigs.txt[]
 
 
 // Automatically generated lists:
diff --git a/docs/manual/merged-defconfigs.txt b/docs/manual/merged-defconfigs.txt
new file mode 100644
index 0000000..e1f50fd
--- /dev/null
+++ b/docs/manual/merged-defconfigs.txt
@@ -0,0 +1,60 @@
+// -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
+
+[[merged-defconfigs]]
+== Merged configurations
+
+Buildroot supports the use of the Linux kernel's +merge_config.sh+ script to
+create configurations by merging a set of partial configurations (or overlays)
+on top of a base configuration. This may be useful when there are several
+configurations that are specializations of a single generic configuration.
+
+Files in the +configs/+ directory with the extension
++.mk+ will be read by the top level Makefile and the Make function
++merge_config+ can be used within them to define new merged configurations.
+
+The merge_config function takes three parameters: the first is the name of the
+new configuration (which should end with +_defconfig+), the second is the name
+of the base configuration file and the third is a space separated list of the
+partial configuration files to merge from the +configs/+ directory. All files
+should be specified relative to the +configs/+ directory and the name of the
+Make fragment file should match the name of the configuration it creates.
+
+The new configuration can be selected as if it were a normal configuration, i.e. with
++make foo_defconfig+.
+
+Partial configurations have the same format as full configuration
+files except that they contain only a subset of values. They can be created by
+starting with a normal configuration file and deleting lines as appropriate.
+
+External configuration files from the +$(BR2_EXTERNAL)/configs+ directory are fully
+supported, and merge configurations may freely refer to files from either
+location.
+
+Example:
+
+If configs/foo_defconfig contains:
+-----
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+-----
+
+And configs/bar_defconfig.mk contains:
+-----
+$(eval $(call merge_config,bar_defconfig,foo_defconfig,b.config))
+-----
+
+And configs/b.config contains:
+-----
+BR2_TARGET_GENERIC_ISSUE="Welcome to BAR"
+-----
+
+After running the command:
+-----
+make bar_defconfig
+-----
+
+The resulting .config file would contain:
+-----
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to BAR"
+-----
-- 
2.1.0
