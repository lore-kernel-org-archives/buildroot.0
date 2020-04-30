From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:38:25 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libid3tag: switch
 to debian to fix CVEs
Message-ID: <20200430124925.61DDA8B8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87a2a759b7b00dc499eaf6b450911ffaf39419b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Upstream libid3tag is dead since 2004 so switch to debian to get two
patches that fix the following CVEs:
 - CVE-2004-2779: id3_utf16_deserialize() in utf16.c in libid3tag
   through 0.15.1b misparses ID3v2 tags encoded in UTF-16 with an odd
   number of bytes, triggering an endless loop allocating memory until
   an OOM condition is reached, leading to denial-of-service (DoS).
 - CVE-2017-11550: The id3_ucs4_length function in ucs4.c in libid3tag
   0.15.1b allows remote attackers to cause a denial of service (NULL
   Pointer Dereference and application crash) via a crafted mp3 file.
 - CVE-2017-11551: The id3_field_parse function in field.c in libid3tag
   0.15.1b allows remote attackers to cause a denial of service (OOM)
   via a crafted MP3 file.

Moreover, drop patch (replaced by add-m4-directory.patch debian patch)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 210ccaef5784011bc035d0ae13611cb4e76f389f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libid3tag/0001-configure-automake-foreign.patch | 16 ----------------
 package/libid3tag/libid3tag.hash                        |  7 +++++--
 package/libid3tag/libid3tag.mk                          | 11 ++++++++++-
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/package/libid3tag/0001-configure-automake-foreign.patch b/package/libid3tag/0001-configure-automake-foreign.patch
deleted file mode 100644
index 8521d559f2..0000000000
--- a/package/libid3tag/0001-configure-automake-foreign.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-configure: don't require GNU-specific files when running automake
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN libid3tag-0.15.1b.orig/configure.ac libid3tag-0.15.1b/configure.ac
---- libid3tag-0.15.1b.orig/configure.ac	2004-01-24 00:22:46.000000000 +0100
-+++ libid3tag-0.15.1b/configure.ac	2018-11-25 15:31:04.184342212 +0100
-@@ -26,7 +26,7 @@
- 
- AC_CONFIG_SRCDIR([id3tag.h])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- 
- AM_CONFIG_HEADER([config.h])
- 
diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
index 82ad59d9ac..9aa1d00270 100644
--- a/package/libid3tag/libid3tag.hash
+++ b/package/libid3tag/libid3tag.hash
@@ -1,4 +1,7 @@
-# Locally computed:
-sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag-0.15.1b.tar.gz
+# From http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libi/libid3tag/libid3tag_0.15.1b-14.dsc
+sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag_0.15.1b.orig.tar.gz
+sha256  f174cafe02bef25a9ad8cb7f9ce80119147297a7036f50878e85ac0d7ae09c62  libid3tag_0.15.1b-14.debian.tar.xz
+
+# Hash for license files:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  7f12ad28dc075763e91b91bfa60fad04062380011ddad8f6bac21dd7b1f44367  COPYRIGHT
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 3ec145725f..14a7f3f938 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -5,12 +5,21 @@
 ################################################################################
 
 LIBID3TAG_VERSION = 0.15.1b
-LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
+LIBID3TAG_PATCH = libid3tag_$(LIBID3TAG_VERSION)-14.debian.tar.xz
+LIBID3TAG_SOURCE = libid3tag_$(LIBID3TAG_VERSION).orig.tar.gz
+LIBID3TAG_SITE = \
+	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libi/libid3tag
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
 
+# debian/patches/10_utf16.dpatch
+LIBID3TAG_IGNORE_CVES += CVE-2004-2779 CVE-2017-11551
+
+# debian/patches/11_unknown_encoding.dpatch
+LIBID3TAG_IGNORE_CVES += CVE-2017-11550
+
 # Force autoreconf to be able to use a more recent libtool script, that
 # is able to properly behave in the face of a missing C++ compiler.
 LIBID3TAG_AUTORECONF = YES
