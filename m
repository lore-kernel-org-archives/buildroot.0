From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 22:24:34 +0100
Subject: [Buildroot] [git commit] libhid: replace patch on configure by
	patch on configure.ac
Message-ID: <20121212213256.3C1E79A1B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31341e8d40ec6c926419ebce8a71daba98a6ff9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to fix some other build problem of libhid, we'll need to do
modifications to the configure.ac. Therefore, let's first convert the
current patch on configure to a patch on configure.ac, and mark the
package as AUTORECONF=YES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libhid/libhid-0.2.16-fix-configure-typo.patch  |   24 --------------------
 package/libhid/libhid-no-newline-in-ldflags.patch  |   22 ++++++++++++++++++
 package/libhid/libhid.mk                           |    1 +
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/package/libhid/libhid-0.2.16-fix-configure-typo.patch b/package/libhid/libhid-0.2.16-fix-configure-typo.patch
deleted file mode 100644
index 870ecf2..0000000
--- a/package/libhid/libhid-0.2.16-fix-configure-typo.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] fix typo in configure
-
-Somehow a newline character has gotten inserted in the middle of the
-LDFLAGS assignment, breaking the build.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: libhid-0.2.16/configure
-===================================================================
---- libhid-0.2.16.orig/configure
-+++ libhid-0.2.16/configure
-@@ -23050,8 +23050,7 @@ echo "$as_me: doxygen disabled by config
-     CPPFLAGS=$(echo  $CPPFLAGS)
-     CFLAGS=$(echo $OS_CFLAGS $LIBUSB_CFLAGS $CFLAGS)
-     CXXFLAGS=$(echo  $CXXFLAGS)
--    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS
-- $LDFLAGS)
-+    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS $LDFLAGS)
- 
- 
- 
diff --git a/package/libhid/libhid-no-newline-in-ldflags.patch b/package/libhid/libhid-no-newline-in-ldflags.patch
new file mode 100644
index 0000000..df845ee
--- /dev/null
+++ b/package/libhid/libhid-no-newline-in-ldflags.patch
@@ -0,0 +1,22 @@
+Fix improper usage of macro that introduces a wrong newline
+
+The MD_CONF_FLAGS() macro was used with a final newline that
+introduces an invalid newline in the middle of the macro expansion
+when defining LDFLAGS.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: libhid-0.2.16/configure.ac
+===================================================================
+--- libhid-0.2.16.orig/configure.ac	2007-04-01 22:32:10.000000000 +0200
++++ libhid-0.2.16/configure.ac	2012-12-12 20:24:03.000000000 +0100
+@@ -102,8 +102,7 @@
+   [],
+   [$OS_CFLAGS $LIBUSB_CFLAGS],
+   [],
+-  [$OS_LDFLAGS $LIBUSB_LIBS]
+-)
++  [$OS_LDFLAGS $LIBUSB_LIBS])
+ 
+ MD_CONF_DB2MAN
+ 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index bad014b..484cdcc 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -9,6 +9,7 @@ LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
 LIBHID_SITE = http://alioth.debian.org/frs/download.php/1958
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
+LIBHID_AUTORECONF = YES
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
 LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
