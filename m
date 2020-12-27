From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:10:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dhcpcd: enhance
 syntax
Message-ID: <20201227082347.E219E80DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a69107c62b9f1d64adf03a4314973339eb0ef7f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Add all configure options through DHCP_CONFIG_OPTS and avoid splitting
lines when they are less than 80 characters

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 909432e0bb55b1bcf7c90e8b60c47ebc02b36a6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 63dbbee86c..3abd4cec68 100644
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
@@ -20,16 +24,11 @@ DHCPCD_CONFIG_OPTS += --disable-fork
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
