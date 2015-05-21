From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 22:47:44 +0200
Subject: [Buildroot] [git commit] package/apr: Add libuuid as optional
	dependency
Message-ID: <20150521204803.BF1D47FC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd25b0128945aa118cb5f66e665d445d0da1d7dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: move the added chunk a bit further down, and use += instead
of =.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr/apr.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 69524a6..0fed19c 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -12,6 +12,7 @@ APR_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APR_AUTORECONF = YES
+
 APR_CONF_ENV = \
 	CC_FOR_BUILD="$(HOSTCC)" \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
@@ -34,6 +35,10 @@ endif
 # Fix lfs detection when cross compiling
 APR_CONF_ENV += apr_cv_use_lfs64=yes
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+APR_DEPENDENCIES += util-linux
+endif
+
 define APR_CLEANUP_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/build-1/
 endef
