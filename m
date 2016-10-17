From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:49 -0300
Subject: [Buildroot] [PATCH 02/93] poco: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-3-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/poco/poco.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 79452c0..4b82c50 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -47,7 +47,7 @@ POCO_MAKE_TARGET = all_release
 endif
 
 define POCO_CONFIGURE_CMDS
-	(cd $(@D); ./configure \
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux		\
 		--prefix=/usr		\
 		--omit="$(POCO_OMIT)"	\
@@ -58,19 +58,19 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
 endef
 
 define POCO_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
 define POCO_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
-- 
2.7.3
