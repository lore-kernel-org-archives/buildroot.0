From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 22:51:50 +0200
Subject: [Buildroot] [git commit] dependencies.sh: improve the missing perl
	modules detection
Message-ID: <20151015205155.8033281EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4339a0823ee886151269b9341e9c4dcb72df092
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Check for Thread::Queue, not Thread:Queue.
 - Use 'printf' instead of 'echo -e', since printf is POSIX, but not
   'echo -e'.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |   26 +++++++++++++++++++++-----
 1 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 01ad828..3146401 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -236,10 +236,26 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
-# Check that the Perl installation is complete enough to build
-# host-autoconf.
-if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
-	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
-	echo "On Debian/Ubuntu distributions, install the 'perl' package."
+# Check that the Perl installation is complete enough for Buildroot.
+required_perl_modules="Data::Dumper" # Needed to build host-autoconf
+required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
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
+	echo
+	for pm in $missing_perl_modules ; do
+		printf "\t $pm\n"
+	done
+	echo
 	exit 1
 fi
