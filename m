From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 00:02:11 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: add option for e2scrub
Message-ID: <20210430213455.B20DB865DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40dee9a19fa3d396f567158345d500dc8c99a028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The e2scrib tool has various requirements:

  - e2scrub and its associated helpers, are bash scripts

  - e2scrub_all depends on coreutils' readlink; busybox readlink is
    missing some options:
        readlink: invalid option -- 'e'

  - by design, e2scrub only works on an LVM volume

Add an option to enable e2scrub. This is probably seldom used, so it
does not warrant the usual dance about BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
and selecting the tools; we can just depend on the required tools.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - add a kconfig option like for other tools
  - move the conditions to that new option
  - reword the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/e2fsprogs/Config.in    | 13 +++++++++++++
 package/e2fsprogs/e2fsprogs.mk | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index b3d12b4a63..23c4ef30b3 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -31,6 +31,19 @@ config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 	help
 	  Save critical ext2/ext3/ext4 filesystem metadata to a file
 
+config BR2_PACKAGE_E2FSPROGS_E2SCRUB
+	bool "e2scrub"
+	depends on BR2_PACKAGE_BASH  # runtime
+	depends on BR2_PACKAGE_COREUTILS  # runtime
+	depends on BR2_PACKAGE_LVM2  # runtime
+	depends on BR2_PACKAGE_UTIL_LINUX  # runtime
+	help
+	  Check the contents of a mounted ext[234] filesystem
+
+comment "e2scrub needs bash, coreutils, lvm2, and util-linux"
+	depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_COREUTILS \
+		|| !BR2_PACKAGE_LVM2 || !BR2_PACKAGE_UTIL_LINUX
+
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 4420d16aff..0a69690e2f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -74,6 +74,16 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	install-libs
 
+# e2scrub has no associated --enable/disable option
+ifneq ($(BR2_PACKAGE_E2FSPROGS_E2SCRUB),y)
+E2FSPROGS_MAKE_OPTS += E2SCRUB_DIR=
+endif
+
+E2FSPROGS_INSTALL_TARGET_OPTS = \
+	$(E2FSPROGS_MAKE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	install
+
 # Package does not build in parallel due to improper make rules
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
