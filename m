From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 10:59:06 +0100
Subject: [Buildroot] [git commit] host-openssl: use correct prefix so libssl
	/ libcrypto can be found
Message-ID: <20141103100523.A8FDCB2F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93951c8f24f676e5ab775fcbbb1b2e8bdd821414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (root cause of):
http://autobuild.buildroot.net/results/d01/d0190a6e5c6b5aa78cfefc29e4e8a4e4b135450b/
http://autobuild.buildroot.net/results/9bb/9bb8defedb8024de83eb3a609ab584efb5d0d2b0/
http://autobuild.buildroot.net/results/e4a/e4a1b298e7e158d3614b89e61d40ef9a00e7ff67/
http://autobuild.buildroot.net/results/5e2/5e24a90058111f7d5618047410f809b45bc165f6/

And many others.

The host version of openssl should be configured to use the host directory
as its prefix and the INSTALL_PREFIX dance shouldn't be used, as otherwise
host-openssl will look in /usr for its libraries.

While we are at it, ensure our host CFLAGS are used similar to how we do for
the target build.  Also enable zlib support as we already list it as a
dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 7c1c7f0..7e30cad 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -61,12 +61,13 @@ define HOST_OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
-		--prefix=/usr \
-		--openssldir=/etc/ssl \
+		--prefix=$(HOST_DIR)/usr \
+		--openssldir=$(HOST_DIR)/etc/ssl \
 		--libdir=/lib \
 		shared \
-		no-zlib \
+		zlib-dynamic \
 	)
+	$(SED) "s:-O[0-9]:$(HOST_CFLAGS):" $(@D)/Makefile
 endef
 
 define OPENSSL_CONFIGURE_CMDS
@@ -106,7 +107,7 @@ define OPENSSL_INSTALL_STAGING_CMDS
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(HOST_DIR) install
+	$(MAKE1) -C $(@D) install
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
