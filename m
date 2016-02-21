From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:41 +0100
Subject: [Buildroot] [PATCH 3/7] package/chrony: add optional support for
	libcap
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066125-28379-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, chrony will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/chronyd | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.7.0
