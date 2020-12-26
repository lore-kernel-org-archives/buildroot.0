From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:28:12 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: enhance syntax
Message-ID: <20201226171100.EEE3687EB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=909432e0bb55b1bcf7c90e8b60c47ebc02b36a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add all configure options through DHCP_CONFIG_OPTS and avoid splitting
lines when they are less than 80 characters

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 0dcd36f369..11d78e1847 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -11,6 +11,10 @@ DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
 
+DHCPCD_CONFIG_OPTS = \
+	--libexecdir=/lib/dhcpcd \
+	--os=linux
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
 endif
@@ -20,16 +24,11 @@ DHCPCD_CONFIG_OPTS += --disable-fork --disable-privsep
 endif
 
 define DHCPCD_CONFIGURE_CMDS
-	(cd $(@D); \
-	$(TARGET_CONFIGURE_OPTS) ./configure \
-		--os=linux \
-		--libexecdir=/lib/dhcpcd \
-		$(DHCPCD_CONFIG_OPTS) )
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(DHCPCD_CONFIG_OPTS))
 endef
 
 define DHCPCD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
