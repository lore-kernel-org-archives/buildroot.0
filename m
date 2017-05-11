From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 May 2017 14:56:37 +0100
Subject: [Buildroot] [PATCH next 1/3] network-manager: bump version to 1.8.0
Message-ID: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added --disable-concheck to avoid configure failure when libcurl is not
available:

  checking for LIBCURL... no
  configure: error: --enable-concheck requires libcurl library.

One would expect the concheck functionality to be automatically disabled
if libcurl is not found. But upstream wants to be explicitly disabled if
now wanted to prevent building NetworkManager without connectivity
check support without any evident warning on systems where libcurl is
not installed. See:

  https://github.com/NetworkManager/NetworkManager/commit/faa1b85dab647baad7ce856e83f343af841aa6a5

Proper support for concheck will be added in a subsequent patch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 94f3e26..2861aed 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.4/NetworkManager-1.4.2.sha256sum
-sha256 a864e347ddf6da8dabd40e0185b8c10a655d4a94b45cbaa2b3bb4b5e8360d204  NetworkManager-1.4.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.8/NetworkManager-1.8.0.sha256sum
+sha256 fa5a5c6a36cdf95b12df34cc575bd61a74f297ede9be22cac4807a1aff3cf69e  NetworkManager-1.8.0.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6adc9b1..1d17ec4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.4
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.8
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -30,7 +30,8 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown \
-	--disable-ifnet
+	--disable-ifnet \
+	--disable-concheck
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
-- 
2.10.2
