From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:42 +0200
Subject: [Buildroot] [PATCH v3 37/37] package/libemotion-generic-players:
	new package
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-38-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: remove trailing slash (Vicente Bergas)
---
 package/Config.in                                    |  1 +
 package/libemotion-generic-players/Config.in         | 20 ++++++++++++++++++++
 .../libemotion-generic-players.hash                  |  2 ++
 .../libemotion-generic-players.mk                    | 17 +++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk

diff --git a/package/Config.in b/package/Config.in
index 62054c8..192dbc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ endif
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/libelementary/Config.in"
+	source "package/libemotion-generic-players/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/libemotion-generic-players/Config.in b/package/libemotion-generic-players/Config.in
new file mode 100644
index 0000000..8253cfb
--- /dev/null
+++ b/package/libemotion-generic-players/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBEMOTION_GENERIC_PLAYERS
+	bool "libemotion generic players"
+	select BR2_PACKAGE_EFL
+	select BR2_PACKAGE_VLC # needs libvlc
+	depends on BR2_INSTALL_LIBSTDCPP # efl vlc
+	depends on BR2_PACKAGE_HAS_UDEV # efl -> libudev
+	depends on BR2_TOOLCHAIN_USES_GLIBC # vlc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # vlc
+	depends on BR2_USE_MMU # efl
+	depends on !BR2_STATIC_LIBS # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  A media object library for Evas and Ecore.
+
+	  https://www.enlightenment.org
+	  https://docs.enlightenment.org/stable/efl/emotion_main.html
+
+comment "libemotion generic players needs udev /dev management and a (e)glibc toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
diff --git a/package/libemotion-generic-players/libemotion-generic-players.hash b/package/libemotion-generic-players/libemotion-generic-players.hash
new file mode 100644
index 0000000..80c8123
--- /dev/null
+++ b/package/libemotion-generic-players/libemotion-generic-players.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/emotion_generic_players/emotion_generic_players-1.15.0.tar.xz.sha256
+sha256	9f6d5e9041ac7c014d663dac56d1b39ac42a45abe954d09d0edbf6e759e55f5f	emotion_generic_players-1.15.0.tar.xz
diff --git a/package/libemotion-generic-players/libemotion-generic-players.mk b/package/libemotion-generic-players/libemotion-generic-players.mk
new file mode 100644
index 0000000..7a0700c
--- /dev/null
+++ b/package/libemotion-generic-players/libemotion-generic-players.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libemotion-generic-players
+#
+################################################################################
+
+LIBEMOTION_GENERIC_PLAYERS_VERSION = 1.15.0
+LIBEMOTION_GENERIC_PLAYERS_SOURCE = emotion_generic_players-$(LIBEMOTION_GENERIC_PLAYERS_VERSION).tar.xz
+LIBEMOTION_GENERIC_PLAYERS_SITE = http://download.enlightenment.org/rel/libs/emotion_generic_players
+LIBEMOTION_GENERIC_PLAYERS_LICENSE = GPLv2
+LIBEMOTION_GENERIC_PLAYERS_LICENSE_FILES = COPYING
+
+LIBEMOTION_GENERIC_PLAYERS_INSTALL_STAGING = YES
+
+LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = efl vlc
+
+$(eval $(autotools-package))
-- 
2.4.3
