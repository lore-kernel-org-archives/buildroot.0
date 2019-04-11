From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:14:05 +0200
Subject: [Buildroot] [git commit] package/log4cplus: bump to version 2.0.4
Message-ID: <20190411061029.7173181F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80ae3f97b89a9f7531232ca319b314e38fcca369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove atomic "hack", not needed since:
  https://github.com/log4cplus/log4cplus/commit/f14427a871219ea69c3f26925bc2f92b87967dab
- Manage new lto option added by
  https://github.com/log4cplus/log4cplus/commit/66d3d36495e0670f20d88b1bf2ba9245093ef2de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cplus/log4cplus.hash |  2 +-
 package/log4cplus/log4cplus.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index 9bea814d6f..ea95cc46eb 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8ff4055be749f17f3648694bd5778bfd86d33158cceaa616a50c0299d6035b41  log4cplus-2.0.2.tar.xz
+sha256  faf15f3651e2d0f9f9cf2c1bfcb38ec4962f22f4a671410453a27c0976da5e36  log4cplus-2.0.4.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 82fc7135f4..d3a19b6b9b 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.2
+LOG4CPLUS_VERSION = 2.0.4
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+LOG4CPLUS_CONF_OPTS += --enable-lto
+else
+LOG4CPLUS_CONF_OPTS += --disable-lto
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE),y)
 LOG4CPLUS_DEPENDENCIES += host-pkgconf qt5base
 LOG4CPLUS_CONF_OPTS += --with-qt5
@@ -18,8 +24,4 @@ else
 LOG4CPLUS_CONF_OPTS += --without-qt5
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LOG4CPLUS_CONF_ENV += LIBS='-latomic'
-endif
-
 $(eval $(autotools-package))
