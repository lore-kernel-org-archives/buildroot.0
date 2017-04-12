From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:36 +0200
Subject: [Buildroot] [PATCH 02/53] libsepol: rework host installation
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsepol has a pretty peculiar interpretation of DESTDIR and PREFIX.
PREFIX is not consistently used: some installation paths are forced to
$(DESTDIR)/usr/... . Also, the shared lib symlink is forced to ../../lib
(i.e. assumes it's installed under /usr). For these reasons, the host
build and install commands are a bit unusual: they use DESTDIR instead
of PREFIX, DESTDIR points to $(HOST_DIR) without /usr, and some
additional fixup is needed to correct the installation directory of
libsepol.so.1 and the symlink to it.

This can be simplified quite a lot by passing both DESTDIR and PREFIX,
and including the /usr part in both. The symlink still has to be fixed,
but that's much simpler.

Note that a side effect is that the man pages are now installed under
$(HOST_DIR)/usr/usr/man. While not very nice, we don't really care
about man pages. In addition, this will resolve itself when we later
move $(HOST_DIR)/usr to $(HOST_DIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
It's a bit counter-intuitive to have a patch that adds /usr in a series
that is meant to remove it, but this is the simplest way to have a
bisectable series...
---
 package/libsepol/libsepol.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 9bdac1e0da..d360bfbcb1 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -33,15 +33,18 @@ define LIBSEPOL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
 endef
 
+HOST_LIBSEPOL_MAKE_ENV = \
+	$(HOST_MAKE_ENV) \
+	DESTDIR=$(HOST_DIR)/usr \
+	PREFIX=$(HOST_DIR)/usr
+
 define HOST_LIBSEPOL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
 endef
 
 define HOST_LIBSEPOL_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
-	mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
-	(cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.1 libsepol.so)
-	-rmdir $(HOST_DIR)/lib
+	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS)
+	ln -sf libsepol.so.1 $(HOST_DIR)/usr/lib/libsepol.so
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
