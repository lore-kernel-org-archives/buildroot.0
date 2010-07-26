From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] iw: bump to 0.9.20 and migrate
	to gentargets
Message-ID: <20100726225418.5C6F5834AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=52beecb809d24264970a5748ba77a005159db45b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/iw/iw.mk |   27 +++++++++++++++++----------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3418a72..abaa7af 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,7 +23,7 @@
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk, gmpc,
 	gst-plugins-base, gst-plugins-good, gstreamer, gzip, intltool,
-	ipsec-tools, iptables, libart, libcgi, libdrm, libfuse,
+	ipsec-tools, iptables, iw, libart, libcgi, libdrm, libfuse,
 	libgpg-error, libidn, liblockfile, libpng, lighttpd, links,
 	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
 	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index e6a3418..0f8851a 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,25 +4,32 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.19
+IW_VERSION = 0.9.20
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
-IW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
-$(eval $(call AUTOTARGETS,package,iw))
-
-$(IW_TARGET_CONFIGURE):
+define IW_CONFIGURE_CMDS
 	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
 	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
 	echo "LDFLAGS = $(TARGET_LDFLAGS)" >>$(IW_CONFIG)
-	touch $@
+endef
+
+define IW_BUILD_CMDS
+	$(IW_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define IW_INSTALL_TARGET_CMDS
+	$(IW_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define IW_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/iw
+	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
+endef
 
-$(IW_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-	rm -f $(TARGET_DIR)/usr/bin/iw
-	rm -f $(IW_TARGET_INSTALL_TARGET) $(IW_HOOK_POST_INSTALL)
+$(eval $(call GENTARGETS,package,iw))
-- 
1.7.1
