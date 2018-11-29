From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 10:21:45 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.9.3
Message-ID: <20181129092145.21721-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

 - CVE-2018-14629:
   All versions of Samba from 4.0.0 onwards are vulnerable to infinite
   query recursion caused by CNAME loops. Any dns record can be added via
   ldap by an unprivileged user using the ldbadd tool, so this is a
   security issue.

 - CVE-2018-16841:
   When configured to accept smart-card authentication, Samba's KDC will call
   talloc_free() twice on the same memory if the principal in a validly signed
   certificate does not match the principal in the AS-REQ.

   This is only possible after authentication with a trusted certificate.

   talloc is robust against further corruption from a double-free with
   talloc_free() and directly calls abort(), terminating the KDC process.

   There is no further vulnerability associated with this issue, merely a
   denial of service.

 - CVE-2018-16851:
   During the processing of an LDAP search before Samba's AD DC returns
   the LDAP entries to the client, the entries are cached in a single
   memory object with a maximum size of 256MB.  When this size is
   reached, the Samba process providing the LDAP service will follow the
   NULL pointer, terminating the process.

   There is no further vulnerability associated with this issue, merely a
   denial of service.

 - CVE-2018-16852:
   During the processing of an DNS zone in the DNS management DCE/RPC server,
   the internal DNS server or the Samba DLZ plugin for BIND9, if the
   DSPROPERTY_ZONE_MASTER_SERVERS property or DSPROPERTY_ZONE_SCAVENGING_SERVERS
   property is set, the server will follow a NULL pointer and terminate.

   There is no further vulnerability associated with this issue, merely a
   denial of service.

 - CVE-2018-16853:
   A user in a Samba AD domain can crash the KDC when Samba is built in the
   non-default MIT Kerberos configuration.

   With this advisory we clarify that the MIT Kerberos build of the Samba
   AD DC is considered experimental.  Therefore the Samba Team will not
   issue security patches for this configuration.

 - CVE-2018-16857:
   AD DC Configurations watching for bad passwords (to restrict brute forcing
   of passwords) in a window of more than 3 minutes may not watch for bad
   passwords at all.

For more details, see the release notes:

https://www.samba.org/samba/history/samba-4.9.3.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4d210ca364..41c670059f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.2.tar.asc
-sha256 349c17b7bf1bf667167843470533da89ff1b2ca4a768b529aaacf5197af1efa2  samba-4.9.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.3.tar.asc
+sha256 cf8fd8707e9ad7bce7832006aac5644155165745ba371170661b3004fa2135cf  samba-4.9.3.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e2f8e7de2f..89e39dab55 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.2
+SAMBA4_VERSION = 4.9.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
