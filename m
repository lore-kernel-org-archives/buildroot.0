From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:55:11 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/atftp: add
 security fix for CVE-2020-6097
Message-ID: <20210210183739.7A63183980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a042904f1758d216be4a7a714f649a77bca4eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixed the following security issue:

- CVE-2020-6097: An exploitable denial of service vulnerability exists in
  the atftpd daemon functionality of atftp 0.7.git20120829-3.1+b1.  A
  specially crafted sequence of RRQ-Multicast requests trigger an assert()
  call resulting in denial-of-service.  An attacker can send a sequence of
  malicious packets to trigger this vulnerability.

For more details, see the report:
https://talosintelligence.com/vulnerability_reports/TALOS-2020-1029

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b36e91fda95de313120ab530a07329a1c5d41db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Fix-for-DoS-issue-CVE-2020-6097.patch     | 104 +++++++++++++++++++++
 package/atftp/atftp.mk                             |   3 +
 2 files changed, 107 insertions(+)

diff --git a/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch b/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch
new file mode 100644
index 0000000000..fe59325e57
--- /dev/null
+++ b/package/atftp/0004-Fix-for-DoS-issue-CVE-2020-6097.patch
@@ -0,0 +1,104 @@
+From 96409ef3b9ca061f9527cfaafa778105cf15d994 Mon Sep 17 00:00:00 2001
+From: Peter Kaestle <peter.kaestle@nokia.com>
+Date: Wed, 14 Oct 2020 14:02:41 +0200
+Subject: [PATCH] Fix for DoS issue CVE-2020-6097
+
+"sockaddr_print_addr" of tftpd can be triggered remotely to call
+assert(), which will crash the tftpd daemon.  See:
+https://talosintelligence.com/vulnerability_reports/TALOS-2020-1029
+
+"sockaddr_print_addr" originaly had two features:
+1) returning pointer to string of the incoming ip address
+2) checking whether ss_family of the connection is supported
+
+To fix the issue, a separate function "sockaddr_family_supported" is
+used to take care of 2) and "sockaddr_print_addr" returns an error
+message string for unsupported cases when using 1) insert of calling
+assert().
+
+[Upstream:
+ https://sourceforge.net/u/peterkaestle/atftp/ci/96409ef3b9ca061f9527cfaafa778105cf15d994/]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ tftp_def.c    | 11 ++++++++++-
+ tftp_def.h    |  1 +
+ tftpd.c       |  5 +++++
+ tftpd_mtftp.c |  5 +++++
+ 4 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/tftp_def.c b/tftp_def.c
+index d457c2a..428a930 100644
+--- a/tftp_def.c
++++ b/tftp_def.c
+@@ -180,6 +180,15 @@ int Gethostbyname(char *addr, struct hostent *host)
+      return OK;
+ }
+ 
++int
++sockaddr_family_supported(const struct sockaddr_storage *ss)
++{
++     if (ss->ss_family == AF_INET || ss->ss_family == AF_INET6)
++          return 1;
++     else
++          return 0;
++}
++
+ char *
+ sockaddr_print_addr(const struct sockaddr_storage *ss, char *buf, size_t len)
+ {
+@@ -189,7 +198,7 @@ sockaddr_print_addr(const struct sockaddr_storage *ss, char *buf, size_t len)
+      else if (ss->ss_family == AF_INET6)
+           addr = &((const struct sockaddr_in6 *)ss)->sin6_addr;
+      else
+-          assert(!"sockaddr_print: unsupported address family");
++          return "sockaddr_print: unsupported address family";
+      return (char *)inet_ntop(ss->ss_family, addr, buf, len);
+ }
+ 
+diff --git a/tftp_def.h b/tftp_def.h
+index 0841746..458e310 100644
+--- a/tftp_def.h
++++ b/tftp_def.h
+@@ -54,6 +54,7 @@ int print_eng(double value, char *string, int size, char *format);
+ inline char *Strncpy(char *to, const char *from, size_t size);
+ int Gethostbyname(char *addr, struct hostent *host);
+ 
++int sockaddr_family_supported(const struct sockaddr_storage *ss);
+ char *sockaddr_print_addr(const struct sockaddr_storage *, char *, size_t);
+ #define SOCKADDR_PRINT_ADDR_LEN INET6_ADDRSTRLEN
+ uint16_t sockaddr_get_port(const struct sockaddr_storage *);
+diff --git a/tftpd.c b/tftpd.c
+index 0b6f6a5..a7561a5 100644
+--- a/tftpd.c
++++ b/tftpd.c
+@@ -644,6 +644,11 @@ void *tftpd_receive_request(void *arg)
+      }
+ 
+ #ifdef HAVE_WRAP
++     if (!abort && !sockaddr_family_supported(&data->client_info->client))
++     {
++          logger(LOG_ERR, "Connection from unsupported network address family refused");
++          abort = 1;
++     }
+      if (!abort)
+      {
+           /* Verify the client has access. We don't look for the name but
+diff --git a/tftpd_mtftp.c b/tftpd_mtftp.c
+index d420d10..0032905 100644
+--- a/tftpd_mtftp.c
++++ b/tftpd_mtftp.c
+@@ -393,6 +393,11 @@ void *tftpd_mtftp_server(void *arg)
+                                         &data_size, data->data_buffer);
+ 
+ #ifdef HAVE_WRAP
++               if (!sockaddr_family_supported(&sa))
++               {
++                    logger(LOG_ERR, "mtftp: Connection from unsupported network address family refused");
++                    continue;
++               }
+                /* Verify the client has access. We don't look for the name but
+                   rely only on the IP address for that. */
+                sockaddr_print_addr(&sa, addr_str, sizeof(addr_str));
+-- 
+2.20.1
+
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index cbe05ba7e0..a4b461fda5 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -18,6 +18,9 @@ ATFTP_LIBS = -lpthread
 ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)" \
 	CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline"
 
+# 0004-Fix-for-DoS-issue-CVE-2020-6097.patch
+ATFTP_IGNORE_CVES += CVE-2020-6097
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
 ATFTP_CONF_OPTS += --enable-libreadline
