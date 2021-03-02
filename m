From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Mar 2021 13:33:33 +0100
Subject: [Buildroot] [PATCH] support/dependencies: detect and bailout when
 PATH contains spaces/TABs
Message-ID: <20210302123333.755928-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Makefiles, variables are split, filtered, and otherwise mangled on a
space as a separator. In a shell, they will also be split on TABs.

We split and filter and iterate of variables in a lot of places, and
most importantluy, spaces in PATH is very seldom tested, if at all, so a
lot of packages will not be working properly in such a situation.

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

---
Notes: Dan had provided a patch [0] that would fix their own specific
issue when runing linux-menuconfig, but I believe this is by far
insufficient to properly solve the issues with spaces in PATH, and I
believe it can't be reliably fixed (at least not in the foreseeable
future with our available manpower), so I prefer that we detect the
situation and bail out.

[0] https://patchwork.ozlabs.org/project/buildroot/patch/16100eb6-bac8-2e4d-65f2-26333179f3b8 at foxvalley.net/
---
 support/dependencies/dependencies.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index b44d28682c..8cbfa984c7 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -2,6 +2,8 @@
 # vi: set sw=4 ts=4:
 
 export LC_ALL=C
+TAB="$(printf '\t')"
+NL="$(printf '\n')"
 
 # Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
@@ -35,9 +37,9 @@ case ":${PATH:-unset}:" in
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
-- 
2.25.1
