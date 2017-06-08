From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:20:30 +0200
Subject: [Buildroot] [git commit] package/qt5base: link with -latomic when
	needed
Message-ID: <20170608212043.F0A177F8A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d286be4f96cfb731e184c3e8cfea27a031bde3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt 5.8 needs atomic operations, which are provided in libatomic when it
exists, like on sparc with gcc >= 4.8.

Fixes:
    http://autobuild.buildroot.org/results/49b/49bc9345b9849c9c3c53ace290c534ff7bb98683/
    http://autobuild.buildroot.org/results/9f2/9f213406954be51dfcad76ebdce8b73850842180/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 81774b7..5fe8bb8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -215,6 +215,13 @@ endef
 endif
 
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+# Qt 5.8 needs atomics, which on various architectures are in -latomic
+define QT5BASE_CONFIGURE_ARCH_CONFIG
+	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+endef
+endif
+
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
