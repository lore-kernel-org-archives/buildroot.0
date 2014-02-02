From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2014 20:55:09 +0100
Subject: [Buildroot] [PATCH] gst1-libav: new package
In-Reply-To: <87fvo3roe1.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 01 Feb 2014 13:47:02 +0100")
References: <1389880672-15503-1-git-send-email-neumann@teufel.de>
 <87fvo3roe1.fsf@dell.be.48ers.dk>
Message-ID: <87zjm9p9wi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Resending as this apparently never made it to the list?


>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
 >> Signed-off-by: Sven Neumann <neumann@teufel.de>
 >> ---
 >> package/gstreamer1/Config.in                |  1 +
 >> package/gstreamer1/gst1-libav/Config.in     | 14 ++++++++++
 >> package/gstreamer1/gst1-libav/gst1-libav.mk | 41 +++++++++++++++++++++++++++++
 >> 3 files changed, 56 insertions(+)
 >> create mode 100644 package/gstreamer1/gst1-libav/Config.in
 >> create mode 100644 package/gstreamer1/gst1-libav/gst1-libav.mk

 >> diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
 >> index f7b98c7..fe0ad48 100644
 >> --- a/package/gstreamer1/Config.in
 >> +++ b/package/gstreamer1/Config.in
 >> @@ -6,5 +6,6 @@ source "package/gstreamer1/gst1-plugins-base/Config.in"
 >> source "package/gstreamer1/gst1-plugins-good/Config.in"
 >> source "package/gstreamer1/gst1-plugins-bad/Config.in"
 >> source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 >> +source "package/gstreamer1/gst1-libav/Config.in"
 >> source "package/gstreamer1/gst-omx/Config.in"
 >> endif
 >> diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
 >> new file mode 100644
 >> index 0000000..859bdff
 >> --- /dev/null
 >> +++ b/package/gstreamer1/gst1-libav/Config.in
 >> @@ -0,0 +1,14 @@
 >> +config BR2_PACKAGE_GST1_LIBAV
 >> +	bool "gst1-libav"
 >> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
 >> +	depends on BR2_LARGEFILE
 >> +	help
 >> +	  GStreamer plugin (formerly gst-ffmpeg).
 >> +
 >> +	  This package contains GStreamer plugins based on
 >> +	  the libav project.
 >> +
 >> +	  http://gstreamer.freedesktop.org/
 >> +
 >> +comment "gst1-libav requires a toolchain with LARGEFILE support"
 >> +	depends on !(BR2_LARGEFILE)

 > As far as I could see, it doesn't really need largefile, so I dropped
 > this.

 >> diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
 >> new file mode 100644
 >> index 0000000..e90f6c5
 >> --- /dev/null
 >> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
 >> @@ -0,0 +1,41 @@
 >> +#############################################################
 >> +#
 >> +# gst1-libav
 >> +#
 >> +#############################################################

 > Header is 80x # these days.

 >> +
 >> +GST1_LIBAV_VERSION = 1.2.2
 >> +GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 >> +GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 >> +
 >> +GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 >> +
 >> +GST1_LIBAV_CONF_OPT = \
 >> +	--with-libav-extra-configure="--target-os=linux \
 >> +	                               --disable-debug \
 >> +				       --disable-ffmpeg \
 >> +				       --disable-avconv \
 >> +				       --disable-avdevice \
 >> +				       --disable-avplay \
 >> +				       --disable-avserver \
 >> +                                       --enable-pthreads \
 >> +                                       --enable-zlib \
 >> +                                       --prefix=$(STAGING_DIR)/usr \
 >> +                                       --sysroot=$(STAGING_DIR) \
 >> +                                       --host-cc=$(TARGET_CC) \
 >> +                                       --cc=$(TARGET_CC) \
 >> +                                       --arch=$(BR2_ARCH) \
 >> +                                       --enable-cross-compile \
 >> +                                       --cross-prefix=$(TARGET_CROSS) \
 >> +                                       --disable-shared \
 >> +                                       --enable-static"
 >> +

 > A number of these already gets passed from the toplevel configure, so
 > they can be dropped.

 > It's also missing all the cpu specific feature enabling/disabling,
 > similar to how we do it for gst-ffmpeg. I've more or less copied over
 > the gst-ffmpeg logic verbatim and committed, thanks.

 > -- 
 > Bye, Peter Korsgaard

-- 
Bye, Peter Korsgaard
