From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Dec 2008 07:10:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20081201151047.4DCDA3C7BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-01 07:10:47 -0800 (Mon, 01 Dec 2008)
New Revision: 24219

Log:
haserl: fix shared cache interaction issue

The ac_cv_path_install override is needed to strip the target binary for
haserl 0.8.0, but it doesn't interact nicely with the shared cache, so
disable the cache for now.

Longer term we should probably forget about install-strip and do the
strip/cleanup/mklibs stuff as a post processing step before the target
filesystem rules are run.

Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2008-12-01 14:53:22 UTC (rev 24218)
+++ trunk/buildroot/package/haserl/haserl.mk	2008-12-01 15:10:47 UTC (rev 24219)
@@ -17,6 +17,8 @@
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
+# the above doesn't interact nicely with a shared cache, so disable for now
+HASERL_USE_CONFIG_CACHE = NO
 
 HASERL_DEPENDENCIES:=uclibc
 
