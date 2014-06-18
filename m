From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:53:43 +0200
Subject: [Buildroot] [git commit] links: add security fix for CVE-2013-6050
Message-ID: <20140618123419.7F1E49CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69636df180e4a723b6160685b605dfbe326a0d26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix LICENSE typo.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rgefile.patch => links-0001-no-largefile.patch} |    0
 package/links/links-0002-CVE-2013-6050.patch       |   17 +++++++++++++++++
 package/links/links.mk                             |    2 +-
 3 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/links/links-no-largefile.patch b/package/links/links-0001-no-largefile.patch
similarity index 100%
rename from package/links/links-no-largefile.patch
rename to package/links/links-0001-no-largefile.patch
diff --git a/package/links/links-0002-CVE-2013-6050.patch b/package/links/links-0002-CVE-2013-6050.patch
new file mode 100644
index 0000000..d85c250
--- /dev/null
+++ b/package/links/links-0002-CVE-2013-6050.patch
@@ -0,0 +1,17 @@
+Description: Fix integer overflow in graphics mode (CVE-2013-6050)
+Author: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
+Bug-CVE: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-6050
+
+Index: links-2.7/html_tbl.c
+===================================================================
+--- links-2.7.orig/html_tbl.c   2013-11-22 01:57:29.000000000 +0100
++++ links-2.7/html_tbl.c        2013-11-22 01:58:30.000000000 +0100
+@@ -1550,6 +1550,8 @@ static void add_to_rect_sets(struct rect
+ static void add_to_cell_sets(struct table_cell ****s, int **nn, int *n, struct rect *r, struct table_cell *c)
+ {
+ 	int i, j;
++	if (r->y1 < 0 || r->y2 < 0)
++		fatal_exit("add_to_cell_sets: integer overflow: %d, %d", r->y1, r->y2);
+ 	for (i = r->y1 >> RECT_BOUND_BITS; i <= (r->y2 - 1) >> RECT_BOUND_BITS; i++) {
+ 		if (i >= *n) {
+ 			struct table_cell ***ns;
diff --git a/package/links/links.mk b/package/links/links.mk
index 6e683dd..a7baa4c 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -7,7 +7,7 @@
 LINKS_VERSION = 2.7
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-LINKS_LICNSE = GPLv2+
+LINKS_LICENSE = GPLv2+
 LINKS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
