From: Marc Khouri <marc@khouri.ca>
Date: Wed, 10 Aug 2016 10:30:16 -0400
Subject: [Buildroot] [PATCH 1/1] libical: use system time zone info
Message-ID: <1470839416-92898-1-git-send-email-marc@khouri.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libical requires time zone information in order to make use of time
zone functions (otherwise, segfaults occur when applications call
the time zone functions). This patch:
1. forces the system to build time zone info
2. ensures libical does not build its own time zone info (this is
   the default behaviour, but the flag is added in case libical's
   default changes in the future).

Signed-off-by: Marc Khouri <marc@khouri.ca>
---
 package/libical/Config.in  | 1 +
 package/libical/libical.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libical/Config.in b/package/libical/Config.in
index 48170e9..3220d5b 100644
--- a/package/libical/Config.in
+++ b/package/libical/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBICAL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
+	select BR2_TARGET_TZ_INFO
 	help
 	  libical is an Open Source (MPL/LGPL) implementation of the IETF's
 	  iCalendar Calendaring and Scheduling protocols.
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index e8cb3f8..a511039 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -13,5 +13,7 @@ LIBICAL_LICENSE_FILES = LICENSE
 # building without this option is broken, it is used by
 # Gentoo/alpinelinux as well
 LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
+# never build time zone info, always use system's tzinfo
+LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=false
 
 $(eval $(cmake-package))
-- 
2.8.2
