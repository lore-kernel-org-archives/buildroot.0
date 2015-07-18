From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 15:47:54 +0200
Subject: [Buildroot] [git commit] sysvinit: added libselinux dependency
Message-ID: <20150718135016.D28367FD2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8fb454db64477491da9df9860f473d7decf268e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - remove the patch from Matthew Weber that did a lot of changes that
    were not needed: the CFLAGS would not get overridden by Buildroot
    ones if the Buildroot TARGET_CONFIGURE_OPTS is passed on the left
    hand-side of make, and the SULOGINLIBS hack needs to be replaced
    by a proper handling of the libcrypt detection.
  - added a patch that changes the libcrypt detection logic to accept
    a SYSROOT variable. Instead of search for /usr/lib/libcrypt.a, it
    search for $(SYSROOT)/usr/lib/libcrypt.a. This avoids the need for
    overriding SULOGINLIBS.
  - don't modify TARGET_CONFIGURE_OPTS in sysvinit.mk, this is
    completely forbidden and broken.
  - don't pass ROOT= since we don't use 'make install' anyway.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/0001-fix-libcrypt-test.patch |   17 +++++++++++++++++
 package/sysvinit/sysvinit.mk                  |    9 ++++++++-
 2 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch b/package/sysvinit/0001-fix-libcrypt-test.patch
new file mode 100644
index 0000000..207270d
--- /dev/null
+++ b/package/sysvinit/0001-fix-libcrypt-test.patch
@@ -0,0 +1,17 @@
+Make the libcrypt test somewhat cross-compilation compliant
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -78,7 +78,7 @@
+ endif
+ 
+ # Additional libs for GNU libc.
+-ifneq ($(wildcard /usr/lib*/libcrypt.a),)
++ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
+   SULOGINLIBS	+= -lcrypt
+ endif
+ 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 2460dd9..faefd5c 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,11 +11,18 @@ SYSVINIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
+SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
+
 # Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSVINIT_DEPENDENCIES = busybox
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SYSVINIT_DEPENDENCIES += libselinux
+SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
+endif
+
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
@@ -27,7 +34,7 @@ SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
 define SYSVINIT_BUILD_CMDS
 	# Force sysvinit to link against libcrypt as it otherwise
 	# use an incorrect test to see if it's available
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) SULOGINLIBS="-lcrypt" -C $(@D)/src
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(SYSVINIT_MAKE_OPTS) -C $(@D)/src
 endef
 
 define SYSVINIT_INSTALL_TARGET_CMDS
