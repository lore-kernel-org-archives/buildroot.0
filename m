From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 30 Jun 2014 21:02:37 +0400
Subject: [Buildroot] [PATCH] binutils: disable makeinfo
Message-ID: <1404147757-23849-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

makeinfo is known to cause problems when building old texi files with more
recent host makeinfo.

In particular binutils-2.18 won't build on Fedora 20 without this change.

Even though more up to date binutils does build without this change there's
no guaranty it will with bump of host makeinfo in the future.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9cc4d28..77d0751 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -49,6 +49,11 @@ BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--enable-install-libiberty \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BINUTILS_DEPENDENCIES += busybox
-- 
1.9.3
