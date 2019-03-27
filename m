From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:55:34 +0100
Subject: [Buildroot] [git commit branch/2018.11.x]
 package/kf5-modemmanager-qt: link with libatomic when needed
Message-ID: <20190327145323.4FB6981DFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e487f72a9f0c9bde949de26508e805b948719de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/b941a3deaa57cac79f1686d47ca6ababf2f0d5e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3cb7546d95bbe227562040d6439b0ab4b62b7c9b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
