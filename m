From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 15:31:33 +0100
Subject: [Buildroot] [git commit] libssh2: fix static linking issue with
	libgcrypt
Message-ID: <20141118143932.C1C8DB48E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b45139297d7f407e00720f667a453f1a9279e12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/07e/07e50ba575b305b37e7a94a773c2b2e255393e9f/
http://autobuild.buildroot.net/results/072/07249f0a001a34ae608a8f8646b26a1152219252/
http://autobuild.buildroot.net/results/1c0/1c0447431e4c025732ea2eb8e9788e303f24fd04/
http://autobuild.buildroot.net/results/5e1/5e1f58c086e437b85b0d31310a93a3b2d0d70836/

And many more.

libgcrypt depends on libgpg-error and the configure script forgets to link
against it breaking static linking.  Fix it by using libgcrypt-config
--libs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 67064eb..c9f7059 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -18,6 +18,9 @@ LIBSSH2_DEPENDENCIES += libgcrypt
 LIBSSH2_CONF_OPTS += --with-libgcrypt \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--without-openssl
+# configure.ac forgets to link to dependent libraries of gcrypt breaking static
+# linking
+LIBSSH2_CONF_ENV += LIBS="$(shell $(STAGING_DIR)/usr/bin/libgcrypt-config --libs)"
 else
 LIBSSH2_DEPENDENCIES += openssl
 LIBSSH2_CONF_OPTS += --with-openssl \
