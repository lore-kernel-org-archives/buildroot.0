From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Oct 2018 21:21:02 +0200
Subject: [Buildroot] [PATCH 1/1] open-plc-utils: fix build with static musl
Message-ID: <20181009192102.13223-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass -static to EXTRA_LDFLAGS to fix following issue:
/home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545: undefined reference to `raise'

Move EXTRA_CFLAGS and this new variable to OPEN_PLC_UTILS_MAKE_OPTS for
readability

Fixes:
 - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open-plc-utils/open-plc-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index d45bb9d4f5..1b2e4431b2 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -15,8 +15,15 @@ OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
 # Yes, we're passing __UCLIBC__ in EXTRA_CFLAGS, as it fixes a build
 # issue for non-uClibc toolchains. It is the very crappy solution
 # suggested at https://github.com/qca/open-plc-utils/issues/36.
+OPEN_PLC_UTILS_MAKE_OPTS = EXTRA_CFLAGS="-D__UCLIBC__"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+OPEN_PLC_UTILS_MAKE_OPTS += EXTRA_LDFLAGS=-static
+endif
+
 define OPEN_PLC_UTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) EXTRA_CFLAGS="-D__UCLIBC__" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
+		$(OPEN_PLC_UTILS_MAKE_OPTS) -C $(@D)
 endef
 
 define OPEN_PLC_UTILS_INSTALL_TARGET_CMDS
-- 
2.17.1
