From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 17:11:15 +0100
Subject: [Buildroot] [git commit] pkg-infra: pass --disable-doc if
	documentation is not enabled
Message-ID: <20121212181633.E329A9A1B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=489970e047a78f7806747b99a7e1bd170fc5c75b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many configure scripts support an option like --disable-doc, --disable-docs
or --disable-documentation.  Pass all of these to configure.

In addition, not all Xorg packages accept the --disable-xxx. Instead they
look for xmlto and/or fop and build documentation if they exist.  For host
packages, this may lead to build errors because /usr/bin/xmlto uses libxml2
and we set LD_LIBRARY_PATH to point to $(HOST_DIR)/lib, which may contain
a libxml2 as well.  So it's essential to disable xmlto for host packages.

Also some whitespace cleanup.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in      |   10 +++++++++-
 package/pkg-autotools.mk |    9 +++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4281773..cc8f320 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -290,7 +290,15 @@ DISABLE_LARGEFILE= --disable-largefile
 endif
 
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-DISABLE_DOCUMENTATION=--disable-gtk-doc
+# The configure option varies, but since unknown options are ignored
+# we can pass all of them.
+DISABLE_DOCUMENTATION = \
+	--disable-gtk-doc \
+	--disable-doc \
+	--disable-docs \
+	--disable-documentation \
+	--with-xmlto=no \
+	--with-fop=no
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 785daab..890506b 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -116,6 +116,9 @@ endef
 else
 
 # Configure package for host
+# disable all kind of documentation generation in the process,
+# because it often relies on host tools which may or may not be
+# installed.
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
 	        $$(HOST_CONFIGURE_OPTS) \
@@ -126,6 +129,12 @@ define $(2)_CONFIGURE_CMDS
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--enable-shared --disable-static \
+		--disable-gtk-doc \
+		--disable-doc \
+		--disable-docs \
+		--disable-documentation \
+		--with-xmlto=no \
+		--with-fop=no \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
