From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:28:17 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] vboot-utils: fix ARCH
 detection
Message-ID: <20171126213911.BD68D802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=720c192ae39223981f21dbaba6c2c493d894a02c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The package includes some target-specific code that is irrelevant
in a host package but gets built anyway. The target for this code
must be one of the supported ChromeOS targets.

Supplied Makefile apparently relies on the environment to provide
a valid target, with a simple fallback to host arch. This breaks
the build if no value is provided and the host arch is not among
the supported ones.

Should fix
http://autobuild.buildroot.net/results/d118a83b6c4f7f910d0d44c279f36251d7ba29e8/
and similar failures.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit bbb25c3ad7b66e6882508e49028d1739732bca34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vboot-utils/vboot-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index a7592d6..a64e1d5 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -21,12 +21,17 @@ HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-util-linux host-pkgconf
 # media partitioning.
 #
 # make target for futility is "futil".
+#
+# The value of ARCH is only relevant for crossystem (a target tool) and
+# does not affect futil or cgpt in any way as long as it is one of the
+# supported targets.
 
 define HOST_VBOOT_UTILS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(HOSTCC)" \
 		CFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
+		ARCH=arm \
 		futil cgpt
 endef
 
