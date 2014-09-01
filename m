From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:44:32 +0200
Subject: [Buildroot] [PATCH 1/4] fs/ext2: enhance option parsing in our
	genext2fs wrapper
In-Reply-To: <cover.1409579021.git.yann.morin.1998@free.fr>
References: <cover.1409579021.git.yann.morin.1998@free.fr>
Message-ID: <05bd974bb8d940cbef323720f0221214bddb2b35.1409579021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the following changesets, we are going to introduce new options to
our genext2fs wrapper, but which are unknown to the real genext2fs.
Thus, we need to filter those incompatible options out, so as not to
confuse genext2fs.

We currently only skim over the existing options, and only add our own
ontop of the existing ones.

Change this behaviour by regenerating a valid set of options, and get
rid of the previous set passed to the wrapper. Also, do not carry the
image filename in that new set of options, and pass it explicitly in the
actual call to genext2fs.

This complexifies a bit the code, and is a no-op for now, but it will be
used by the following changes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/genext2fs.sh | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index 6f7b075..db80383 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -9,16 +9,32 @@ CALC_INODES=1
 EXT_OPTS=
 EXT_OPTS_O=
 
+# Tell getopts to stop after all existing options,
+# and not parse the ones we add
+set -- "${@}" --
 while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
 do
     case $f in
-	b) CALC_BLOCKS=0 ;;
-	N) CALC_INODES=0; INODES=$OPTARG ;;
-	d) TARGET_DIR=$OPTARG ;;
+        # The following options are specific to our wrapper,
+        # so do not pass them to the real genext2fs.
+        # (none for now)
+        # Any other option is recognised by the real genext2fs,
+        # so we want to keep them.
+        b) CALC_BLOCKS=0 ;;
+        N) CALC_INODES=0; INODES=$OPTARG ;;
+        d) TARGET_DIR=$OPTARG ;;
     esac
+    # Append the option, and its arg if there's one
+    set -- "${@}" "-${f}"
+    if [ "${OPTARG+set}" = "set" ]; then
+        set -- "${@}" "${OPTARG}"
+    fi
 done
 eval IMG="\"\${${OPTIND}}\""
 
+# Get rid of all old options, up to and including our '--' marker
+while [ "${1}" != "--" ]; do shift; done; shift
+
 # calculate needed inodes
 if [ $CALC_INODES -eq 1 ];
 then
@@ -117,5 +133,5 @@ if [ -n "${EXT_OPTS_O}" ]; then
 fi
 
 # Generate and upgrade the filesystem
-genext2fs "$@"
+genext2fs "$@" "${IMG}"
 e2tunefsck ${EXT_OPTS}
-- 
1.9.1
