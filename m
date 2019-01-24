From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:26:39 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/openssh: add
 upstream security fix
Message-ID: <20190124162608.9C2068E4B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad444c2557c258979d752cf7f87536d7a883ffce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-20685: The scp client allows server to modify permissions
of the target directory by using empty ("D0777 0 \n") or dot ("D0777 0
.\n") directory name.

The bug reporter lists a number of related vulnerabilities that are not
fixed yet:

  https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8233c666124890fff713ecb254993b52b1fa7674)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sallow-empty-incoming-filename-or-ones-th.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/openssh/0001-upstream-disallow-empty-incoming-filename-or-ones-th.patch b/package/openssh/0001-upstream-disallow-empty-incoming-filename-or-ones-th.patch
new file mode 100644
index 0000000000..2b5a958d13
--- /dev/null
+++ b/package/openssh/0001-upstream-disallow-empty-incoming-filename-or-ones-th.patch
@@ -0,0 +1,39 @@
+From 6010c0303a422a9c5fa8860c061bf7105eb7f8b2 Mon Sep 17 00:00:00 2001
+From: "djm at openbsd.org" <djm@openbsd.org>
+Date: Fri, 16 Nov 2018 03:03:10 +0000
+Subject: [PATCH] upstream: disallow empty incoming filename or ones that refer
+ to the
+
+current directory; based on report/patch from Harry Sintonen
+
+OpenBSD-Commit-ID: f27651b30eaee2df49540ab68d030865c04f6de9
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status (openssh-portable): commit 6010c0303a422
+
+ scp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 60682c68769b..4f3fdcd3db89 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: scp.c,v 1.197 2018/06/01 04:31:48 dtucker Exp $ */
++/* $OpenBSD: scp.c,v 1.198 2018/11/16 03:03:10 djm Exp $ */
+ /*
+  * scp - secure remote copy.  This is basically patched BSD rcp which
+  * uses ssh to do the data transfer (instead of using rcmd).
+@@ -1106,7 +1106,8 @@ sink(int argc, char **argv)
+ 			SCREWUP("size out of range");
+ 		size = (off_t)ull;
+ 
+-		if ((strchr(cp, '/') != NULL) || (strcmp(cp, "..") == 0)) {
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
+-- 
+2.20.1
+
