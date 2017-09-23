From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 20:49:36 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-mm: new package
In-Reply-To: <20170831155352.4644-1-aduskett@gmail.com>
References: <20170831155352.4644-1-aduskett@gmail.com>
Message-ID: <b7c64db0-eeb9-8e2f-5b33-c68d1192d336@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

 I have a lot of nitpicky comments :-)


On 31-08-17 17:53, Adam Duskett wrote:
> Gstreamermm provides C++ bindings for gstreamer.

 Since upstream calls it gstreamermm, we should have a name that closely
resembles it. I think we could even use gstreamermm itself, but it could also be
gstreamer1-mm to be more similar to the existing gst1 packages. Note that the
upstream of gst1-plugins-bad is called gst-plugins-bad, not gstreamer-plugins-bad.

 But since we already have a gst-omx (this is a plugin that didn't exist in
gstreamer-0.10), I think we could choose gstreamermm.


> Signed-off-by: Adam Duskett <aduskett@gmail.com>
[snip]
> diff --git a/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch b/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch
> new file mode 100644
> index 000000000..c2db2657a
> --- /dev/null
> +++ b/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch
> @@ -0,0 +1,68 @@
> +From 631414d89ba50bb207ce1fb7e0324c0e91cdcf43 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>

 You should really keep the upstream author information...

git clone https://git.gnome.org/browse/gstreamermm
cd gstreamermm
git checkout 1.8.0
git cherry-pick -s 167eeba7757027e5faf8cdb59030ca094af04763
git commit --amend

> +Date: Thu, 31 Aug 2017 11:40:37 -0400
> +Subject: [PATCH] Gst::AudioClock: auto generate some audioclock methods
> +
> +Those methods used to have object of GstClock type  as a
> +first argument, so had to be wrapped manually. It has been
> +fixed in GStreamer (https://bugzilla.gnome.org/show_bug.cgi?id=756628)
> +in version 1.12.0
> +https://bugzilla.gnome.org/show_bug.cgi?id=783628
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[Upstream commit: https://github.com/GNOME/gstreamermm/commit/167eeba7757027e5faf8cdb59030ca094af04763]

 The upstream repo is (AFAIK) https://git.gnome.org/browse/gstreamermm, github
is just a mirror.

[snip]
> diff --git a/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch b/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch
> new file mode 100644
> index 000000000..70a05a6cd
> --- /dev/null
> +++ b/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch
> @@ -0,0 +1,29 @@
> +From f65960a21c76bcd1371a9d0d3b008731d02a0e5d Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Thu, 31 Aug 2017 11:42:40 -0400
> +Subject: [PATCH] remove gstreamer-check dependency
> +
> +gstreamer-check is disabled by default in buildroot and itsn't required to
                                                           it isn't

> +build gstreamermm. Remove the requirement from configure.

 Do you think this patch could be sent upstream?

> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index de43442..c30bc4c 100755
> +--- a/configure
> ++++ b/configure
> +@@ -16685,7 +16685,7 @@ fi
> + # The format below is used so that the requirements appear nicely in the .pc
> + # file.
> + 
> +-GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.8.0 gstreamer-base-1.0 >= 1.8.0 gstreamer-check-1.0 >= 1.8.0 gstreamer-controller-1.0 >= 1.8.0 gstreamer-net-1.0 >= 1.8.0 gstreamer-allocators-1.0 >= 1.8.0 gstreamer-app-1.0 >= 1.8.0 gstreamer-audio-1.0 >= 1.8.0 gstreamer-fft-1.0 >= 1.8.0 gstreamer-pbutils-1.0 >= 1.8.0 gstreamer-plugins-base-1.0 >= 1.8.0 gstreamer-riff-1.0 >= 1.8.0 gstreamer-rtp-1.0 >= 1.8.0 gstreamer-rtsp-1.0 >= 1.8.0 gstreamer-sdp-1.0 >= 1.8.0 gstreamer-tag-1.0 >= 1.8.0 gstreamer-video-1.0 >= 1.8.0'
> ++GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.8.0 gstreamer-base-1.0 >= 1.8.0 gstreamer-controller-1.0 >= 1.8.0 gstreamer-net-1.0 >= 1.8.0 gstreamer-allocators-1.0 >= 1.8.0 gstreamer-app-1.0 >= 1.8.0 gstreamer-audio-1.0 >= 1.8.0 gstreamer-fft-1.0 >= 1.8.0 gstreamer-pbutils-1.0 >= 1.8.0 gstreamer-plugins-base-1.0 >= 1.8.0 gstreamer-riff-1.0 >= 1.8.0 gstreamer-rtp-1.0 >= 1.8.0 gstreamer-rtsp-1.0 >= 1.8.0 gstreamer-sdp-1.0 >= 1.8.0 gstreamer-tag-1.0 >= 1.8.0 gstreamer-video-1.0 >= 1.8.0'
> + 
> + 
> + 
> +-- 
> +2.13.5
> +
> diff --git a/package/gstreamer1/gst1-mm/Config.in b/package/gstreamer1/gst1-mm/Config.in
> new file mode 100644
> index 000000000..bbddbbd0c
> --- /dev/null
> +++ b/package/gstreamer1/gst1-mm/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_GST1_MM
> +	bool "Gstreamer C++ bindings"
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE

 Based on the modules listed above, I'd guess that you actually need to select a
bunch of modules from plugins-base, e.g.
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP. And isn't e.g.
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP needed as well?


> +	select BR2_PACKAGE_GLIBMM
> +	help
> +	  gstreamermm provides C++ bindings for the GStreamer streaming
> +	  multimedia library (http://gstreamer.freedesktop.org). With
> +	  gstreamermm it is possible to	develop applications that work
> +	  with multimedia in C++.
> +
> +	  gstreamermm is developed over glibmm, libsigc++ and libxml++
> +	  and the functionalities they provide. This means that, among
> +	  other things, referencing and unreferencing of GObjects is
> +	  handled automatically via glibmm's automatic pointer class,
> +	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
> +	  signals.
> +
> +	  https://gstreamer.freedesktop.org/bindings/cplusplus.html

 Good choice of upstream URL!


 Regards,
 Arnout

> diff --git a/package/gstreamer1/gst1-mm/gst1-mm.hash b/package/gstreamer1/gst1-mm/gst1-mm.hash
> new file mode 100644
> index 000000000..d10e00215
> --- /dev/null
> +++ b/package/gstreamer1/gst1-mm/gst1-mm.hash
> @@ -0,0 +1,2 @@
> +#From http://ftp.gnome.org/pub/gnome/sources/gstreamermm/1.8/gstreamermm-1.8.0.sha256sum
> +sha256 3ee3c1457ea2c32c1e17b784faa828f414ba27a9731532bf26d137a2ad999a44 gstreamermm-1.8.0.tar.xz
> diff --git a/package/gstreamer1/gst1-mm/gst1-mm.mk b/package/gstreamer1/gst1-mm/gst1-mm.mk
> new file mode 100644
> index 000000000..d54a4d6b3
> --- /dev/null
> +++ b/package/gstreamer1/gst1-mm/gst1-mm.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# gst1-mm
> +#
> +################################################################################
> +
> +GST1_MM_VERSION_MAJOR = 1.8
> +GST1_MM_VERSION = $(GST1_MM_VERSION_MAJOR).0
> +GST1_MM_SITE = http://ftp.gnome.org/pub/gnome/sources/gstreamermm/$(GST1_MM_VERSION_MAJOR)
> +GST1_MM_SOURCE = gstreamermm-$(GST1_MM_VERSION).tar.xz
> +GST1_MM_LICENSE = LGPL-2.1+
> +GST1_MM_LICENSE_FILES = COPYING.LIB
> +GST1_MM_INSTALL_STAGING = YES
> +GST1_MM_DEPENDENCIES += \
> +	glibmm \
> +	gstreamer1 \
> +	gst1-plugins-base
> +
> +GST1_MM_CONF_OPTS += \
> +	--disable-gl \
> +	--disable-plugins-bad
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
