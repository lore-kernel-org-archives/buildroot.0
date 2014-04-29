From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 18:49:14 +0200
Subject: [Buildroot] [PATCH 6/9] package/upx: new package
In-Reply-To: <cover.1398789775.git.yann.morin.1998@free.fr>
References: <cover.1398789775.git.yann.morin.1998@free.fr>
Message-ID: <fe74c338bb8072b838c0452a9f6ff7fb7a036551.1398789775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Frank Hunleth <fhunleth@troodon-software.com>

UPX is a free, portable, extendable, high-performance executable
packer for several executable formats.

This is needed for syslinux 6.x.

Note: upx is a host-only package. Although it supports quite a few
target architectures, the only use so far wil be syslinux, which
already has an x86-on-x86 requirement anyway. So we currently do
not care to have target-dependencies on host-upx.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[yann.morin.1998 at free.fr: builds fine in parallel; fix build to
 locate libucl; fix installation; don't add a menuconfig entry]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - slightly improve on the commit log about host <-> target
    architectutre limitations  (Arnout)
---
 package/upx/upx.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/upx/upx.mk

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
new file mode 100644
index 0000000..a039376
--- /dev/null
+++ b/package/upx/upx.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# upx
+#
+################################################################################
+
+UPX_VERSION = 3.91
+UPX_SITE = http://upx.sourceforge.net/download/
+UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
+UPX_LICENSE = GPLv2+
+UPX_LICENSE_FILES = COPYING
+
+HOST_UPX_DEPENDENCIES = host-ucl
+
+# We need to specify all, otherwise the default target only prints a message
+# stating to "please choose a target for 'make'"... :-(
+define HOST_UPX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
+	    LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+	    -C $(@D) all
+endef
+
+# UPX has no install procedure, so install it manually.
+define HOST_UPX_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/usr/bin/upx
+endef
+
+$(eval $(host-generic-package))
-- 
1.8.3.2
