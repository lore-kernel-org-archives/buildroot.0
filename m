From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 06 Oct 2013 22:10:24 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
Message-ID: <5251C3B0.7090105@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -fPIC flag

Fixes:
http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libcap/libcap.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 16afaef..6248fed 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -25,10 +25,15 @@ endif
 # we don't have host-attr
 HOST_LIBCAP_DEPENDENCIES =

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBCAP_LDFLAGS=-fPIC
+endif
+
 define LIBCAP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
-		BUILD_CFLAGS="$(HOST_CFLAGS)"
+		BUILD_CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(LIBCAP_LDFLAGS)"
 endef

 define LIBCAP_INSTALL_STAGING_CMDS
-- 
1.8.4
