From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 13:53:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20080916205345.D2BE83C8C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-16 13:53:45 -0700 (Tue, 16 Sep 2008)
New Revision: 23411

Log:
Makefile: support relative paths for out of tree builds

And complain if the output directory cannot be created.

Modified:
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2008-09-16 19:35:42 UTC (rev 23410)
+++ trunk/buildroot/project/Makefile.in	2008-09-16 20:53:45 UTC (rev 23411)
@@ -30,7 +30,8 @@
 BASE_DIR:=$(shell pwd)
 ifdef O
 ifeq ("$(origin O)", "command line")
-BASE_DIR := $(O)
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
+$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 endif
 endif
 
