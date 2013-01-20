From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:38:53 +0100
Subject: [Buildroot] [git commit] sg3_utils: new package
Message-ID: <20130120214100.203669A55B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c81a67056e793b5147f39711a34186b2db3f9313
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: rename to sg3-utils, invert package license logic]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/sg3_utils/Config.in    |   16 ++++++++++++++++
 package/sg3_utils/sg3_utils.mk |   40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ba03b3c..3fe5c79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -267,6 +267,7 @@ source "package/rpi-userland/Config.in"
 source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
+source "package/sg3_utils/Config.in"
 source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
new file mode 100644
index 0000000..3262eae
--- /dev/null
+++ b/package/sg3_utils/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SG3_UTILS
+	bool "sg3-utils"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Low level utilities for devices that use a SCSI command set.
+	  This option install only libsgutils2 library not programs.
+
+	  http://sg.danny.cz/sg/sg3_utils.html
+
+config BR2_PACKAGE_SG3_UTILS_PROGS
+	bool "install programs"
+	depends on BR2_PACKAGE_SG3_UTILS
+
+comment "sg3-utils requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
new file mode 100644
index 0000000..9015b2a
--- /dev/null
+++ b/package/sg3_utils/sg3_utils.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# sg3_utils
+#
+#############################################################
+
+SG3_UTILS_VERSION = 1.34
+SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
+SG3_UTILS_LICENSE = BSD-3c
+# utils progs are GPLv2+ licenced
+ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
+SG3_UTILS_LICENSE += GPLv2+
+endif
+SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
+
+# install the libsgutils2 library
+SG3_UTILS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
+define SG3_UTILS_REMOVE_PROGS
+	for prog in \
+		dd decode_sense emc_trespass format get_config \
+		get_lba_status ident inq logs luns map26 \
+		map sgm_dd modes opcodes sgp_dd persist prevent \
+		raw rbuf rdac read readcap read_block_limits \
+		read_buffer read_long reassign referrals \
+		requests reset rmsn rtpg safte sanitize \
+		sat_identify sat_phy_event sat_set_features scan \
+		senddiag ses start stpg sync test_rwbuf turs \
+		unmap verify vpd write_buffer write_long \
+		write_same wr_mode ; do \
+		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
+	done
+	$(RM) $(TARGET_DIR)/usr/bin/sginfo
+endef
+
+SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
+endif
+
+$(eval $(autotools-package))
