From: Valentine Barshak <gvaxon@gmail.com>
Date: Sat,  6 Oct 2012 22:55:06 +0400
Subject: [Buildroot] [PATCH v2] sylpheed: Fix includedir
Message-ID: <1349549706-24827-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sylpheed headers are installed to the target directory,
creating full staging directory path in the target rootfs,
which is wrong.
This happens because the headers are installed to
$(DESTDIR)$(includedir), while DESTDIR is $(TARGET_DIR)
and includedir is set to $(STAGING_DIR)/usr/include in the
SYLPHEED_CONF_OPT.

The includedir was set to staging include because sylpheed
incorrectly adds includedir to its include path, and does
not build with the default includedir set to /usr/include
in the target filesystem.

This removes includedir setting and also removes it from
include paths in Makefiles. The same approach is used
in the OE.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/sylpheed/sylpheed.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 451c4de..100fd67 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,11 +9,18 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell \
-                    --includedir=$(STAGING_DIR)/usr/include
+SYLPHEED_CONF_OPT = --disable-gtkspell
 
 SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
 
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
-- 
1.7.11.4
