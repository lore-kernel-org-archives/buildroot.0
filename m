From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:00:59 +0100
Subject: [Buildroot] [git commit] package/ecryptfs-utils: add optional
 dependency on linux-pam
Message-ID: <20191224140121.8466A8E265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ba786d22c714293c14ba13f44fdc282406987d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If linux-pam is enabled, we want to build pam_ecryptfs.so and install
it into /lib/security/.

Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b6d0..326ff4f2dd 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,13 +11,20 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 
 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
-ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap --disable-pam
+ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
 	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
 	NSS_LIBS="-lnss3"
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
+ECRYPTFS_UTILS_DEPENDENCIES += linux-pam
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
