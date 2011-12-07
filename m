From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 22:42:48 +0100
Subject: [Buildroot] [git commit] uclibc: update internal toolchain build
Message-ID: <20111208102416.1B1088F8C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=713bb00aa2ab6da400766bc8683f6b95fbacdece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the uClibc build procedure to accomodate for the new build
system, otherwise it breaks with snapshot versions.
As pointed by linuxjacques on IRC.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 6335e6a..fbfb0df 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -384,6 +384,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
 	touch $@
@@ -401,6 +402,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		HOSTCC="$(HOSTCC)" headers \
 		lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
@@ -421,6 +423,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLO
 		PREFIX= \
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		HOSTCC="$(HOSTCC)" \
 		all
 	touch -c $@
@@ -431,6 +434,7 @@ uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	touch -c $(UCLIBC_DIR)/.config
@@ -442,6 +446,7 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		install_runtime install_dev
 	# Install the kernel headers to the staging dir if necessary
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
@@ -471,6 +476,7 @@ $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 		PREFIX=$(TARGET_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
 		install_runtime
 	touch -c $@
 
