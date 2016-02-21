From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:45 +0100
Subject: [Buildroot] [PATCH 7/7] package/quagga: add optional support for
	libcap
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066125-28379-7-git-send-email-bernd.kuhls@t-online.de>
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
 package/quagga/quagga.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index c5dd2ba..30e8233 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -37,6 +37,12 @@ endif
 ifeq ($(BR2_PACKAGE_QUAGGA_VTYSH),y)
 QUAGGA_CONF_OPTS += --enable-vtysh
 QUAGGA_DEPENDENCIES += readline
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+QUAGGA_CONF_OPTS += --enable-capabilities
+QUAGGA_DEPENDENCIES += libcap
+else
+QUAGGA_CONF_OPTS += --disable-capabilities
+endif
 else
 QUAGGA_CONF_OPTS += --disable-vtysh
 endif
-- 
2.7.0
