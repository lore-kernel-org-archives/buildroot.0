From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 14:38:55 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: Add an explicit option to
	enable nl80211.
Message-ID: <20151011124125.B816181DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8ad272143c305fe32ed54fbb7d38021456daac7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, nl80211 support is conditionnal with libnl being enabled,
using implicit dependencies.  This causes problems since it is not
obvious and wpa_supplicant without nl80211 isn't what most user expects.

If nl80211 isn't enabled, then buildroot only enables the wext driver,
which will only work if some deprecated kernel feature isn't left
disabled, or if using a outdated out-of-tree linux driver which doesn't
use the cfg80211 infrastructure.

This makes nl80211 support an explicit option, which
"select BR2_PACKAGE_LIBNL" accordingly.  To handle upgrades nicely, it
would have been nice to have "default y if BR2_PACKAGE_LIBNL", but
Kconfig treats this as a circular dependency.  So instead, this enables
the option by default, which is less worse than not enabling nl80211
when it was previously implicitely enabled.

[Thomas:
 - rewrap Config.in help text
 - add comment about thread dependency.]

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/Config.in         |   21 +++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk |    2 +-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index f32a867..eb42257 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -8,6 +8,27 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 
 if BR2_PACKAGE_WPA_SUPPLICANT
 
+config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
+	bool "Enable nl80211 support"
+	default y
+	select BR2_PACKAGE_LIBNL
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	help
+	  Enable support for nl80211.  This is the current wireless
+	  API for Linux, supported by all wireless drivers in vanilla
+	  Linux, but may not be supported by some out-of-tree Linux
+	  wireless drivers.  wpa_supplicant will still fall back to
+	  using the Wireless Extensions (wext) API with these drivers.
+
+	  If this option is disabled, then only the deprecated wext
+	  API will be supported, with far less features.  Linux may
+	  supports using wext with modern drivers using a
+	  compatibility layer, but it must be enabled in the kernel
+	  configuration.
+
+comment "nl80211 support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	bool "Enable AP mode"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 1a3e0db..0574f02 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -32,7 +32,7 @@ WPA_SUPPLICANT_CONFIG_DISABLE = \
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
 # in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
-ifeq ($(BR2_PACKAGE_LIBNL),y)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_NL80211),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
 endif
