From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  3 Nov 2008 12:11:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20081103201104.190E7F8015@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-03 12:11:03 -0800 (Mon, 03 Nov 2008)
New Revision: 23920

Log:
Makefile: ignore glib-genmarshal in staging_dir

HOST_GLIB is set to the path that contains the host glib tool set and is
used when building packages using glib. The buildroot top level Makefile
sets HOST_GLIB using which to find the path where glib-genmarshal is
located.

The problem is that a cross compiled version of glib-genmarshal is also
put in the build_ARCH/staging_dir/usr/bin directory when the package
libglib2 is built. This cross compiled version will typically not run on
the host system.

Fix it by ignoring staging_dir in the which output.

Closes #5934

jacmet: fixed to work correctly if it's only found in staging_dir.

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-03 16:14:04 UTC (rev 23919)
+++ trunk/buildroot/Makefile	2008-11-03 20:11:03 UTC (rev 23920)
@@ -122,7 +122,8 @@
 HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
-HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
+# ignore version in staging_dir
+HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "(which -a glib-genmarshal; echo /usr/bin/glib-genmarshal)|grep -v staging_dir|head -n 1")`
 HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
 
 
