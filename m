From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Jun 2018 18:10:42 +0200
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
Message-ID: <20180607161042.18763-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do expect that users be able to implement new filesystems and submit
them, or have local, custom and private filesystems in their
br2-external trees.

So, add docuemtnation for filesystems, based on the format we have for
packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-filesystems.txt    | 119 ++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages-hooks.txt |   7 +-
 docs/manual/adding-packages.txt       |   2 +
 3 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 docs/manual/adding-filesystems.txt

diff --git a/docs/manual/adding-filesystems.txt b/docs/manual/adding-filesystems.txt
new file mode 100644
index 0000000000..bc122a9a64
--- /dev/null
+++ b/docs/manual/adding-filesystems.txt
@@ -0,0 +1,119 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for filesystems
+
+As for packages, Buildroot provides an infrastructure to build
+filesystems.
+
+The filesystem infrastructure follows a carefully-crafted sequence:
+
+1. Assemble an intermediate, internal tarball from the +target/+
+   directory:
+  * create users and groups,
+  * set the correct rights on files,
+  * create device nodes,
+  * create the intermediate tarball;
+2. Then for each filesystem:
+  * extract the intermediate tarball to a filesystem-specific
+    +$(TARGET_DIR)+,
+  * execute the filesystem pre-gen hooks (see below),
+  * optionally, touch everything to a specific date, for reproducibility,
+  * execute the filesystem commands,
+  * execute the filesystem post-gen hooks (see below),
+  * remove the filesystem-specific +$(TARGET_DIR)+;
+3. Remove the intermediate tarball.
+
+[[filesystem-tutorial]]
+==== +filesystem+ tutorial
+
+Let's look at an example filesytem. First and foremost, like for a
+package, create a directory named from your filesystem, e.g. +foo+.
+
+Then, create a +Config.in+ file describing the menuconfig entries
+for the filesystem. Be sure to have that +Config.in+ included from
++fs/Config.in+ (or from the +Config.in+ of your *br2-external* tree).
+For example:
+
+----
+01: config BR2_TARGET_ROOTFS_FOO
+02: 	bool "foo root filesystem"
+03: 	help
+04: 	  Build a foo root filesystem.
+05: 
+06: if BR2_TARGET_ROOTFS_FOO
+07: 
+08: config BR2_TARGET_ROOTFS_FOO_FORMAT_BAR
+09: 	bool "bar format"
+10: 	help
+11: 	  Enable the bar format.
+12: 
+13: endif
+----
+
+Then, in the same directory, create a +foo.mk+ file describing how
+to actually assemble the filesystem image from the content of
++$(TARGET_DIR)+. Be sure that this +.mk+ file is included in the
+Makefile code (automatic for built-in filesystems, not for filesystems
+in a *br2-external* tree.) For example:
+
+----
+01: ################################################################################
+02: #
+03: # foo filesystem
+04: #
+05: ################################################################################
+06: 
+07: ROOTFS_FOO_DEPENDENCIES = host-foo-utils
+08: 
+09: ifeq ($(BR2_TARGET_ROOTFS_FOO_FORMAT_BAR),y)
+10: ROOTFS_FOO_OPTS = --format=bar
+11: else
+12: ROOTFS_FOO_OPTS = --format=foo
+13: endif
+14: 
+15: define ROOTFS_FOO_CMDS
+16: 	$(HOST_DIR)/bin/mkfs.foo \
+17: 		--root-dir=$(TARGET_DIR) \
+18: 		--option-foo --option-bar \
+19: 		$(ROOTFS_FOO_OPTS) \
+20: 		--output-file=$(@)
+21: endef
+22: 
+23: $(eval $(rootfs))
+----
+
+On line 7, we specify the dependencies on packages needed to build the
+filesystem. Usually, those dependencies are one or more host-packages
+that provide the filesystem generator.
+
+On lines 9 to 13, we define a conditional set of options, depending on
+the user's choice.
+
+On lines 15 to 21, we define the actual command that will generate the
+filesystem image.
+
+Finally, on line 23, we invoke the +rootfs+ macro that generates all the
+Makefile rules that actually allow the filesystem to be built.
+
+[[filesystem-reference]]
+==== +filesystem+ reference
+
+If one compares a package with a filesystem, one may notice that the
+variables for a filesystem start with the prefix +ROOTFS_+, when the
+variables for packages have no prefix.
+
+There is a single macro that a filesystem may set:
+
+* +ROOTFS_FOO_CMDS+ contains the commands to execute to actually
+  generate the filesystem iamge from the content of the +$(TARGET_DIR)+
+  directory.
+
+Additionally, like for packages, there are a set of hooks; see
+xref:hooks[] for details.
+
+And here is a list of variables that may be used (but may *not* be set):
+
+* +$(TARGET_DIR)+ is the directory containing the +target/+ directory.
+
+* +$(@)+ is the filename where to store the filesystem image into.
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 0ce79f8907..34d5801169 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -11,7 +11,7 @@ Most hooks aren't really useful for generic packages, since the +.mk+
 file already has full control over the actions performed in each step
 of the package construction.
 
-The following hook points are available:
+The following hook points are available for packages:
 
 * +LIBFOO_PRE_DOWNLOAD_HOOKS+
 * +LIBFOO_POST_DOWNLOAD_HOOKS+
@@ -46,6 +46,11 @@ The following hook points are available:
 * +LIBFOO_PRE_LEGAL_INFO_HOOKS+
 * +LIBFOO_POST_LEGAL_INFO_HOOKS+
 
+The following hook points are available for filesystems:
+
+* +ROOTFS_FOO_PRE_GEN_HOOKS+
+* +ROOTFS_FOO_POST_GEN_HOOKS+
+
 These variables are 'lists' of variable names containing actions to be
 performed at this hook point. This allows several hooks to be
 registered at a given hook point. Here is an example:
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 4a4a17e879..83c93f3dde 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -47,6 +47,8 @@ include::adding-packages-asciidoc.txt[]
 
 include::adding-packages-linux-kernel-spec-infra.txt[]
 
+include::adding-filesystems.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
-- 
2.14.1
