From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:18 -0500
Subject: [Buildroot] [PATCH 04/10] util-linux: add suport for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-5-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patch to fix the LDFLAGS for libmount to support SELinux.

Cleaning up the naming of the util-linux patches.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 ...-linux-002-program-invocation-short-name.patch} |    0
 .../util-linux-003-libmount-libselinux-fix.patch   |   21 ++++++++++++++++++++
 package/util-linux/util-linux.mk                   |   21 ++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 rename package/util-linux/{util-linux-003-program-invocation-short-name.patch => util-linux-002-program-invocation-short-name.patch} (100%)
 create mode 100644 package/util-linux/util-linux-003-libmount-libselinux-fix.patch

diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-002-program-invocation-short-name.patch
similarity index 100%
rename from package/util-linux/util-linux-003-program-invocation-short-name.patch
rename to package/util-linux/util-linux-002-program-invocation-short-name.patch
diff --git a/package/util-linux/util-linux-003-libmount-libselinux-fix.patch b/package/util-linux/util-linux-003-libmount-libselinux-fix.patch
new file mode 100644
index 0000000..2c925bf
--- /dev/null
+++ b/package/util-linux/util-linux-003-libmount-libselinux-fix.patch
@@ -0,0 +1,21 @@
+diff -urN a/libmount/src/Makemodule.am b/libmount/src/Makemodule.am
+--- a/libmount/src/Makemodule.am	2012-10-15 05:09:42.390129040 -0500
++++ b/libmount/src/Makemodule.am	2013-07-12 09:25:11.000000000 -0500
+@@ -30,7 +30,7 @@
+ 
+ nodist_libmount_la_SOURCES = libmount/src/mountP.h
+ 
+-libmount_la_LIBADD = libcommon.la libblkid.la $(SELINUX_LIBS)
++libmount_la_LIBADD = libcommon.la libblkid.la
+ 
+ libmount_la_CFLAGS = \
+ 	-I$(ul_libblkid_incdir) \
+@@ -44,7 +44,7 @@
+ 
+ libmount_la_LDFLAGS = \
+ 	-Wl,--version-script=$(top_srcdir)/libmount/src/libmount.sym \
+-	-version-info $(LIBMOUNT_VERSION_INFO)
++	-version-info $(LIBMOUNT_VERSION_INFO) $(SELINUX_LIBS)
+ 
+ EXTRA_DIST += \
+ 	libmount/src/libmount.sym \
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6f79e74..b1ff992 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -40,6 +40,27 @@ UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+UTIL_LINUX_DEPENDENCIES += libselinux
+UTIL_LINUX_CONF_OPT += --with-selinux
+else
+UTIL_LINUX_CONF_OPT += --without-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+UTIL_LINUX_DEPENDENCIES += linux-pam
+UTIL_LINUX_CONF_OPT += --with-pam
+else
+UTIL_LINUX_CONF_OPT += --without-pam
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+UTIL_LINUX_DEPENDENCIES += audit
+UTIL_LINUX_CONF_OPT += --with-audit
+else
+UTIL_LINUX_CONF_OPT += --without-audit
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-- 
1.7.1
