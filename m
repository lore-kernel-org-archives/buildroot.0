From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 09:51:42 +0100
Subject: [Buildroot] [git commit] openocd: avoid documentation rebuild to
	fix build issues
Message-ID: <20170228085709.9E2D07FB14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84617352f3c0508b3f14b526318048b5629e23b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On PowerPC64(le), we patch all configure scripts. Due to this, the
version.texi in OpenOCD files gets regenerated, and then since it has
a newer date than openocd.info, openocd build system rebuilds the
documentation. Unfortunately, this documentation rebuild fails on old
machines.

We work around this by faking the date of the generated version.texi
file, to make the build system believe the documentation doesn't need
to be regenerated.

Fixes:

  http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/openocd.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 21a302f..0d18365 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -99,5 +99,20 @@ HOST_OPENOCD_CONF_OPTS = \
 
 HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
 
+# Avoid documentation rebuild. On PowerPC64(le), we patch the
+# configure script. Due to this, the version.texi files gets
+# regenerated, and then since it has a newer date than openocd.info,
+# openocd build system rebuilds the documentation. Unfortunately, this
+# documentation rebuild fails on old machines. We work around this by
+# faking the date of the generated version.texi file, to make the
+# build system believe the documentation doesn't need to be
+# regenerated.
+define OPENOCD_FIX_VERSION_TEXI
+       touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
+endef
+OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
+HOST_OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
+
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
