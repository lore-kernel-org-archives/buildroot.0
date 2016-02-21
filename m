From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:26:51 +0100
Subject: [Buildroot] [git commit] package/gnupg2: add optional support for
	libusb-compat
Message-ID: <20160221202702.87CC9817CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e44f0ce28972da1c4f5509db76fda1d9cc994181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libusb-compat was compiled before, gnupg2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/libexec/scdaemon | grep NEEDED
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libusb-0.1.so.4]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2e1f067..8d4f373 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -38,6 +38,13 @@ else
 GNUPG2_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+GNUPG2_CONF_OPTS += --enable-ccid-driver
+GNUPG2_DEPENDENCIES += libusb-compat
+else
+GNUPG2_CONF_OPTS += --disable-ccid-driver
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GNUPG2_CONF_OPTS += --with-readline=$(STAGING_DIR)
 GNUPG2_DEPENDENCIES += readline
