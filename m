From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  5 Jul 2017 00:22:24 +0200
Subject: [Buildroot] [PATCH] package/filemq: disable Wformat-truncation to
	build with gcc >= 7.1
Message-ID: <20170704222224.26739-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code intend to truncate the string to ~20 chars but this behaviour
throw an error with new compiler (gcc >= 7.1).

From: src/fmq_server_engine.inc:
//  Set log file prefix; this string will be added to log data, to make
//  log data more searchable. The string is truncated to ~20 chars.

Fixes:
http://autobuild.buildroot.net/results/434/43452430edf44cbcef6ea3a5ab80ac0ff406208f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/filemq/filemq.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 581e8a8..54b2ce5 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -20,4 +20,7 @@ endef
 
 FILEMQ_POST_PATCH_HOOKS += FILEMQ_CREATE_CONFIG_DIR
 
+# Disable Wformat-truncation to build with gcc >= 7.1
+FILEMQ_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -Wno-format-truncation"
+
 $(eval $(autotools-package))
-- 
2.9.4
