From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed,  5 May 2021 20:10:12 +0200
Subject: [Buildroot] [PATCH] package/log4qt: link with latomic if needed
Message-ID: <20210505181012.477189-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/fb5/fb52f5366a25230606149f44dc46f86f0273a680/

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/log4qt/log4qt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/log4qt/log4qt.mk b/package/log4qt/log4qt.mk
index b01d9c6611..0594427cf7 100644
--- a/package/log4qt/log4qt.mk
+++ b/package/log4qt/log4qt.mk
@@ -11,6 +11,11 @@ LOG4QT_LICENSE = Apache-2.0
 LOG4QT_LICENSE_FILES = LICENSE
 LOG4QT_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LOG4QT_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT)$(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),y)
 LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
 else
-- 
2.31.1
