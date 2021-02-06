From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:45:32 +0100
Subject: [Buildroot] [git commit] package/atftp: bump to version 0.7.4
Message-ID: <20210206132523.CB5BE82B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41cf0ec8e8b53432fb6c372ea34850d33822b724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

https://sourceforge.net/p/atftp/code/ci/v0.7.4/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...file.am-link-against-libpthread-for-atftp.patch |  26 ------
 ...gz.h-fix-musl-compile-add-missing-defines.patch |  42 ---------
 ...-tftpd.h-fix-musl-compile-missing-include.patch |  40 --------
 .../0004-Fix-for-DoS-issue-CVE-2020-6097.patch     | 104 ---------------------
 package/atftp/atftp.hash                           |   4 +-
 package/atftp/atftp.mk                             |   7 +-
 6 files changed, 3 insertions(+), 220 deletions(-)

diff --git a/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch b/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch
deleted file mode 100644
index e879df5b3b..0000000000
--- a/package/atftp/0001-Makefile.am-link-against-libpthread-for-atftp.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Makefile.am: link against libpthread for atftp
-
-atftp client needs to link against libpthread as static builds do not
-work otherwise.
-
-Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e59592f..200829a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -28,7 +28,7 @@ noinst_HEADERS   = argz.h logger.h options.h stats.h tftp.h tftp_def.h tftp_io.h
- 		   tftpd.h tftpd_pcre.h tftpd_mtftp.h
- 
- bin_PROGRAMS     = atftp
--atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE)
-+atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE) $(LIBPTHREAD)
- atftp_SOURCES    = tftp.c tftp_io.c logger.c options.c tftp_def.c tftp_file.c \
- 		   argz.c tftp_mtftp.c
- 
--- 
-1.9.1
-
diff --git a/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch b/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
deleted file mode 100644
index 0679ef3b44..0000000000
--- a/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 543e67919f5cacf309ac88ab091331e41af4224b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 16 Apr 2015 22:41:57 +0200
-Subject: [PATCH] argz.h: fix musl compile (add missing defines)
-
-Add __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__ defines.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- argz.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/argz.h b/argz.h
-index 582be55..bdf9f62 100644
---- a/argz.h
-+++ b/argz.h
-@@ -48,6 +48,22 @@
- # define __const const
- #endif
- 
-+#ifndef __THROW
-+# define __THROW
-+#endif
-+
-+#ifndef __BEGIN_DECLS
-+# define __BEGIN_DECLS
-+#endif
-+
-+#ifndef __END_DECLS
-+# define __END_DECLS
-+#endif
-+
-+#ifndef __attribute_pure__
-+# define __attribute_pure__
-+#endif
-+
- #ifndef __error_t_defined
- typedef int error_t;
- #endif
--- 
-2.1.4
-
diff --git a/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch b/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
deleted file mode 100644
index 485e71a84b..0000000000
--- a/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 16 Apr 2015 22:43:49 +0200
-Subject: [PATCH] tftp.h/tftpd.h: fix musl compile (missing include)
-
-Add sys/types.h include for u_char typedef.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- tftp.h  | 1 +
- tftpd.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/tftp.h b/tftp.h
-index 12bd6aa..32a3f63 100644
---- a/tftp.h
-+++ b/tftp.h
-@@ -19,6 +19,7 @@
- 
- #include <sys/time.h>
- #include <sys/times.h>
-+#include <sys/types.h>
- #include "tftp_def.h"
- #include "config.h"
- 
-diff --git a/tftpd.h b/tftpd.h
-index 945065e..60d3a49 100644
---- a/tftpd.h
-+++ b/tftpd.h
-@@ -20,6 +20,7 @@
- #include <pthread.h>
- #include <arpa/tftp.h>
- #include <arpa/inet.h>
-+#include <sys/types.h>
- #include "tftp_io.h"
- 
- /*
--- 
-2.1.4
-
diff --git a/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch b/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch
deleted file mode 100644
index fe59325e57..0000000000
--- a/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 96409ef3b9ca061f9527cfaafa778105cf15d994 Mon Sep 17 00:00:00 2001
-From: Peter Kaestle <peter.kaestle@nokia.com>
-Date: Wed, 14 Oct 2020 14:02:41 +0200
-Subject: [PATCH] Fix for DoS issue CVE-2020-6097
-
-"sockaddr_print_addr" of tftpd can be triggered remotely to call
-assert(), which will crash the tftpd daemon.  See:
-https://talosintelligence.com/vulnerability_reports/TALOS-2020-1029
-
-"sockaddr_print_addr" originaly had two features:
-1) returning pointer to string of the incoming ip address
-2) checking whether ss_family of the connection is supported
-
-To fix the issue, a separate function "sockaddr_family_supported" is
-used to take care of 2) and "sockaddr_print_addr" returns an error
-message string for unsupported cases when using 1) insert of calling
-assert().
-
-[Upstream:
- https://sourceforge.net/u/peterkaestle/atftp/ci/96409ef3b9ca061f9527cfaafa778105cf15d994/]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- tftp_def.c    | 11 ++++++++++-
- tftp_def.h    |  1 +
- tftpd.c       |  5 +++++
- tftpd_mtftp.c |  5 +++++
- 4 files changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/tftp_def.c b/tftp_def.c
-index d457c2a..428a930 100644
---- a/tftp_def.c
-+++ b/tftp_def.c
-@@ -180,6 +180,15 @@ int Gethostbyname(char *addr, struct hostent *host)
-      return OK;
- }
- 
-+int
-+sockaddr_family_supported(const struct sockaddr_storage *ss)
-+{
-+     if (ss->ss_family == AF_INET || ss->ss_family == AF_INET6)
-+          return 1;
-+     else
-+          return 0;
-+}
-+
- char *
- sockaddr_print_addr(const struct sockaddr_storage *ss, char *buf, size_t len)
- {
-@@ -189,7 +198,7 @@ sockaddr_print_addr(const struct sockaddr_storage *ss, char *buf, size_t len)
-      else if (ss->ss_family == AF_INET6)
-           addr = &((const struct sockaddr_in6 *)ss)->sin6_addr;
-      else
--          assert(!"sockaddr_print: unsupported address family");
-+          return "sockaddr_print: unsupported address family";
-      return (char *)inet_ntop(ss->ss_family, addr, buf, len);
- }
- 
-diff --git a/tftp_def.h b/tftp_def.h
-index 0841746..458e310 100644
---- a/tftp_def.h
-+++ b/tftp_def.h
-@@ -54,6 +54,7 @@ int print_eng(double value, char *string, int size, char *format);
- inline char *Strncpy(char *to, const char *from, size_t size);
- int Gethostbyname(char *addr, struct hostent *host);
- 
-+int sockaddr_family_supported(const struct sockaddr_storage *ss);
- char *sockaddr_print_addr(const struct sockaddr_storage *, char *, size_t);
- #define SOCKADDR_PRINT_ADDR_LEN INET6_ADDRSTRLEN
- uint16_t sockaddr_get_port(const struct sockaddr_storage *);
-diff --git a/tftpd.c b/tftpd.c
-index 0b6f6a5..a7561a5 100644
---- a/tftpd.c
-+++ b/tftpd.c
-@@ -644,6 +644,11 @@ void *tftpd_receive_request(void *arg)
-      }
- 
- #ifdef HAVE_WRAP
-+     if (!abort && !sockaddr_family_supported(&data->client_info->client))
-+     {
-+          logger(LOG_ERR, "Connection from unsupported network address family refused");
-+          abort = 1;
-+     }
-      if (!abort)
-      {
-           /* Verify the client has access. We don't look for the name but
-diff --git a/tftpd_mtftp.c b/tftpd_mtftp.c
-index d420d10..0032905 100644
---- a/tftpd_mtftp.c
-+++ b/tftpd_mtftp.c
-@@ -393,6 +393,11 @@ void *tftpd_mtftp_server(void *arg)
-                                         &data_size, data->data_buffer);
- 
- #ifdef HAVE_WRAP
-+               if (!sockaddr_family_supported(&sa))
-+               {
-+                    logger(LOG_ERR, "mtftp: Connection from unsupported network address family refused");
-+                    continue;
-+               }
-                /* Verify the client has access. We don't look for the name but
-                   rely only on the IP address for that. */
-                sockaddr_print_addr(&sa, addr_str, sizeof(addr_str));
--- 
-2.20.1
-
diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index 3e5e783cff..158e9e3b33 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1ad080674e9f974217b3a703e7356c6c8446dc5e7b2014d0d06e1bfaa11b5041  atftp-0.7.2.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
+sha256  d3c9cd0d971dfc786d7a5f4055c35d4e66aafc8102ac03473ef225bdf7edb26a  atftp-0.7.4.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index a4b461fda5..9f9b69a27e 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.2
+ATFTP_VERSION = 0.7.4
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
-# 0001-Makefile.am-link-against-libpthread-for-atftp.patch patches Makefile.am
-ATFTP_AUTORECONF = YES
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
@@ -18,9 +16,6 @@ ATFTP_LIBS = -lpthread
 ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)" \
 	CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline"
 
-# 0004-Fix-for-DoS-issue-CVE-2020-6097.patch
-ATFTP_IGNORE_CVES += CVE-2020-6097
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
 ATFTP_CONF_OPTS += --enable-libreadline
