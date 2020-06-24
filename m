From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:21:28 +0200
Subject: [Buildroot] [git commit] package/xenomai: add support to download
 from a custom git tree
Message-ID: <20200624212441.47FB682318@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0fd8c51d877d2d1a093e7b0daa2290c26bc7cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
