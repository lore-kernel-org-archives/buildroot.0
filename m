From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 17 Mar 2017 17:06:14 +0100
Subject: [Buildroot] [PATCH v2 1/3] acl: make sure build picks up
	TARGET_CFLAGS
Message-ID: <20170317160616.20570-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The acl build system doesn't use automake, therefore it is broken. It
doesn't use the CFLAGS passed by configure. Work around this by passing
CFLAGS in the environment. The makefiles append to CFLAGS, so this
works.

This issue hasn't led to build failures, but it is visible e.g. when
stack protector is enabled: the stack protector options are not applied
to acl. Also debug and optimisation options aren't applied.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: new patch
---
 package/acl/acl.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index cbe5e93961..9fd5de18a4 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -15,7 +15,13 @@ ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
-# around their deficiencies by passing installation paths.
+# around their deficiencies by:
+# - explicitly passing CFLAGS (LDFLAGS are passed on from configure,
+#   CFLAGS are not).
+# - explicitly passing the installation prefix, not using DESTDIR.
+
+ACL_MAKE_ENV = CFLAGS="$(TARGET_CFLAGS)"
+
 ACL_INSTALL_STAGING_OPTS = \
 	prefix=$(STAGING_DIR)/usr \
 	exec_prefix=$(STAGING_DIR)/usr \
-- 
2.11.0
