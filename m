From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:45:36 +0100
Subject: [Buildroot] [git commit] package/libfm: add optional support for
	libexif
Message-ID: <20160221135332.C085F817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=018843ce1bfe1c83d12a3e12f9b9b4c986ec9e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libexif was compiled before, libfm will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libfm.so.4.0.3 | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libexif.so.12]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfm/libfm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index f0888b7..e8410d0 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -12,4 +12,11 @@ LIBFM_LICENSE = GPLv2+, LGPLv2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBFM_CONF_OPTS += --enable-exif
+LIBFM_DEPENDENCIES += libexif
+else
+LIBFM_CONF_OPTS += --disable-exif
+endif
+
 $(eval $(autotools-package))
