From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 14 Feb 2014 02:45:48 +0100
Subject: [Buildroot] [PATCH 1/1] ncftp: fix cross-compilation issues
Message-ID: <1392342348-28066-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncftp is unable to find ncurses library installed by ncurses package.
So ncftpbookmarks is not build and install fails.

If ncurses is installed on the host machine then ncftp find it
and build ncftpbookmarks.

To avoid that, we need to remove the cross-compilation test in
configure script and set ac_cv_prog_cc_cross=yes in ncftp.mk

Sadly, autoreconf don't work with this package.

Fixes
http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...-cross_compiling-variable-on-command-line.patch | 30 ++++++++++++++++++++++
 package/ncftp/ncftp.mk                             |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 package/ncftp/ncftp-0001-set-cross_compiling-variable-on-command-line.patch

diff --git a/package/ncftp/ncftp-0001-set-cross_compiling-variable-on-command-line.patch b/package/ncftp/ncftp-0001-set-cross_compiling-variable-on-command-line.patch
new file mode 100644
index 0000000..b1330fd
--- /dev/null
+++ b/package/ncftp/ncftp-0001-set-cross_compiling-variable-on-command-line.patch
@@ -0,0 +1,30 @@
+From 80898fd24a975c579618b98d67cc59c68fc41aab Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 14 Feb 2014 02:21:57 +0100
+Subject: [PATCH 1/1] configure: set cross_compiling variable on command line
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure b/configure
+index 2f0fae0..c24a49b 100755
+--- a/configure
++++ b/configure
+@@ -1273,12 +1273,6 @@ main(){return(0);}
+ EOF
+ if { (eval echo configure:1275: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+-  # If we can't run a trivial program, we are probably using a cross compiler.
+-  if (./conftest; exit) 2>/dev/null; then
+-    ac_cv_prog_cc_cross=no
+-  else
+-    ac_cv_prog_cc_cross=yes
+-  fi
+ else
+   echo "configure: failed program was:" >&5
+   cat conftest.$ac_ext >&5
+-- 
+1.8.5.3
+
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index ff6c70a..e2037f0 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -11,6 +11,10 @@ NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
+# force cross-compilation
+NCFTP_CONF_ENV += \
+	ac_cv_prog_cc_cross=yes
+
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
 	NCFTP_TARGET_BINS += ncftpget
 endif
-- 
1.8.5.3
