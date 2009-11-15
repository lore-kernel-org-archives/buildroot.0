From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 23:46:53 +0100
Subject: [Buildroot] [git commit master] dnsmasq: bump to 2.51 and add IDN
	option
Message-ID: <20091115224803.9EBDB77785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=882e137608e2727f485014286bad6cdddc31a198
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #717

Dnsmasq 2.51 introduces IDN support, add it to the package.
Newsworthy items:

* Add support for internationalised DNS (IDN).
* Improved upstream nameserver checks for slow nameservers.
* Improved TFTP support (win/dos filenames, new tftpserver-address option
  for DHCP).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/dnsmasq/Config.in  |    8 ++++++++
 package/dnsmasq/dnsmasq.mk |    9 +++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 23e66d1..98525ce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -40,6 +40,7 @@
 	#709: Bump lighttpd package to 1.4.24
 	#713: Migrate openntpd package to Makefile.autotools.in
 	#715: Bump libidn package to 1.15 and other fixes
+	#717: Bump dnsmasq to 2.51 and introduce new IDN option
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 073f57b..a8d0d9a 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -20,3 +20,11 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 	help
 	  Enable DHCP server support in dnsmasq.
 
+config BR2_PACKAGE_DNSMASQ_IDN
+	bool "IDN support (BIG!)"
+	depends on BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBIDN
+	help
+	  Enable IDN support in dnsmasq.
+	  This option is a big space taker since is pulls in many libraries.
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dec2971..07b3c48 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.50
-DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.gz
+DNSMASQ_VERSION = 2.51
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_AUTORECONF = NO
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
@@ -24,6 +23,12 @@ ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
 DNSMASQ_COPTS += -DNO_TFTP
 endif
 
+ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
+DNSMASQ_MAKE_OPT += all-i18n
+DNSMASQ_DEPENDENCIES += libidn libintl
+DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl"
+endif
+
 ifneq ($(BR2_LARGEFILE),y)
 DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
-- 
1.6.3.3
