From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 23:41:35 +0100
Subject: [Buildroot] [git commit master] libidn: update to 1.15 and other
	fixes
Message-ID: <20091115224210.3AE5A77785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=83f9881d64cd7bcd760bc935e992e95ef3136b93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #715

* Add target uninstall.
* Remove stray /usr/share/emacs files.
* Remove stray mono (host, autodetected) dll installation in
  $(TARGET_DIR)/usr/lib by disabling C# altogether.
* Disable java.
* Add new option to install idn binary (default N, usually not required).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    5 +++--
 package/libidn/libidn.mk |   20 +++++++++++++++++---
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2cfa390..23e66d1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,8 +6,8 @@
 	Updated/fixed packages: autoconf, busybox, gcc, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
-	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
-	libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
+	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
+	libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
 	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
 	quagga, radvd, rsync, samba, sawman, shared-mime-info, speech-tools,
 	sqlite, squashfs, synergy, syslinux, tcpdump, u-boot, util-linux,
@@ -39,6 +39,7 @@
 	#667: [PATCH] e2fsprogs
 	#709: Bump lighttpd package to 1.4.24
 	#713: Migrate openntpd package to Makefile.autotools.in
+	#715: Bump libidn package to 1.15 and other fixes
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 50d9beb..52f59f2 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -3,12 +3,26 @@
 # libidn
 #
 #############################################################
-LIBIDN_VERSION = 1.9
-LIBIDN_SOURCE = libidn-$(LIBIDN_VERSION).tar.gz
+
+LIBIDN_VERSION = 1.15
 LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_INSTALL_TARGET = YES
-LIBIDN_CONF_OPT = --enable-shared
+LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
+LIBIDN_LIBTOOL_PATCH = NO
 LIBIDN_DEPENDENCIES = host-pkgconfig gettext $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(call AUTOTARGETS,package,libidn))
+
+$(LIBIDN_HOOK_POST_INSTALL):
+ifneq ($(BR2_PACKAGE_LIBIDN_BINARY),y)
+	rm -f $(TARGET_DIR)/usr/bin/idn
+endif
+	rm -rf $(TARGET_DIR)/usr/share/emacs
+	touch $@
+
+$(LIBIDN_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/lib/libidn*
+	rm -f $(TARGET_DIR)/usr/bin/idn
+	rm -f $(LIBIDN_TARGET_INSTALL_TARGET) $(LIBIDN_HOOK_POST_INSTALL)
-- 
1.6.3.3
