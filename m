From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 May 2017 23:15:29 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/qt5base: link with -latomic for
	sparc
In-Reply-To: <cover.1495055675.git.yann.morin.1998@free.fr>
References: <cover.1495055675.git.yann.morin.1998@free.fr>
Message-ID: <6bdfcdff79478a9835c4c5d0296f8f62d5b64d66.1495055675.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt 5.8 needs atomic operations, which are provided in libatomic when it
exists, ike on sparc with gcc >= 4.8.

Fixes:
    http://autobuild.buildroot.org/results/49b/49bc9345b9849c9c3c53ace290c534ff7bb98683/
    http://autobuild.buildroot.org/results/9f2/9f213406954be51dfcad76ebdce8b73850842180/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>

---
Changes v1 -> v2:
  - condition is on HAS_LIBATOMIC, not on BR2_sparc  (Thomas)
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 81774b74a6..5944c869bb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -215,6 +215,13 @@ endef
 endif
 
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+# Qt 5.8 needs atomics, which on sparc are in -latomic
+define QT5BASE_CONFIGURE_ARCH_CONFIG
+	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+endef
+endif
+
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
-- 
2.11.0
