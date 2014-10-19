From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:13:57 +0200
Subject: [Buildroot] [git commit] avahi: do not install S05avahi-setup.sh in
	systemd setup
Message-ID: <20141019111437.B8104AF20E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b4ec0c6a82fc853b00b2a720d0b945dcb2ea67e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AVAHI_INSTALL_AUTOIPD was unconditionally installing
S05avahi-setup.sh to /etc/init.d/, even in systemd
configurations. Therefore, this commit:

 * Moves the installation of S05avahi-setup.sh to a separate variable
   called AVAHI_INSTALL_AUTOIPD_INIT_SYSV.

 * Makes sure to use 'install -D' and a full destination path when
   installing S05avahi-setup.sh.

 * Moves the definition of AVAHI_INSTALL_AUTOIPD inside the
   BR2_PACKAGE_AVAHI_AUTOIPD conditional, so that both the variable
   definition and its addition to AVAHI_POST_INSTALL_TARGET_HOOKS are
   enclosed in the conditional.

 * Moves the S50avahi-daemon installation from AVAHI_INSTALL_INIT_SYSV
   to AVAHI_INSTALL_DAEMON_INIT_SYSV.

 * Uses 'install -D' to install S50avahi-daemon.

 * Adds a AVAHI_INSTALL_INIT_SYSV definition which calls both
   AVAHI_INSTALL_AUTOIPD_INIT_SYSV and AVAHI_INSTALL_DAEMON_INIT_SYSV.

Note: in a systemd configuration, there is no provision to do what
S05avahi-setup.sh is doing for sysv init configurations. Maybe this is
something that our systemd people should have a look at.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b684ab7..3b9ac63 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -150,14 +150,17 @@ endef
 
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT
 
+ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
 define AVAHI_INSTALL_AUTOIPD
-	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 endef
 
-ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
+define AVAHI_INSTALL_AUTOIPD_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/S05avahi-setup.sh
+endef
+
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_AUTOIPD
 endif
 
@@ -176,12 +179,17 @@ define AVAHI_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
 endef
 
-define AVAHI_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
+define AVAHI_INSTALL_DAEMON_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/S50avahi-daemon
 endef
 
 endif
 
+define AVAHI_INSTALL_INIT_SYSV
+	$(AVAHI_INSTALL_AUTOIPD_INIT_SYSV)
+	$(AVAHI_INSTALL_DAEMON_INIT_SYSV)
+endef
+
 # applications expects to be able to #include <dns_sd.h>
 define AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 	ln -sf avahi-compat-libdns_sd/dns_sd.h \
