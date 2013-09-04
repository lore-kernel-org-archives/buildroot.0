From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 16:22:30 +0200
Subject: [Buildroot] [git commit] gcc: pass MAKEINFO=missing in the
	environment rather than as a ./configure arg
Message-ID: <20130904142250.7F5999B6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5128cc6602d56a2c3af4cf6a0fe072d39d6c1aca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build issue with the avr32 toolchain:

http://jenkins.free-electrons.com/job/buildroot/config=atngw100_defconfig/104/

Invalid configuration `MAKEINFO=missing': machine `MAKEINFO=missing' not
recognized

Instead pass it in the environment of ./configure, similar to how it was
done originally in 62322acb2ce (toolchain/gcc: disable makeinfo).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-final/gcc-final.mk               |    3 +++
 package/gcc/gcc-initial/gcc-initial.mk           |    3 +++
 package/gcc/gcc-intermediate/gcc-intermediate.mk |    3 +++
 package/gcc/gcc.mk                               |    6 +++++-
 4 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b62dfe2..328ad7b 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -55,6 +55,9 @@ endif
 HOST_GCC_FINAL_CONF_OPT += \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
+HOST_GCC_FINAL_CONF_ENV = \
+	$(HOST_GCC_COMMON_CONF_ENV)
+
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index e468419..0eb492f 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -34,6 +34,9 @@ HOST_GCC_INITIAL_CONF_OPT = \
 	--disable-nls \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
+HOST_GCC_INITIAL_CONF_ENV = \
+	$(HOST_GCC_COMMON_CONF_ENV)
+
 HOST_GCC_INITIAL_MAKE_OPT = all-gcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
 
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index a666025..f47e4be 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -33,6 +33,9 @@ HOST_GCC_INTERMEDIATE_CONF_OPT = \
 	--disable-nls \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
+HOST_GCC_INTERMEDIATE_CONF_ENV = \
+	$(HOST_GCC_COMMON_CONF_ENV)
+
 HOST_GCC_INTERMEDIATE_MAKE_OPT = all-gcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 HOST_GCC_INTERMEDIATE_MAKE_OPT += all-target-libgcc
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 782217f..ccba5e1 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -96,7 +96,11 @@ HOST_GCC_COMMON_CONF_OPT = \
 	--disable-libssp \
 	--disable-multilib \
 	--with-gmp=$(HOST_DIR)/usr \
-	--with-mpfr=$(HOST_DIR)/usr \
+	--with-mpfr=$(HOST_DIR)/usr
+
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
