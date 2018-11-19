From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 12:19:45 +0100
Subject: [Buildroot] [PATCH] rpm: really take DEPENDENCIES into account
Message-ID: <20181119111945.17683-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e7af4033c32560594ddbd457b68f6d3713662a26 ("rpm: use the new
gettext logic") introduced a really nasty bug: by adding
$(TARGET_NLS_DEPENDENCIES) to RPM_DEPENDENCIES, it completely
overwrote the existing value of RPM_DEPENDENCIES, entirely masking all
mandatory RPM dependencies.

rpm is fairly towards the end of the alphabet, and most other
mandatory dependencies (berkeleydb, host-pkgconf, file and popt)
appear earlier by alphabetic ordering. Only zlib was afterwards, but
since file depends on zlib, it was always built before. This probably
explains why our autobuilders haven't encountered a single build
failure.

However, a simple "make rpm" clearly exhibits the failure, and
obviously the upcoming per-package folder mechanism makes such bugs
even more obvious.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
I don't know who was this guy @free-electrons.com who did this silly
change, but something wasn't quite right with him :-)
---
 package/rpm/rpm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 159ae72aa8..87c2059e71 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -8,10 +8,10 @@ RPM_VERSION_MAJOR = 4.13
 RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
-RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
+RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib \
+	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-RPM_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # 0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
 # 0002-configure-ac-correct-stack-protector-check.patch
-- 
2.19.1
