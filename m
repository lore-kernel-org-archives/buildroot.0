From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 18 Oct 2016 16:53:23 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
	enabled
Message-ID: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix bug 9341: avahi-utils does not compile with uClibc and libglib2.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/avahi/avahi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 069b45a..c9cf2bc 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -168,7 +168,9 @@ endif
 
 AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
 
-AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
+# If either locale or libglib2 is defined, avahi needs libintl.
+AVAHI_MAKE_OPTS += \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_LIBGLIB2),LIBS=-lintl)
 
 define AVAHI_USERS
 	avahi -1 avahi -1 * - - -
-- 
2.7.4
