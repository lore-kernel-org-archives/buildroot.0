From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:08:09 +0100
Subject: [Buildroot] [PATCH v6 33/33] package/libemotion-generic-players:
	new package
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-34-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v6: Add missing vlc dependencies and host-pkgconf (Yann E.Morin)
v5: Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
    update comment on dependencies
v4: update Config.in to use libefl
v3: remove trailing slash (Vicente Bergas)
---
 package/Config.in                                     |  1 +
 package/libemotion-generic-players/Config.in          | 19 +++++++++++++++++++
 .../libemotion-generic-players.hash                   |  2 ++
 .../libemotion-generic-players.mk                     | 17 +++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk

diff --git a/package/Config.in b/package/Config.in
index b3f5a9a..6a89cfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -819,6 +819,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libemotion-generic-players/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
diff --git a/package/libemotion-generic-players/Config.in b/package/libemotion-generic-players/Config.in
new file mode 100644
index 0000000..f6dd45d
--- /dev/null
+++ b/package/libemotion-generic-players/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBEMOTION_GENERIC_PLAYERS
+	bool "libemotion generic players"
+	depends on BR2_PACKAGE_EFL
+	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # vlc
+	depends on BR2_INSTALL_LIBSTDCPP # vlc
+	depends on BR2_USE_WCHAR # vlc
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vlc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # vlc
+	select BR2_PACKAGE_VLC # needs libvlc
+	help
+	  A media object library for Evas and Ecore.
+
+	  https://www.enlightenment.org
+	  https://docs.enlightenment.org/stable/efl/emotion_main.html
+
+comment "libemotion generic players needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
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
index 0000000..ef41b2e
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
+LIBEMOTION_GENERIC_PLAYERS_LICENSE = BSD-2c
+LIBEMOTION_GENERIC_PLAYERS_LICENSE_FILES = COPYING
+
+LIBEMOTION_GENERIC_PLAYERS_INSTALL_STAGING = YES
+
+LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = host-pkgconf libefl vlc
+
+$(eval $(autotools-package))
-- 
2.4.3
