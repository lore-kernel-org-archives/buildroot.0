From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 May 2014 07:27:03 +0400
Subject: [Buildroot] [PATCH 1/4] sqlcipher: fix passing CFLAGS/LDFLAGS to
	configure
In-Reply-To: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1399865226-7054-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SQLCIPHER_CONF_ENV is a string used to pass environment variables to the
confgiure script, '+=' operator doesn't have any special meaning inside
it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Fixes:
  http://autobuild.buildroot.net/results/dbf/dbf947ad6442fa8e57201ffcc96871361bf39ad7/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/sqlcipher/sqlcipher.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 6130870..bae59bb 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -10,8 +10,8 @@ SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
-	CFLAGS+=" $(SQLCIPHER_CFLAGS)" \
-	LDFLAGS+=" $(SQLCIPHER_LDFLAGS)" \
+	CFLAGS="$(TARGET_CFLAGS) $(SQLCIPHER_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS) $(SQLCIPHER_LDFLAGS)" \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPT = \
-- 
1.7.7.6
