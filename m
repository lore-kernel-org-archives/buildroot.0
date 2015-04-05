From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:43:27 +0200
Subject: [Buildroot] [git commit] open-plc-utils: fix build on !uclibc
	toolchains
Message-ID: <20150405094334.6DD948193A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4ae98d5108e276e5f46b35303374279f89d3f25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The open-plc-utils source code has a condition for uClibc toolchains
when calling vfprintf(). But the non-uClibc case simply doesn't
build. And the recommended solution at
https://github.com/qca/open-plc-utils/issues/36 is to pass
-D__UCLIBC__ unconditionally.

Fixes:

  http://autobuild.buildroot.org/results/4fd/4fdc56f5dec6c8773086a4661eff1e4ce6ef660e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/open-plc-utils/open-plc-utils.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index e7c5a6f..61badcd 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -11,8 +11,12 @@ OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, as it would
 # override the package CFLAGS, LDFLAGS and CXXFLAGS definitions.
+#
+# Yes, we're passing __UCLIBC__ in EXTRA_CFLAGS, as it fixes a build
+# issue for non-uClibc toolchains. It is the very crappy solution
+# suggested at https://github.com/qca/open-plc-utils/issues/36.
 define OPEN_PLC_UTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) EXTRA_CFLAGS="-D__UCLIBC__" -C $(@D)
 endef
 
 define OPEN_PLC_UTILS_INSTALL_TARGET_CMDS
