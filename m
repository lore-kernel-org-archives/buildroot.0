From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Apr 2020 18:36:45 +0200
Subject: [Buildroot] [PATCH] packages/exim: enable parallel make
Message-ID: <20200420163645.17803-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel make used to be broken in exim, as reported in its docs. Now that
line has disappeared from the docs, and parallel make is actually working.

Tested with 'make exim-dirclean ; time make BR2_JLEVEL=999 exim': builds
still succeed and the build time decreases from 34 to 11 seconds on my
host.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8d5b6e415b62..dc445c6d93c0 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -120,16 +120,14 @@ endif
 
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
-# "The -j (parallel) flag must not be used with make"
-# (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
 define EXIM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) makefile
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
+	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) makefile
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build-br macro_predef \
 		CC=$(HOSTCC) \
 		LNCC=$(HOSTCC) \
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
-	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) \
+	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
 		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
 endef
 
@@ -137,7 +135,7 @@ endef
 # something when installing...
 define EXIM_INSTALL_TARGET_CMDS
 	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) \
+	  $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
 		CFLAGS="-std=c99 $(TARGET_CFLAGS)" \
 		install
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
-- 
2.26.1
