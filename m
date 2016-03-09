From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  9 Mar 2016 01:00:20 +0100
Subject: [Buildroot] [PATCH 3/3] package/binutils: use our missing script to
	disable the doc
In-Reply-To: <1457481620-9607-1-git-send-email-romain.naour@gmail.com>
References: <1457481620-9607-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457481620-9607-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for gdb, use our 'missing' script to workaround a build issue when makeinfo
is missing on the host.

This fixes the issue with binutils >= 2.26.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/binutils.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f75c1d..7eb3002 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -52,9 +52,15 @@ BINUTILS_CONF_OPTS = \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
-# and sometimes needs specific makeinfo versions to work
-BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
-HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+# and sometimes needs specific makeinfo versions to work.
+# Since binutils use an updated version of the 'missing' script from
+# automake >= v1.12b, use our customized version.
+BINUTILS_CONF_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
+BINUTILS_MAKE_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
+BINUTILS_INSTALL_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
+HOST_BINUTILS_CONF_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
+HOST_BINUTILS_MAKE_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
+HOST_BINUTILS_INSTALL_OPTS += MAKEINFO="$(TOPDIR)/support/scripts/missing makeinfo"
 
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.5.0
