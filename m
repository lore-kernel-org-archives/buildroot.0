From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 28 Apr 2007 10:10:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20070428171032.29DB94808C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-04-28 10:10:31 -0700 (Sat, 28 Apr 2007)
New Revision: 18529

Log:
When using an external toolchain, we still need to have the user select which thread model the toolchain was built with. This allows for proper building of LTP and possibly other packages.


Modified:
   trunk/buildroot/toolchain/external-toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-04-28 17:09:44 UTC (rev 18528)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-04-28 17:10:31 UTC (rev 18529)
@@ -27,10 +27,10 @@
 	help
 	  Strip shared libraries copied from the external toolchain.
 
+comment "Common Toolchain Options"
+
 source "toolchain/gdb/Config.in.2"
 
-comment "Common Toolchain Options"
-
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "External toolchain path"
 	default ""
@@ -44,6 +44,29 @@
 	  This the the external toolchain prefix. For example:
 	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
 
+choice
+	prompt "Thread library implementation"
+	default BR2_EXT_PTHREADS_OLD
+	help
+	  Select the version of libpthreads used in the external toolchain.
+
+	config BR2_EXT_PTHREADS_NONE
+		bool
+		prompt "none"
+
+	config BR2_EXT_PTHREADS
+		bool
+		prompt "linuxthreads"
+
+	config BR2_EXT_PTHREADS_OLD
+		bool
+		prompt "linuxthreads (stable/old)"
+
+	config BR2_EXT_PTHREADS_NATIVE
+		bool
+		prompt "Native POSIX Threading (NPTL)"
+endchoice
+
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
 	depends on !BR2_cris
