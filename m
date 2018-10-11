From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Oct 2018 20:20:13 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] open-plc-utils: fix build with static musl
Message-ID: <20181011182013.16467-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass TARGET_LDFLAGS to EXTRA_LDFLAGS to fix following issue:
/home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545: undefined reference to `raise'

Also pass TARGET_CFLAGS to EXTRA_CFLAGS and TARGET_CXXFLAGS to
EXTRA_CXXFLAGS and move all these variables to
OPEN_PLC_UTILS_MAKE_OPTS for readability

Fixes:
 - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Instead of passing -static to EXTRA_LDFLAGS, use TARGET_LDFLAGS
 - pass TARGET_CFLAGS to EXTRA_CFLAGS
 - pass TARGET_CXXFLAGS to EXTRA_CXXFLAGS

 package/open-plc-utils/open-plc-utils.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index d45bb9d4f5..e1e66bf7e0 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -15,8 +15,14 @@ OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
 # Yes, we're passing __UCLIBC__ in EXTRA_CFLAGS, as it fixes a build
 # issue for non-uClibc toolchains. It is the very crappy solution
 # suggested at https://github.com/qca/open-plc-utils/issues/36.
+OPEN_PLC_UTILS_MAKE_OPTS = \
+	EXTRA_CFLAGS="$(TARGET_CFLAGS) -D__UCLIBC__" \
+	EXTRA_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
+
 define OPEN_PLC_UTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) EXTRA_CFLAGS="-D__UCLIBC__" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
+		$(OPEN_PLC_UTILS_MAKE_OPTS) -C $(@D)
 endef
 
 define OPEN_PLC_UTILS_INSTALL_TARGET_CMDS
-- 
2.17.1
