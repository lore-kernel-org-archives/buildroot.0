From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 22 Feb 2016 13:52:56 -0300
Subject: [Buildroot] [PATCH 3/4] libcap: enable extended attribute support
In-Reply-To: <1456159977-8428-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456159977-8428-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1456159977-8428-4-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

This is required for capability support in files, via fakeroot.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.4.10
