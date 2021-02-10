From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 10:01:50 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sox: security
 bump to latest git commit
Message-ID: <20210210085153.CF37883900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4065deba8ed47edce6a58cc5cf3a0edfa6ce8a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Bump to the latest git commit as this will fix the following CVEs:

git log|grep CVE
  sox-fmt: validate comments_bytes before use (CVE-2019-13590) [bug #325]
  fix possible null pointer deref in lsx_make_lpf() (CVE-2019-8357)
  fft4g: bail if size too large (CVE-2019-8356)
  fix possible overflow in lsx_(re)valloc() size calculation (CVE-2019-8355)
  fix possible buffer size overflow in lsx_make_lpf() (CVE-2019-8354)
  xa: validate channel count (CVE-2017-18189)
  aiff: fix crash on empty comment chunk (CVE-2017-15642)
  adpcm: fix stack overflow with >4 channels (CVE-2017-15372)
  flac: fix crash on corrupt metadata (CVE-2017-15371)
  wav: ima_adpcm: fix buffer overflow on corrupt input (CVE-2017-15370)
  wav: fix crash writing header when channel count >64k (CVE-2017-11359)
  hcom: fix crash on input with corrupt dictionary (CVE-2017-11358)
  wav: fix crash if channel count is zero (CVE-2017-11332)

- Tweak configuration options due to
  https://sourceforge.net/p/sox/code/ci/6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3
- libgsm is now an optional dependency since
  https://sourceforge.net/p/sox/code/ci/e548827ffcf4dffa7f21709b8e96b04b481c09b8
- Add patch to put back --disable-stack-protector

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6871f9d93055ec94d6fb88779d44b3235b29ce9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...igure.ac-put-back-disable-stack-protector.patch | 45 +++++++++++++++++
 package/sox/sox.hash                               |  4 +-
 package/sox/sox.mk                                 | 56 +++++++++++++++++-----
 3 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/package/sox/0002-configure.ac-put-back-disable-stack-protector.patch b/package/sox/0002-configure.ac-put-back-disable-stack-protector.patch
new file mode 100644
index 0000000000..28e2871f54
--- /dev/null
+++ b/package/sox/0002-configure.ac-put-back-disable-stack-protector.patch
@@ -0,0 +1,45 @@
+From 18ace560a15207503805d4df25b90c7a756bcbf6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 2 Feb 2021 23:53:39 +0100
+Subject: [PATCH] configure.ac: put back --disable-stack-protector
+
+Put back --disable-stack-protector which has been removed by commit
+70c85915eace83142b84e4f65f5db421cf0c09e3. This will allow the user to
+disable it or to let a higher buildsystem such as buildroot to finely
+configure it.
+
+Indeed, without this patch, build can fail as some compilers (such as
+uclibc) could missed the needed library (-lssp or -lssp_nonshared) at
+linking step:
+
+  CCLD     libsox.la
+/home/fabrice/br-test-pkg/br-arm-full/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp_nonshared
+/home/fabrice/br-test-pkg/br-arm-full/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/sox/patches/122/]
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 39306398..a1665467 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,7 +32,12 @@ AC_PROG_LN_S
+ PKG_PROG_PKG_CONFIG
+ PKG_INSTALLDIR
+ 
+-AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong])
++AC_ARG_ENABLE([stack-protector],
++    AS_HELP_STRING([--disable-stack-protector], [Disable -fstack-protector-strong]),
++    [enable_stack_protector=$enableval], [enable_stack_protector=yes])
++AS_IF([test x"$enable_stack_protector" = "xyes"],
++    [AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong])])
++
+ AX_APPEND_COMPILE_FLAGS([-Wall -Wmissing-prototypes -Wstrict-prototypes])
+ AX_APPEND_LINK_FLAGS([-Wl,--as-needed])
+ 
+-- 
+2.29.2
+
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index 1a4a7dbf7f..d2006e0291 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,6 +1,4 @@
-# From http://sourceforge.net/projects/sox/files/sox/14.4.2/
-md5	ba804bb1ce5c71dd484a102a5b27d0dd	sox-14.4.2.tar.bz2
-sha1	dc9668256b9d81ef25d672f14f12ec026b0b4087	sox-14.4.2.tar.bz2
 # Locally computed
+sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-br1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index e2e8d1da94..80f4924704 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -4,12 +4,20 @@
 #
 ################################################################################
 
-SOX_VERSION = 14.4.2
-SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
-SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
-SOX_DEPENDENCIES = host-pkgconf
+SOX_VERSION = 7524160b29a476f7e87bc14fddf12d349f9a3c5e 
+SOX_SITE = git://git.code.sf.net/p/sox/code
+SOX_SITE_METHOD = git
+SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
+# From git and we're patching configure.ac
+SOX_AUTORECONF = YES
+SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+SOX_IGNORE_CVES += CVE-2017-11332 CVE-2017-11358 CVE-2017-11359 \
+	CVE-2017-15370 CVE-2017-15371 CVE-2017-15372 CVE-2017-15642 \
+	CVE-2017-18189 CVE-2019-8354 CVE-2019-8355 CVE-2019-8356 \
+	CVE-2019-8357 CVE-2019-13590
 
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
@@ -17,92 +25,114 @@ SOX_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
+SOX_CONF_OPTS += --enable-alsa
 else
-SOX_CONF_OPTS += --without-alsa
+SOX_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 SOX_DEPENDENCIES += file
+SOX_CONF_OPTS += --with-magic
 else
 SOX_CONF_OPTS += --without-magic
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 SOX_DEPENDENCIES += flac
+SOX_CONF_OPTS += --enable-flac
 else
-SOX_CONF_OPTS += --without-flac
+SOX_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_LAME),y)
 SOX_DEPENDENCIES += lame
+SOX_CONF_OPTS += --with-lame
 else
 SOX_CONF_OPTS += --without-lame
 endif
 
 ifeq ($(BR2_PACKAGE_LIBAO),y)
 SOX_DEPENDENCIES += libao
+SOX_CONF_OPTS += --enable-ao
+else
+SOX_CONF_OPTS += --disable-ao
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+SOX_DEPENDENCIES += libgsm
+SOX_CONF_OPTS += --enable-gsm
 else
-SOX_CONF_OPTS += --without-ao
+SOX_CONF_OPTS += --disable-gsm
 endif
 
 ifeq ($(BR2_PACKAGE_LIBID3TAG),y)
 SOX_DEPENDENCIES += libid3tag
+SOX_CONF_OPTS += --with-id3tag
 else
 SOX_CONF_OPTS += --without-id3tag
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 SOX_DEPENDENCIES += libmad
+SOX_CONF_OPTS += --with-mad
 else
 SOX_CONF_OPTS += --without-mad
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SOX_DEPENDENCIES += libpng
+SOX_CONF_OPTS += --with-png
 else
 SOX_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 SOX_DEPENDENCIES += libsndfile
+SOX_CONF_OPTS += --enable-sndfile
 else
-SOX_CONF_OPTS += --without-sndfile
+SOX_CONF_OPTS += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SOX_DEPENDENCIES += libvorbis
+SOX_CONF_OPTS += --enable-oggvorbis
 else
-SOX_CONF_OPTS += --without-oggvorbis
+SOX_CONF_OPTS += --disable-oggvorbis
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
 SOX_DEPENDENCIES += opencore-amr
+SOX_CONF_OPTS += --enable-amrwb --enable-amrnb
 else
-SOX_CONF_OPTS += --without-amrwb --without-amrnb
+SOX_CONF_OPTS += --disable-amrwb --disable-amrnb
 endif
 
 ifeq ($(BR2_PACKAGE_OPUSFILE),y)
 SOX_DEPENDENCIES += opusfile
+SOX_CONF_OPTS += --enable-opus
 else
-SOX_CONF_OPTS += --without-opus
+SOX_CONF_OPTS += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 SOX_DEPENDENCIES += pulseaudio
+SOX_CONF_OPTS += --enable-pulseaudio
 else
-SOX_CONF_OPTS += --without-pulseaudio
+SOX_CONF_OPTS += --disable-pulseaudio
 endif
 
 ifeq ($(BR2_PACKAGE_TWOLAME),y)
 SOX_DEPENDENCIES += twolame
+SOX_CONF_OPTS += --with-twolame
 else
 SOX_CONF_OPTS += --without-twolame
 endif
 
 ifeq ($(BR2_PACKAGE_WAVPACK),y)
 SOX_DEPENDENCIES += wavpack
+SOX_CONF_OPTS += --enable-wavpack
 else
-SOX_CONF_OPTS += --without-wavpack
+SOX_CONF_OPTS += --disable-wavpack
 endif
 
 $(eval $(autotools-package))
