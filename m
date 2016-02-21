From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 19:00:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/quagga: add optional support for
	libcap
Message-ID: <1456077645-25127-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, quagga will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vtysh | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: moved BR2_PACKAGE_LIBCAP code block (Thomas)

 package/quagga/quagga.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index c5dd2ba..4a55594 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -14,6 +14,13 @@ QUAGGA_CONF_OPTS = --program-transform-name=''
 # 0002-configure-fix-static-linking-with-readline.patch
 QUAGGA_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+QUAGGA_CONF_OPTS += --enable-capabilities
+QUAGGA_DEPENDENCIES += libcap
+else
+QUAGGA_CONF_OPTS += --disable-capabilities
+endif
+
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
-- 
2.7.0
