From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 19:59:14 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] support/dependencies:
 detect and bailout when PATH contains spaces/TABs
Message-ID: <20210321183640.1676E885AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cb21c8ca5825be858e4add63124a7688227570c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

In Makefiles, variables are split, filtered, and otherwise mangled on
a space as a separator. In a shell, they will also be split on TABs.

We split and filter and iterate on variables in a lot of places, and
most importantly, spaces in PATH is very seldom tested, if at all, so
a lot of packages will not be working properly in such a situation.

For example, the config.guess contains constructs that are not resilient
to a space in PATH:

    PATH=$PATH:/.attbin ; export PATH

Also, our fakedate will iterate over PATH:

    for P in `echo $PATH | tr ':' ' '`; do

Those are only two cases, but the first means basically all
autotools-based packages are susceptible to subtle breakage.

Furthermore, Buildroot itself does not support that the top-level or
output directories are in a path with spaces anyway.

So, instead of chasing all cases that might be potentially broken,
let's just detect the case and bail out, like we already do when PATH
contains a \n, or when it contains the current working directory.

Reported-by: Dan Raymond <draymond@foxvalley.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e36974d9e8c30227dc492c03737ef5951452cb29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index b44d28682c..1954f038be 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -2,6 +2,9 @@
 # vi: set sw=4 ts=4:
 
 export LC_ALL=C
+TAB="$(printf '\t')"
+NL="
+"
 
 # Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
@@ -35,9 +38,9 @@ case ":${PATH:-unset}:" in
 	echo "PATH environment variable. This doesn't work."
 	exit 1
 	;;
-(*"
-"*)	printf "\n"
-	printf "Your PATH contains a newline (\\\n) character.\n"
+(*" "*|*"${TAB}"*|*"${NL}"*)
+	printf "\n"
+	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
 	printf "This doesn't work. Fix you PATH.\n"
 	exit 1
 	;;
