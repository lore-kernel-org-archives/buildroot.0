From: Michael Walle <michael@walle.cc>
Date: Mon, 10 Feb 2020 20:11:30 +0100
Subject: [Buildroot] [RFC PATCH] package/sdbusplus: fix the build
Message-ID: <20200210191131.2520-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d255b67972b4b7f27572581fe0c8c8aa03d850c8 fixed the handling of
the a package local m4/ directory which might be missing. But this only
works if it is the very first argument. But for this package this is not
possible because we already occupy this with the extra include directory
for autoconf-archive. Bring back the hook to create the m4/ directory to
fix this.

Signed-off-by: Michael Walle <michael@walle.cc>
---

IMHO keeping this hook if the package has an include directory in its
_AUTORECONF_OPTS variable is the least bad thing to do.

Unfortunately, I've only been able to test this briefly with the host
build.

 package/sdbusplus/sdbusplus.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index 9d3d1e8cf4..b771576a1d 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -22,5 +22,14 @@ SDBUSPLUS_INSTALL_STAGING = YES
 SDBUSPLUS_LICENSE = Apache-2.0
 SDBUSPLUS_LICENSE_FILES = LICENSE
 
+# Autoreconf is missing the m4/ directory, which might actually be missing
+# iff it was the first argument, but unfortunately we are overriding the
+# first include directory above. Thus we need that hook here.
+define SDBUSPLUS_CREATE_M4
+       mkdir -p $(@D)/m4
+endef
+SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
+HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
