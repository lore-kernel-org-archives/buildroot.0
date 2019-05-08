From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 15:39:57 +0200
Subject: [Buildroot] [git commit] package/atftp: security bump to version
 0.7.2
Message-ID: <20190508133457.150A488761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=457837087d0990fab038fce26247435d0715e9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2019-11365: An issue was discovered in atftpd in atftp 0.7.1.  A remote
attacker may send a crafted packet triggering a stack-based buffer overflow
due to an insecurely implemented strncpy call.  The vulnerability is
triggered by sending an error packet of 3 bytes or fewer.  There are
multiple instances of this vulnerable strncpy pattern within the code base,
specifically within tftpd_file.c, tftp_file.c, tftpd_mtftp.c, and
tftp_mtftp.c.

CVE-2019-11366: An issue was discovered in atftpd in atftp 0.7.1.  It does
not lock the thread_list_mutex mutex before assigning the current thread
data structure.  As a result, the daemon is vulnerable to a denial of
service attack due to a NULL pointer dereference.  If thread_data is NULL
when assigned to current, and modified by another thread before a certain
tftpd_list.c check, there is a crash when dereferencing current->next.

For details, see
https://pulsesecurity.co.nz/advisories/atftpd-multiple-vulnerabilities

Patch 0001-Makefile.am-link-against-libpthread-for-atftp.patch patches
Makefile.am, so add _AUTORECONF.

CFLAGS is now correctly handled since commit f9dbb96844167f (configure.ac:
fix hard setting of CFLAGS), so drop the workaround about passing
-fgnu89-inline in CPPFLAGS.

Add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atftp/atftp.hash |  3 ++-
 package/atftp/atftp.mk   | 10 +++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index b7860c7681..3e5e783cff 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha1 fc9e9f821dfd2f257b4a5c32b948ed60b4e31fd1 atftp-0.7.1.tar.gz
+sha256 1ad080674e9f974217b3a703e7356c6c8446dc5e7b2014d0d06e1bfaa11b5041  atftp-0.7.2.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index e1c257cb8e..cbe05ba7e0 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.1
+ATFTP_VERSION = 0.7.2
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
+# 0001-Makefile.am-link-against-libpthread-for-atftp.patch patches Makefile.am
+ATFTP_AUTORECONF = YES
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
-# We use CPPFLAGS for -fgnu89-inline even though it's a compiler flag
-# because atftp discards configure environment CFLAGS. -fgnu89-inline
-# is needed to avoid multiple definition error with gcc 5. See
+# -fgnu89-inline is needed to avoid multiple definition error with gcc 5. See
 # https://gcc.gnu.org/gcc-5/porting_to.html.
 ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -fgnu89-inline"
+	CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline"
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
