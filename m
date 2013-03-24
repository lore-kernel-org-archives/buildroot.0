From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:00:31 +0100
Subject: [Buildroot] [git commit] dependencies: check that SSL certificates
	are installed
Message-ID: <20130324130053.A74A19B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d66cd067f3dc3d5e2479e1e8c05f24fd82329f7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages are hosted on https:// servers, and wget only works on
these if the SSL certificates are installed. For example, downloading
the kernel sources from kernel.org requires those SSL certificates to
be installed.

[Peter: fix typo]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0b44c5a..ce4d9e1 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -200,3 +200,12 @@ if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
     /bin/echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
     exit 1
 fi
+
+# Check that we have the SSL certificates to make https:// downloads
+# work.
+if ! test -d /etc/ssl/certs; then
+    /bin/echo -e "Your system lacks Common CA certificates for SSL."
+    /bin/echo -e "This prevents https:// downloads from succeeding."
+    /bin/echo -e "On Debian/Ubuntu distributions, install 'ca-certificates' package."
+    exit 1
+fi
