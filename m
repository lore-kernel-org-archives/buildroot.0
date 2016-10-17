From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:48 -0300
Subject: [Buildroot] [PATCH 01/93] pppd: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pppd/pppd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 92897be..b37832d 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -46,11 +46,11 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-	( cd $(@D); ./configure --prefix=/usr )
+	( cd $(@D); $(TARGET_MAKE_ENV) ./configure --prefix=/usr )
 endef
 
 define PPPD_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
 		-C $(@D) $(PPPD_MAKE_OPTS)
 endef
 
@@ -104,7 +104,7 @@ define PPPD_INSTALL_TARGET_CMDS
 endef
 
 define PPPD_INSTALL_STAGING_CMDS
-	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
+	$(TARGET_MAKE_ENV) $(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
