From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:58:05 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] samba4: security bump to
 version 4.8.7
Message-ID: <20181203215444.75BB78A5F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d708397a94d252644993fc09957fe944413d668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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

 - CVE-2018-16853:
   A user in a Samba AD domain can crash the KDC when Samba is built in the
   non-default MIT Kerberos configuration.

   With this advisory we clarify that the MIT Kerberos build of the Samba
   AD DC is considered experimental.  Therefore the Samba Team will not
   issue security patches for this configuration.

For more details, see the release notes:

https://www.samba.org/samba/history/samba-4.8.7.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9594c7a932..2ecea7fa5a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.5.tar.asc
-sha256 e58ee6b1262d4128b8932ceee59d5f0b0a9bbe00547eb3cc4c41552de1a65155  samba-4.8.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.7.tar.asc
+sha256 0f6f67932e8bb23ab83b43070037ac452f9fc5f20763857d2b67e209ee7cd362  samba-4.8.7.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a257af75fc..ed860fbda2 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.5
+SAMBA4_VERSION = 4.8.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
