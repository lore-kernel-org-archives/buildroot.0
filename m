From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:21 +0100
Subject: [Buildroot] [PATCH 3/5 v4] package/xenomai: add support to download
 from a custom git tree
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <a85eefc234cb2e64805b6e48d7f17a77a12f37cc.1579035147.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Kiszka <jan.kiszka@siemens.com>

Soem versions are tagged, but not tarballed, so we need to be able to
retrieve them from git.

Usually, we do not have a default value for the repository, but unlike
for the kernel or the various bootloaders, the most prominent repository
for Xeniomai is upstream's official one (for the reason above, amongst
others), so we use that as a default.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 8 ++++++++
 package/xenomai/xenomai.mk | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 326e1be737..452b452039 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -58,8 +58,16 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 	bool "Custom tarball"
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	bool "Custom Git repository"
+
 endchoice
 
+config BR2_PACKAGE_XENOMAI_REPOSITORY
+	string "URL of custom repository"
+	default "https://gitlab.denx.de/Xenomai/xenomai.git"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+
 config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index d169c2e315..11c69000df 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -9,6 +9,9 @@ ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL),y)
 XENOMAI_TARBALL = $(call qstrip,$(BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL))
 XENOMAI_SOURCE = $(notdir $(XENOMAI_TARBALL))
 XENOMAI_SITE = $(patsubst %/,%,$(dir $(XENOMAI_TARBALL)))
+else ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_GIT),y)
+XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
+XENOMAI_SITE_METHOD = git
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
-- 
2.20.1
