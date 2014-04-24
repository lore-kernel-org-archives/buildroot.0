From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 00:30:01 +0200
Subject: [Buildroot] [PATCH 6/9] package/upx: new package
In-Reply-To: <cover.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <d2b063c77023df58acb96852a8dfe0b812750355.1398378217.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Frank Hunleth <fhunleth@troodon-software.com>

UPX is a free, portable, extendable, high-performance executable packer
for several executable formats.

This is needed for syslinux 6.x.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[yann.morin.1998 at free.fr: builds fine in parallel; fix build to
 locate libucl; fix installation; don't add a menuconfig entry]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
