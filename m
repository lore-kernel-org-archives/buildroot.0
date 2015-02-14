From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:01:49 +0100
Subject: [Buildroot] [git commit] package/libssh2: fix zlib library search
	path issues
Message-ID: <20150214210156.0BA858045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f335ed5508abe3a19e5e2106eb5339531cb4a82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for lingcrypt and openssl, help the configure script to find
zlib installed in STAGING_DIR.

Otherwise, It might find the one installed on the host:
checking how to link with libz... /usr/lib/libz.so -Wl,-rpath -Wl,/usr/lib

Fixes:
http://autobuild.buildroot.net/results/93b/93b43e114f21a22f0f8b7d7dd6774c089c426cd1

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh2/libssh2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c9f7059..1a1a06f 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -31,7 +31,8 @@ endif
 # Add zlib support if enabled
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH2_DEPENDENCIES += zlib
-LIBSSH2_CONF_OPTS += --with-libz
+LIBSSH2_CONF_OPTS += --with-libz \
+	--with-libz-prefix=$(STAGING_DIR)/usr
 else
 LIBSSH2_CONF_OPTS += --without-libz
 endif
