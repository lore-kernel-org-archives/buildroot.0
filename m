From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] docs/manual: document the br2-external
	desc: field
Message-ID: <20161016110154.AF42A8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c75c3b80744bd67cf76dd54613d5be71b2af702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Docuement the new, optional desc: field for an external.desc file.

That part of the manual was starting to be a bit of a mess, so
reorganise it. Provide a complete br2-external tree example.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.txt | 280 ++++++++++++++++++++++++++---------
 1 file changed, 206 insertions(+), 74 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 4c0f568..56c2c8a 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -70,21 +70,40 @@ Or disable the usage of any br2-external tree:
 buildroot/ $ make BR2_EXTERNAL= xconfig
 -----
 
-A br2-external tree must contain at least those three files:
-
-+external.desc+::
-   That file shall contain the _name_ for the br2-external tree. That name
-   must only use ASCII characters in the set +[A-Za-z0-9_]+; any other
-   character is forbidden. The format for this file is a single line with
-   the keyword 'name:', followed by one or more spaces, followed by the
-   name.
-+
-Buildroot sets +BR2_EXTERNAL_$(NAME)_PATH+ to the absolute path of each
-   br2-external tree, so that you can use it to refer to your br2-external
-   tree. This variable is available both in Kconfig, so you can use it
-   to source your Kconfig files (see below) and in the Makefile, so that
-   you can use it to include other Makefiles (see below) or refer to other
-   files (like data files) from your br2-external tree.
+==== Layout of a br2-external tree
+
+A br2-external tree must contain at least those three files, described
+in the following chapters:
+
+ * +external.desc+
+ * +external.mk+
+ * +Config.in+
+
+Apart from those mandatory files, there may be additional and optional
+content that may be present in a br2-external tree, like the +configs/+
+directory. They are described in the following chapters as well.
+
+A complete example br2-external tree layout is also described later.
+
+===== The +external.desc+ file
+
+That file describes the br2-external tree: the _name_ and _description_
+for that br2-external tree.
+
+The format for this file is line based, with each line starting by a
+keyword, followed by a colon and one or more spaces, followed by the
+value assigned to that keyword. There are two keywords currently
+recognised:
+
+ * +name+, mandatory, defines the name for that br2-external tree. That
+   name must only use ASCII characters in the set +[A-Za-z0-9_]+; any
+   other character is forbidden. Buildroot sets the variable
+   +BR2_EXTERNAL_$(NAME)_PATH+ to the absolute path of the br2-external
+   tree, so that you can use it to refer to your br2-external tree. This
+   variable is available both in Kconfig, so you can use it to source your
+   Kconfig files (see below) and in the Makefile, so that you can use it
+   to include other Makefiles (see below) or refer to other files (like
+   data files) from your br2-external tree.
 +
 .Note:
 Since it is possible to use multiple br2-external trees at once, this
@@ -95,80 +114,193 @@ Since it is possible to use multiple br2-external trees at once, this
   from another br2-external tree, especially if you are planning on
   somehow sharing your br2-external tree with third parties or using
   br2-external trees from third parties.
-+
-Example of an +external.desc+ file that declares the name +FOO+:
-+
-----
-$ cat external.desc
-name: FOO
-----
-+
+
+ * +desc+, optional, provides a short description for that br2-external
+   tree. It shall fit on a single line, is mostly free-form (see below),
+   and is used when displaying information about a br2-external tree (e.g.
+   above the list of defconfig files, or as the prompt in the menuconfig);
+   as such, it should relatively brief (40 chars is probably a good upper
+   limit).
+
 Examples of names and the corresponding +BR2_EXTERNAL_$(NAME)_PATH+
 variables:
-+
+
   * +FOO+ -> +BR2_EXTERNAL_FOO_PATH+
   * +BAR_42+ -> +BR2_EXTERNAL_BAR_42_PATH+
-+
+
 In the following examples, it is assumed the name to be set to +BAR_42+.
 
-+Config.in+::
-+external.mk+::
-   Those files (which may each be empty) can be used to define package
-   recipes, like for packages bundled in Buildroot itself, or other
-   custom configuration options.
-
-Using a br2-external tree then allows three different things:
-
- * One can store all the board-specific configuration files there, such
-   as the kernel configuration, the root filesystem overlay, or any other
-   configuration file for which Buildroot allows to set the location (by
-   using the +BR2_EXTERNAL_$(NAME)_PATH+ variable). For example, you
-   could set the paths to a global patch directory, to a rootfs overlay
-   and to the kernel configuration file as follows (e.g. by running
-   `make menuconfig` and filling in these options):
-+
----- 
-BR2_GLOBAL_PATCH_DIR=$(BR2_EXTERNAL_BAR_42_PATH)/patches/
-BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_FOO)/board/<boardname>/kernel.config
-----
+===== The +Config.in+ and +external.mk+ files
+
+Those files (which may each be empty) can be used to define package
+recipes (i.e. +foo/Config.in+ and +foo/foo.mk+ like for packages bundled
+in Buildroot itself) or other custom configuration options or make logic.
+
+Buildroot automatically includes the +Config.in+ from each br2-external
+tree to make it appear in the top-level configuration menu, and includes
+the +external.mk+ from each br2-external tree with the rest of the
+makefile logic.
 
- * One can store package recipes (i.e. +Config.in+ and +<packagename>.mk+),
-   or even custom configuration options and make logic. Buildroot
-   automatically includes the +Config.in+ from each br2-external tree to
-   make it appear in the top-level configuration menu, and includes the
-   +external.mk+ from each br2-external tree with the rest of the makefile
-   logic.
-+
 The main usage of this is to store package recipes. The recommended way
-   to do this is to write a +Config.in+ file that looks like:
-+
+to do this is to write a +Config.in+ file that looks like:
+
 ------
 source "$BR2_EXTERNAL_BAR_42_PATH/package/package1/Config.in"
 source "$BR2_EXTERNAL_BAR_42_PATH/package/package2/Config.in"
 ------
-+
+
 Then, have an +external.mk+ file that looks like:
-+
+
 ------
 include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
 ------
-+
-And then in +$(BR2_EXTERNAL_FOO_42_PATH)/package/package1+ and
-   +$(BR2_EXTERNAL_FOO_42_PATH)/package/package2+ create normal
-   Buildroot package recipes, as explained in xref:adding-packages[].
-   If you prefer, you can also group the packages in subdirectories
-   called <boardname> and adapt the above paths accordingly.
-
- * One can store Buildroot defconfigs in the +configs+ subdirectory of
-   the br2-external tree. Buildroot will automatically show them in the
-   output of +make list-defconfigs+ and allow them to be loaded with the
-   normal +make <name>_defconfig+ command. They will be visible in the
-   'make list-defconfigs' output, below an +External configs+ label that
-   contains the name of the br2-extermnal tree they are defined in.
-+
+
+And then in +$(BR2_EXTERNAL_BAR_42_PATH)/package/package1+ and
++$(BR2_EXTERNAL_BAR_42_PATH)/package/package2+ create normal
+Buildroot package recipes, as explained in xref:adding-packages[].
+If you prefer, you can also group the packages in subdirectories
+called <boardname> and adapt the above paths accordingly.
+
+You can also define custom configuration options in +Config.in+ and
+custom make logic in +external.mk+.
+
+===== The +configs/+ directory
+
+One can store Buildroot defconfigs in the +configs+ subdirectory of
+the br2-external tree. Buildroot will automatically show them in the
+output of +make list-defconfigs+ and allow them to be loaded with the
+normal +make <name>_defconfig+ command. They will be visible in the
+'make list-defconfigs' output, below an +External configs+ label that
+contains the name of the br2-extermnal tree they are defined in.
+
 .Note:
 If a defconfig file is present in more than one br2-external tree, then
-   the one from the last br2-external tree is used. It is thus possible
-   to override a defconfig bundled in Buildroot or another br2-external
-   tree.
+the one from the last br2-external tree is used. It is thus possible
+to override a defconfig bundled in Buildroot or another br2-external
+tree.
+
+===== Free-form content
+
+One can store all the board-specific configuration files there, such
+as the kernel configuration, the root filesystem overlay, or any other
+configuration file for which Buildroot allows to set the location (by
+using the +BR2_EXTERNAL_$(NAME)_PATH+ variable). For example, you
+could set the paths to a global patch directory, to a rootfs overlay
+and to the kernel configuration file as follows (e.g. by running
+`make menuconfig` and filling in these options):
+
+----
+BR2_GLOBAL_PATCH_DIR=$(BR2_EXTERNAL_BAR_42_PATH)/patches/
+BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_FOO)/board/<boardname>/kernel.config
+----
+
+===== Example layout
+
+Here is an example layout using all features of br2-external (the sample
+content is shown for the file above it, when it is relevant to explain
+the br2-external tree; this is all entirely made up just for the sake of
+illustration, of course):
+
+----
+/path/to/br2-ext-tree/
+  |- external.desc
+  |     |name: BAR_42
+  |     |desc: Example br2-external tree
+  |     `----
+  |
+  |- Config.in
+  |     |source "$BR2_EXTERNAL_BAR_42_DIR/package/pkg-1/Config.in
+  |     |source "$BR2_EXTERNAL_BAR_42_DIR/package/pkg-2/Config.in
+  |     |
+  |     |config BAR_42_FLASH_ADDR
+  |     |    hex "my-board flash address"
+  |     |    default 0x10AD
+  |     `----
+  |
+  |- external.mk
+  |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
+  |     |
+  |     |flash-my-board:
+  |     |    $(BR2_EXTERNAL_BAR_42_DIR)/board/my-board/flash-image \
+  |     |        --image $(BINARIES_DIR)/image.bin \
+  |     |        --address $(BAR_42_FLASH_ADDR)
+  |     `----
+  |
+  |- package/pkg-1/Config.in
+  |     |config BR2_PACKAGE_PKG_1
+  |     |    bool "pkg-1"
+  |     |    help
+  |     |      Some help about pkg-1
+  |     `----
+  |- package/pkg-1/pkg-1.hash
+  |- package/pkg-1/pkg-1.mk
+  |     |PKG_1_VERSION = 1.2.3
+  |     |PKG_1_SITE = /some/where/to/get/pkg-1
+  |     |PKG_1_LICENSE = blabla
+  |     |
+  |     |define PKG_1_INSTALL_INIT_SYSV
+  |     |    $(INSTALL) -D -m 0755 $(PKG_1_PKGDIR)/S99my-daemon \
+  |     |                          $(TARGET_DIR)/etc/init.d/S99my-daemon
+  |     |endef
+  |     |
+  |     |$(eval $(autotools-package))
+  |     `----
+  |- package/pkg-1/S99my-daemon
+  |
+  |- package/pkg-2/Config.in
+  |- package/pkg-2/pkg-2.hash
+  |- package/pkg-2/pkg-2.mk
+  |
+  |- configs/my-board_defconfig
+  |     |BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BAR_42_PATH)/patches/"
+  |     |BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/overlay/"
+  |     |BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/post-image.sh"
+  |     |BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_BAR_42_FOO)/board/my-board/kernel.config"
+  |     `----
+  |
+  |- patches/linux/0001-some-change.patch
+  |- patches/linux/0002-some-other-change.patch
+  |- patches/busybox/0001-fix-something.patch
+  |
+  |- board/my-board/kernel.config
+  |- board/my-board/overlay/var/www/index.html
+  |- board/my-board/overlay/var/www/my.css
+  |- board/my-board/flash-image
+  `- board/my-board/post-image.sh
+        |#!/bin/sh
+        |generate-my-binary-image \
+        |    --root ${BINARIES_DIR}/rootfs.tar \
+        |    --kernel ${BINARIES_DIR}/zImage \
+        |    --dtb ${BINARIES_DIR}/my-board.dtb \
+        |    --output ${BINARIES_DIR}/image.bin
+        `----
+----
+
+The br2-external tree will then be visible in the menuconfig (with
+the layout expanded):
+
+----
+External options  --->
+    *** Example br2-external tree (in /path/to/br2-ext-tree/)
+    [ ] pkg-1
+    [ ] pkg-2
+    (0x10AD) my-board flash address
+----
+
+If you are using more than one br2-external tree, it would look like
+(with the layout expanded and the second one with name +FOO_27+ but no
++desc:+ field in +external.desc+):
+
+----
+External options  --->
+    Example br2-external tree  --->
+        *** Example br2-external tree (in /path/to/br2-ext-tree)
+        [ ] pkg-1
+        [ ] pkg-2
+        (0x10AD) my-board flash address
+    FOO_27  --->
+        *** FOO_27 (in /path/to/another-br2-ext)
+        [ ] foo
+        [ ] bar
+----
