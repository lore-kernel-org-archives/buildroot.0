From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:23 +0100
Subject: [Buildroot] [PATCH 5/5 v4] package/xenomai: add support to download
 from a custom svn tree
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <65857f8b385110e6dfc59ae8011df19181006c1b.1579035147.git.yann.morin.1998@free.fr>
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
 package/xenomai/Config.in  | 6 +++++-
 package/xenomai/xenomai.mk | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 114aec3968..44973aab50 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -64,13 +64,17 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 config BR2_PACKAGE_XENOMAI_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_SVN
+	bool "Custom Subversion repository"
+
 endchoice
 
 config BR2_PACKAGE_XENOMAI_REPOSITORY
 	string "URL of custom repository"
 	default "https://gitlab.denx.de/Xenomai/xenomai.git" if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT \
-		|| BR2_PACKAGE_XENOMAI_CUSTOM_HG
+		|| BR2_PACKAGE_XENOMAI_CUSTOM_HG \
+		|| BR2_PACKAGE_XENOMAI_CUSTOM_SVN
 
 config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index e2a89cfeb9..f7211bf856 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -15,6 +15,9 @@ XENOMAI_SITE_METHOD = git
 else ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_HG),y)
 XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
 XENOMAI_SITE_METHOD = hg
+else ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_SVN),y)
+XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
+XENOMAI_SITE_METHOD = svn
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
-- 
2.20.1
