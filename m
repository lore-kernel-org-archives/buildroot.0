From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jun 2021 08:39:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/pdbg: fix build with -DNDEBUG
Message-ID: <20210611063921.212274-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure with -DNDEBUG raised since commit
5a8c50fe05afacc3cbe8e7347e238da9f242fab0

Fixes:
 - http://autobuild.buildroot.org/results/9d90ede1ff7425cbb25b95aed3bf8d27ced865a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-build-Fix-build-with-DNDEBUG.patch   | 78 +++++++++++++++++++
 .../0002-build-Fix-build-with-DNDEBUG.patch   | 71 +++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch
 create mode 100644 package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch

diff --git a/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch b/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch
new file mode 100644
index 0000000000..fba5d38693
--- /dev/null
+++ b/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch
@@ -0,0 +1,78 @@
+From 9b4276d33c8637ca912911e720d6c760812a769b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 9 Jun 2021 21:15:31 +0200
+Subject: [PATCH] build: Fix build with -DNDEBUG
+
+Fix the following build failures with -DNDEBUG:
+
+libpdbg/adu.c: In function 'blog2':
+libpdbg/adu.c:112:1: error: control reaches end of non-void function [-Werror=return-type]
+  112 | }
+      | ^
+  CC       libpdbg/libpdbg_la-chip.lo
+  CC       libpdbg/libpdbg_la-cronus.lo
+libpdbg/cfam.c: In function 'cfam_hmfsi_probe':
+libpdbg/cfam.c:325:13: error: 'port' is used uninitialized in this function [-Werror=uninitialized]
+  325 |  value |= 1 << (31 - port);
+      |           ~~^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9d90ede1ff7425cbb25b95aed3bf8d27ced865a4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-by: Amitay Isaacs <amitay@ozlabs.org>
+[Retrieved from:
+https://github.com/open-power/pdbg/commit/9b4276d33c8637ca912911e720d6c760812a769b]
+---
+ libpdbg/adu.c    | 3 ++-
+ libpdbg/device.c | 2 +-
+ src/mem.c        | 2 +-
+ 3 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libpdbg/adu.c b/libpdbg/adu.c
+index 6358e7a3f..7ee15c350 100644
+--- a/libpdbg/adu.c
++++ b/libpdbg/adu.c
+@@ -15,6 +15,7 @@
+  */
+ #include <stdio.h>
+ #include <stdint.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <inttypes.h>
+ 
+@@ -107,7 +108,7 @@ uint8_t blog2(uint8_t x)
+ 	case 64:
+ 		return 6;
+ 	default:
+-		assert(0);
++		abort();
+ 	}
+ }
+ 
+diff --git a/libpdbg/device.c b/libpdbg/device.c
+index 8884baa45..502ca38ab 100644
+--- a/libpdbg/device.c
++++ b/libpdbg/device.c
+@@ -501,7 +501,7 @@ static enum pdbg_target_status str_to_status(const char *status)
+ 	else if (!strcmp(status, "unknown"))
+ 		return PDBG_TARGET_UNKNOWN;
+ 	else
+-		assert(0);
++		abort();
+ }
+ 
+ static int dt_expand_node(struct pdbg_target *node, void *fdt, int fdt_node)
+diff --git a/src/mem.c b/src/mem.c
+index 99a673f36..878ac029a 100644
+--- a/src/mem.c
++++ b/src/mem.c
+@@ -166,7 +166,7 @@ OPTCMD_DEFINE_CMD_WITH_FLAGS(getmemio, getmemio, (ADDRESS, DATA, BLOCK_SIZE),
+ static int _putmem(const char *mem_prefix, uint64_t addr, uint8_t block_size, bool ci)
+ {
+ 	uint8_t *buf;
+-	size_t buflen;
++	size_t buflen = 0;
+ 	int rc, count = 0;
+ 	struct pdbg_target *target;
+ 
diff --git a/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch b/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
new file mode 100644
index 0000000000..323a87d779
--- /dev/null
+++ b/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
@@ -0,0 +1,71 @@
+From cd1a44bac413e8a6bc2572720153cc5e703762e1 Mon Sep 17 00:00:00 2001
+From: Amitay Isaacs <amitay@ozlabs.org>
+Date: Fri, 11 Jun 2021 15:27:29 +1000
+Subject: [PATCH] build: Fix build with -DNDEBUG
+
+Signed-off-by: Amitay Isaacs <amitay@ozlabs.org>
+[Retrieved from:
+https://github.com/open-power/pdbg/commit/cd1a44bac413e8a6bc2572720153cc5e703762e1]
+---
+ libpdbg/cfam.c   | 6 +++++-
+ libpdbg/device.c | 9 ++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/libpdbg/cfam.c b/libpdbg/cfam.c
+index ffe69296e..976ce5a6d 100644
+--- a/libpdbg/cfam.c
++++ b/libpdbg/cfam.c
+@@ -17,6 +17,7 @@
+  */
+ #include <unistd.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <inttypes.h>
+ 
+ #include "hwunit.h"
+@@ -320,7 +321,10 @@ static int cfam_hmfsi_probe(struct pdbg_target *target)
+ 	int rc;
+ 
+ 	/* Enable the port in the upstream control register */
+-	assert(!(pdbg_target_u32_property(target, "port", &port)));
++	if (pdbg_target_u32_property(target, "port", &port)) {
++		PR_ERROR("Attribute port not defined for %s\n", pdbg_target_path(target));
++		abort();
++	}
+ 	fsi_read(fsi_parent, 0x3404, &value);
+ 	value |= 1 << (31 - port);
+ 	if ((rc = fsi_write(fsi_parent, 0x3404, value))) {
+diff --git a/libpdbg/device.c b/libpdbg/device.c
+index 502ca38ab..ab821d387 100644
+--- a/libpdbg/device.c
++++ b/libpdbg/device.c
+@@ -417,7 +417,7 @@ static const void *dt_require_property(struct pdbg_target *node,
+ 
+ 		prerror("DT: Missing required property %s/%s\n",
+ 			path, name);
+-		assert(false);
++		abort();
+ 	}
+ 	if (wanted_len >= 0 && len != wanted_len) {
+ 		const char *path = dt_get_path(node);
+@@ -426,7 +426,7 @@ static const void *dt_require_property(struct pdbg_target *node,
+ 			path, name);
+ 		prerror("DT: Expected len: %d got len: %zu\n",
+ 			wanted_len, len);
+-		assert(false);
++		abort();
+ 	}
+ 
+ 	if (prop_len) {
+@@ -604,7 +604,10 @@ uint64_t pdbg_target_address(struct pdbg_target *target, uint64_t *out_size)
+ 
+ 	p = dt_require_property(target, "reg", -1, &len);
+ 	n = (na + ns) * sizeof(u32);
+-	assert(n <= len);
++	if (n > len) {
++		PR_ERROR("Invalid reg value for %s\n", pdbg_target_path(target));
++		abort();
++	}
+ 	if (out_size)
+ 		*out_size = dt_get_number(p + na * sizeof(u32), ns);
+ 	return dt_get_number(p, na);
-- 
2.30.2
