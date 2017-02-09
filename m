From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 14:51:09 +0100
Subject: [Buildroot] [git commit] quagga: security bump to version 1.1.1
Message-ID: <20170209140255.AA8B4821B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae73226476e5ca449cf0b312aa03a18dfe31d3a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-5495: Telnet interface input buffer allocates unbounded amounts
of memory, leading to DoS.

Add optional dependency on protobuf-c.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.hash |  2 +-
 package/quagga/quagga.mk   | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index 23a0a82..6da37cf 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d284af5dd875dbba90ab875d40db5d68fdc9ede17a76f2af525f85344be56767	quagga-1.0.20160315.tar.xz
+sha256	b5a94e5bdad3062e04595a5692b8cc435f0a85102f75dfdca0a06d093b4ef63f	quagga-1.1.1.tar.gz
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index ad2aff4..c17ceaa 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 1.0.20160315
-QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
+QUAGGA_VERSION = 1.1.1
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
-QUAGGA_DEPENDENCIES = host-gawk
+QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
 
@@ -29,6 +28,13 @@ else
 QUAGGA_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
+QUAGGA_CONF_OPTS += --enable-protobuf
+QUAGGA_DEPENDENCIES += protobuf-c
+else
+QUAGGA_CONF_OPTS += --disable-protobuf
+endif
+
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
