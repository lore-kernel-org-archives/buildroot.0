From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  4 Aug 2020 16:00:08 +0200
Subject: [Buildroot] [PATCH for LTS] package/dropbear: backport security fix
 for CVE-2018-20685
Message-ID: <20200804140009.24861-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The update to 2020.79 contains several other changes that may not be
appropriate for the LTS branch, hence just backport the single fix.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...-scp-Port-OpenSSH-CVE-2018-20685-fix.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/dropbear/0001-scp-Port-OpenSSH-CVE-2018-20685-fix.patch

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
-- 
2.26.2
