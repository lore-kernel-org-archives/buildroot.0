From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:45 +0100
Subject: [Buildroot] [PATCH 21/22] dependencies: check that a full perl
	installation is available
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-22-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-autoconf build process requires a full Perl installation, or
at least a Perl installation that has the Data::Dumper module
installed. On a basic Debian system, only 'perl-base' is installed,
but Data::Dumper is in the 'perl' package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c11d362..5fb4c19 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -192,3 +192,11 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
 	exit 1
     fi
 fi
+
+# Check that the Perl installation is complete enough to build
+# host-autoconf.
+if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
+    /bin/echo -e "Your Perl installation is not complete enough, at least Data::Dumper is missing."
+    /bin/echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
+    exit 1
+fi
\ No newline at end of file
-- 
1.7.9.5
