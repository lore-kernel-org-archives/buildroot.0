From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Jan 2017 15:42:52 +0100
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.3
Message-ID: <20170103144252.28827-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security related fixes:
This flaw is caused by loading data from external sources (file, custom ctx,
etc) and are hard to validate before calling libgd APIs:

- fix php bug 72339, Integer Overflow in _gd2GetHeader (CVE-2016-5766)
- bug #248, fix Out-Of-Bounds Read in read_image_tga
- gd: Buffer over-read issue when parsing crafted TGA file (CVE-2016-6132)

Using application provided parameters, in these cases invalid data causes
the issues:

 - Integer overflow error within _gdContributionsAlloc() (CVE-2016-6207)
 - fix php bug 72494, invalid color index not handled, can lead to crash ( CVE-2016-6128)
 - improve color check for CropThreshold

The build system now enables -Wall and -Werror by default, so pass
--disable-werror to disable that.  Notice that this issue has been fixed
upstream post-2.2.3:

https://github.com/libgd/libgd/issues/339

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.hash | 2 +-
 package/gd/gd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index d08220a..eb3da42 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	489f756ce07f0c034b1a794f4d34fdb4d829256112cb3c36feb40bb56b79218c	libgd-2.2.2.tar.xz
+sha256	746b6cbd6769a22ff3ba6f5756f3512a769bd4cdf4695dff17f4867f25fa7d3c	libgd-2.2.3.tar.xz
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 8de8d15..0777bdb 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-GD_VERSION = 2.2.2
+GD_VERSION = 2.2.3
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
 GD_CONFIG_SCRIPTS = gdlib-config
-GD_CONF_OPTS = --without-x --disable-rpath
+GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
 # gd forgets to link utilities with -pthread even though it uses
-- 
2.10.2
