From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 08:21:56 +0100
Subject: [Buildroot] [PATCH v4] dependencies.sh: improve the missing perl
	modules detection
Message-ID: <1443079316-10651-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v3 -> v4:
  - Thread::Queue module is actually needed because host-automake uses
    it. Comment modified accordingly. (Highlighted by Thomas Petazzoni)

Changes v2 -> v3:
  - Add comments about why each module is needed. (Suggested by Baruch
    Siach)

Changes v1 -> v2:
  - Check first for perl itself, and then the modules. Also keep the
    comment which says that perl is needed to build host-autoconf.
    (Suggested by Baruch Siach)

 support/dependencies/dependencies.sh |   32 +++++++++++++++++++++++++++-----
 1 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 01ad828..c48322d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -236,10 +236,32 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
-# Check that the Perl installation is complete enough to build
-# host-autoconf.
-if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
-	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
-	echo "On Debian/Ubuntu distributions, install the 'perl' package."
+# Verify that Perl is installed. Is needed to buid host-autoconf among
+# many other packages.
+check_prog_host "perl"
+
+# Check that the Perl installation is complete enough for Buildroot.
+# Here is the space-separated list of the required modules.
+# Data::Dumper (needed to build host-autoconf)
+# Thread::Queue (used by host-automake)
+required_perl_modules="Data::Dumper Thread:Queue"
+
+# This variable will keep the modules that are missing in your system.
+missing_perl_modules=""
+
+for pm in $required_perl_modules ; do
+	if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
+		missing_perl_modules="$missing_perl_modules $pm"
+	fi
+done
+
+if [ -n "$missing_perl_modules" ] ; then
+	echo "Your Perl installation is not complete enough; at least the following"
+	echo "modules are missing:"
+	echo ""
+	for pm in $missing_perl_modules ; do
+		echo -e "\t $pm"
+	done
+	echo ""
 	exit 1
 fi
-- 
1.7.1
