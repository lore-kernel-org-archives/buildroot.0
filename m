From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  9 Mar 2016 13:29:42 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/binutils: use our missing script
	to disable the doc
In-Reply-To: <1457526582-20655-1-git-send-email-romain.naour@gmail.com>
References: <1457526582-20655-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457526582-20655-3-git-send-email-romain.naour@gmail.com>
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
v2: Remove the script bundled with binutils sources an create a symlink to our
    customized 'missing' script.
---
 package/binutils/binutils.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f75c1d..799f083 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -52,10 +52,19 @@ BINUTILS_CONF_OPTS = \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
-# and sometimes needs specific makeinfo versions to work
+# and sometimes needs specific makeinfo versions to work.
 BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 
+# Since binutils use an updated version of the 'missing' script from automake
+# >= v1.12b, use our customized version.
+define BINUTILS_DISABLE_DOC
+	rm -f $(@D)/missing
+	ln -s $(TOPDIR)/support/scripts/missing $(@D)/missing
+endef
+BINUTILS_PRE_CONFIGURE_HOOKS += BINUTILS_DISABLE_DOC
+HOST_BINUTILS_PRE_CONFIGURE_HOOKS += BINUTILS_DISABLE_DOC
+
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BINUTILS_DEPENDENCIES += busybox
-- 
2.5.0
