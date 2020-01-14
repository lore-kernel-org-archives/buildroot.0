From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:05:01 +0100
Subject: [Buildroot] [git commit] package/olsr: use make foreach loops
Message-ID: <20200114205502.5E0AE81F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b71b13f2f1abc29c9aea13e8906a6f28cc0da1fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace shell for loops by make foreach loops

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/olsr/olsr.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index e643a0cfb3..53bf874af0 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -18,19 +18,19 @@ OLSR_DEPENDENCIES = host-flex host-bison
 
 define OLSR_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
-	for p in $(OLSR_PLUGINS) ; do \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$$p ; \
-	done
+	$(foreach p,$(OLSR_PLUGINS), \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$(p)
+	)
 endef
 
 define OLSR_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
 		prefix="/usr" install_bin
-	for p in $(OLSR_PLUGINS) ; do \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$$p \
+	$(foreach p,$(OLSR_PLUGINS), \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$(p) \
 			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
-			prefix="/usr" install ; \
-	done
+			prefix="/usr" install
+	)
 	$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq \
 		$(TARGET_DIR)/etc/olsrd/olsrd.conf
 endef
