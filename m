From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 22:10:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/kf5-modemmanager-qt: link with
 libatomic when needed
Message-ID: <20190317211016.2052-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/b941a3deaa57cac79f1686d47ca6ababf2f0d5e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
index 9bbeeaa760..20fbc102c6 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -13,4 +13,9 @@ KF5_MODEMMANAGER_QT_LICENSE_FILE = COPYING.LIB
 KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager qt5base
 KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+KF5_MODEMMANAGER_QT_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
