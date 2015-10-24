From: Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 24 Oct 2015 17:39:14 -0400
Subject: [Buildroot] [PATCH 1/1] libcap: depend on host-attr for the host
In-Reply-To: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
Message-ID: <1445722754-3477-2-git-send-email-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a host-libcap is built, it is built without libattr support.
However, libcap does not define some symbols based on this flag. This
becomes a problem when a build-host tool is run (e.g., ls) which uses
these symbols gets the host-libcap library via LD_LIBRARY_PATH.

In order to define all of the symbols, add libattr support on the host.
The RAISE_SETFCAP setting must also be disabled since the required
permissions are not available during install.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 package/attr/attr.mk     | 1 +
 package/libcap/libcap.mk | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index a66891b..7dac7cf 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -37,3 +37,4 @@ endef
 ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 54844f8..65057e5 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -20,8 +20,7 @@ else
 LIBCAP_HAVE_LIBATTR = no
 endif
 
-# we don't have host-attr
-HOST_LIBCAP_DEPENDENCIES =
+HOST_LIBCAP_DEPENDENCIES = host-attr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a
@@ -67,12 +66,12 @@ define LIBCAP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) \
-		prefix=/usr lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+		RAISE_SETFCAP=no prefix=/usr lib=lib install
 endef
 
 $(eval $(generic-package))
-- 
2.6.2
