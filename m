From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 22:37:12 +0100
Subject: [Buildroot] [git commit] package/quickjs: link with libatomic
Message-ID: <20210103212208.7D8AC8177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac992501e36aa1747d8633658f08694c6600b78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with libatomic if available.

Fixes:

  - http://autobuild.buildroot.net/results/e0766eef95a2559d51e58d1a81a9c40df84ae509

  .../build/quickjs-2020-11-08/quickjs.c:12229: undefined reference to `__atomic_fetch_xor_1'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - make it a generic variable, not tied to -latomic
  - pass it in all step, like CROSS_PREFIX
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Makefile-add-optional-link-with-libatomic.patch | 37 ++++++++++++++++++++++
 package/quickjs/quickjs.mk                         |  7 ++++
 2 files changed, 44 insertions(+)

diff --git a/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch b/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
new file mode 100644
index 0000000000..76634a51a4
--- /dev/null
+++ b/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
@@ -0,0 +1,37 @@
+From 2cf2aa34d5d55a4eedb1aedd4d56d89d24870230 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 3 Jan 2021 21:11:44 +0100
+Subject: [PATCH] Makefile: allow linking with extra libraries
+
+With some toolchains, it is neede to link with extra libraries, for
+example with -latomic, to fix:
+
+  .../build/quickjs-2020-11-08/quickjs.c:12229: undefined reference to `__atomic_fetch_xor_1'
+
+Fixes:
+  http://autobuild.buildroot.net/results/e0766eef95a2559d51e58d1a81a9c40df84ae509
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[yann.morin.1998 at free.fr:
+  - make it a generic variable, not tied to -latomic
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index e6ae827..22ad496 100644
+--- a/Makefile
++++ b/Makefile
+@@ -179,6 +179,7 @@ endif
+ ifndef CONFIG_WIN32
+ LIBS+=-ldl -lpthread
+ endif
++LIBS+=$(EXTRA_LIBS)
+ 
+ $(OBJDIR):
+ 	mkdir -p $(OBJDIR) $(OBJDIR)/examples $(OBJDIR)/tests
+-- 
+2.29.2
+
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 1a2e63278f..b85c255f23 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -10,15 +10,21 @@ QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
 QUICKJS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+QUICKJS_EXTRA_LIBS += -latomic
+endif
+
 define QUICKJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CROSS_PREFIX="$(TARGET_CROSS)" \
+		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		all
 endef
 
 define QUICKJS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CROSS_PREFIX="$(TARGET_CROSS)" \
+		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(STAGING_DIR) \
 		STRIP=/bin/true \
 		prefix=/usr \
@@ -28,6 +34,7 @@ endef
 define QUICKJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CROSS_PREFIX="$(TARGET_CROSS)" \
+		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(TARGET_DIR) \
 		STRIP=/bin/true \
 		prefix=/usr \
