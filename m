From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 20:57:15 +0200
Subject: [Buildroot] [git commit] package/procps-ng: needs gettext if locales
Message-ID: <20140603185956.C6D4D9CE4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a54ade566eba2911581f7f56b0f83adfb924465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/88a/88a2c8907dce0e5abe0d544ce9a2875dfdcc9e7c/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/Config.in    |    1 +
 package/procps-ng/procps-ng.mk |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

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
