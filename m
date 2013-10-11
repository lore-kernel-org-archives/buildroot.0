From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Oct 2013 21:25:55 +0200
Subject: [Buildroot] [PATCH v2] support/kconfig: fix compile warning because
	of missing include.
Message-ID: <1381519555-5585-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With commit b58bf60b519353e983e372f5627d639e7cc72a7a the libgen.h
include was removed from confdata.c, but it is needed for the dirname
function declaration.

Fixes the following compile warning:
./confdata.c: In function ?conf_split_config?:
./confdata.c:849:6: warning: assignment makes pointer from integer
without a cast

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - Update patch 14-support-out-of-tree-config.patch to add missing
    include (as suggested by Thomas Petazzoni).
---
 support/kconfig/confdata.c                         |  1 +
 .../patches/14-support-out-of-tree-config.patch    | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 43f08fa..db1fac5 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -13,6 +13,7 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
+#include <libgen.h>
 
 #include "lkc.h"
 
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index 9e3f93d..e764fb2 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -20,7 +20,15 @@ Index: b/confdata.c
 ===================================================================
 --- a/confdata.c
 +++ b/confdata.c
-@@ -70,9 +70,7 @@
+@@ -13,6 +13,7 @@
+ #include <string.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <libgen.h>
+ 
+ #include "lkc.h"
+ 
+@@ -70,9 +71,7 @@
  
  const char *conf_get_autoconfig_name(void)
  {
@@ -31,7 +39,7 @@ Index: b/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -737,6 +735,9 @@
+@@ -737,6 +736,9 @@
  	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
@@ -41,7 +49,7 @@ Index: b/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -831,6 +832,7 @@
+@@ -831,6 +833,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -49,7 +57,7 @@ Index: b/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -839,8 +841,20 @@
+@@ -839,8 +842,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +80,7 @@ Index: b/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -933,9 +947,11 @@
+@@ -933,9 +948,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +95,7 @@ Index: b/confdata.c
  	return res;
  }
  
-@@ -945,25 +961,38 @@
+@@ -945,25 +962,38 @@
  	const char *name;
  	FILE *out, *tristate, *out_h;
  	int i;
@@ -130,7 +138,7 @@ Index: b/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -995,19 +1024,22 @@
+@@ -995,19 +1025,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
-- 
1.8.1.4
