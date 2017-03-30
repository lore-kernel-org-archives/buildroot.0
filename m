From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:04:17 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] acl: make sure build
	picks up TARGET_CFLAGS
Message-ID: <20170331071605.4E13A826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7c5c7e5f6837bd47fb95d2df96726aeacbaf28f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The acl build system doesn't use automake, therefore it is broken. It
doesn't use the CFLAGS passed by configure. Work around this by passing
CFLAGS in the environment. The makefiles append to CFLAGS, so this
works.

This issue hasn't led to build failures, but it is visible e.g. when
stack protector is enabled: the stack protector options are not applied
to acl. Also debug and optimisation options aren't applied.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 99c9b0affde4fcc3270425319b98a0e5e32f5964)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index cbe5e93..9fd5de1 100644
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
