From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Sep 2018 22:45:05 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
Message-ID: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Github repository at https://github.com/symless/synergy no longer
exists, it has apparently been moved to
https://github.com/symless/synergy-core.

On master as of 811734ef9044bbdfc067da76358153061fae2031, we use
v1.8.8, which fails to download from github.com, so we fallback to
sources.buildroot.net, which has the tarball.

However, on next as of 7da2748c9ef4e67a060ea7eb6ff23275da235daa, we
use v2.1.0, which completely fails to download, as we don't have a
backup tarball on sources.buildroot.net.

This commit fixes that by using the new upstream
location. Unfortunately, the hash changes, because the prefix in the
tarball is changed from synergy-1.8.8-stable/ to
synergy-core-1.8.8-stable/. There are no other changes. This means
that people having existing tarballs locally we'll see them being
re-downloaded because the hash has changed.

Fixes (once applied to next):

  http://autobuild.buildroot.net/results/82ae9a378b70a3d27e78e1d80a63495b37329e16/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/synergy/Config.in    | 2 +-
 package/synergy/synergy.hash | 2 +-
 package/synergy/synergy.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 3bb8b8e98c..2f99cdf6fc 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SYNERGY
 	  operating systems, each with its own display,
 	  without special hardware.
 
-	  https://github.com/symless/synergy/
+	  https://github.com/symless/synergy-core/
 
 comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index 52f9d74d6b..34d4b99050 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  85c388f93881d741981ce3c675e840a52a76883cb2cea1da306c0c453c5d7d9b  synergy-v1.8.8-stable.tar.gz
+sha256  9ee45aabf9f77925bfab6248e713ae5d9e6bfe6bc246e4a0a6304dc6a30f5f14  synergy-v1.8.8-stable.tar.gz
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 76a4004f06..932a2ee9dc 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYNERGY_VERSION = v1.8.8-stable
-SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
+SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
 SYNERGY_DEPENDENCIES = libcurl openssl xlib_libX11 xlib_libXtst
-- 
2.14.4
