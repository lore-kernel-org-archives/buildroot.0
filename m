From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  7 Feb 2017 23:08:17 +0100
Subject: [Buildroot] [PATCH] fakedate: simplify logic
Message-ID: <20170207220817.5781-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can use IFS=':' to get the shell to split on colons instead of running
tr, and using -ef to check for the same file is nicer than relying on magic
symlink-to-fakedate.

Notice that -ef isn't stricly posix (but supported by bash/dash/zsh), so
I've changed the shebang to /bin/bash.

While we are at it, restructure the logic to do a single exec at the end
instead of handling the epoch/!epoch cases differently for simplicity.

With that out of the way we can directly install it as $HOST/usr/bin/date
instead of the fakedate / date symlink.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakedate/fakedate    | 16 +++++-----------
 package/fakedate/fakedate.mk |  3 +--
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index 4a9b9b5e6..abe6b38f9 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # vim: set sw=4 expandtab:
 #
 # This program is free software; you can redistribute it and/or modify
@@ -18,18 +18,12 @@
 # Copyright (C) 2016 J?r?me Pouiller <jezz@sysmic.org>
 #
 
-# Sanity check
-if ! readlink -f "$0" | grep -q fakedate; then
-    echo "fakedate: Please name this script \`fakedate'"
-    exit 1
-fi
-
 DATE_BIN=false
 # Do not call `date' directly since it will produce an infinite recursion.
 # Instead, find path of true `date' binary.
-for P in `echo $PATH | tr ':' ' '`; do
+IFS=':'; for P in $PATH; do
     if [ -x "$P/date" ]; then
-        if readlink -f "$P/date" | grep -qv fakedate; then
+        if ! [ "$P/date" -ef "$0" ]; then
             DATE_BIN="$P/date"
             break;
         fi
@@ -50,8 +44,8 @@ if [ -n "$SOURCE_DATE_EPOCH" ]; then
     done
     if [ $FORCE_EPOCH -eq 1 ]; then
         echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
-        exec $DATE_BIN -d "@$SOURCE_DATE_EPOCH" "$@"
+	ARGS="-d @$SOURCE_DATE_EPOCH"
     fi
 fi
 
-exec $DATE_BIN "$@"
+exec $DATE_BIN $ARGS "$@"
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
index 61d4bd702..e81ce5dac 100644
--- a/package/fakedate/fakedate.mk
+++ b/package/fakedate/fakedate.mk
@@ -8,8 +8,7 @@
 HOST_FAKEDATE_LICENSE = GPLv2+
 
 define HOST_FAKEDATE_INSTALL_CMDS
-	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/fakedate
-	ln -sfn fakedate $(HOST_DIR)/usr/bin/date
+	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/date
 endef
 
 $(eval $(host-generic-package))
-- 
2.11.0
