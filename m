From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:02:36 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/clamav: add
 optional dependency to json-c
Message-ID: <20180131123646.4CEFE87BC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0420d0910b3d5b63fae3bca9e490ffcbe6ece3c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

clamav has optional support for json-c:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libltdl.so.7]
 0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libjson-c.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 013207f2e4997cb836914b6a9bc9dbc6ee87553c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 86bdda49e2..5d57b8dc00 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -48,6 +48,13 @@ else
 CLAMAV_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+CLAMAV_CONF_OPTS += --with-libjson=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += json-c
+else
+CLAMAV_CONF_OPTS += --without-libjson
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
 CLAMAV_DEPENDENCIES += libxml2
