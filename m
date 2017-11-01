From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 16:40:36 +0100
Subject: [Buildroot] [git commit] nmap: fix libssh2 build failure
Message-ID: <20171101153340.94807810E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=302ab5ed258c366dfc3853954ef9ec20b22661ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that fixes the libssh2 AC_CHECK_LIB() check,
and makes sure it is taken into account by doing an autoconf in the
package. We can't autoreconf as the package doesn't autoreconf
properly, so we do a manual autoconf.

Based on prior work from Baruch Siach and Max Filippov.

Fixes:

  http://autobuild.buildroot.net/results/9e636919c98cd31b5067c8306d0e481a672434cf
  http://autobuild.buildroot.net/results/912561f505ad10d1eaa96dbe247d5838e9968e14

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...c-fix-AC_CHECK_HEADER-call-to-test-for-li.patch | 30 ++++++++++++++++++++++
 package/nmap/nmap.mk                               | 10 +++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch b/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch
new file mode 100644
index 0000000..ed5cae2
--- /dev/null
+++ b/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch
@@ -0,0 +1,30 @@
+From ff629766dbd3b5e179330ba4f07fd7e3d8384ec0 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 1 Nov 2017 15:30:40 +0100
+Subject: [PATCH] configure.ac: fix AC_CHECK_HEADER call to test for libssh2
+
+The -lm argument is passed as an argument to AC_CHECK_HEADER(), which
+doesn't make sense. The intention was to pass it as the fifth
+argument of AC_CHECK_LIB().
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3d00e164e..67db42e08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -674,7 +674,7 @@ AC_HELP_STRING([--without-libssh2], [Compile without libssh2]),
+       AC_CHECK_LIB(ssh2, libssh2_version,
+         [have_libssh2=yes
+         LIBSSH2_INC=$with_libssh2/include
+-        LIBSSH2_LIB=$with_libssh2/lib])],,[-lm])
++        LIBSSH2_LIB=$with_libssh2/lib],,[-lm])])
+ 
+     LDFLAGS=$_ldflags
+     CPPFLAGS=$_cppflags
+-- 
+2.13.6
+
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 9db06d1..ceb08ec 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -7,13 +7,21 @@
 NMAP_VERSION = 7.60
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap pcre
+NMAP_DEPENDENCIES = libpcap pcre host-autoconf
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
 	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
+# nmap doesn't autoreconf properly, so we just re-generate the
+# top-level configure script, since we are patching configure.ac.
+define NMAP_DO_AUTOCONF
+	(cd $(@D); $(HOST_DIR)/bin/autoconf)
+endef
+
+NMAP_PRE_CONFIGURE_HOOKS += NMAP_DO_AUTOCONF
+
 # needed by libpcap
 NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 
