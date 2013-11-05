From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue,  5 Nov 2013 07:55:14 +0000
Subject: [Buildroot] [PATCH v2] dropwatch: fix avr32 build failure
Message-ID: <1383638114-9207-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

On avr32, dropwatch needs libiberty to avoid build failures such as

  http://autobuild.buildroot.net/results/cd5/cd5e22fb5c9b0fc5d396bc85a5e253a1a65054da/

Also test built on ARM.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Handle using LDFLAGS in package makefile, rather than by patching. This
     was suggested by Peter Korsgaard.

 package/dropwatch/dropwatch.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 5d65d86..9d49d1e 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -13,8 +13,12 @@ DROPWATCH_LICENSE_FILES = COPYING
 
 # libbfd may be linked to libintl
 # Ugly... but LDFLAGS are hardcoded anyway
+#
+# Also: always need to add -liberty to hardcoded LDFLAGS for avr32
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-DROPWATCH_LDFLAGS = LDFLAGS="-lintl -lbfd -lreadline -lnl-3 -lnl-genl-3"
+DROPWATCH_LDFLAGS = LDFLAGS="-lintl -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3"
+else
+DROPWATCH_LDFLAGS = LDFLAGS="-lbfd -liberty -lreadline -lnl-3 -lnl-genl-3"
 endif
 
 define DROPWATCH_BUILD_CMDS
-- 
1.8.3.2
