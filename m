From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 17 Dec 2012 22:48:11 +0100
Subject: [Buildroot] [PATCH] netatalk: fix 64-bit build
Message-ID: <1355780891-26657-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The configure script sets LD_LIBRARY_PATH to the staging directory,
which makes the `ls` that is called in one of the tests fail. Fix by
not setting LD_LIBRARY_PATH when cross-compiling.

The patch has been sent upstream.

Also remove the BDB_LIB variable: it isn't used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch |   48 ++++++++++++++++++++
 package/netatalk/netatalk.mk                       |    4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch

diff --git a/package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch b/package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
new file mode 100644
index 0000000..01d5776
--- /dev/null
+++ b/package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
@@ -0,0 +1,48 @@
+From 60d100713b5289948e9cdf5b0646ff3cdd2c206b Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 17 Dec 2012 22:32:44 +0100
+Subject: [PATCH] Fix setting of LD_LIBRARY_FLAGS ($shlibpath_var).
+
+LD_LIBRARY_PATH should not be set when cross-compiling, because it
+adds the cross-libraries to the build's LD-path.
+
+Also the restoring of LD_LIBRARY_PATH was done incorrectly: it would
+set LD_LIBRARY_PATH=LD_LIBRARY_PATH.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ macros/db3-check.m4 |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/macros/db3-check.m4 b/macros/db3-check.m4
+index 902220b..d5a5446 100644
+--- a/macros/db3-check.m4
++++ b/macros/db3-check.m4
+@@ -94,7 +94,7 @@ if test "x$bdb_required" = "xyes"; then
+     savedldflags="$LDFLAGS"
+     savedcppflags="$CPPFLAGS"
+     savedlibs="$LIBS"
+-    saved_shlibpath_var=$shlibpath_var
++    eval saved_shlibpath_var=\$$shlibpath_var
+ 
+     dnl required BDB version: 4.6, because of cursor API change
+     DB_MAJOR_REQ=4
+@@ -148,7 +148,7 @@ if test "x$bdb_required" = "xyes"; then
+                         dnl -- LD_LIBRARY_PATH on many platforms. This will be fairly
+                         dnl -- portable hopefully. Reference:
+                         dnl -- http://lists.gnu.org/archive/html/autoconf/2009-03/msg00040.html
+-                        eval export $shlibpath_var=$bdblibdir
++                        test "$cross_compiling" = yes || eval export $shlibpath_var=$bdblibdir
+                         NETATALK_BDB_TRY_LINK
+                         eval export $shlibpath_var=$saved_shlibpath_var
+ 
+@@ -171,7 +171,7 @@ if test "x$bdb_required" = "xyes"; then
+                            CPPFLAGS="-I${bdbdir}/include${subdir} $CPPFLAGS"
+                            LDFLAGS="-L$bdblibdir $LDFLAGS"
+ 
+-                           eval export $shlibpath_var=$bdblibdir
++                           test "$cross_compiling" = yes || eval export $shlibpath_var=$bdblibdir
+                            NETATALK_BDB_TRY_LINK
+                            eval export $shlibpath_var=$saved_shlibpath_var
+ 
+-- 
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 46355ce..243d3f7 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -7,8 +7,10 @@ NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
+NETATALK_AUTORECONF = YES
+
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
-NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_DIR)/usr/lib
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--disable-zeroconf \
-- 
1.7.10.4
