From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 19:02:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/libvorbis: fix CVE-2018-10392
Message-ID: <20200301180226.186420-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mapping0_forward in mapping0.c in Xiph.Org libvorbis 1.3.6 does not
validate the number of channels, which allows remote attackers to cause
a denial of service (heap-based buffer overflow or over-read) or
possibly have unspecified other impact via a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ty-check-number-of-channels-in-setup.patch | 28 +++++++++++++++++++
 package/libvorbis/libvorbis.mk                |  3 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch

diff --git a/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch b/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch
new file mode 100644
index 0000000000..1208839a20
--- /dev/null
+++ b/package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch
@@ -0,0 +1,28 @@
+From 112d3bd0aaacad51305e1464d4b381dabad0e88b Mon Sep 17 00:00:00 2001
+From: Thomas Daede <daede003@umn.edu>
+Date: Thu, 17 May 2018 16:19:19 -0700
+Subject: [PATCH] Sanity check number of channels in setup.
+
+Fixes #2335.
+[Retrieved from:
+https://gitlab.xiph.org/xiph/vorbis/commit/112d3bd0aaacad51305e1464d4b381dabad0e88b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/vorbisenc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/vorbisenc.c b/lib/vorbisenc.c
+index 4fc7b62..64a51b5 100644
+--- a/lib/vorbisenc.c
++++ b/lib/vorbisenc.c
+@@ -684,6 +684,7 @@ int vorbis_encode_setup_init(vorbis_info *vi){
+   highlevel_encode_setup *hi=&ci->hi;
+ 
+   if(ci==NULL)return(OV_EINVAL);
++  if(vi->channels<1||vi->channels>255)return(OV_EINVAL);
+   if(!hi->impulse_block_p)i0=1;
+ 
+   /* too low/high an ATH floater is nonsensical, but doesn't break anything */
+-- 
+2.24.1
+
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index ae2c1efffe..bf479a3900 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -13,4 +13,7 @@ LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
 
+# 0002-Sanity-check-number-of-channels-in-setup.patch
+LIBVORBIS_IGNORE_CVES += CVE-2018-10392
+
 $(eval $(autotools-package))
-- 
2.25.0
