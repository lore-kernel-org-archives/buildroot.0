From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:46 +0100
Subject: [Buildroot] [PATCH 22/22] dependencies: check that SSL certificates
	are installed
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-23-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages are hosted on https:// servers, and wget only works on
these if the SSL certificates are installed. For example, downloading
the kernel sources from kernel.org requires those SSL certificates to
be installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 5fb4c19..9ee63b5 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -199,4 +199,13 @@ if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
     /bin/echo -e "Your Perl installation is not complete enough, at least Data::Dumper is missing."
     /bin/echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
     exit 1
+fi
+
+# Check that we have the SSL certificates to make https:// downloads
+# work.
+if ! test -d /etc/ssl/certs; then
+    /bin/echo -e "Your system lacks Common CA certificates for SSL."
+    /bin/echo -e "This prevents https:// downloads from suceeding."
+    /bin/echo -e "On Debian/Ubuntu distributions, install 'ca-certificates' package."
+    exit 1
 fi
\ No newline at end of file
-- 
1.7.9.5
