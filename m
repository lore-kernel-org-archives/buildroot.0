From: Frank Bergmann <frank@frajasalo.de>
Date: Fri,  9 May 2014 22:42:48 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix missing fallocate64()
Message-ID: <1399668168-4521-1-git-send-email-frank@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current nios2 toolchain is missing the falloacte64() function call. The
configure script does not detect this correctly and the C library is
swapping fallocate with fallocate64 while compiling with the LARGEFILE*
flags.

The patch disables fallocate in the configure script.

Fixes http://autobuild.buildroot.net/results/9cd30031a40f768f6090cfba44c880fb2406672b

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
---
 .../fio-0001-nios2-configure-disable-fallocate.patch   | 18 ++++++++++++++++++
 package/fio/fio.mk                                     |  4 ++++
 2 files changed, 22 insertions(+)
 create mode 100644 board/common-nios2/fio/fio-0001-nios2-configure-disable-fallocate.patch

diff --git a/board/common-nios2/fio/fio-0001-nios2-configure-disable-fallocate.patch b/board/common-nios2/fio/fio-0001-nios2-configure-disable-fallocate.patch
new file mode 100644
index 0000000..97b8b63
--- /dev/null
+++ b/board/common-nios2/fio/fio-0001-nios2-configure-disable-fallocate.patch
@@ -0,0 +1,18 @@
+configure: Disable fallocate
+
+Signed-off-by: Frank Bergmann <frank@frajasalo.de>
+
+--- fio-fio-2.1.4.orig/configure	2013-11-16 19:15:12.000000000 +0100
++++ fio-fio-2.1.4/configure	2014-05-09 20:06:35.000000000 +0200
+@@ -578,7 +578,10 @@ int main(int argc, char **argv)
+ }
+ EOF
+ if compile_prog "" "" "linux_fallocate"; then
+-    linux_fallocate="yes"
++    # For nios2 disable fallocate because with LARGE_FILE flags it
++    # becomes fallocate64 which isn't available
++    #linux_fallocate="yes"
++    linux_fallocate="no"
+ fi
+ echo "Linux fallocate               $linux_fallocate"
+ 
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index f9a690e..311779b 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,6 +9,10 @@ FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
 FIO_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_nios2),y)
+BR2_GLOBAL_PATCH_DIR += "board/common-nios2"
+endif
+
 define FIO_CONFIGURE_CMDS
 	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
-- 
1.9.1
