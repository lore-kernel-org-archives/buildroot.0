From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:24:32 +0100
Subject: [Buildroot] [git commit] libcap: enable extended attribute support
Message-ID: <20160302202758.222A77FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cc9dd31e1d07a30001645b4f8a0f4aff91dbc1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required for capability support in files, via fakeroot.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 54844f8..252c4bb 100644
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
@@ -67,12 +66,13 @@ define LIBCAP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
+		LIBATTR=yes RAISE_SETFCAP=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) \
-		prefix=/usr lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+		LIBATTR=yes RAISE_SETFCAP=no prefix=/usr lib=lib install
 endef
 
 $(eval $(generic-package))
