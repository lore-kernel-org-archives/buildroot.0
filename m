From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:48:58 +0200
Subject: [Buildroot] [git commit] sqlcipher: fix passing CFLAGS/LDFLAGS to
	configure
Message-ID: <20140512205829.595339CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09322f456b7d00989a6a340a377096499c11e1db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SQLCIPHER_CONF_ENV is a string used to pass environment variables to the
confgiure script, '+=' operator doesn't have any special meaning inside
it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Fixes:
  http://autobuild.buildroot.net/results/dbf/dbf947ad6442fa8e57201ffcc96871361bf39ad7/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
