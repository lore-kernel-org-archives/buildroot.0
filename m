From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:42:10 +0200
Subject: [Buildroot] [git commit] libcurl: fix build with ssh2 and static
 mbedtls
Message-ID: <20180527214612.E3936819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=624603328ab3280374e88eb7d45806d24e933943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ssh2 pkg-config file could contain the following lines when build
with a static version of mbedtls:
   Libs: -L${libdir} -lssh2 /xxx/libmbedcrypto.a
   Libs.private: /xxx/libmbedcrypto.a

This static mbedtls library must be used to correctly detect ssh2
support and this library must be copied in libcurl.pc otherwise
compilation of any application (such as upmpdcli) with libcurl will fail
when trying to find mbedtls functions included in libssh2.

So, replace pkg-config --libs-only-l by pkg-config --libs.

Fixes:
 - http://autobuild.buildroot.net/results/43e24b22a77f616d6198c10435dcc23cc3b9088a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ink-with-ssh2-built-with-a-static-mbedtls.patch | 40 ++++++++++++++++++++++
 package/libcurl/libcurl.mk                         |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch b/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch
new file mode 100644
index 0000000000..9107fa7c8c
--- /dev/null
+++ b/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch
@@ -0,0 +1,40 @@
+From b5fbc486e805805efb8400373ccec2a3dee1c81b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 21 May 2018 12:07:00 +0200
+Subject: [PATCH 1/1] Fix link with ssh2 built with a static mbedtls
+
+The ssh2 pkg-config file could contain the following lines when build
+with a static version of mbedtls:
+   Libs: -L${libdir} -lssh2 /xxx/libmbedcrypto.a
+   Libs.private: /xxx/libmbedcrypto.a
+
+This static mbedtls library must be used to correctly detect ssh2
+support and this library must be copied in libcurl.pc otherwise
+compilation of any application (such as upmpdcli) with libcurl will fail
+when trying to found mbedtls functions included in libssh2.
+So, replace pkg-config --libs-only-l by pkg-config --libs.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/43e24b22a77f616d6198c10435dcc23cc3b9088a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5569a26b4..9e2606885 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -2766,7 +2766,7 @@ if test X"$OPT_LIBSSH2" != Xno; then
+     CURL_CHECK_PKGCONFIG(libssh2)
+ 
+     if test "$PKGCONFIG" != "no" ; then
+-      LIB_SSH2=`$PKGCONFIG --libs-only-l libssh2`
++      LIB_SSH2=`$PKGCONFIG --libs libssh2`
+       LD_SSH2=`$PKGCONFIG --libs-only-L libssh2`
+       CPP_SSH2=`$PKGCONFIG --cflags-only-I libssh2`
+       version=`$PKGCONFIG --modversion libssh2`
+-- 
+2.14.1
+
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fbaeaa8975..25d74394c7 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,6 +14,8 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
