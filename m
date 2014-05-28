From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 09:59:32 +0200
Subject: [Buildroot] [git commit] package/exim: fix static linking
Message-ID: <20140528080949.BC26F9CDFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf22cea53fa2af48bde3010673d3babee1ae6873
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/0a3/0a392087878f80a70435981856455a30152b684d/

When building static, we need to tell exim that it needs to link
statically (obviously), and that it should link against pthreads.

Yet, exim is still not happy with that, as it still wants to build
something (a version-related program) at install time, so we need
to replicate the ld flags at install time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

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
 
