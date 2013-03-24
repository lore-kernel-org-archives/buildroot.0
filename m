From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:57:31 +0100
Subject: [Buildroot] [git commit] dependencies: check that a full perl
	installation is available
Message-ID: <20130324130053.5FABC9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=876e91dc447d874ac17ea1038e836655f24e6750
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-autoconf build process requires a full Perl installation, or
at least a Perl installation that has the Data::Dumper module
installed. On a basic Debian system, only 'perl-base' is installed,
but Data::Dumper is in the 'perl' package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c11d362..0b44c5a 100755
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
