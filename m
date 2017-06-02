From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  2 Jun 2017 07:55:23 +0300
Subject: [Buildroot] [PATCH] swupdate: fix build without json-c
Message-ID: <3490aaf3fa9ecc82542a416fa6908dc1bc666b61.1496379323.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

swupdate enables SURICATTA_HAWKBIT by default, which unconditionally selects
JSON. This breaks the build when the optional json-c dependency is not built.
Add a patch fixing SURICATTA_HAWKBIT dependencies.

Fixes:
http://autobuild.buildroot.net/results/e61/e6179f515589a42a9aee16b54b897ef9111e7f4b/
http://autobuild.buildroot.net/results/dba/dba54b00c81f62d957a8c189dde39ba0db8864e6/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-suricata_hawkbit-depends-on-HAVE_JSON_C.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch

diff --git a/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch b/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch
new file mode 100644
index 000000000000..e8cd790bd457
--- /dev/null
+++ b/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch
@@ -0,0 +1,39 @@
+From ae647879efad6ba2bb0b95ed7e70dee82c05b82a Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 2 Jun 2017 07:40:08 +0300
+Subject: [PATCH] suricata_hawkbit: depends on HAVE_JSON_C
+
+Unconditionally selecting JSON when !HAVE_JSON_C leads to a warning:
+
+warning: (SURICATTA_HAWKBIT) selects JSON which has unmet direct dependencies (HAVE_JSON_C)
+
+and eventually a build failure:
+
+In file included from corelib/artifacts_versions.c:34:0:
+include/parselib.h:61:25: fatal error: json-c/json.h: No such file or directory
+
+Make SURICATTA_HAWKBIT depend on HAVE_JSON_C.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status:
+https://groups.google.com/forum/?hl=en#!topic/swupdate/WmwNN_Hni0c
+
+ suricatta/Config.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/suricatta/Config.in b/suricatta/Config.in
+index 24bd5d1053f5..cfd96b83506a 100644
+--- a/suricatta/Config.in
++++ b/suricatta/Config.in
+@@ -54,6 +54,7 @@ choice
+ config SURICATTA_HAWKBIT
+ 	bool "hawkBit support"
+ 	depends on HAVE_LIBCURL
++	depends on HAVE_JSON_C
+ 	select JSON
+ 	select SURICATTA
+ 	help
+-- 
+2.11.0
+
-- 
2.11.0
