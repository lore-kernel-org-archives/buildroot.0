From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Jun 2014 00:00:16 +0200
Subject: [Buildroot] [git commit] avahi: run as avahi user/group instead of
	default
Message-ID: <20140606221344.749FD9CE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3ccfa362b21394d15b2cccc2636a0cb0ef87832
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create an avahi specific user/group and use it instead of the global
'default' one, so it can be removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 6e84564..725e96b 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -80,10 +80,10 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-distro=none \
 		--disable-manpages \
 		$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
-		--with-avahi-user=default \
-		--with-avahi-group=default \
-		--with-autoipd-user=default \
-		--with-autoipd-group=default
+		--with-avahi-user=avahi \
+		--with-avahi-group=avahi \
+		--with-autoipd-user=avahi \
+		--with-autoipd-group=avahi
 
 AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
        host-pkgconf host-gettext
@@ -136,6 +136,10 @@ endif
 
 AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
+define AVAHI_USERS
+	avahi -1 avahi -1 * - - -
+endef
+
 define AVAHI_REMOVE_INITSCRIPT
 	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
 endef
