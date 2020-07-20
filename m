From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:03:06 +0200
Subject: [Buildroot] [git commit] package/libvorbis: bump version to 1.3.7
Message-ID: <20200720160000.6CA8E821BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe383b5f216e0bf1a4ab9fa6df514b4d277d431e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which were applied upstream.

Reformatted hashes,

Updated license hash after copyright year update:
https://gitlab.xiph.org/xiph/vorbis/-/commit/eb40ca5fbd0c60d8bd1fd33be07f02defc21e5d7

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fix-bounds-check-on-very-low-sample-rates.patch | 31 ----------------------
 ...-Sanity-check-number-of-channels-in-setup.patch | 28 -------------------
 package/libvorbis/libvorbis.hash                   |  4 +--
 package/libvorbis/libvorbis.mk                     | 10 ++-----
 4 files changed, 4 insertions(+), 69 deletions(-)

diff --git a/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch b/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
deleted file mode 100644
index 94dc4c614b..0000000000
--- a/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Thomas Daede <daede003@umn.edu>
-Date: Wed, 9 May 2018 21:56:59 +0000 (-0700)
-Subject: CVE-2017-14160: fix bounds check on very low sample rates.
-X-Git-Url: https://git.xiph.org/?p=vorbis.git;a=commitdiff_plain;h=018ca26dece618457dd13585cad52941193c4a25
-
-CVE-2017-14160: fix bounds check on very low sample rates.
-CVE-2018-10393: Out-of-bounds Read
-
-Downloaded from upstream commit
-https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=018ca26dece618457dd13585cad52941193c4a25
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[yann.morin.1998 at free.fr: also fixes CVE-2018-10393]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
-
-diff --git a/lib/psy.c b/lib/psy.c
-index 422c6f1..1310123 100644
---- a/lib/psy.c
-+++ b/lib/psy.c
-@@ -602,8 +602,9 @@ static void bark_noise_hybridmp(int n,const long *b,
-   for (i = 0, x = 0.f;; i++, x += 1.f) {
- 
-     lo = b[i] >> 16;
--    if( lo>=0 ) break;
-     hi = b[i] & 0xffff;
-+    if( lo>=0 ) break;
-+    if( hi>=n ) break;
- 
-     tN = N[hi] + N[-lo];
-     tX = X[hi] - X[-lo];
diff --git a/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch b/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch
deleted file mode 100644
index 1208839a20..0000000000
--- a/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 112d3bd0aaacad51305e1464d4b381dabad0e88b Mon Sep 17 00:00:00 2001
-From: Thomas Daede <daede003@umn.edu>
-Date: Thu, 17 May 2018 16:19:19 -0700
-Subject: [PATCH] Sanity check number of channels in setup.
-
-Fixes #2335.
-[Retrieved from:
-https://gitlab.xiph.org/xiph/vorbis/commit/112d3bd0aaacad51305e1464d4b381dabad0e88b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/vorbisenc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/vorbisenc.c b/lib/vorbisenc.c
-index 4fc7b62..64a51b5 100644
---- a/lib/vorbisenc.c
-+++ b/lib/vorbisenc.c
-@@ -684,6 +684,7 @@ int vorbis_encode_setup_init(vorbis_info *vi){
-   highlevel_encode_setup *hi=&ci->hi;
- 
-   if(ci==NULL)return(OV_EINVAL);
-+  if(vi->channels<1||vi->channels>255)return(OV_EINVAL);
-   if(!hi->impulse_block_p)i0=1;
- 
-   /* too low/high an ATH floater is nonsensical, but doesn't break anything */
--- 
-2.24.1
-
diff --git a/package/libvorbis/libvorbis.hash b/package/libvorbis/libvorbis.hash
index 15bd01f22a..2e44ba33af 100644
--- a/package/libvorbis/libvorbis.hash
+++ b/package/libvorbis/libvorbis.hash
@@ -1,4 +1,4 @@
 # From http://www.xiph.org/downloads/
-sha256 af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415 libvorbis-1.3.6.tar.xz
+sha256  b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b  libvorbis-1.3.7.tar.xz
 # License files, locally calculated
-sha256 29e9914e6173b7061b7d48c25e6159fc1438326738bc047cc7248abc01b271f6  COPYING
+sha256  ec1815db59fcd302846df949d7424876cb2e2dc5ed1606c5fb0b36787b1cf43a  COPYING
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 708f3364ec..95c43d959e 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-LIBVORBIS_VERSION = 1.3.6
+LIBVORBIS_VERSION = 1.3.7
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
-LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
+LIBVORBIS_SITE = https://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPTS = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
 
-# 0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
-LIBVORBIS_IGNORE_CVES += CVE-2018-10393
-
-# 0002-Sanity-check-number-of-channels-in-setup.patch
-LIBVORBIS_IGNORE_CVES += CVE-2018-10392
-
 $(eval $(autotools-package))
