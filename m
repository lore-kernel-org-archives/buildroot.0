From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 23 Jan 2017 14:47:17 -0500
Subject: [Buildroot] [PATCH] mariadb: explicitly disable dtrace detection
Message-ID: <1485200837-23626-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, mariadb's cmake script tries to detect dtrace support. On
hosts that have dtrace installed, this incorrectly enables dtrace and
causes compile errors.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/mariadb/mariadb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d667208..2e7305e 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -43,6 +43,9 @@ MARIADB_CONF_OPTS += -DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1
 # Make it explicit that we are cross-compiling
 MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 
+# Explicitly disable dtrace to avoid detection of a host version
+MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
 else
-- 
2.7.4
