From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 19 Sep 2020 11:13:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix passing of make
 opts and add snappy dep
Message-ID: <20200919091313.29175-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/makedumpfile/makedumpfile.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8077664892..9d67853ef5 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -15,6 +15,11 @@ MAKEDUMPFILE_DEPENDENCIES += lzo
 MAKEDUMPFILE_MAKE_OPTS += USELZO=on
 endif
 
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+MAKEDUMPFILE_DEPENDENCIES += snappy
+MAKEDUMPFILE_MAKE_OPTS += USESNAPPY=on
+endif
+
 ifeq ($(BR2_powerpc),y)
 MAKEDUMPFILE_TARGET = powerpc32
 else
@@ -24,7 +29,7 @@ endif
 
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
+		$(MAKEDUMPFILE_MAKE_OPTS) TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
 endef
 
 define MAKEDUMPFILE_INSTALL_TARGET_CMDS
-- 
2.28.0
