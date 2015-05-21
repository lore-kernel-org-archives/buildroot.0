From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 19:19:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: Add libuuid as optional
	dependency
Message-ID: <1432228748-24980-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuuid is picked up by apr when present:

Checking for OS UUID Support...
checking uuid/uuid.h usability... yes
checking uuid/uuid.h presence... yes
checking for uuid/uuid.h... yes
checking for library containing uuid_generate... -luuid
checking for uuid_generate... yes
checking for os uuid usability... yes

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libapr-1.so | grep libuuid
 0x00000001 (NEEDED)                     Shared library: [libuuid.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/apr.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 69524a6..b398d44 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -12,6 +12,11 @@ APR_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APR_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+APR_DEPENDENCIES = util-linux
+endif
+
 APR_CONF_ENV = \
 	CC_FOR_BUILD="$(HOSTCC)" \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-- 
1.7.10.4
