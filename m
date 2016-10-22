From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] pppd: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.6F5D181974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebd73fab3e0c0a5bef351d1d6f14ed2323b6e24f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pppd/pppd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 3741f92..55630a8 100644
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
