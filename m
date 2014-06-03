From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Jun 2014 12:11:14 +0200
Subject: [Buildroot] [PATCH] package/procps-ng: needs gettext if locales
Message-ID: <1401790274-15039-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes:
    http://autobuild.buildroot.net/results/88a/88a2c8907dce0e5abe0d544ce9a2875dfdcc9e7c/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/procps-ng/Config.in    | 1 +
 package/procps-ng/procps-ng.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 0dea84a..7463fa8 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 3245e92..9227cc4 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -12,4 +12,9 @@ PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 
 PROCPS_NG_DEPENDENCIES = ncurses
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+PROCPS_NG_DEPENDENCIES += gettext
+PROCPS_NG_CONF_OPT += LIBS=-lintl
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2
