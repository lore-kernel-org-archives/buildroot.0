From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:22 +0100
Subject: [Buildroot] [PATCH 4/5 v4] package/xenomai: add support to download
 from a custom Hg tree
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <a8eae0fd60176d26f808328969682472d3f388de.1579035147.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 8 ++++++--
 package/xenomai/xenomai.mk | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 452b452039..114aec3968 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -61,12 +61,16 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 	bool "Custom Git repository"
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_HG
+	bool "Custom Mercurial repository"
+
 endchoice
 
 config BR2_PACKAGE_XENOMAI_REPOSITORY
 	string "URL of custom repository"
-	default "https://gitlab.denx.de/Xenomai/xenomai.git"
-	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	default "https://gitlab.denx.de/Xenomai/xenomai.git" if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT \
+		|| BR2_PACKAGE_XENOMAI_CUSTOM_HG
 
 config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 11c69000df..e2a89cfeb9 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -12,6 +12,9 @@ XENOMAI_SITE = $(patsubst %/,%,$(dir $(XENOMAI_TARBALL)))
 else ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_GIT),y)
 XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
 XENOMAI_SITE_METHOD = git
+else ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_HG),y)
+XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
+XENOMAI_SITE_METHOD = hg
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
-- 
2.20.1
