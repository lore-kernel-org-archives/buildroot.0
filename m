From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 May 2010 08:22:26 +0200
Subject: [Buildroot] [git commit master] pciutils: fix access to pci.ids and
	make update-pciids work with busybox wget
Message-ID: <20100524071718.B2D658B82D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=096b21e552b05b68a846172e320ae3e38dee16ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1819

Fix two issues with pciutils:

- pciutils would look in /usr/share/misc for pci.ids, but install it in
  /usr/share. This is because pciutils doesn't use a ./configure script,
  so we have to also provide the configuration (make) arguments when
  we run make install as well. Fix it by making it look into /usr/share
  as that's simpler to do, and is what upstream does.

- the update-pciids script would call wget with the --no-timestamping
  option, which isn't supported by busybox wget. Fix it by simply
  removing that option as it isn't really critical.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    6 ++++--
 package/pciutils/pciutils.mk |    3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 72b2158..4d00463 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,14 +5,16 @@
 	Updated/fixed packages: aumix, avahi, busybox, cairo, cdrkit,
 	fltk, gettext, gmpc, grep, hal, iconv, icu, libcgicc, libglib2,
 	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
-	mtd-utils, mutt, netsnmp, ntp, pango, php, psmisc, qt, samba,
-	sshfs, startup-notification, uemacs, util-linux, vpnc
+	mtd-utils, mutt, netsnmp, ntp, pango, pciutils, php, psmisc,
+	qt, samba, sshfs, startup-notification, uemacs, util-linux,
+	vpnc
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#1693: NTP trys IPV6 even if not configured error: 'IPV6_MULTICAST...
 	#1729: alsamixergui fails to build
 	#1801: Avahi-autoipd doesn't create TARGET_DIR/var/lib
+	#1819: pciutils small bugs
 
 2010.05-rc2, Released May 11th, 2010:
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2b999df..a7d9996 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -15,6 +15,7 @@ PCIUTILS_DNS=no
 PCIUTILS_SHARED=yes
 
 define PCIUTILS_CONFIGURE_CMDS
+	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
 		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
 		$(PCIUTILS_DIR)/lib/configure
@@ -32,7 +33,7 @@ define PCIUTILS_BUILD_CMDS
 		SHARED=$(PCIUTILS_SHARED) \
 		ZLIB=$(PCIUTILS_ZLIB) \
 		DNS=$(PCIUTILS_DNS) \
-		SHAREDIR=/usr/share/misc
+		PREFIX=/usr
 endef
 
 # Ditch install-lib if SHARED is an option in the future
-- 
1.6.3.3
