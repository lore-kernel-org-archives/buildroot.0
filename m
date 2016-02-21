From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 16:06:32 +0100
Subject: [Buildroot] [git commit] package/chrony: add optional support for
	libcap
Message-ID: <20160221172737.28C6F81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0b2041d44c32c7c6b6730137b23e4b3208ee109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, chrony will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/chronyd | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 369d7eb..59faa10 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -16,6 +16,12 @@ CHRONY_CONF_OPTS = \
 	--without-seccomp \
 	--without-tomcrypt
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+CHRONY_DEPENDENCIES += libcap
+else
+CHRONY_CONF_OPTS += --without-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += host-pkgconf libnss
 else
