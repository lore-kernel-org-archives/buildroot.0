From: Will Newton <will.newton@gmail.com>
Date: Tue, 25 Aug 2009 14:49:29 +0100
Subject: [Buildroot] [PATCH] webkit: Run autoreconf for webkit.
Message-ID: <87a5b0800908250649l26638b6dhe9f5ed1ae761de22@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the hacky way of running autogen.sh and use buildroot autoreconf
support instead.

Note: This depends on Thomas's patch for gtk-doc.m4 support in
automake and the patches I posted previously for autoconf 2.64.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/webkit/webkit.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index bc7d062..9febc97 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -11,6 +11,8 @@ WEBKIT_INSTALL_STAGING = YES
 WEBKIT_INSTALL_TARGET = YES
 WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 WEBKIT_LIBTOOL_PATCH = NO
+WEBKIT_AUTORECONF = YES
+WEBKIT_AUTORECONF_OPT = -I $(WEBKIT_DIR)/autotools

 WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite enchant \
 			libsoup
@@ -28,8 +30,5 @@ WEBKIT_CONF_OPT += --disable-video
 $(eval $(call AUTOTARGETS,package,webkit))

 $(WEBKIT_HOOK_POST_EXTRACT):
-	$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing
--copy"/' $(WEBKIT_DIR)/autogen.sh
-	$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake
--copy"/' $(WEBKIT_DIR)/autogen.sh
-	# Don't run the configure step yet
-	cd $(WEBKIT_DIR); AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
+	echo "EXTRA_DIST =" >$(WEBKIT_DIR)/gtk-doc.make
 	touch $@
-- 
1.5.5.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-webkit-Run-autoreconf-for-webkit.patch
Type: text/x-patch
Size: 1440 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090825/8fb7d670/attachment.bin>
