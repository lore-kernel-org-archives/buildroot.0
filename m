From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 15:32:04 +0100
Subject: [Buildroot] [git commit] sqlcipher: fix static linking with openssl
Message-ID: <20141125143444.B5DCA7FEF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74b399e7cd44fb3866a3cc8bc6b5636f1c8f2fa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass the needed libraries in LIBS instead of LDFLAGS so they end up last on
the linker cmdline, fixing static linking.

Fixes:
http://autobuild.buildroot.net/results/59d/59d8d7c7f3e0a205503121c1288187471c0ce80f/
http://autobuild.buildroot.net/results/2ed/2ed2026bc5502807588a9335bd4c78e0a26c1cd3/
http://autobuild.buildroot.net/results/cd3/cd35b24422cf7f8697e81ca7f0dd2f06dfc55997/
http://autobuild.buildroot.net/results/aa2/aa24359a0d7d9bb4e00ba96cb80301f59466ab90/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 86eebb5..9b4446c 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -11,14 +11,13 @@ SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(SQLCIPHER_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(SQLCIPHER_LDFLAGS)" \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
-SQLCIPHER_LDFLAGS += -lcrypto -lz
+SQLCIPHER_CONF_ENV += LIBS="-lcrypto -lz"
 
 ifneq ($(BR2_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
