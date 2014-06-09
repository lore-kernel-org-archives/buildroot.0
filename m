From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:37:46 +0200
Subject: [Buildroot] [git commit] isl: new package
Message-ID: <20140609094816.D42599CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac888c06f3f42551a74c1d7c5fbc22344de15168
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

isl is a library for manipulating sets and relations of integer points
bounded by linear constraints.

isl is needed for the optional graphite optimisations that are supported
by gcc since version 4.5. Therefore this package is required for the
toolchain to support graphite.

Graphite optimisations primarily involve loop blocking flattening and
interchage so are probably of mimimal use in an embedded system where
small sizes are favoured.

[Thomas:
 - bump to 0.12.2 (cannot use 0.13, incompatible with cloog 0.18.2,
   comment added about this)
 - use .bz2 tarball
 - disable libtool patch, which doesn't apply]

Signed-off-by: Steve Thomas <scjthm@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/isl/isl.mk |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
new file mode 100644
index 0000000..40e023f
--- /dev/null
+++ b/package/isl/isl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# isl
+#
+################################################################################
+
+# The latest 0.13 version is not yet compatible with cloog 0.18.2, so
+# bumping isl is not possible until a new version of cloog is
+# published.
+ISL_VERSION = 0.12.2
+ISL_SOURCE = isl-$(ISL_VERSION).tar.bz2
+ISL_SITE = http://isl.gforge.inria.fr/
+ISL_LICENSE = MIT
+ISL_LICENSE_FILES = LICENSE
+ISL_INSTALL_STAGING = YES
+ISL_DEPENDENCIES = gmp
+
+# Our libtool patch doesn't apply, and since this package is only
+# built for the host, we don't really care about it.
+ISL_LIBTOOL_PATCH = NO
+
+$(eval $(host-autotools-package))
