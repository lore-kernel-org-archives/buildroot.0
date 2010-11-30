From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 30 Nov 2010 23:19:05 +0200
Subject: [Buildroot] [RFC PATCH] Add support for sources in .zip
Message-ID: <20101130211905.24115.69245.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/Makefile.package.in |    1 +
 scripts/unzip_wrapper.sh    |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100755 scripts/unzip_wrapper.sh

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 816a013..fc48ead 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -61,6 +61,7 @@ INFLATE.gz   = $(ZCAT)
 INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
+INFLATE.zip  = scripts/unzip_wrapper.sh 
 INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
diff --git a/scripts/unzip_wrapper.sh b/scripts/unzip_wrapper.sh
new file mode 100755
index 0000000..7e897e4
--- /dev/null
+++ b/scripts/unzip_wrapper.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+ZIP_TMP_DIR=`mktemp -d`
+
+unzip -q $1 -d $ZIP_TMP_DIR
+tar -cC $ZIP_TMP_DIR `ls $ZIP_TMP_DIR`
+rm -rf $ZIP_TMP_DIR
