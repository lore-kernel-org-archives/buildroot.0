From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:29:01 +0300
Subject: [Buildroot] [PATCH 6/9] firefox: Mozilla Web Browser
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-7-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                                  |    1 +
 package/firefox/Config.in                          |  417 ++++++++++++++++++++
 .../firefox/firefox-11.0-NativeWindowHandle.patch  |   12 +
 package/firefox/firefox-11.0-execinfo.patch        |   45 +++
 package/firefox/firefox-11.0-isfinite.patch        |   22 +
 package/firefox/firefox-11.0-uclibc.patch          |  112 ++++++
 package/firefox/firefox-11.0-uintptr_t.patch       |   12 +
 package/firefox/firefox.mk                         |  240 +++++++++++
 package/firefox/firefox_extensions.mk.in           |  168 ++++++++
 package/firefox/mozconfig                          |   35 ++
 package/firefox/prefs.js                           |  100 +++++
 11 files changed, 1164 insertions(+), 0 deletions(-)
 create mode 100644 package/firefox/Config.in
 create mode 100644 package/firefox/firefox-11.0-NativeWindowHandle.patch
 create mode 100644 package/firefox/firefox-11.0-execinfo.patch
 create mode 100644 package/firefox/firefox-11.0-isfinite.patch
 create mode 100644 package/firefox/firefox-11.0-uclibc.patch
 create mode 100644 package/firefox/firefox-11.0-uintptr_t.patch
 create mode 100644 package/firefox/firefox.mk
 create mode 100644 package/firefox/firefox_extensions.mk.in
 create mode 100644 package/firefox/mozconfig
 create mode 100755 package/firefox/prefs.js

diff --git a/package/Config.in b/package/Config.in
index 636caf8..1848abb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -540,6 +540,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/firefox/Config.in"
 source "package/heirloom-mailx/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hiawatha/Config.in"
diff --git a/package/firefox/Config.in b/package/firefox/Config.in
new file mode 100644
index 0000000..fbd4749
--- /dev/null
+++ b/package/firefox/Config.in
@@ -0,0 +1,417 @@
+config BR2_PACKAGE_FIREFOX
+	bool "firefox"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_TEE
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_FTS3
+	select BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
+	select BR2_PACKAGE_SQLITE_SECURE_DELETE
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Mozilla Firefox Web Browser
+
+	  http://releases.mozilla.org/pub/mozilla.org/firefox/releases/11.0/source/
+
+if BR2_PACKAGE_FIREFOX
+
+config BR2_PACKAGE_FIREFOX_ENABLE_DEBUG
+	bool "Enable debug build and Valgrind integration hooks"
+	select BR2_PACKAGE_VALGRIND if BR2_TOOLCHAIN_BUILDROOT && BR2_GCC_ENABLE_TLS
+	help
+		This enables debug support.
+		If you are using buildroot toolchain and your gcc has TLS enable then
+		this will also enable Valgrind integration hooks.
+
+config BR2_PACKAGE_FIREFOX_ENABLE_WEBM
+	bool "Enable WebM"
+	select BR2_PACKAGE_YASM if BR2_i386 || BR2_x86_64
+	help
+		WebM is an audio-video format designed to provide royalty-free, open video compression
+		for use with HTML5 video. The project's development is sponsored by Google inc.
+
+		A WebM file consist of VP8 video and Vorbis audio streams, in a container based on 
+		a profile of Matroska. The project releases WebM related software under a BSD license and
+		all users are granted a worldwide, non-exclusive, non-charge, royalty-free patent license.
+
+		WebM is one way of watching YouTube videos without proprietary Adobe Flash.
+		After you have installed WebM enabled Firefox you can try it by visiting the following link:
+
+		http://www.youtube.com/results?search_query=web&webm=1
+
+config BR2_PACKAGE_FIREFOX_ULTRA_PARANOID
+	bool "Enable Ulta-paranoid settings"
+	select BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	select BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT
+	select BR2_PACKAGE_FIREFOX_EXTENSION_ADBLOCK_LITE
+	select BR2_PACKAGE_FIREFOX_EXTENSION_GHOSTERY
+	select BR2_PACKAGE_FIREFOX_EXTENSION_HTTPS_EVERYWHERE
+	help
+		This enables my (IMHO) ultra-private custom settings.
+		The changed settings appear bold when typing about:config into your browser address bar.
+
+		Most (but not all!) are documented in 
+		http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries
+
+		For more info of these entries please take a look at package/firefox/prefs.js file.
+
+		By selecting this option you are also enabling pipelining for your browser.
+
+		Below is a short summary of settings changed:
+		
+			network.http.pipelining = true;
+			network.http.pipelining.aggressive = true;
+			network.http.pipelining.ssl = true;
+			network.http.proxy.pipelining = true;
+			browser.download.manager.retention = 1;
+			browser.formfill.enable = false;
+			browser.privatebrowsing.autostart = true;
+			dom.disable_window_move_resize = false;
+			dom.event.contextmenu.enabled = false;
+			geo.enabled = false;
+			network.cookie.cookieBehavior = 1;
+			network.cookie.lifetimePolicy = 2;
+			network.cookie.prefsMigrated = true;
+			network.proxy.socks_remote_dns = true;
+			network.websocket.enabled = false; 
+			places.history.enabled = false;
+			privacy.clearOnShutdown.offlineApps = true;
+			privacy.clearOnShutdown.passwords = true;
+			privacy.clearOnShutdown.siteSettings = true;
+			privacy.donottrackheader.enabled = true;
+			privacy.item.cookies = true;
+			privacy.sanitize.sanitizeOnShutdown = true;
+
+			Note: 
+			By selecting this option you are also enabling the following privacy/security related
+			extensions: NoScript, Adblock Lite, Ghostery & HTTPS Everywhere
+
+config BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	bool "Enable installing of selected default extensions"
+	help
+		This option will enable you to select default extensions to
+		be installed when building Firefox.
+
+		Note: The selected extensions are only *installed*.
+		They are not *enabled* by default.
+		For that you have to manually enable them after starting you
+		freshly build Firefox.
+
+config BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT
+	bool "Install NoScript extensions"
+	depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	help
+		NoScript for Firefox pre-emptively blocks malicious scripts
+		and allows JavaScript, Java, Flash and other potentially dangerous
+		content only from sites you trust.
+
+		NoScript also provides the most anti-XSS and anti-Clickjacking
+		protection ever available in a browser
+
+		http://noscript.net
+
+config BR2_PACKAGE_FIREFOX_EXTENSION_ADBLOCK_LITE
+	bool "Install Adblock Lite extension"
+	depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	help
+		Adblock Lite is a fork of the Adblock Plus version 1.3.10 (classic UI)
+		extension for blocking advertisements on the web.
+		This fork will provide the same features as Adblock Plus 2.x and higher
+		while keeping the old UI but without acceptable ads feature.
+
+		https://bitbucket.org/adstomper/adblocklite
+
+config BR2_PACKAGE_FIREFOX_EXTENSION_GHOSTERY
+	bool "Install Ghostery extension"
+	depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	help
+		Protect your privacy. See who's tracking your web browsing and
+		block them with Ghostery.
+
+		http://www.ghostery.com
+
+config BR2_PACKAGE_FIREFOX_EXTENSION_HTTPS_EVERYWHERE
+	bool "Install HTTPS Everywhere extension"
+	depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	help
+		HTTPS Everywhere is a Firefox and Chrome extension
+		that encrypts your communications wit many major
+		websites, making your browsing more secure.
+
+		https://www.eff.org/https-everywhere
+
+config BR2_PACKAGE_FIREFOX_PLUGIN_GNASH
+	source "package/gnash/Config.in"
+
+choice
+	default BR2_PACKAGE_FIREFOX_LOCALE_EN_US
+	prompt "Select locale"
+	config BR2_PACKAGE_FIREFOX_LOCALE_AF
+		bool "af"
+	config BR2_PACKAGE_FIREFOX_LOCALE_AK
+		bool "ak"
+	config BR2_PACKAGE_FIREFOX_LOCALE_AR
+		bool "ar"
+	config BR2_PACKAGE_FIREFOX_LOCALE_AS
+		bool "as"
+	config BR2_PACKAGE_FIREFOX_LOCALE_AST
+		bool "ast"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BE
+		bool "be"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BG
+		bool "bg"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BN_BD
+		bool "bn-BD"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BN_ID
+		bool "bn-IN"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BR
+		bool "br"
+	config BR2_PACKAGE_FIREFOX_LOCALE_BS
+		bool "bs"
+	config BR2_PACKAGE_FIREFOX_LOCALE_CA
+		bool "ca"
+	config BR2_PACKAGE_FIREFOX_LOCALE_CSB
+		bool "csb"
+	config BR2_PACKAGE_FIREFOX_LOCALE_CS
+		bool "cs"
+	config BR2_PACKAGE_FIREFOX_LOCALE_CY
+		bool "cy"
+	config BR2_PACKAGE_FIREFOX_LOCALE_DA
+		bool "da"
+	config BR2_PACKAGE_FIREFOX_LOCALE_DE
+		bool "de"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EL
+		bool "el"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EN_GB
+		bool "en-GB"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EN_US
+		bool "en-US"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EN_ZA
+		bool "en-ZA"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EO
+		bool "eo"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ES_AR
+		bool "es-AR"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ES_CL
+		bool "es-CL"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ES_ES
+		bool "es-ES"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ES_MX
+		bool "es-MX"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ET
+		bool "et"
+	config BR2_PACKAGE_FIREFOX_LOCALE_EU
+		bool "eu"
+	config BR2_PACKAGE_FIREFOX_LOCALE_FA
+		bool "fa"
+	config BR2_PACKAGE_FIREFOX_LOCALE_FI
+		bool "fi"
+	config BR2_PACKAGE_FIREFOX_LOCALE_FR
+		bool "fr"
+	config BR2_PACKAGE_FIREFOX_LOCALE_FY_NL
+		bool "fy-NL"
+	config BR2_PACKAGE_FIREFOX_LOCALE_GA_IE
+		bool "ga-IE"
+	config BR2_PACKAGE_FIREFOX_LOCALE_GD
+		bool "gd"
+	config BR2_PACKAGE_FIREFOX_LOCALE_GL
+		bool "gl"
+	config BR2_PACKAGE_FIREFOX_LOCALE_GU_IN
+		bool "gu-IN"
+	config BR2_PACKAGE_FIREFOX_LOCALE_HE
+		bool "he"
+	config BR2_PACKAGE_FIREFOX_LOCALE_HI_IN
+		bool "hi-IN"
+	config BR2_PACKAGE_FIREFOX_LOCALE_HR
+		bool "hr"
+	config BR2_PACKAGE_FIREFOX_LOCALE_HU
+		bool "hu"
+	config BR2_PACKAGE_FIREFOX_LOCALE_HY_AM
+		bool "hy-AM"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ID
+		bool "id"
+	config BR2_PACKAGE_FIREFOX_LOCALE_IS
+		bool "is"
+	config BR2_PACKAGE_FIREFOX_LOCALE_IT
+		bool "it"
+	config BR2_PACKAGE_FIREFOX_LOCALE_JA
+		bool "ja"
+	config BR2_PACKAGE_FIREFOX_LOCALE_KK
+		bool "kk"
+	config BR2_PACKAGE_FIREFOX_LOCALE_KN
+		bool "kn"
+	config BR2_PACKAGE_FIREFOX_LOCALE_KO
+		bool "ko"
+	config BR2_PACKAGE_FIREFOX_LOCALE_KU
+		bool "ku"
+	config BR2_PACKAGE_FIREFOX_LOCALE_LG
+		bool "lg"
+	config BR2_PACKAGE_FIREFOX_LOCALE_LT
+		bool "lt"
+	config BR2_PACKAGE_FIREFOX_LOCALE_LV
+		bool "lv"
+	config BR2_PACKAGE_FIREFOX_LOCALE_MAI
+		bool "mai"
+	config BR2_PACKAGE_FIREFOX_LOCALE_MK
+		bool "mk"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ML
+		bool "ml"
+	config BR2_PACKAGE_FIREFOX_LOCALE_MR
+		bool "mr"
+	config BR2_PACKAGE_FIREFOX_LOCALE_NB_NO
+		bool "nb-NO"
+	config BR2_PACKAGE_FIREFOX_LOCALE_NL
+		bool "nl"
+	config BR2_PACKAGE_FIREFOX_LOCALE_NN_NO
+		bool "nn-NO"
+	config BR2_PACKAGE_FIREFOX_LOCALE_NSO
+		bool "nso"
+	config BR2_PACKAGE_FIREFOX_LOCALE_OR
+		bool "or"
+	config BR2_PACKAGE_FIREFOX_LOCALE_PA_IN
+		bool "pa-IN"
+	config BR2_PACKAGE_FIREFOX_LOCALE_PL
+		bool "pl"
+	config BR2_PACKAGE_FIREFOX_LOCALE_PT_BR
+		bool "pt-BR"
+	config BR2_PACKAGE_FIREFOX_LOCALE_PT_PT
+		bool "pt-PT"
+	config BR2_PACKAGE_FIREFOX_LOCALE_RM
+		bool "rm"
+	config BR2_PACKAGE_FIREFOX_LOCALE_RO
+		bool "ro"
+	config BR2_PACKAGE_FIREFOX_LOCALE_RU
+		bool "ru"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SI
+		bool "si"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SK
+		bool "sk"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SL
+		bool "sl"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SON
+		bool "son"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SQ
+		bool "sq"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SR
+		bool "sr"
+	config BR2_PACKAGE_FIREFOX_LOCALE_SV_SE
+		bool "sv-SE"
+	config BR2_PACKAGE_FIREFOX_LOCALE_TA
+		bool "ta"
+	config BR2_PACKAGE_FIREFOX_LOCALE_TA_LK
+		bool "ta-LK"
+	config BR2_PACKAGE_FIREFOX_LOCALE_TE
+		bool "te"
+	config BR2_PACKAGE_FIREFOX_LOCALE_TH
+		bool "th"
+	config BR2_PACKAGE_FIREFOX_LOCALE_TR
+		bool "tr"
+	config BR2_PACKAGE_FIREFOX_LOCALE_UK
+		bool "uk"
+	config BR2_PACKAGE_FIREFOX_LOCALE_VI
+		bool "vi"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ZH_CN
+		bool "zh-CN"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ZH_TW
+		bool "zh-TW"
+	config BR2_PACKAGE_FIREFOX_LOCALE_ZU
+		bool "zu"
+endchoice
+
+config BR2_PACKAGE_FIREFOX_LOCALE
+	string
+	default "af" 	if BR2_PACKAGE_FIREFOX_LOCALE_AF
+	default "ak" 	if BR2_PACKAGE_FIREFOX_LOCALE_AK
+	default "ar" 	if BR2_PACKAGE_FIREFOX_LOCALE_AR
+	default "as" 	if BR2_PACKAGE_FIREFOX_LOCALE_AS
+	default "ast" 	if BR2_PACKAGE_FIREFOX_LOCALE_AST
+	default "be" 	if BR2_PACKAGE_FIREFOX_LOCALE_BE
+	default "bg"	if BR2_PACKAGE_FIREFOX_LOCALE_BG
+	default "bn-BD"	if BR2_PACKAGE_FIREFOX_LOCALE_BN_BD
+	default "bn-IN"	if BR2_PACKAGE_FIREFOX_LOCALE_BN_ID
+	default "br"	if BR2_PACKAGE_FIREFOX_LOCALE_BR
+	default "bs"	if BR2_PACKAGE_FIREFOX_LOCALE_BS
+	default "ca"	if BR2_PACKAGE_FIREFOX_LOCALE_CA
+	default "csb"	if BR2_PACKAGE_FIREFOX_LOCALE_CSB
+	default "cs"	if BR2_PACKAGE_FIREFOX_LOCALE_CS
+	default "cy"	if BR2_PACKAGE_FIREFOX_LOCALE_CY
+	default "da"	if BR2_PACKAGE_FIREFOX_LOCALE_DA
+	default "de"	if BR2_PACKAGE_FIREFOX_LOCALE_DE
+	default "el"	if BR2_PACKAGE_FIREFOX_LOCALE_EL
+	default "en-GB"	if BR2_PACKAGE_FIREFOX_LOCALE_EN_GB
+	default "en-US"	if BR2_PACKAGE_FIREFOX_LOCALE_EN_US
+	default "en-ZA"	if BR2_PACKAGE_FIREFOX_LOCALE_EN_ZA
+	default "eo"	if BR2_PACKAGE_FIREFOX_LOCALE_EO
+	default "es-AR"	if BR2_PACKAGE_FIREFOX_LOCALE_ES_AR
+	default "es-CL"	if BR2_PACKAGE_FIREFOX_LOCALE_ES_CL
+	default "es-ES"	if BR2_PACKAGE_FIREFOX_LOCALE_ES_ES
+	default "es-MX" if BR2_PACKAGE_FIREFOX_LOCALE_ES_MX
+	default "et"	if BR2_PACKAGE_FIREFOX_LOCALE_ET
+	default	"eu"	if BR2_PACKAGE_FIREFOX_LOCALE_EU
+	default "fa"	if BR2_PACKAGE_FIREFOX_LOCALE_FA
+	default "fi"	if BR2_PACKAGE_FIREFOX_LOCALE_FI
+	default "fr"	if BR2_PACKAGE_FIREFOX_LOCALE_FR
+	default "fy-NL" if BR2_PACKAGE_FIREFOX_LOCALE_FY_NL
+	default "ga-IE"	if BR2_PACKAGE_FIREFOX_LOCALE_GA_IE
+	default "gd"	if BR2_PACKAGE_FIREFOX_LOCALE_GD
+	default "gl"	if BR2_PACKAGE_FIREFOX_LOCALE_GL
+	default "gu-IN"	if BR2_PACKAGE_FIREFOX_LOCALE_GU_IN
+	default "he"	if BR2_PACKAGE_FIREFOX_LOCALE_HE
+	default "hi-IN"	if BR2_PACKAGE_FIREFOX_LOCALE_HI_IN
+	default "hr"	if BR2_PACKAGE_FIREFOX_LOCALE_HR
+	default "hu"	if BR2_PACKAGE_FIREFOX_LOCALE_HU
+	default "hy-AM"	if BR2_PACKAGE_FIREFOX_LOCALE_HY_AM
+	default "id"	if BR2_PACKAGE_FIREFOX_LOCALE_ID
+	default "is"	if BR2_PACKAGE_FIREFOX_LOCALE_IS
+	default	"it"	if BR2_PACKAGE_FIREFOX_LOCALE_IT
+	default "ja"	if BR2_PACKAGE_FIREFOX_LOCALE_JA
+	default "kk"	if BR2_PACKAGE_FIREFOX_LOCALE_KK
+	default "kn"	if BR2_PACKAGE_FIREFOX_LOCALE_KN
+	default "ko"	if BR2_PACKAGE_FIREFOX_LOCALE_KO
+	default "ku"	if BR2_PACKAGE_FIREFOX_LOCALE_KU
+	default "lg"	if BR2_PACKAGE_FIREFOX_LOCALE_LG
+	default "lt"	if BR2_PACKAGE_FIREFOX_LOCALE_LT
+	default "lv"	if BR2_PACKAGE_FIREFOX_LOCALE_LV
+	default "mai"	if BR2_PACKAGE_FIREFOX_LOCALE_MAI
+	default "mk"	if BR2_PACKAGE_FIREFOX_LOCALE_MK
+	default "ml"	if BR2_PACKAGE_FIREFOX_LOCALE_ML
+	default "mr"	if BR2_PACKAGE_FIREFOX_LOCALE_MR
+	default "nb-NO"	if BR2_PACKAGE_FIREFOX_LOCALE_NB_NO
+	default "nl"	if BR2_PACKAGE_FIREFOX_LOCALE_NL
+	default "nn-NO"	if BR2_PACKAGE_FIREFOX_LOCALE_NN_NO
+	default "nso"	if BR2_PACKAGE_FIREFOX_LOCALE_NSO
+	default "or"	if BR2_PACKAGE_FIREFOX_LOCALE_OR
+	default "pa-IN"	if BR2_PACKAGE_FIREFOX_LOCALE_PA_IN
+	default "pl"	if BR2_PACKAGE_FIREFOX_LOCALE_PL
+	default "pt-BR"	if BR2_PACKAGE_FIREFOX_LOCALE_PT_BR
+	default "pt-PT"	if BR2_PACKAGE_FIREFOX_LOCALE_PT_PT
+	default "rm"	if BR2_PACKAGE_FIREFOX_LOCALE_RM
+	default "ro"	if BR2_PACKAGE_FIREFOX_LOCALE_RO
+	default "ru"	if BR2_PACKAGE_FIREFOX_LOCALE_RU
+	default "si"	if BR2_PACKAGE_FIREFOX_LOCALE_SI
+	default "sk"	if BR2_PACKAGE_FIREFOX_LOCALE_SK
+	default "sl"	if BR2_PACKAGE_FIREFOX_LOCALE_SL
+	default "son"	if BR2_PACKAGE_FIREFOX_LOCALE_SON
+	default "sq"	if BR2_PACKAGE_FIREFOX_LOCALE_SQ
+	default "sr"	if BR2_PACKAGE_FIREFOX_LOCALE_SR
+	default "sv-SE" if BR2_PACKAGE_FIREFOX_LOCALE_SV_SE
+	default "ta"	if BR2_PACKAGE_FIREFOX_LOCALE_TA
+	default "ta-LK"	if BR2_PACKAGE_FIREFOX_LOCALE_TA_LK
+	default "te"	if BR2_PACKAGE_FIREFOX_LOCALE_TE
+	default "th"	if BR2_PACKAGE_FIREFOX_LOCALE_TH
+	default "tr"	if BR2_PACKAGE_FIREFOX_LOCALE_TR
+	default "uk"	if BR2_PACKAGE_FIREFOX_LOCALE_UK
+	default "vi"	if BR2_PACKAGE_FIREFOX_LOCALE_VI
+	default "zh-CN"	if BR2_PACKAGE_FIREFOX_LOCALE_ZH_CN
+	default "zh-TW"	if BR2_PACKAGE_FIREFOX_LOCALE_ZH_TW
+	default "zu"	if BR2_PACKAGE_FIREFOX_LOCALE_ZU
+
+endif
diff --git a/package/firefox/firefox-11.0-NativeWindowHandle.patch b/package/firefox/firefox-11.0-NativeWindowHandle.patch
new file mode 100644
index 0000000..bced599
--- /dev/null
+++ b/package/firefox/firefox-11.0-NativeWindowHandle.patch
@@ -0,0 +1,12 @@
+diff -Naur firefox-11.0.org/dom/plugins/ipc/PluginMessageUtils.h firefox-11.0/dom/plugins/ipc/PluginMessageUtils.h
+--- firefox-11.0.org/dom/plugins/ipc/PluginMessageUtils.h	2012-09-04 22:20:07.086923927 +0300
++++ firefox-11.0/dom/plugins/ipc/PluginMessageUtils.h	2012-09-04 22:23:45.195922486 +0300
+@@ -131,7 +131,7 @@
+ typedef HWND NativeWindowHandle;
+ #elif defined(MOZ_X11)
+ typedef XID NativeWindowHandle;
+-#elif defined(XP_MACOSX) || defined(ANDROID) || defined(MOZ_WIDGET_QT)
++#elif defined(XP_MACOSX) || defined(ANDROID) || defined(MOZ_WIDGET_QT) || defined(MOZ_DFB)
+ typedef intptr_t NativeWindowHandle; // never actually used, will always be 0
+ #else
+ #error Need NativeWindowHandle for this platform
diff --git a/package/firefox/firefox-11.0-execinfo.patch b/package/firefox/firefox-11.0-execinfo.patch
new file mode 100644
index 0000000..cacd7a1
--- /dev/null
+++ b/package/firefox/firefox-11.0-execinfo.patch
@@ -0,0 +1,45 @@
+diff -Naur firefox-11.0.org/ipc/chromium/src/base/debug_util_posix.cc firefox-11.0/ipc/chromium/src/base/debug_util_posix.cc
+--- firefox-11.0.org/ipc/chromium/src/base/debug_util_posix.cc	2012-08-06 15:09:43.325994371 +0300
++++ firefox-11.0/ipc/chromium/src/base/debug_util_posix.cc	2012-08-06 23:30:33.750226316 +0300
+@@ -5,7 +5,7 @@
+ #include "build/build_config.h"
+ #include "base/debug_util.h"
+ 
+-#define MOZ_HAVE_EXECINFO_H (!defined(ANDROID) && !defined(__OpenBSD__))
++#define MOZ_HAVE_EXECINFO_H (!defined(ANDROID) && !defined(__OpenBSD__) && !defined(__UCLIBC__) )
+ 
+ #include <errno.h>
+ #include <fcntl.h>
+diff -Naur firefox-11.0.org/tools/profiler/sps/platform-linux.cc firefox-11.0/tools/profiler/sps/platform-linux.cc
+--- firefox-11.0.org/tools/profiler/sps/platform-linux.cc	2012-08-06 15:09:24.330995513 +0300
++++ firefox-11.0/tools/profiler/sps/platform-linux.cc	2012-08-06 23:30:33.751226314 +0300
+@@ -28,7 +28,7 @@
+ #include <sys/stat.h>   // open
+ #include <fcntl.h>      // open
+ #include <unistd.h>     // sysconf
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <execinfo.h>   // backtrace, backtrace_symbols
+ #endif  // def __GLIBC__
+ #include <strings.h>    // index
+@@ -114,7 +114,7 @@
+ static Sampler* sActiveSampler = NULL;
+ 
+ 
+-#if !defined(__GLIBC__) && (defined(__arm__) || defined(__thumb__))
++#if !defined(__GLIBC__) && (defined(__arm__) || defined(__thumb__)) && !defined(__UCLIBC__)
+ // Android runs a fairly new Linux kernel, so signal info is there,
+ // but the C library doesn't have the structs defined.
+ 
+diff -Naur firefox-11.0.org/xpcom/threads/nsThread.cpp firefox-11.0/xpcom/threads/nsThread.cpp
+--- firefox-11.0.org/xpcom/threads/nsThread.cpp	2012-08-06 15:09:49.129994022 +0300
++++ firefox-11.0/xpcom/threads/nsThread.cpp	2012-08-06 23:30:49.474225373 +0300
+@@ -53,7 +53,7 @@
+                       _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED) &&           \
+                       !(_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)
+ 
+-#if defined(XP_UNIX) && !defined(ANDROID) && !defined(DEBUG) && HAVE_UALARM \
++#if defined(XP_UNIX) && !defined(ANDROID) && !defined(__UCLIBC__) && !defined(DEBUG) && HAVE_UALARM \
+   && defined(_GNU_SOURCE)
+ # define MOZ_CANARY
+ # include <unistd.h>
diff --git a/package/firefox/firefox-11.0-isfinite.patch b/package/firefox/firefox-11.0-isfinite.patch
new file mode 100644
index 0000000..87c024d
--- /dev/null
+++ b/package/firefox/firefox-11.0-isfinite.patch
@@ -0,0 +1,22 @@
+diff -Naur firefox-11.0.org/xpcom/ds/nsMathUtils.h firefox-11.0/xpcom/ds/nsMathUtils.h
+--- firefox-11.0.org/xpcom/ds/nsMathUtils.h	2012-08-06 15:09:49.059994026 +0300
++++ firefox-11.0/xpcom/ds/nsMathUtils.h	2012-08-06 23:32:57.771217662 +0300
+@@ -42,6 +42,9 @@
+ 
+ #include "nscore.h"
+ #include <math.h>
++#ifdef	__UCLIBC__
++#include <cmath>
++#endif
+ #include <float.h>
+ 
+ #ifdef SOLARIS
+@@ -134,6 +137,8 @@
+     // Darwin has deprecated |finite| and recommends |isfinite|. The former is
+     // not present in the iOS SDK.
+     return isfinite(d);
++#elif __UCLIBC__
++    return std::isfinite(d);
+ #else
+     return finite(d);
+ #endif
diff --git a/package/firefox/firefox-11.0-uclibc.patch b/package/firefox/firefox-11.0-uclibc.patch
new file mode 100644
index 0000000..3d1b1a0
--- /dev/null
+++ b/package/firefox/firefox-11.0-uclibc.patch
@@ -0,0 +1,112 @@
+diff -Naur firefox-11.0.org/ipc/chromium/src/base/file_util.h firefox-11.0/ipc/chromium/src/base/file_util.h
+--- firefox-11.0.org/ipc/chromium/src/base/file_util.h	2012-08-06 15:09:43.333994370 +0300
++++ firefox-11.0/ipc/chromium/src/base/file_util.h	2012-08-06 23:42:29.523183319 +0300
+@@ -16,7 +16,9 @@
+ #include <sys/stat.h>
+ #elif defined(OS_POSIX) 
+ #include <sys/types.h>
++#ifndef __UCLIBC__
+ #include <fts.h>
++#endif
+ #include <sys/stat.h>
+ #endif
+ 
+@@ -466,7 +468,7 @@
+ #if defined(OS_WIN)
+   WIN32_FIND_DATA find_data_;
+   HANDLE find_handle_;
+-#elif defined(ANDROID)
++#elif defined(ANDROID) || defined(__UCLIBC__)
+   void *fts_;
+ #elif defined(OS_POSIX)
+   FTS* fts_;
+diff -Naur firefox-11.0.org/ipc/chromium/src/base/file_util_posix.cc firefox-11.0/ipc/chromium/src/base/file_util_posix.cc
+--- firefox-11.0.org/ipc/chromium/src/base/file_util_posix.cc	2012-08-06 15:09:43.296994374 +0300
++++ firefox-11.0/ipc/chromium/src/base/file_util_posix.cc	2012-08-06 23:42:29.525183319 +0300
+@@ -8,7 +8,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <fnmatch.h>
+-#ifndef ANDROID
++#if !defined(ANDROID) && !defined(__UCLIBC__)
+ #include <fts.h>
+ #endif
+ #include <libgen.h>
+@@ -123,7 +123,7 @@
+   if (!recursive)
+     return (rmdir(path_str) == 0);
+ 
+-#ifdef ANDROID
++#if defined(ANDROID) || defined(__UCLIBC__)
+   // XXX Need ftsless impl for bionic
+   return false;
+ #else
+@@ -196,7 +196,7 @@
+     return false;
+   }
+ 
+-#ifdef ANDROID
++#if defined(ANDROID) || defined(__UCLIBC__)
+   // XXX Need ftsless impl for bionic
+   return false;
+ #else
+@@ -419,7 +419,7 @@
+   std::string tmpdir_string = tmpdir.value();
+   // this should be OK since mkdtemp just replaces characters in place
+   char* buffer = const_cast<char*>(tmpdir_string.c_str());
+-#ifdef ANDROID
++#if defined(ANDROID) || defined(__UCLIBC__)
+   char* dtemp = NULL;
+ #else
+   char* dtemp = mkdtemp(buffer);
+@@ -549,7 +549,7 @@
+ }
+ 
+ FileEnumerator::~FileEnumerator() {
+-#ifndef ANDROID
++#if !defined(ANDROID) && !defined(__UCLIBC__)
+   if (fts_)
+     fts_close(fts_);
+ #endif
+@@ -561,7 +561,7 @@
+   if (!is_in_find_op_)
+     return;
+ 
+-#ifndef ANDROID
++#if !defined(ANDROID) && !defined(__UCLIBC__)
+   memcpy(&(info->stat), fts_ent_->fts_statp, sizeof(info->stat));
+   info->filename.assign(fts_ent_->fts_name);
+ #endif
+@@ -572,7 +572,7 @@
+ // large directories with many files this can be quite deep.
+ // TODO(erikkay) - get rid of this recursive pattern
+ FilePath FileEnumerator::Next() {
+-#ifdef ANDROID
++#if defined(ANDROID) || defined(__UCLIBC__)
+   return FilePath();
+ #else
+   if (!is_in_find_op_) {
+diff -Naur firefox-11.0.org/js/src/ctypes/CTypes.cpp firefox-11.0/js/src/ctypes/CTypes.cpp
+--- firefox-11.0.org/js/src/ctypes/CTypes.cpp	2012-08-06 15:09:42.909994396 +0300
++++ firefox-11.0/js/src/ctypes/CTypes.cpp	2012-08-06 23:45:09.691173699 +0300
+@@ -473,6 +473,8 @@
+ static inline bool FloatIsFinite(jsdouble f) {
+ #ifdef WIN32
+   return _finite(f) != 0;
++#elif __UCLIBC__
++  return isinf(f);
+ #else
+   return finite(f);
+ #endif
+diff -Naur firefox-11.0.org/memory/mozalloc/mozalloc.cpp firefox-11.0/memory/mozalloc/mozalloc.cpp
+--- firefox-11.0.org/memory/mozalloc/mozalloc.cpp	2012-08-06 15:09:42.968994393 +0300
++++ firefox-11.0/memory/mozalloc/mozalloc.cpp	2012-08-06 23:45:58.800170749 +0300
+@@ -259,7 +259,7 @@
+ 
+ #if defined(XP_MACOSX)
+     return malloc_size(ptr);
+-#elif defined(MOZ_MEMORY) || defined(XP_LINUX)
++#elif defined(MOZ_MEMORY) || defined(XP_LINUX) && !defined(__UCLIBC__)
+     // XXX: the |defined(XP_LINUX)| may be too lax;  some Linux installations
+     // might use a libc that doesn't have malloc_usable_size.  Let's fix this
+     // if/when it happens.
diff --git a/package/firefox/firefox-11.0-uintptr_t.patch b/package/firefox/firefox-11.0-uintptr_t.patch
new file mode 100644
index 0000000..559b4c7
--- /dev/null
+++ b/package/firefox/firefox-11.0-uintptr_t.patch
@@ -0,0 +1,12 @@
+diff -Naur firefox-11.0.org/gfx/qcms/qcmstypes.h firefox-11.0/gfx/qcms/qcmstypes.h
+--- firefox-11.0.org/gfx/qcms/qcmstypes.h	2012-08-06 15:09:44.189994318 +0300
++++ firefox-11.0/gfx/qcms/qcmstypes.h	2012-08-06 23:35:38.339208022 +0300
+@@ -27,7 +27,7 @@
+ #ifdef __OS2__
+ /* OS/2's stdlib typdefs uintptr_t. So we'll just include that so we don't collide */
+ #include <stdlib.h>
+-#elif !defined(__intptr_t_defined) && !defined(_UINTPTR_T_DEFINED)
++#elif !defined(__intptr_t_defined) && !defined(_UINTPTR_T_DEFINED) && !defined(__UCLIBC__)
+ typedef PRUptrdiff uintptr_t;
+ #endif
+ #endif
diff --git a/package/firefox/firefox.mk b/package/firefox/firefox.mk
new file mode 100644
index 0000000..f501636
--- /dev/null
+++ b/package/firefox/firefox.mk
@@ -0,0 +1,240 @@
+#############################################################
+#
+# Mozilla Firefox
+#
+# Version:     11.0
+# Authors:     Stefan Froberg
+#
+# Builds a very minimal binary with all the optional features
+# stripped, except WebM. 
+#
+# With WebM enabled you can watch *some* (but not all!)
+# YouTube videos without Adobe Flash player
+# http://www.youtube.com/results?search_query=web&webm=1
+#
+# Because Adobe Flash player plug-in is a glibc binary it
+# will obviously not work with uClibc.
+# (but maybe with nspluginwrapper ... )
+# 
+# So the only real open source solution for playing flash videos
+# with Firefox under uClibc will be gnash + lightspark combo.
+# Lightspark handling the newer flash formats while falling back
+# to gnash with older versions.
+#
+# Further, Adobe has recently stopped supporting Linux version of 
+# their plug-in but Google Chrome PPAPI might some day
+# find it's way to firefox and save the day.
+# http://www.phoronix.com/scan.php?page=news_item&px=MTEyNzc
+#
+# Used Linux From Scratch as a starting template for this file
+# http://www.linuxfromscratch.org/blfs/view/svb/xsoft/firefox.html
+# 
+# Note: Even tought the libnss and libnspr are marked as dependencies 
+# here I could not get them to work when building firefox.
+# Seems that the configure script needs some patching ...
+#
+# So for now, untill somebody fixes this, instead of trying to 
+# use the buildroot system version of these libs the 
+# internal ones provided by the firefox tarball are used.
+#
+#############################################################
+FIREFOX_VERSION = 11.0
+FIREFOX_SOURCE = firefox-$(FIREFOX_VERSION).source.tar.bz2
+FIREFOX_SITE = http://releases.mozilla.org/pub/mozilla.org/firefox/releases/$(FIREFOX_VERSION)/source/
+FIREFOX_DEPENDENCIES = host-python alsa-lib cairo freetype jpeg libffi libgtk2 libnss libnspr libpng sqlite zlib
+
+ifeq ($(BR2_PACKAGE_FIREFOX_ENABLE_DEBUG),y)
+FIREFOX_DEPENDENCIES += valgrind
+define FIREFOX_ENABLE_DEBUG
+	echo "ac_add_options --enable-debug" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --enable-debug-symbols" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --disable-strip" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --enable-valgrind" >> $(FIREFOX_DIR)/mozconfig
+endef
+else
+define FIREFOX_ENABLE_DEBUG
+	echo "ac_add_options --disable-debug" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --disable-debug-symbols" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --enable-strip" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --disable-valgrind" >> $(FIREFOX_DIR)/mozconfig
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_FIREFOX_ENABLE_WEBM),y)
+# Only x86 needs yasm
+ifeq ($(BR2_i386),y) || ($(BR2_x86_64),y)
+FIREFOX_DEPENDENCIES += host-yasm
+endif
+define FIREFOX_ENABLE_WEBM
+	echo "ac_add_options --enable-webm" >> $(FIREFOX_DIR)/mozconfig
+endef
+else
+define FIREFOX_ENABLE_WEBM
+	echo "ac_add_options --disable-webm" >> $(FIREFOX_DIR)/mozconfig
+endef
+endif
+
+#####################################################################
+# Some post-install, optional default profile custom settings 
+# (extensions, secure default settings, language packs, flash etc...)
+#####################################################################
+
+# General Info & description of some Firefox extensions. 
+# Too large to put directly here.
+include package/firefox/firefox_extensions.mk.in
+
+# My (IMHO) privacy enhanced about:config settings.
+# Before you enable this feature please
+# check prefs.js file
+#
+# Note: This will also install NoScript, Adblock Lite, Ghostery and
+# HttpsEverywhere extensions
+
+ifeq ($(BR2_PACKAGE_FIREFOX_ULTRA_PARANOID),y)
+define FIREFOX_ULTRA_PARANOID
+	cp -i package/firefox/prefs.js $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS),y)
+
+# Because this setting will also install the extensions mentioned in 
+# package/firefox/firefox_extensions.mk.in we will need two
+# additional tools: host-unzip and host-xmlstarlet
+
+FIREFOX_DEPENDENCIES += host-unzip host-xmlstarlet
+
+define FIREFOX_INSTALL_DEFAULT_EXTENSIONS
+	$(call FIREFOX_INSTALL_EXTENSION,$(EXTENSION_SOURCE))
+endef
+endif
+
+# Installing selected langpack (en-US locale does not need any)	
+ifneq ($(BR2_FIREFOX_LOCALE_EN_US),y)
+
+FIREFOX_LOCALE:=$(call qstrip,$(BR2_PACKAGE_FIREFOX_LOCALE))
+FIREFOX_LOCALE_SOURCE:=https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$(FIREFOX_VERSION)/linux-i686/xpi/$(FIREFOX_LOCALE).xpi
+
+define FIREFOX_INSTALL_LANGPACK
+	$(call DOWNLOAD,$(FIREFOX_LOCALE_SOURCE))
+	cp $(DL_DIR)/$(FIREFOX_LOCALE).xpi $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/langpack-$(FIREFOX_LOCALE)@firefox.mozilla.org.xpi
+	echo "user_pref(\"general.useragent.locale\",\"$(FIREFOX_LOCALE)\");" >> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile/prefs.js
+endef
+endif
+
+define FIREFOX_CUSTOM_DEFAULT_PROFILE
+	mkdir -p $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile
+	$(FIREFOX_ULTRA_PARANOID)
+	$(FIREFOX_INSTALL_DEFAULT_EXTENSIONS)
+	$(FIREFOX_INSTALL_LANGPACK)
+endef
+
+FIREFOX_POST_INSTALL_TARGET_HOOKS += FIREFOX_CUSTOM_DEFAULT_PROFILE
+
+# Even thought Firefox uses autoconf it's configure process
+# is not simple "configure && make && make install"
+# but a lot more messier than that.
+
+define FIREFOX_CONFIGURE_CMDS
+	# Copy the default mozconfig to source directory.
+	cp package/firefox/mozconfig $(@D)
+
+	# If you want to enable any extra build options like
+	# DBus support, libnotify support, etc., then this 
+	# will be the right place to do it.
+
+	echo "ac_add_options --build=$(GNU_HOST_NAME)" >> $(FIREFOX_DIR)/mozconfig
+	echo "ac_add_options --host=$(GNU_TARGET_NAME)" >> $(FIREFOX_DIR)/mozconfig
+
+	# Enable parallel building
+	echo "mk_add_options MOZ_MAKE_FLAGS=\"-j$(BR2_JLEVEL)\"" >> $(FIREFOX_DIR)/mozconfig
+
+	$(FIREFOX_ENABLE_WEBM)
+	$(FIREFOX_ENABLE_DEBUG)
+
+	# Create the needed build directory that was defined in mozconfig file
+	mkdir -p $(@D)/firefox-build-dir
+endef
+
+
+# Firefox needs SQLite to store it's configurations.
+# Further the SQLite must be build with SQLITE_SECURE_DELETE, SQLITE_THREADSAFE,
+# SQLITE_ENABLE_FTS3 and SLITE_ENABLE_UNLOCK_NOTIFY enabled.
+#
+# However, even if you *do* have these things enabled the damn configure
+# script says that they are not. So I had to force the correct settings.
+#
+# Even worse, it seems that the script does not respect even
+# pkg-config variables (see below) to find the buildroot version of SQLite
+# but insist of using *host* SQLite library.
+#
+# Luckily, in the actual linking time, the correct libraries seem to be used.
+
+define FIREFOX_BUILD_CMDS
+
+	# Picked the PKG_ variable suggestions from:
+	# http://www.flameeyess.eu/autotools-mythbuster/pkgconfig/cross-compiling
+	#
+	# With these settings, *most* of the buildroot system libs were found.
+	# With the exception of SQLite, NSS and NSPR.
+
+	# Had to enforce HOST_CC, CC_FOR_BUILD and HOST_CXX because
+	# the configure would not get them right.
+
+	(cd $(@D); \
+		sed -i 's# ""##' browser/base/Makefile.in && \
+		ac_cv_sqlite_secure_delete=yes \
+		ac_cv_sqlite_threadsafe=yes \
+		ac_cv_sqlite_enable_fts3=yes \
+		ac_cv_sqlite_enable_unlock_notify=yes \
+		HOST_CC=gcc \
+		CC_FOR_BUILD=gcc \
+		HOST_CXX=g++ \
+		PKG_CONFIG_DIR= \
+		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"\
+		$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) CXXFLAGS="$(TARGET_CXXFLAGS) -fvisibility=hidden -fvisibility-inlines-hidden" LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -f client.mk )
+
+endef
+
+define FIREFOX_INSTALL_TARGET_CMDS
+	# This will create a firefox installation tarball
+	(cd $(@D); \
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C firefox-build-dir/browser/installer )
+
+	# Make nice new clean home for our firefox and extract it there
+	rm -rf $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) && \
+	mkdir $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) && \
+	tar -xvf $(@D)/firefox-build-dir/dist/firefox-$(FIREFOX_VERSION).en-US.linux-*.tar.bz2 -C $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) --strip-components=1
+	
+	# Make some symlinks to firefox binary and plugins directory
+	(cd $(TARGET_DIR)/usr/bin && \
+	ln -sfv ../lib/firefox-$(FIREFOX_VERSION)/firefox . && \
+	mkdir -pv $(TARGET_DIR)/usr/lib/mozilla/plugins && \
+	cd $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) && \
+	ln -sfv ../mozilla/plugins . && \
+	chown -R -v root:root $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) )
+
+	# Using strace revealed that for some strange reason the firefox is looking these 
+	# from /usr/lib and not from /usr/lib/$(FIREFOX_VERSION) like the rest of the files.
+	# That's why I had to use symlinks to make it start.
+
+	(cd $(TARGET_DIR)/usr/lib && \
+	ln -sfv firefox-$(FIREFOX_VERSION)/libxul.so . && \
+	ln -sfv firefox-$(FIREFOX_VERSION)/libmozjs.so . && \
+	ln -sfv firefox-$(FIREFOX_VERSION)/libmozalloc.so . )
+
+	# For gnash support
+	rm -rf $(STAGING_DIR)/usr/include/npapi
+	mkdir -v $(STAGING_DIR)/usr/include/npapi	
+	cp -v $(FIREFOX_DIR)/dom/plugins/base/*.h $(STAGING_DIR)/usr/include/npapi
+
+endef
+
+$(eval $(generic-package))
+
+
+
+
+
diff --git a/package/firefox/firefox_extensions.mk.in b/package/firefox/firefox_extensions.mk.in
new file mode 100644
index 0000000..8c8fa3d
--- /dev/null
+++ b/package/firefox/firefox_extensions.mk.in
@@ -0,0 +1,168 @@
+#############################################################
+# Extensions
+#
+# General Info:
+#
+# Firefox extensions are nothing more than ordinary zip-files with .xpi file extension.
+#
+# If you want to add your own default extension(s) to your default firefox profile
+# then you basically have to:
+# - download the extension file
+# - get the extension id from that file with the help of xmlstarlet tool
+# - unzip the extension file to /usr/lib/firefox-$(FIREFOX_VERSION/extensions/$(EXTENSION_ID)
+#
+# For more information of global extension installation look at:
+# http://kb.mozillazine.org/Installing_extensions#Global_installation
+#
+# For information of how to get the extension id (needs unzip and xmlstarlet) look at:
+# http://kb.mozillazine.org/Determine_extension_ID
+#
+# Note that this process will only *install* your extensions to your default firefox profile.
+# It will not *enable* them by default.
+# You have to do it manually afterwards from Firefox Add-ons menu.
+#
+# There is an "extensions.enabledAddons" setting in about:config
+# but it's no use if you try to set it in pref.js file.
+# It seems it's a read-only setting and it will be updated each
+# time after you have manually enabled your installed extensions/language packs
+# from Add-ons menu.
+#
+# The messy way to enable your extensions by default with each build would be:
+#
+# - Start your firefox at least once and then enable all your extensions manually
+#
+# - Do all the necessary setting you need for your extensions/langpacks
+# (like Adblock Lite subscriptions, default language etc..)
+#
+# - Go to your $HOME/.mozilla/firefox/some_random_chars.default/ folder and copy 
+# at least the files starting with extensions.* (and maybe also addons.*)
+# to package/firefox/extensions buildroot folder.
+# To make sure, it's generally better to copy *all* files & directories from
+# $HOME/.mozilla/firefox/some_random_chars.default/ folder to 
+# packge/firefox/extensions
+#
+# - Add buildroot option that will copy all those saved custom settings from 
+# package/firefox/extensions folder in FIREFOX_POST_INSTALL_TARGET_HOOKS phase
+# (or alternativaly, at the end of the FIREFOX_INSTALL_TARGET_CMDS)
+# to $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions
+#
+# This seems to be the only way to *enable* extensions by default because 
+# firefox keep's track of extensions in SQLite database (like extensions.sqlite file) 
+# and not in easily editable/patchable text files :-(
+#
+# Next comes four privacy/security related extensions.
+# 
+
+# Name:		NoScript
+# Version:	2.5.3
+# Home:		http://noscript.net
+# Download URL:	http://releases.mozilla.org/pub/mozilla.org/addons/722/noscript-2.5.3-fx+fn+sm.xpi
+# Description:	"NoScript for Firefox pre-emptively blocks malicious scripts
+# 		and allows JavaScript, Java, Flash and other potentially dangerous
+# 		content only from sites you trust.
+# 		NoScript also provides the most anti-XSS and anti-Clickjacking
+#		protection ever available in a browser."
+
+ifeq ($(BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT),y)
+EXTENSION_SOURCE+=http://releases.mozilla.org/pub/mozilla.org/addons/722/noscript-2.5.3-fx+fn+sm.xpi
+endif
+
+# Name:		Adblock Lite
+# Version:	1.4.3
+# Home:		https://bitbucket.org/adstomper/adblocklite
+# Download URL:	https://bitbucket.org/adstomper/adblocklite/downloads/adblocklite-1.4.3.xpi	
+# Description:	"Adblocklite is a fork of the Adblock Plus version 1.3.10 (classic UI)
+#		extension for blocking advertisements on the web.
+#		This fork will provide the same features as Adblock Plus 2.x and higher
+#		while keeping the old UI but without acceptable ads feature."
+#
+#		Indeed, I can confirm that Adblock Plus is still (as of version 2.1.2)
+#		using this "acceptable ads" feature and enabling some adds by default.
+#
+#		If you want to check it by yourself then do the following:
+#
+#		- wget http://releases.mozilla.org/pub/mozilla.org/addons/1865/adblock_plus-2.1.2-sm+an+fx+tb.xpi
+#
+#		- unzip -d adblockplus adblock_plus-2.1.2-sm+an+fx+tb.xpi
+#
+#		- cd adblockplus/defaults
+#
+#		- open the prefs.js file and look if you can find line entry named:
+#
+#		pref("extensions.adblockplus.subscriptions_exceptionsurl","https://easylist-downloads.adblockplus.org/exceptionrules.txt")
+#
+#		- if you open that https://easylist-downloads.adblockplus.org/exceptionrules.txt
+#		  in your browser you will see that Adblock Plus is whitelisting 
+#		  (all those lines starting with @@)
+#		  ads from google and amazon.
+#
+#		So the end of the story is: Use Adblock Lite instead :-)
+#
+#		Note: 
+#		You need some ad blacklist subscriptions for the Adblock Lite to be effective.
+#		You can get them by either selecting the subscriptions you want from
+#		Adblock Lite options menu or by visiting https://easylist.adblockplus.org
+#
+#		I might later add an option to download and install my own, 
+#		default ad blacklist subscription text file that contains *all* those
+#		subscriptions mentioned in https://easylist.adblockplus.org but
+#		without any whitelisted ad sites.
+
+ifeq ($(BR2_PACKAGE_FIREFOX_EXTENSION_ADBLOCK_LITE),y)
+EXTENSION_SOURCE+=http://bitbucket.org/adstomper/adblocklite/downloads/adblocklite-1.4.3.xpi
+endif
+
+# Name:		Ghostery
+# Version:	2.8.0.2
+# Home:		http://www.ghostery.com
+# Download URL:	http://releases.mozilla.org/pub/mozilla.org/addons/9609/ghostery-2.8.0.2-sm+fx.xpi
+# Description:	"Protect your privacy. See who's tracking your web browsing and 
+#		block them with Ghostery"
+
+ifeq ($(BR2_PACKAGE_FIREFOX_EXTENSION_GHOSTERY),y)
+EXTENSION_SOURCE+=http://releases.mozilla.org/pub/mozilla.org/addons/9609/ghostery-2.8.0.2-sm+fx.xpi
+endif
+
+# Name:		HTTPS Everywhere
+# Version:	2.2
+# Home:		https://www.eff.org/https-everywhere
+# Download URL:	https://www.eff.org/files/https-everywhere-latest.xpi
+# Description:	"HTTPS Everywhere is a Firefox and Chrome extension
+#		that encrypts your communications with many major
+#		websites, making your browsing more secure."
+
+ifeq ($(BR2_PACKAGE_FIREFOX_EXTENSION_HTTPS_EVERYWHERE),y)
+EXTENSION_SOURCE+=http://www.eff.org/files/https-everywhere-latest.xpi
+endif
+
+
+ifeq ($(BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS),y)
+
+UNZIP=$(HOST_DIR)/usr/bin/unzip
+XMLSTARLET=$(HOST_DIR)/usr/bin/xml
+
+define	FIREFOX_INSTALL_EXTENSION
+	
+# Do multi-download, get extension id for each downloaded file
+# and finally unzip it to 
+# $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/${EXTENSION_ID}
+#
+# Inner guts copied from package/pkg-download.mk DOWNLOAD_WGET
+# Thanks to Yann and Thomas for helping with that $${i##*/} thing!
+
+	for i in $(EXTENSION_SOURCE);do \
+		FILENAME=$${i##*/} ;\
+		test -e $(DL_DIR)/$${FILENAME} || \
+		$(WGET) -O $(DL_DIR)/$${FILENAME} $${i} || \
+		(rm -f $(DL_DIR)/$${FILENAME} ; exit 1) ;\
+		EXTENSION_ID=`$(UNZIP) -qc $(DL_DIR)/$${FILENAME} install.rdf | $(XMLSTARLET) sel \
+		-N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# \
+		-N em=http://www.mozilla.org/2004/em-rdf# \
+		-t -v \
+		"//rdf:Description[@about='urn:mozilla:install-manifest']/em:id"` ;\
+		$(UNZIP) -d $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/$${EXTENSION_ID} $(DL_DIR)/$${FILENAME};\
+	done	
+
+endef
+endif
+	
diff --git a/package/firefox/mozconfig b/package/firefox/mozconfig
new file mode 100644
index 0000000..83450aa
--- /dev/null
+++ b/package/firefox/mozconfig
@@ -0,0 +1,35 @@
+ac_add_options --disable-crashreporter
+ac_add_options --disable-dbus
+ac_add_options --disable-elf-hack
+ac_add_options --disable-glibtest
+ac_add_options --disable-installer
+ac_add_options --disable-jemalloc
+ac_add_options --disable-libnotify
+ac_add_options --disable-necko-wifi
+ac_add_options --disable-static
+ac_add_options --disable-tests
+ac_add_options --disable-trace-malloc
+ac_add_options --disable-tree-freetype
+ac_add_options --disable-updater
+ac_add_options --disable-warnings-as-errors
+ac_add_options --enable-application=browser
+ac_add_options --enable-default-toolkit=cairo-gtk2
+#ac_add_options --enable-official-branding
+ac_add_options --with-branding=browser/branding/unofficial
+ac_add_options --enable-shared
+ac_add_options --enable-shared-js
+ac_add_options --enable-system-cairo
+ac_add_options --enable-system-ffi
+ac_add_options --enable-system-sqlite
+ac_add_options --prefix=/usr
+ac_add_options --without-libIDL
+ac_add_options --with-pthreads
+ac_add_options --with-system-jpeg
+#ac_add_options --with-system-nspr
+#ac_add_options --with-system-nss
+#ac_add_options --with-system-png
+ac_add_options --with-system-zlib
+mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/firefox-build-dir
+CROSS_COMPILE=1
+CC_FOR_BUILD=gcc
+HOST_CC=gcc
diff --git a/package/firefox/prefs.js b/package/firefox/prefs.js
new file mode 100755
index 0000000..7cbf675
--- /dev/null
+++ b/package/firefox/prefs.js
@@ -0,0 +1,100 @@
+# Mozilla User Preferences
+
+# Most of the settings below are documented in 
+# http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries
+#
+# Those entries that are not documented (tagged UNDOCUMENTED) are 
+# the ones I found out when playing with various
+# Firefox Privacy settings and then checking afterwards 
+# from the about:config URL what had changed.
+
+# If you have more information about these entries please update.
+
+########################
+# Performance settings #
+########################
+
+# Enable pipelining
+user_pref("network.http.pipelining",true);
+user_pref("network.http.pipelining.agressive",true);
+user_pref("network.http.pipelining.ssl",true);
+user_pref("network.http.proxy.pipelining",true);
+
+###############################
+# Privacy & Security settings #
+###############################
+
+# When to remove downloaded files entries from the Download Manager
+#	0: Upon successful download
+#	1: When the browser exits
+#	2 (default): Manually
+user_pref("browser.download.manager.retention",1);
+
+# Don't save information entered in web page forms and the Search Bar
+user_pref("browser.formfill.enable",false);
+
+# Automatically Start in Private Browsing Mode
+user_pref("browser.privatebrowsing.autostart",true);
+
+# Windows may not be moved or resized via JavaScript
+user_pref("dom.disable_window_move_resize",true);
+
+# Webpages will not be able to affect the context menu event,
+# thus allowing to access the context menu all the time
+user_pref("dom.event.contextmenu.enabled",false);
+
+# Is location aware browsing enabled? Default setting *was* 'true' (Jesus Christ!)
+user_pref("geo.enabled",false);
+
+# Allow cookies from originating server only
+user_pref("network.cookie.cookieBehavior",1);
+
+# Accept cookies for session only
+user_pref("network.cookie.lifetimePolicy",2);
+
+# Consult current preferences for cookie prefs
+user_pref("network.cookie.prefsMigrated",true);
+
+# Perform all DNS lookups on remote proxy server 
+# NOTE: It has *still* (8th of June 2012) not been fixed!
+# ( see Bug 134105 https://bugzilla.mozilla.org/show_bug.cgi?id=134105 )
+user_pref("network.proxy.socks_remote_dns",true);
+
+# Only important if you are using Tor. Might be fixed by now
+# ( see https://trac.torproject.org/projects/tor/ticket/5741 )
+user_pref("network.websocket.enabled",false);
+
+# UNDOCUMENTED 
+# Not documented by Mozilla but my best guess is that this disables browser history :-)
+user_pref("places.history.enabled",false);
+
+# UNDOCUMENTED
+# Not documented by Mozilla (what the heck are offline apps???)
+user_pref("privacy.clearOnShutdown.offlineApps",true);
+
+# UNDOCUMENTED
+# Not documented by Mozilla (but should be obvious :-) )
+user_pref("privacy.clearOnShutdown.passwords",true);
+
+# UNDOCUMENTED
+# Not documented by Mozilla (???)
+user_pref("privacy.clearOnShutdown.siteSettings",true);
+
+# UNDOCUMENTED
+# Not documented by Mozilla but this is clearly the 
+# Do-not-track feature from Firefox privacy settings
+user_pref("privacy.donottrackheader.enabled",true);
+
+# Delete all cookies when using the Firefox Clear Private Data feature
+user_pref("privacy.item.cookies",true);
+
+# Perform the Firefox Clear Private Data operation when closing the browser
+user_pref("privacy.sanitize.sanitizeOnShutdown",true);
+
+
+
+
+
+
+
+
-- 
1.7.7.6
