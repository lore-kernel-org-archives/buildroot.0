From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 10:13:28 +0100
Subject: [Buildroot] [git commit] package/tvheadend: unbreak
Message-ID: <20131204093549.90C749BF0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50a8ff5c5bc3586b3ec23a070b036bbd00a7f54a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: tweak 004-dont-run-compiled-code.patch description as pointed out by Thomas]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend-004-dont-run-compiled-code.patch     |   21 +++++++++++++++
 package/tvheadend/tvheadend.mk                     |   27 +++++++++++++++++---
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
new file mode 100644
index 0000000..f559583
--- /dev/null
+++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
@@ -0,0 +1,21 @@
+support: don't try to run compiled code
+
+When cross-compiling, we can't run the compiled code.
+
+Consider the compiler returning succes as an indication
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
