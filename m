From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:21:43 +0200
Subject: [Buildroot] [git commit] gnupg2: bump to version 2.2.0
Message-ID: <20170903121429.46BC27FB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e82fadab236aa75592b99f58476e057ad37249d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to https download for firewall compatibility and security.

As upstream now defaults to 'gpg' for the main binary name, keep the
'gpg2' name as in previous releases, to avoid conflict with the gnupg
package.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash | 9 +++++----
 package/gnupg2/gnupg2.mk   | 6 ++++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 36fa575..84152ee 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,4 +1,5 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000405.html
-sha1 1852c066bc21893bc52026ead78edf50fdf15e13  gnupg-2.1.21.tar.bz2
-# Calculated based on the hash above
-sha256 7aead8a8ba75b69866f583b6c747d91414d523bfdfbe9a8e0fe026b16ba427dd  gnupg-2.1.21.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
+sha1 36ee693d0b2ec529ecf53dd6d397cc38ba71c0a7  gnupg-2.2.0.tar.bz2
+# Calculated based on the hash above and signature
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.0.tar.bz2.sig
+sha256 d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6  gnupg-2.2.0.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 9145f23..0466ed6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.1.21
+GNUPG2_VERSION = 2.2.0
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
-GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
+GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
+# Keep the gpg2 binary name to avoid conflict with gnupg
 GNUPG2_CONF_OPTS = \
+	--enable-gpg-is-gpg2 \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
