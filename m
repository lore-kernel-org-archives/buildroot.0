From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:06:03 +0100
Subject: [Buildroot] [git commit] package/gst1-libav: fix powerpc build
Message-ID: <20190329160252.37FF18A2D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c6f83c3eb63940808644281575844573c45477a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AS "hack" is also needed for powerpc builds otherwise build fails on:
AS	libavcodec/ppc/fft_altivec.o
/home/buildroot/autobuild/run/instance-2/output/host/bin/powerpc64-linux-as: invalid option -- '_'

This error is raised because CPPFLAGS are (wrongly) passed to AS

Fixes:
 - http://autobuild.buildroot.org/results/6710e72452fe70788d75191b8b735f90beff9361
 - http://autobuild.buildroot.org/results/a1f22975d4a4a6cfc553a450da464a431702800f
 - http://autobuild.buildroot.org/results/be2d161443c5ab24979e6b9389eb21a53d4b4066

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 97e069a35f..254ab719ae 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -15,8 +15,8 @@ GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
 GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
 
-# fixes arm build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
+# fixes arm/powerpc build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
 endif
 
