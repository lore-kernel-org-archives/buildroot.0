From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] proftpd: fix largefile file size printing
Message-ID: <20140424113619.BF8449C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=722090da36285be4440f0205035ada3e66d8de9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses AC_TRY_RUN to detect if it can use the %llu format
string for printing the file size, which doesn't work when cross compiling.

We unfortunately cannot AUTORECONF the package, so instead patch configure
to force it on if we know we support it.

E.G.:

dd if=/dev/zero of=/home/ftp/file bs=1M seek=8000 count=1
1+0 records in
1+0 records out

total 1032
-rw-r--r--    1 root     root     8389656576 Jan  1 00:00 file

ncftp / > ls -l
-rw-r--r--   0        0   8389656576   Jan  1 00:00   file

VS:

ncftp / > ls -l
-rw-r--r--   0        0   4094689280   Jan  1 00:00   file

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 2f7eb0d..45c19c3 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -26,6 +26,18 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_CONF_OPT += --with-modules=mod_rewrite
 endif
 
+ifeq ($(BR2_LARGEFILE),y)
+# configure script doesn't handle detection of %llu format string
+# support for printing the file size when cross compiling, breaking
+# access for large files.
+# We unfortunately cannot AUTORECONF the package, so instead force it
+# on if we know we support it
+define PROFTPD_USE_LLU
+	$(SED) 's/HAVE_LU/HAVE_LLU/' $(@D)/configure
+endef
+PROFTPD_PRE_CONFIGURE_HOOKS += PROFTPD_USE_LLU
+endif
+
 define PROFTPD_MAKENAMES
 	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
 endef
