From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 21:39:21 +0200
Subject: [Buildroot] [git commit] sylpheed: Fix includedir
Message-ID: <20121008195648.A9888997FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e572092a920592bae08db58e5e701b53cabf46b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sylpheed headers are installed to $(DESTDIR)$(includedir),
while DESTDIR is $(TARGET_DIR) and includedir is set to
$(STAGING_DIR)/usr/include in the SYLPHEED_CONF_OPT.
Thus, the full staging directory path is created in the
target root filesystem, which is wrong.

The includedir was set to staging include because sylpheed
incorrectly adds includedir to its include path, and does
not cross-compile with the default includedir set to
/usr/include.

This removes includedir setting and also removes it from
include paths in Makefiles to prevent using host headers
from /usr/include. The same approach is used in the OE.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed.mk |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 451c4de..32c0a82 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,11 +9,20 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell \
-                    --includedir=$(STAGING_DIR)/usr/include
+SYLPHEED_CONF_OPT = --disable-gtkspell
 
 SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
 
+# Remove the -I$(includedir) from the Makefiles
+# because it refers to the host /usr/include.
+define SYLPHEED_PRECONFIGURE
+	for i in $$(find $(@D) -name "Makefile*"); do \
+		sed -i 's:-I$$(includedir)::g' $$i; \
+	done
+endef
+
+SYLPHEED_PRE_CONFIGURE_HOOKS += SYLPHEED_PRECONFIGURE
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SYLPHEED_DEPENDENCIES += openssl
 SYLPHEED_CONF_OPT += --enable-ssl
