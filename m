From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Sep 2008 07:04:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20080926140409.17D7E3C368@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-26 07:04:08 -0700 (Fri, 26 Sep 2008)
New Revision: 23518

Log:
project/Makefile.in: workaround issue with out-of-tree builds

Other packages might also support Linux-style out of tree builds
with the O=<dir> syntax (E.G. Busybox does). As make automatically
forwards command line variable definitions those packages get very
confused. Fix this by telling make to not do so

Modified:
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2008-09-26 14:00:26 UTC (rev 23517)
+++ trunk/buildroot/project/Makefile.in	2008-09-26 14:04:08 UTC (rev 23518)
@@ -32,6 +32,12 @@
 ifeq ("$(origin O)", "command line")
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
+
+# other packages might also support Linux-style out of tree builds
+# with the O=<dir> syntax (E.G. Busybox does). As make automatically
+# forwards command line variable definitions those packages get very
+# confused. Fix this by telling make to not do so
+MAKEOVERRIDES =
 endif
 endif
 
