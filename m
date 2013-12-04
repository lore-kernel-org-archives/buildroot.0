From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Dec 2013 01:08:41 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
Message-ID: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

tvheadend tries to impersonate an autotools package, when it is not.
This breaks the build.

tvheadend's ./configure tries to run compiled code.
This breaks the build.

Switch tvheadend over to using the generic-package infrastructure,
and provide carefully-crafted _CMDS for each steps.

We still keep a post-install hook to install our "DB" since it is not
part of tvheadend, but an addition of our own packaging of tvheadend.

Fixes:
    http://autobuild.buildroot.net/results/3ea/3eaa17b94975477263fe12e201eec9cbeeb2912c/
    http://autobuild.buildroot.net/results/7c8/7c85db0dfab98808c97a5ef17dec9d1071dc0d49/
and a few others as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v2->v3:
  - use $(MAKE) not make  (Thomas)

Changes v1->v2:
 - add references to (some) autobuild failures
---
 .../tvheadend-004-dont-run-compiled-code.patch     | 21 +++++++++++++++++
 package/tvheadend/tvheadend.mk                     | 27 ++++++++++++++++++----
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 package/tvheadend/tvheadend-004-dont-run-compiled-code.patch

diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
new file mode 100644
index 0000000..caa6e2a
--- /dev/null
+++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
@@ -0,0 +1,21 @@
+support: don't try to run compiled code
+
+When cross-compiling, we can't run the compiled code.
+
+Consider the compiler besing successfull as an indication
+it is working.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN tvheadend.orig/support/configure.inc tvheadend-c7d0335eb10d02b780423bef8e7c740e422fff13/support/configure.inc
+--- tvheadend.orig/support/configure.inc	2013-12-01 01:24:26.000000000 +0100
++++ tvheadend-c7d0335eb10d02b780423bef8e7c740e422fff13/support/configure.inc	2013-12-03 22:34:57.547762178 +0100
+@@ -265,8 +265,6 @@
+ EOF
+   $CC $CFLAGS $LDFLAGS $TMPDIR/$$.c -o $TMPDIR/$$.bin $opt #&> /dev/null
+   RET=$?
+-  [ $RET -eq 0 ] && $TMPDIR/$$.bin
+-  RET=$?
+   rm -f $TMPDIR/$$.{c,bin}
+   return $RET
+ }
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1713d58..43bc382 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -22,6 +22,28 @@ endif
 # scan files installed by the dvb-apps package
 TVHEADEND_DEPENDENCIES     += dvb-apps
 
+define TVHEADEND_CONFIGURE_CMDS
+	(cd $(@D);				\
+	 $(TARGET_CONFIGURE_OPTS)		\
+	 $(TARGET_CONFIGURE_ARGS)		\
+	 ./configure				\
+	 --prefix=/usr				\
+	 --cc="$(TARGET_CC)"			\
+	 --cflags="$(TARGET_CFLAGS)"		\
+	 --arch="$(ARCH)"			\
+	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
+	 --python="$(HOST_DIR)/usr/bin/python"	\
+	)
+endef
+
+define TVHEADEND_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define TVHEADEND_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
 #----------------------------------------------------------------------------
 # To run tvheadend, we need:
 #  - a startup script, and its config file
@@ -43,7 +65,4 @@ define TVHEADEND_USERS
 tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
 endef
 
-#----------------------------------------------------------------------------
-# tvheadend is not an autotools-based package, but it is possible to
-# call its ./configure script as if it were an autotools one.
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
1.8.1.2
