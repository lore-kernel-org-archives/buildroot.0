From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 17:48:37 +0100
Subject: [Buildroot] [PATCH v5] dependencies.sh: improve the missing perl
	modules detection
Message-ID: <1443113317-25791-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v4 -> v5:
  - Use the string concatenation operator (+=) to assing the values to
    the required_perl_modules. That way the comments about why each
    module is needed can be in the same line where the module is added
    to the variable.
    Use also += for the missing_perl_modules variable.

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

 support/dependencies/dependencies.sh |   31 ++++++++++++++++++++++++++-----
 1 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 01ad828..81b7f12 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -236,10 +236,31 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
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
+required_perl_modules="Data::Dumper" # Needed to build host-autoconf
+required_perl_modules+=" Thread:Queue" # Used by host-automake
+
+# This variable will keep the modules that are missing in your system.
+missing_perl_modules=""
+
+for pm in $required_perl_modules ; do
+	if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
+		missing_perl_modules+=" $pm"
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
