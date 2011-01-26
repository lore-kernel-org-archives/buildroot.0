From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 14:57:00 +0100
Subject: [Buildroot] [git commit master 1/1] Use 'sysroot' rather than
	'sys-root' for the sysroot/staging_dir
Message-ID: <20110126135723.3928C8D2F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d97db71d10054999517f4fc44c669624c72ff16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out on the list, using sysroot rather than sys-root is less
confusing, as this is how it is referred to in the GCC manual.

So rather than changing BR, patch ct-ng to use sysroot instead.
The next ct-ng release will use 'sysroot' as well by default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                                |    2 +-
 .../toolchain-crosstool-ng/003-use-sysroot.patch   |   35 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-ng/003-use-sysroot.patch

diff --git a/package/Makefile.in b/package/Makefile.in
index d3f51ad..644eb1f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -33,7 +33,7 @@ endif
 
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
-STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-root
+STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
 
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION+=-O0
diff --git a/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch b/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch
new file mode 100644
index 0000000..f9b0baf
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch
@@ -0,0 +1,35 @@
+ct-ng: use 'sysroot' rather than 'sys-root' for sysroot directory
+
+The sysroot directory name is arbitrary, but 'sysroot' matches the GCC
+documentation.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ scripts/crosstool-NG.sh.in |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
+===================================================================
+--- crosstool-ng-1.8.0.orig/scripts/crosstool-NG.sh.in
++++ crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
+@@ -274,7 +274,7 @@ esac
+ if [ -z "${CT_RESTART}" ]; then
+     # Arrange paths depending on wether we use sys-root or not.
+     if [ "${CT_USE_SYSROOT}" = "y" ]; then
+-        CT_SYSROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/sys-root"
++        CT_SYSROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/sysroot"
+         CT_DEBUGROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/debug-root"
+         CT_HEADERS_DIR="${CT_SYSROOT_DIR}/usr/include"
+         BINUTILS_SYSROOT_ARG="--with-sysroot=${CT_SYSROOT_DIR}"
+@@ -315,9 +315,9 @@ if [ -z "${CT_RESTART}" ]; then
+ 
+     if [ "${CT_USE_SYSROOT}" = "y" ]; then
+         # Prevent gcc from installing its libraries outside of the sys-root
+-        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sys-root/lib" "${CT_PREFIX_DIR}/${CT_TARGET}/lib"
++        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sysroot/lib" "${CT_PREFIX_DIR}/${CT_TARGET}/lib"
+         # Prevent libc from installing its headers outside of the sysroot
+-        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sys-root/usr/include" "${CT_PREFIX_DIR}/${CT_TARGET}/include"
++        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sysroot/usr/include" "${CT_PREFIX_DIR}/${CT_TARGET}/include"
+     fi
+ 
+     # Now, in case we're 64 bits, just have lib64/ be a symlink to lib/
-- 
1.7.3.4
