From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Apr 2016 20:02:53 +0200
Subject: [Buildroot] [PATCH] ccache: fix explicit build 'make clean
	host-ccache'
Message-ID: <1461952973-20054-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

To build host-ccache we need to call the bare compiler. With a standard
'make', this is guaranteed because host-ccache is built as part of the
dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
no-ccache version (see support/dependencies/dependencies.mk).
However, this is not the case when using 'make host-ccache' explicitly
from a clean build.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/ccache/ccache.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c4f0310..ae369a6 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -21,6 +21,13 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 
+# To build host-ccache we need to call the bare compiler. With a standard
+# 'make', this is guaranteed because host-ccache is built as part of the
+# dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
+# no-ccache version (see support/dependencies/dependencies.mk).
+# However, this is not the case when using 'make host-ccache'.
+HOST_CCACHE_CONF_ENV += CC=$(HOSTCC_NOCCACHE) CXX=$(HOSTCXX_NOCCACHE)
+
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
 #    is already used by autotargets for the ccache package.
-- 
2.7.3
