From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 09:47:54 +0200
Subject: [Buildroot] [PATCH] package/exim: fix static linking
Message-ID: <1401263274-12833-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When building static, we need to tell exim that it needs to link
statically (obviously), and that it should link against pthreads.

Yet, exim is still not happy with that, as it still wants to build
something (a version-related program) at install time, so we need
to replicate the ld flags at install time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/exim/exim.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index ca9c8a7..b780b85 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -49,15 +49,22 @@ define EXIM_CONFIGURE_CMDS
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 endef
 
+# exim needs a bit of love to build statically
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
+endif
+
 # "The -j (parallel) flag must not be used with make"
 # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
 define EXIM_BUILD_CMDS
-	build=br $(MAKE1) -C $(@D)
+	build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
 endef
 
+# Need to replicate the LFLAGS in install, as exim still wants to build
+# something when installing...
 define EXIM_INSTALL_TARGET_CMDS
 	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE1) -C $(@D) install
+	  $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) install
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
 endef
 
-- 
1.8.3.2
