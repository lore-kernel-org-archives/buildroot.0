From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:52 +0100
Subject: [Buildroot] [PATCH 02/33] libpcap: add pcap.pc file
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libpcap/libpcap.mk | 10 ++++++++++
 package/libpcap/pcap.pc    | 12 ++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 package/libpcap/pcap.pc

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 7a1d32f..d813b85 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -26,4 +26,14 @@ ifeq ($(BR2_microblaze),y)
 LIBPCAP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
+LIBPCAP_USB_SUPPORT = $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
+define LIBPCAP_INSTALL_STAGING_PC
+	sed -e 's/@LIBPCAP_VERSION@/$(LIBPCAP_VERSION)/' \
+		-e 's/@LIBPCAP_USB_SUPPORT@/$(LIBPCAP_USB_SUPPORT)/' \
+		< package/libpcap/pcap.pc \
+		> $(STAGING_DIR)/usr/lib/pkgconfig/pcap.pc
+endef
+
+LIBPCAP_POST_INSTALL_STAGING_HOOKS += LIBPCAP_INSTALL_STAGING_PC
+
 $(eval $(autotools-package))
diff --git a/package/libpcap/pcap.pc b/package/libpcap/pcap.pc
new file mode 100644
index 0000000..0bd1917
--- /dev/null
+++ b/package/libpcap/pcap.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: pcap
+Description: System-independent library for user-level network packet capture
+Requires:
+Version: @LIBPCAP_VERSION@
+Libs: -L${libdir} -lpcap
+Libs.private: @LIBPCAP_USB_SUPPORT@ -lpthread
+Cflags: -I${includedir}
-- 
1.8.0
