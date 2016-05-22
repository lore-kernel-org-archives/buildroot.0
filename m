From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:46:54 +0200
Subject: [Buildroot] [git commit] package/qlibc: fix musl build by removing
	usage of internal glibc header sys/cdefs.h
Message-ID: <20160522194744.8722D819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ce65b030037164449a33c0a04bdb45d1d5948d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/15c/15ce460214875c2e56d5d26372778b43cd7325ad/
http://autobuild.buildroot.net/results/790/79098fb27ef2d5b09df777cd7365a61d6de55c52/
http://autobuild.buildroot.net/results/8d3/8d3dad2dcf5b3c7fa94cc759386759b1ac9e3287/
http://autobuild.buildroot.net/results/9d8/9d8f6259c62e15cc528ec99d6375cc02c2bc7489/
http://autobuild.buildroot.net/results/a05/a0540ed23bd2d48cd742aa1b0228719b13e162b6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l-build-by-removing-usage-of-internal-gli.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch b/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
new file mode 100644
index 0000000..2ce3757
--- /dev/null
+++ b/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
@@ -0,0 +1,60 @@
+From fe45b18f777b1414aee908f08f56a5730a00dbb5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 21 May 2016 09:59:56 +0200
+Subject: [PATCH 1/1] md5: fix musl build by removing usage of internal glibc
+ header sys/cdefs.h
+
+As suggested in musl FAQ:
+http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_musl_and_I_get_error_messages_about_sys.2Fcdefs.h
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch for master branch sent upstream:
+ https://github.com/wolkykim/qlibc/pull/53,
+ this patch is a backport for v2.1.6)
+---
+ src/internal/md5/md5.h  | 10 ++++++----
+ src/internal/md5/md5c.c |  1 -
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/internal/md5/md5.h b/src/internal/md5/md5.h
+index cbfa7ca..8e726fe 100644
+--- a/src/internal/md5/md5.h
++++ b/src/internal/md5/md5.h
+@@ -35,9 +35,9 @@ typedef struct MD5Context {
+     unsigned char buffer[64];	/* input buffer */
+ } MD5_CTX;
+ 
+-#include <sys/cdefs.h>
+-
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ void   MD5Init (MD5_CTX *);
+ void   MD5Update (MD5_CTX *, const unsigned char *, unsigned int);
+ void   MD5Final (unsigned char[16], MD5_CTX *);
+@@ -45,6 +45,8 @@ char * MD5End(MD5_CTX *, char *);
+ char * MD5File(const char *, char *);
+ char * MD5FileChunk(const char *, char *, off_t, off_t);
+ char * MD5Data(const unsigned char *, unsigned int, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* Q_MD5_H */
+diff --git a/src/internal/md5/md5c.c b/src/internal/md5/md5c.c
+index de9e47f..040bf5e 100644
+--- a/src/internal/md5/md5c.c
++++ b/src/internal/md5/md5c.c
+@@ -26,7 +26,6 @@
+  * edited for clarity and style only.
+  */
+ 
+-#include <sys/cdefs.h>
+ #include <sys/types.h>
+ #include <string.h>
+ #include "md5.h"
+-- 
+2.8.1
+
