From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Dec 2016 09:47:57 +0100
Subject: [Buildroot] [PATCH] package/ipmitool: bump version to 1.8.18
Message-ID: <20161214084757.21823-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some patches are not necessary anymore as upstream fixed the issues.

As we are not patching configure.ac anymore, there is no need to
autoreconf the package.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...tch => 0001-Fix-missing-stddef.h-include.patch} | 23 +++++----
 .../0001-Make-the-package-autoreconfigurable.patch | 38 --------------
 .../ipmitool/0002-Avoid-wchar_t-redefinition.patch | 60 ----------------------
 ...-Add-missing-linux-param.h-header-include.patch | 39 --------------
 package/ipmitool/ipmitool.hash                     |  2 +-
 package/ipmitool/ipmitool.mk                       |  5 +-
 6 files changed, 14 insertions(+), 153 deletions(-)
 rename package/ipmitool/{0004-Fix-missing-stddef.h-include.patch => 0001-Fix-missing-stddef.h-include.patch} (57%)
 delete mode 100644 package/ipmitool/0001-Make-the-package-autoreconfigurable.patch
 delete mode 100644 package/ipmitool/0002-Avoid-wchar_t-redefinition.patch
 delete mode 100644 package/ipmitool/0003-Add-missing-linux-param.h-header-include.patch

diff --git a/package/ipmitool/0004-Fix-missing-stddef.h-include.patch b/package/ipmitool/0001-Fix-missing-stddef.h-include.patch
similarity index 57%
rename from package/ipmitool/0004-Fix-missing-stddef.h-include.patch
rename to package/ipmitool/0001-Fix-missing-stddef.h-include.patch
index e58c8b0..dc3f92e 100644
--- a/package/ipmitool/0004-Fix-missing-stddef.h-include.patch
+++ b/package/ipmitool/0001-Fix-missing-stddef.h-include.patch
@@ -1,4 +1,4 @@
-From 2b149f7723fbd6153e6605ea8efb2c9f2940c8e5 Mon Sep 17 00:00:00 2001
+From 04d489936191e685123978a1ca370f9cc30e6a06 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 18 Apr 2016 21:17:26 +0200
 Subject: [PATCH] Fix missing stddef.h include
@@ -16,22 +16,23 @@ https://sourceforge.net/p/ipmitool/mailman/message/35022779/
 
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
- src/plugins/imb/imbapi.h | 2 ++
- 1 file changed, 2 insertions(+)
+ src/plugins/imb/imbapi.h | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
-index ead8956..8d0c7ae 100644
+index 6ba4121..6b39b47 100644
 --- a/src/plugins/imb/imbapi.h
 +++ b/src/plugins/imb/imbapi.h
-@@ -40,6 +40,8 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- # include <config.h>
- #endif
- 
+@@ -33,6 +33,9 @@ ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
+ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  *----------------------------------------------------------------------*/
++
 +#include <stddef.h>
 +
+ #ifndef	_WINDEFS_H
+ #define	_WINDEFS_H
  #ifndef FALSE
- #define FALSE   0
- #endif
 -- 
-2.8.0
+2.10.2
 
diff --git a/package/ipmitool/0001-Make-the-package-autoreconfigurable.patch b/package/ipmitool/0001-Make-the-package-autoreconfigurable.patch
deleted file mode 100644
index 17b4076..0000000
--- a/package/ipmitool/0001-Make-the-package-autoreconfigurable.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 0d4b9d5d547b4a6e79108ac8c455e01f72a9aefa Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 10 Apr 2016 11:47:14 +0200
-Subject: [PATCH 1/3] Make the package autoreconfigurable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ipmitool is not a compliant GNU package as it does not provide some necessary
-files, like NEWS, AUTHORS, etc.
-
-Therefor set the Automake strictness to foreign to make the package
-autoreconfigurable.
-
-Upstream status: Pending
-https://sourceforge.net/p/ipmitool/mailman/message/35004711/
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 94e267a..9f3f7e1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -33,7 +33,7 @@ DOCLIST = $(top_srcdir)/README $(top_srcdir)/COPYING $(top_srcdir)/AUTHORS $(top
- 
- EXTRA_DIST = $(DOCLIST)
- 
--AUTOMAKE_OPTIONS = dist-bzip2
-+AUTOMAKE_OPTIONS = dist-bzip2 foreign
- 
- MAINTAINERCLEANFILES = Makefile.in aclocal.m4 configure configure-stamp \
- 	config.guess config.sub depcomp install-sh ltmain.sh missing \
--- 
-2.8.0
-
diff --git a/package/ipmitool/0002-Avoid-wchar_t-redefinition.patch b/package/ipmitool/0002-Avoid-wchar_t-redefinition.patch
deleted file mode 100644
index 99598e0..0000000
--- a/package/ipmitool/0002-Avoid-wchar_t-redefinition.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7d1863b47877129376f37613d29d3a5ba084af66 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 2 Apr 2016 19:45:14 +0200
-Subject: [PATCH 2/3] Avoid wchar_t redefinition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The musl C library does not define _WCHAR_T. Use autoconf to check for wchar_t.
-
-Upstream status: Pending
-https://sourceforge.net/p/ipmitool/mailman/message/35007331/
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac             | 2 ++
- src/plugins/imb/imbapi.h | 7 ++++++-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1d74fcf..c2ba1eb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,6 +22,8 @@ AC_CHECK_HEADERS([stdlib.h string.h sys/ioctl.h sys/stat.h unistd.h paths.h])
- AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/socket.h])
- AC_CHECK_HEADERS([sys/byteorder.h byteswap.h])
- 
-+AC_CHECK_TYPES([wchar_t])
-+
- AC_C_CONST
- AC_C_INLINE
- AC_C_BIGENDIAN
-diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
-index 74975c6..ead8956 100644
---- a/src/plugins/imb/imbapi.h
-+++ b/src/plugins/imb/imbapi.h
-@@ -35,6 +35,11 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  *----------------------------------------------------------------------*/
- #ifndef	_WINDEFS_H
- #define	_WINDEFS_H
-+
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #ifndef FALSE
- #define FALSE   0
- #endif
-@@ -46,7 +51,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #endif
- #ifndef WIN32   
- /* WIN32 defines this in stdio.h */
--#ifndef _WCHAR_T
-+#if !defined(HAVE_WCHAR_T)
- #define _WCHAR_T
- typedef long    wchar_t;
- #endif
--- 
-2.8.0
-
diff --git a/package/ipmitool/0003-Add-missing-linux-param.h-header-include.patch b/package/ipmitool/0003-Add-missing-linux-param.h-header-include.patch
deleted file mode 100644
index a3bd725..0000000
--- a/package/ipmitool/0003-Add-missing-linux-param.h-header-include.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 661095378b74df564bc621ced4db72b688d87399 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 2 Apr 2016 19:47:21 +0200
-Subject: [PATCH 3/3] Add missing linux/param.h header include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes the following build failure under musl:
-
-imbapi.c: In function 'MapPhysicalMemory':
-imbapi.c:109:19: error: 'EXEC_PAGESIZE' undeclared (first use in this function)
- # define PAGESIZE EXEC_PAGESIZE
-
-Upstream status: Pending
-https://sourceforge.net/p/ipmitool/mailman/message/35007330/
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/plugins/imb/imbapi.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/plugins/imb/imbapi.c b/src/plugins/imb/imbapi.c
-index 899c47a..8a6421d 100644
---- a/src/plugins/imb/imbapi.c
-+++ b/src/plugins/imb/imbapi.c
-@@ -95,6 +95,9 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include <stdlib.h>
- #include <fcntl.h>
- #include <string.h>
-+#ifdef __linux__
-+#include <linux/param.h>
-+#endif
- #endif
- #include "imbapi.h"
- #include <asm/socket.h>
--- 
-2.8.0
-
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index 9bb852c..9b16414 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  3c5da6b067abf475bc24685120ec79f6e4ef6b3ea606aaa267e462023861223e  ipmitool-1.8.16.tar.bz2
+sha256  0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01  ipmitool-1.8.18.tar.bz2
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index a246584..f4dca73 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1.8.16
+IPMITOOL_VERSION = 1.8.18
 IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3c
 IPMITOOL_LICENSE_FILES = COPYING
 
-# Patching configure.ac
-IPMITOOL_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 IPMITOOL_CONF_OPTS += --enable-intf-lanplus
-- 
2.10.2
