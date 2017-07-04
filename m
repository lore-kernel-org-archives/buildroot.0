From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:20 +0200
Subject: [Buildroot] [git commit] avahi: use new gettext logic
Message-ID: <20170704233513.2212C7F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=218bcaeb8d356b3420d203c205f0dd5bab283552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avahi/Config.in | 1 -
 package/avahi/avahi.mk  | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index a6b4ac8..5e303d0 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_AVAHI
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index a356a08..94b6292 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -97,8 +97,8 @@ AVAHI_CONF_OPTS = \
 	--with-autoipd-group=avahi
 
 AVAHI_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
-	host-pkgconf host-gettext
+	host-intltool host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
 
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
@@ -168,7 +168,7 @@ endif
 
 AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
 
-AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
+AVAHI_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 
 define AVAHI_USERS
 	avahi -1 avahi -1 * - - -
