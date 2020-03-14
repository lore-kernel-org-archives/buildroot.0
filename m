From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:39:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libvorbis: fix
 CVE-2018-10392
Message-ID: <20200314182659.3F62D83BD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a295adad0a2505de937a5f9ac69a6ec4a7ed236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

mapping0_forward in mapping0.c in Xiph.Org libvorbis 1.3.6 does not
validate the number of channels, which allows remote attackers to cause
a denial of service (heap-based buffer overflow or over-read) or
possibly have unspecified other impact via a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3321eef6f28339df1c72ac4e1af937b391084501)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Sanity-check-number-of-channels-in-setup.patch | 28 ++++++++++++++++++++++
 package/libvorbis/libvorbis.mk                     |  3 +++
 2 files changed, 31 insertions(+)

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
