From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:30:40 +0100
Subject: [Buildroot] [git commit] package/quagga: add optional support for
	libcap
Message-ID: <20160221203049.0E6778021B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00351a541b3577ed4cddf107a3d757e6348fd406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, quagga will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vtysh | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
