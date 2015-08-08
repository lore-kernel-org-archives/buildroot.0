From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:42 -0000
Subject: [Buildroot] [git commit branch/next] rpcbind: add missing
	dependency on host-pkgconf
Message-ID: <20150808105631.E0CF980414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31b7e36418bde33b1a5ec81c5cccad739035dfb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rpcbind depends on libtirpc, which used to depend on
host-pkgconf. However, since commit
aee57627b09d0955270a562b8adaa0ff88ef523b, the dependency of libtirpc
on host-pkgconf has been removed, because libtirpc no longer uses
PKG_CHECK_MODULES().

However, rpcbind does use PKG_CHECK_MODULES(). It used to work because
host-pkgconf was brought into the build by the dependency on libtirpc,
but that's no longer the case. Bottom line: we need to make rpcbind
depend on host-pkgconf, which is exactly what this commit does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/rpcbind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 7bfb1e2..b85d88e 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -12,7 +12,7 @@ RPCBIND_LICENSE_FILES = COPYING
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
-RPCBIND_DEPENDENCIES += libtirpc
+RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 define RPCBIND_INSTALL_INIT_SYSV
