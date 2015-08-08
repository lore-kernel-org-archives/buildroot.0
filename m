From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:45 -0000
Subject: [Buildroot] [git commit branch/next] heimdal: backport upstream
	commit to fix parallel build
Message-ID: <20150808105632.89028818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b34208115f6b9ebbe98e6252e13027c342e15d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Thanks to Vicente for an initial patch, and to Gustavo for pointing
out the relevant upstream fix.

Fixes:

  http://autobuild.buildroot.net/results/3a4/3a42c5b294a9a8602844ed1127ec5eadb60a6bed/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch |   35 ++++++++++++++++++++
 package/heimdal/heimdal.mk                         |    2 +
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch b/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
new file mode 100644
index 0000000..7361bf2
--- /dev/null
+++ b/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
@@ -0,0 +1,35 @@
+From 18fe7d300f133c2b9eb93bb4bd81e4644979a74b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jakub=20=C4=8Cajka?= <jcajka@redhat.com>
+Date: Tue, 1 Jul 2014 13:13:43 -0600
+Subject: [PATCH] kadm5: fix race in Makefile with kadm5_err.h
+
+When running make with -j4, occasionally kadm5 fails due to a missing
+header file kadm5_err.h. Fix the race condition.
+
+Reported at https://bugzilla.redhat.com/1115164
+
+Reviewed-by: Ken Dreyer <ktdreyer@ktdreyer.com>
+
+Backported from upstream commit
+6affa4cceceaa1369dd895f8acdd7a883ee65674.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/kadm5/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/kadm5/Makefile.am b/lib/kadm5/Makefile.am
+index f8be3b1..1b399b1 100644
+--- a/lib/kadm5/Makefile.am
++++ b/lib/kadm5/Makefile.am
+@@ -155,6 +155,7 @@ iprop-commands.c iprop-commands.h: iprop-commands.in
+ 	$(SLC) $(srcdir)/iprop-commands.in
+ 
+ $(libkadm5srv_la_OBJECTS): kadm5_err.h
++$(libkadm5clnt_la_OBJECTS): kadm5_err.h
+ $(iprop_log_OBJECTS): iprop-commands.h
+ 
+ client_glue.lo server_glue.lo: $(srcdir)/common_glue.c
+-- 
+2.4.5
+
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 19bca5e..8296448 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -26,6 +26,8 @@ HOST_HEIMDAL_CONF_OPTS = \
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
+# 0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
+HEIMDAL_AUTORECONF = YES
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
