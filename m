From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 09:27:27 +0300
Subject: [Buildroot] [PATCH] Revert "dependencies: check that SSL
	certificates are installed"
Message-ID: <1369031247-2075-1-git-send-email-baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit d66cd067f3dc3d5e2479e1e8c05f24fd82329f7a.

SSL certificates are no always installed in /etc/ssl/certs. For example, on
CentOS 5.6 the default OpenSSL certificates directory is /etc/pki/tls/certs,
and wget can download using https without any problem.

Moreover, the existence of /etc/ssl/certs does not guarantee the presence of a
CA certificates bundle even on Debian. On my current Debian testing
installation the openssl package itself creates an empty /etc/ssl/certs
directory.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 support/dependencies/dependencies.sh |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index ce4d9e1..0b44c5a 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -200,12 +200,3 @@ if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
     /bin/echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
     exit 1
 fi
-
-# Check that we have the SSL certificates to make https:// downloads
-# work.
-if ! test -d /etc/ssl/certs; then
-    /bin/echo -e "Your system lacks Common CA certificates for SSL."
-    /bin/echo -e "This prevents https:// downloads from succeeding."
-    /bin/echo -e "On Debian/Ubuntu distributions, install 'ca-certificates' package."
-    exit 1
-fi
-- 
1.7.10.4
