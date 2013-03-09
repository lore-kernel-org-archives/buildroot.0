From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 21:18:29 +0100
Subject: [Buildroot] [git commit] libglib2: use system pcre when available
Message-ID: <20130309201910.2A4329AF33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe192908a4e3195b6f724310fe83fadaf18b66e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, glib builds its own internal copy of the pcre library, but
it also allows to use the one available from the system. Use this
possibility when pcre is already selected in the Buildroot
configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b108b89..4ca6ca3 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -81,6 +81,13 @@ LIBGLIB2_CONF_OPT += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+LIBGLIB2_CONF_OPT += --with-pcre=system
+LIBGLIB2_DEPENDENCIES += pcre
+else
+LIBGLIB2_CONF_OPT += --with-pcre=internal
+endif
+
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
 	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
