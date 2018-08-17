From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:55:41 +0200
Subject: [Buildroot] [git commit] cryptsetup: fix build with pre C11
 toolchains
Message-ID: <20180817145448.16D198D4C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9cfe343d230fe95ad84842b9b2ed87667da6430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch removing a redefined typedef. Redefinition of typedef, even
to the same type, used to be illegal before C11.

Fixes:
http://autobuild.buildroot.net/results/93b/93b300a62f2ddbad66eab08e25fc3225969f224b/
http://autobuild.buildroot.net/results/6c6/6c6092d633400498ee5b8090733a949a9632e473/
http://autobuild.buildroot.net/results/f46/f46ef6123b5fa92753ff534b4ef7bea3f53ac388/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-json_object-typedef.patch          | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/cryptsetup/0001-Remove-json_object-typedef.patch b/package/cryptsetup/0001-Remove-json_object-typedef.patch
new file mode 100644
index 0000000000..fa865314a7
--- /dev/null
+++ b/package/cryptsetup/0001-Remove-json_object-typedef.patch
@@ -0,0 +1,46 @@
+From 567e7f8664c621f8aeaa95d9f4ab4b590574f572 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 15 Aug 2018 14:13:46 +0300
+Subject: [PATCH] Remove json_object typedef
+
+The json-c header already defines the same typedef. While C11 allows
+typedef redefinition to the same type, older versions of gcc disallow
+that.
+
+In file included from lib/luks2/luks2_internal.h:32,
+                 from lib/luks2/luks2_disk_metadata.c:24:
+lib/luks2/luks2.h:86: error: redefinition of typedef 'json_object'
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ lib/luks2/luks2.h | 1 -
+ lib/setup.c       | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/luks2/luks2.h b/lib/luks2/luks2.h
+index ee57b41ba974..25e36190da45 100644
+--- a/lib/luks2/luks2.h
++++ b/lib/luks2/luks2.h
+@@ -83,7 +83,6 @@ struct luks2_hdr_disk {
+ /*
+  * LUKS2 header in-memory.
+  */
+-typedef struct json_object json_object;
+ struct luks2_hdr {
+ 	size_t		hdr_size;
+ 	uint64_t	seqid;
+diff --git a/lib/setup.c b/lib/setup.c
+index fddbe7ef7897..856f6e80f465 100644
+--- a/lib/setup.c
++++ b/lib/setup.c
+@@ -28,6 +28,7 @@
+ #include <sys/utsname.h>
+ #include <fcntl.h>
+ #include <errno.h>
++#include <json-c/json.h>
+ 
+ #include "libcryptsetup.h"
+ #include "luks.h"
+-- 
+2.18.0
+
