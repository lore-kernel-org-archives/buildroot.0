From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:08:57 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] open-plc-utils: fix build
 with static musl
Message-ID: <20181024110823.0EBB2826CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c894af75fd91c8a16bee0caba97b320d97058a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Pass TARGET_LDFLAGS to EXTRA_LDFLAGS to fix following issue:
/home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545: undefined reference to `raise'

Also pass TARGET_CFLAGS to EXTRA_CFLAGS and TARGET_CXXFLAGS to
EXTRA_CXXFLAGS and move all these variables to
OPEN_PLC_UTILS_MAKE_OPTS for readability

Fixes:
 - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d8738d3b97a1ec1b356143269b293d55c91de860)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
