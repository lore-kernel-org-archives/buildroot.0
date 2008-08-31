From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 31 Aug 2008 13:23:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: docs project
Message-ID: <20080831202347.8128B3C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-31 13:23:47 -0700 (Sun, 31 Aug 2008)
New Revision: 23287

Log:
buildroot: support out-of-tree builds

Add support and documentation for out-of-tree builds with syntax
like the Linux kernel (make O=<dir>).

Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-08-31 20:23:41 UTC (rev 23286)
+++ trunk/buildroot/docs/buildroot.html	2008-08-31 20:23:47 UTC (rev 23287)
@@ -217,6 +217,20 @@
     <p>You can now disconnect or copy the content of your <code>dl</code> 
     directory to the build-host. </p>
 
+    <h3><a name="building_out_of_tree" id="building_out_of_tree"></a>
+    Building out-of-tree</h3>
+
+    <p>Buildroot supports building out of tree with a syntax similar
+    to the Linux kernel. To use it, add O=&lt;directory&gt; to the
+    make command line, E.G.:</p>
+
+<pre>
+ $ make O=/tmp/build
+</pre>
+
+    <p>And all the output files will be located under
+    <code>/tmp/build</code>.</p>
+
     <h3><a name="environment_variables" id="environment_variables"></a>
     Environment variables</h3>
 

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2008-08-31 20:23:41 UTC (rev 23286)
+++ trunk/buildroot/project/Makefile.in	2008-08-31 20:23:47 UTC (rev 23287)
@@ -25,7 +25,14 @@
 #")
 
 
+# Buildroot supports building out of tree similarly to the Linux kernel.
+# To use, add O= to the make command line (make O=/tmp/build)
 BASE_DIR:=$(shell pwd)
+ifdef O
+ifeq ("$(origin O)", "command line")
+BASE_DIR := $(O)
+endif
+endif
 
 TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
 #"))
