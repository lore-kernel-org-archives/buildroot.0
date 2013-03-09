From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 19:21:30 +0100
Subject: [Buildroot] [PATCH 5/5] libglib2: use system pcre when available
In-Reply-To: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362853290-15592-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, glib builds its own internal copy of the pcre library, but
it also allows to use the one available from the system. Use this
possibility when pcre is already selected in the Buildroot
configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk |    7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.7.9.5
