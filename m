From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Aug 2020 22:18:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/dropbear:
 backport security fix for CVE-2018-20685
Message-ID: <20200806200340.8F30184184@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e90b0171f4c4ab4c8b0f76079255261270ef61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The update to 2020.79 contains several other changes that may not be
appropriate for the LTS branch, hence just backport the single fix.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-scp-Port-OpenSSH-CVE-2018-20685-fix.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/dropbear/0001-scp-Port-OpenSSH-CVE-2018-20685-fix.patch b/package/dropbear/0001-scp-Port-OpenSSH-CVE-2018-20685-fix.patch
new file mode 100644
index 0000000000..4372d615d6
--- /dev/null
+++ b/package/dropbear/0001-scp-Port-OpenSSH-CVE-2018-20685-fix.patch
@@ -0,0 +1,24 @@
+# HG changeset patch
+# User Haelwenn Monnier <contact+github.com@hacktivis.me>
+# Date 1590411269 -7200
+#      Mon May 25 14:54:29 2020 +0200
+# Node ID 087c2804147074c95b6a3f35137b4f4b726b1452
+# Parent  009d52ae26d35f3381c801e02318fa9be34be93c
+scp.c: Port OpenSSH CVE-2018-20685 fix (#80)
+
+[backport from 2020.79 to 2019.78 for Buildroot 2020.02.x]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+diff --git a/scp.c b/scp.c
+--- a/scp.c
++++ b/scp.c
+@@ -935,7 +935,8 @@ sink(int argc, char **argv)
+ 			size = size * 10 + (*cp++ - '0');
+ 		if (*cp++ != ' ')
+ 			SCREWUP("size not delimited");
+-		if ((strchr(cp, '/') != NULL) || (strcmp(cp, "..") == 0)) {
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
