From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:46:35 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/pppd: Add
 upstream security fix for CVE-2020-8597
Message-ID: <20200315103600.5321782502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da40edcc1abea79e48a9ce4a0441daed696c5439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Apply patch from upstream and set PPPD_INGORE_CVES appropriately.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cfbff1456e397495435b08dbea10dd63035c4df2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/0001-pppd-Fix-bounds-check.patch | 37 +++++++++++++++++++++++++++
 package/pppd/pppd.mk                          |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/package/pppd/0001-pppd-Fix-bounds-check.patch b/package/pppd/0001-pppd-Fix-bounds-check.patch
new file mode 100644
index 0000000000..5d7c51bcac
--- /dev/null
+++ b/package/pppd/0001-pppd-Fix-bounds-check.patch
@@ -0,0 +1,37 @@
+From 8d7970b8f3db727fe798b65f3377fe6787575426 Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Mon, 3 Feb 2020 15:53:28 +1100
+Subject: [PATCH] pppd: Fix bounds check in EAP code
+
+Given that we have just checked vallen < len, it can never be the case
+that vallen >= len + sizeof(rhostname).  This fixes the check so we
+actually avoid overflowing the rhostname array.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+---
+ pppd/eap.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pppd/eap.c b/pppd/eap.c
+index 94407f56..1b93db01 100644
+--- a/pppd/eap.c
++++ b/pppd/eap.c
+@@ -1420,7 +1420,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
+@@ -1846,7 +1846,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 4784fe79f8..685666a200 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -11,6 +11,9 @@ PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
+# 0001-pppd-Fix-bounds-check.patch
+PPPD_IGNORE_CVES += CVE-2020-8597
+
 PPPD_MAKE_OPTS = HAVE_INET6=y
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 PPPD_DEPENDENCIES += openssl
