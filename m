From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:54:35 +0100
Subject: [Buildroot] [git commit] e2fsprogs: pass LDCONFIG=true also at
	install time
Message-ID: <20161211150151.9D9C981814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64544178f180f03cedd8fe403d3718406d909c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We correctly set LDCONFIG=true for MAKE_OPTS, but not for the other
steps which don't inherit it, and therefore e2fsprogs tries to use the
host ldconfig during staging and target installation, which causes some
weird error messages at build time (even if they don't abort the build).

Fix that by passing LDCONFIG=true at install time.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index b6e79d2..48bb9ec 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -63,8 +63,9 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
-E2FSPROGS_MAKE_OPTS = \
-	LDCONFIG=true
+E2FSPROGS_MAKE_OPTS = LDCONFIG=true
+E2FSPROGS_INSTALL_STAGING_OPTS = LDCONFIG=true
+E2FSPROGS_INSTALL_TARGET_OPTS = LDCONFIG=true
 
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
