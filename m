From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/libss7: new package
Message-ID: <20170923171328.182308103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c3b714f3548cf42aeaaf9c022ad5f5c63d2069b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile in the package is not very versatile, so we need to go our
way to only build and install what we can.

Fixing the Makefile is not worth it, considering that we can quite
easily do all of that in our .mk.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: Add license file hash, use SPDX license name]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in          |  1 +
 package/libss7/Config.in   | 18 +++++++++++++++
 package/libss7/libss7.hash |  6 +++++
 package/libss7/libss7.mk   | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0dbe188..3b2f04a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1170,6 +1170,7 @@ menu "Hardware handling"
 	source "package/libsigrok/Config.in"
 	source "package/libsigrokdecode/Config.in"
 	source "package/libsoc/Config.in"
+	source "package/libss7/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
 	source "package/libusbgx/Config.in"
diff --git a/package/libss7/Config.in b/package/libss7/Config.in
new file mode 100644
index 0000000..b99c578
--- /dev/null
+++ b/package/libss7/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBSS7
+	bool "libss7"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_DAHDI_LINUX
+	select BR2_PACKAGE_DAHDI_TOOLS
+	help
+	  libss7 is an open source library that encapsulates the
+	  protocols used to communicate using Signaling System 7
+	  over ISDN (T1, E1).
+
+	  http://www.asterisk.org/downloads/libss7
+
+comment "libss7 needs a kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "libss7 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libss7/libss7.hash b/package/libss7/libss7.hash
new file mode 100644
index 0000000..8e1d663
--- /dev/null
+++ b/package/libss7/libss7.hash
@@ -0,0 +1,6 @@
+# Hashes from http://downloads.asterisk.org/pub/telephony/libss7/releases/
+sha1    7112a0717293fc273d5d488e1387ad28abe4e9b3  libss7-2.0.0.tar.gz
+sha256  5af00853cfb2bc6bcf050947804db132ae6872db0cd2ab24b5378828f78eda52  libss7-2.0.0.tar.gz
+
+# License file, locally calculated
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
new file mode 100644
index 0000000..541505b
--- /dev/null
+++ b/package/libss7/libss7.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# libss7
+#
+################################################################################
+
+LIBSS7_VERSION = 2.0.0
+LIBSS7_SITE = http://downloads.asterisk.org/pub/telephony/libss7/releases
+
+LIBSS7_LICENSE = GPL-2.0
+LIBSS7_LICENSE_FILES = LICENSE
+
+LIBSS7_DEPENDENCIES = dahdi-linux dahdi-tools
+LIBSS7_INSTALL_STAGING = YES
+
+# The Makefile default rule will always try to generate both libraries.
+# So we need to explicitly build only what we can.
+ifneq ($(BR2_SHARED_LIBS),y)
+LIBSS7_LIBS = libss7.a
+define LIBSS7_INSTALL_A
+	$(INSTALL) -D -m 0644 $(@D)/libss7.a $(1)/usr/lib/libss7.a
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+LIBSS7_LIBS += libss7.so.2.0
+define LIBSS7_INSTALL_SO
+	$(INSTALL) -D -m 0644 $(@D)/libss7.so.2.0 $(1)/usr/lib/libss7.so.2.0
+	ln -sf libss7.so.2.0 $(1)/usr/lib/libss7.so
+endef
+endif
+
+# The Makefile erroneously looks for host headers to decide what utilities
+# to build, and thus misses the test utilities. So we explicitly build them
+# as they can be useful to validate that the hardware does work.
+LIBSS7_UTILS = parser_debug ss7test ss7linktest
+
+define LIBSS7_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(LIBSS7_LIBS) $(LIBSS7_UTILS)
+endef
+
+define LIBSS7_INSTALL_STAGING_CMDS
+	$(call LIBSS7_INSTALL_A,$(STAGING_DIR))
+	$(call LIBSS7_INSTALL_SO,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libss7.h $(STAGING_DIR)/usr/include/libss7.h
+endef
+
+define LIBSS7_INSTALL_TARGET_CMDS
+	$(foreach u,$(LIBSS7_UTILS),\
+		$(INSTALL) -D -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
+	$(call LIBSS7_INSTALL_SO,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
