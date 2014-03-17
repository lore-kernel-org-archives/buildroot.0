From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Mar 2014 11:42:34 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a dependency
Message-ID: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The way we are checking for bash is to look if "$SHELL --version"
will return a string containing "^GNU bash".

In case the system shell is dash (eg. /bin/sh -> /bin/dash), but
the user's login shell is bash, dash will not override the SHELL
variable:

    $ echo $SHELL
    /bin/bash
    $ /bin/dash
    $$ echo $SHELL
    /bin/bash

The same happens when called as the interpreter for a shell script:

    $ cat foo.sh
    #!/bin/dash
    echo $SHELL

    $ echo $SHELL
    /bin/bash
    $ ./foo.sh
    /bin/bash

So, calling "$SHELL --version" will still return "^GNU bash" no matter
what shell is actually running.

Since quite a lot of #!/bin/sh scripts are in fact bash scripts, we
really want to ensure that /bin/sh is bash.

Reported-by: Andrew Barnes <andy@outsideglobe.com> (on IRC)
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Andrew Barnes <andy@outsideglobe.com>
---
 support/dependencies/dependencies.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a8261b3..1b1a825 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -138,11 +138,16 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 	fi
 fi
 
-# Check bash
-if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
+# Check bash is the system shell
+if ! /bin/sh --version 2>&1 | grep -q '^GNU bash'; then
 	echo
-	echo "You must install 'bash' on your build machine";
-	exit 1;
+	echo "You must install 'bash' on your build machine"
+	echo "and make it your default shell. On Debian-like"
+	echo "systems, this can be done with:"
+	echo "    sudo dpkg-reconfigure dash"
+	echo "and answer 'No' to the question:"
+	echo "    Use dash as the default system shell (/bin/sh)?"
+	exit 1
 fi;
 
 # Check that a few mandatory programs are installed
-- 
1.8.3.2
