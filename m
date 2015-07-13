From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 22:19:38 +0300
Subject: [Buildroot] [PATCH] atftp: fix build with gcc5
Message-ID: <ac8be3f9d655c21dbc07a66ad3a459c00a67ae17.1436815178.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc5 defaults to -std=gnu11 which changes the inline semantics. This leads to
multiple definition error with 'extern inline'. See
https://gcc.gnu.org/gcc-5/porting_to.html for the details.

Fixes:
http://autobuild.buildroot.net/results/762/762bce2bbc1f994cc796f0442bfa73b7ad64e272/
http://autobuild.buildroot.net/results/28b/28bf6018dcf91ddacfb76f54a92313da8bf182e1/
http://autobuild.buildroot.net/results/fde/fdee23ecd0c5c66fda1ed38efe43048ce934b733/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/atftp/atftp.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 4d9a71bcd211..615b6eadbbee 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -11,7 +11,12 @@ ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
-ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)"
+# We use CPPFLAGS for -fgnu89-inline even though it's a compiler flag
+# because atftp discards configure environment CFLAGS. -fgnu89-inline
+# is needed to avoid multiple definition error with gcc 5. See
+# https://gcc.gnu.org/gcc-5/porting_to.html.
+ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -fgnu89-inline"
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
-- 
2.1.4
