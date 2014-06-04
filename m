From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  5 Jun 2014 00:27:33 +0400
Subject: [Buildroot] [PATCH] uclibc: prevent rebuilding after installation
	to staging
Message-ID: <1401913653-23804-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently we configure uClibc to use kernel headers from "staging" folder with
KERNEL_HEADERS="$(STAGING_DIR)/usr/include". This path is added to include
search path of uClibc build system in Rules.mak "CFLAGS += -I$(KERNEL_HEADERS)".

At the same time on uClibc installation to "staging" we point to the same
location "$(STAGING_DIR)/usr" (headers effectively go in "usr/include").

So after every installation to "staging" dependences get touched (even though we
copy the same headers every time) and so we may see lots of sources in uClibc
get rebuilt.

This has 2 consequences:
1. Longer build time - becase even on ordinary buildroot build uClibc is built
twice. On "uclibc building" and on "uclibc installation to target".

2. Symbols in libuClibc built initially (that is later installed in
"staging/sysroot") are situated with different offset compared to second build
(later copied in "target"). This happens because as described above only part
of sources get rebuilt and then on final linkage object files are linked in
different order.

And (2) leads to problems on remote rebugging: gdbserver reports offsets that
correspond to pointless assembly in libuClibc on host.

Here's how it looks like.

Before this patch:
$ cd ~/br2_output/i586/target/lib
$ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
   423: 0000c42c    54 FUNC    GLOBAL DEFAULT    7 kill

$ cd ~/br2_output/i586/staging/lib
$ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
   423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill

After this patch:
$ cd ~/br2_output/i586/target/lib
$ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
   423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill

$ cd ~/br2_output/i586/staging/lib
$ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
   423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Noam Camus <noamc@ezchip.com>
---
 package/linux-headers/linux-headers.mk | 14 ++++++++++++++
 package/uclibc/uclibc.mk               |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 7b3edf4..8302d56 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -26,6 +26,20 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 # This results in seemingly errors like:
 #   [...]/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
 # Those can be safely ignored.
+
+# This step is required to have a separate linux headers location for
+# uClibc building. This way uClibc doesn't modify linux headers on installation
+# of "its" headers
+define LINUX_HEADERS_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) $(MAKE) \
+			ARCH=$(KERNEL_ARCH) \
+			HOSTCC="$(HOSTCC)" \
+			HOSTCFLAGS="$(HOSTCFLAGS)" \
+			HOSTCXX="$(HOSTCXX)" \
+			headers_install)
+endef
+
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 717cf53..144f993 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -418,7 +418,7 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
-	$(call UCLIBC_OPT_SET,KERNEL_HEADERS,"$(STAGING_DIR)/usr/include",$(@D))
+	$(call UCLIBC_OPT_SET,KERNEL_HEADERS,"$(LINUX_HEADERS_DIR)/usr/include",$(@D))
 	$(call UCLIBC_OPT_SET,RUNTIME_PREFIX,"/",$(@D))
 	$(call UCLIBC_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
 	$(call UCLIBC_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
-- 
1.9.3
