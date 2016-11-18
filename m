From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 18 Nov 2016 16:24:26 +0100
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: propagate LDCONFIG=true
Message-ID: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We correctly set LDCONFIG=true for MAKE_OPTS, but not for the other
steps which don't inherit it, to avoid permissions error displayed
during the build, we need to set them up.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/e2fsprogs/e2fsprogs.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 022ba52..b01336a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -57,8 +57,9 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
-E2FSPROGS_MAKE_OPTS = \
-	LDCONFIG=true
+E2FSPROGS_MAKE_OPTS = LDCONFIG=true
+E2FSPROGS_INSTALL_STAGING_OPTS = LDCONFIG=true
+E2FSPROGS_INSTALL_TARGET_OPTS = LDCONFIG=true
 
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
-- 
2.10.2
