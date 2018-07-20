From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 20 Jul 2018 09:04:18 +0200
Subject: [Buildroot] [PATCH] bluez-alsa: bump to version 1.3.0
Message-ID: <20180720070418.29150-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add optional build of rfcomm which requires readline.

Update license hash as authorship has been updated in the license file.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/Config.in       | 6 ++++++
 package/bluez-alsa/bluez-alsa.hash | 4 ++--
 package/bluez-alsa/bluez-alsa.mk   | 9 ++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 1753da48f9..e52933f07c 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -26,6 +26,12 @@ config BR2_PACKAGE_BLUEZ_ALSA_HCITOP
 	help
 	  Enable top-like monitoring tool for HCI.
 
+config BR2_PACKAGE_BLUEZ_ALSA_RFCOMM
+	bool "rfcomm"
+	select BR2_PACKAGE_READLINE
+	help
+	  Simple tool for sending RFCOMM commands.
+
 endif
 
 comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library"
diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index b96c37cc46..5036f82eaa 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  dfa48e991a6bbb194a9161deb949371155150dabd5cfc1453a8df754b7cbdc84  bluez-alsa-9045edb436ea755f395a2e09e4525b5defad286a.tar.gz
-sha256  c90a0081b0526834f700d084e48819b18d11453ecb030c9b7de0d2cc3e3711a5  LICENSE.txt
+sha256  20005c4a153346ea7941973e9b7bd0b228417351f2e8ce88d1c02cc62bca188e  bluez-alsa-v1.3.0.tar.gz
+sha256  4738489ada14818fe4c53ce86223d7b2f4c1f57cb1f93d62c973c94a89080e83  LICENSE.txt
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 3ba237a6b7..fdf7e464a7 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 9045edb436ea755f395a2e09e4525b5defad286a
+BLUEZ_ALSA_VERSION = v1.3.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE.txt
@@ -40,4 +40,11 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-hcitop
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_RFCOMM),y)
+BLUEZ_ALSA_DEPENDENCIES += readline
+BLUEZ_ALSA_CONF_OPTS += --enable-rfcomm
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-rfcomm
+endif
+
 $(eval $(autotools-package))
-- 
2.18.0
