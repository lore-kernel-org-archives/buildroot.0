From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Jul 2017 09:52:00 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] uboot-tools: disable
	libfdt swig wrapper for host
Message-ID: <20170721075957.C547781EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2638b3f305da06705692343d0deec8d34757945a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Commit f4891c398e599f18bbf41eb33885930431f5e1c8 [1] added a workaround to
disable the build of the python libfdt module if swig is available on the
host.

This workaround is also necessary when building the host uboot-tools.

Note, that the issue was introduced in upstream commit
1905c8fc711a527ff10550425498bc77e4db9ac3 [2] and released in version
U-Boot version 2017.03 and fixed in version 2017.07 (see [3]).

[1] https://git.busybox.net/buildroot/commit/package/uboot-tools?h=master&id=f4891c398e599f18bbf41eb33885930431f5e1c8
[2] http://git.denx.de/?p=u-boot.git;a=commit;h=1905c8fc711a527ff10550425498bc77e4db9ac3
[3] http://patchwork.ozlabs.org/patch/787412/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 352f53d..4096a0c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -23,7 +23,7 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 
 # This option was added through an additional patch
 # and allows the disabling of a host python swig
-# detect which as of 2017.5 assumes the host systems swig.
+# detect which as of 2017.3 assumes the host systems swig.
 UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE=y
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
@@ -92,6 +92,10 @@ HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+# Workaround to disable building the host python libfdt module. See comment
+# above when setting the target uboot-tools make options.
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE=y
+
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
