From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 12 Jun 2013 14:19:22 -0500
Subject: [Buildroot] [PATCH v10 08/13] gst1-plugins-base: add gstreamer1
 base plugins
In-Reply-To: <51B81371.3050109@mind.be>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-9-git-send-email-spenser@gillilanding.com>
 <51B81371.3050109@mind.be>
Message-ID: <CAEBucnB6iVqt4A6muV9ouwpqk4Npmd7Uu7SkNDrr3myGk_9Mnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thanks for taking the time to review these patches.  For your other
two patch reviews, I have incorporated all changes into my next patch
series.

On Wed, Jun 12, 2013 at 1:21 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/06/13 01:18, Spenser Gilliland wrote:
>>
>> Adds gstreamer 1.X base plugins.
>
>
>  Missing SoB.
>
>  Protip: git config --global format.signoff true

Usually, do this with git format-patch -s must have forgot to add the
switch.  I'll add this to my config.

>
>> ---
>>   package/multimedia/Config.in                       |    1 +
>>   package/multimedia/gst1-plugins-base/Config.in     |  106 ++++++++++
>>   .../gst1-plugins-base/gst1-plugins-base.mk         |  204
>> ++++++++++++++++++++
>>   3 files changed, 311 insertions(+), 0 deletions(-)
>>   create mode 100644 package/multimedia/gst1-plugins-base/Config.in
>>   create mode 100644
>> package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
>>
>> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
>> index 0351fd0..253fd17 100644
>> --- a/package/multimedia/Config.in
>> +++ b/package/multimedia/Config.in
>> @@ -12,6 +12,7 @@ source "package/multimedia/gst-dsp/Config.in"
>>   source "package/multimedia/gst-fsl-plugins/Config.in"
>>   source "package/multimedia/gst-omapfb/Config.in"
>>   source "package/multimedia/gst-plugins-base/Config.in"
>> +source "package/multimedia/gst1-plugins-base/Config.in"
>
>
>  Same remark: keep all gst1 stuff together.

Will do.

>
>
>>   source "package/multimedia/gst-plugins-good/Config.in"
>>   source "package/multimedia/gst-plugins-bad/Config.in"
>>   source "package/multimedia/gst-plugins-ugly/Config.in"
>> diff --git a/package/multimedia/gst1-plugins-base/Config.in
>> b/package/multimedia/gst1-plugins-base/Config.in
>> new file mode 100644
>> index 0000000..2a95846
>> --- /dev/null
>> +++ b/package/multimedia/gst1-plugins-base/Config.in
>> @@ -0,0 +1,106 @@
>> +menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
>> +       bool "gst1-plugins-base"
>> +       depends on BR2_PACKAGE_GSTREAMER1
>> +       select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>> +       select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>> +       select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
>> +       help
>> +         A basic set of well-supported plug-ins for GStreamer.
>> +
>> +         http://gstreamer.freedesktop.org/
>> +
>> +if BR2_PACKAGE_GST1_PLUGINS_BASE
>> +
>> +comment "dependency-less plugins"
>
>
>  It would be nice if these plugins would get some help text explaining what
> they are.  Copy and past of the description in gst-inspect is probably
> sufficient.

Sounds reasonable.  Will do.
>
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER
>> +       bool "adder"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
>> +       bool "app"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
>> +       bool "audioconvert (mandatory for audio playback)"
>> +       default y
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE
>> +       bool "audiorate"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
>> +       bool "audioresample (mandatory for audio playback)"
>> +       default y
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
>> +       bool "audiotestsrc"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
>> +       bool "encoding"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
>> +       bool "gio"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
>> +       bool "playback"
>> +       default y
>
>
>  I would add a "select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND" here.
> I think that is the only required dependency of the playsinks.

Good to know. I'll add this to the next patch series.

>  There's also a gdp and a gst_v4l plugin for which no config option exists.

I cannot find either of these options in the ./configure --help output
are you sure they are available?

>
>
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE
>> +       bool "subparse"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP
>> +       bool "tcp"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
>> +       bool "typefind"
>> +       default y
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
>> +       bool "videoconvert"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
>> +       bool "videotestsrc"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
>> +       bool "videorate"
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
>> +       bool "videoscale (mandatory for video playback)"
>> +       default y
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
>> +       bool "volume (mandatory for audio playback)"
>> +       default y
>> +
>> +comment "plugins with external dependencies (there may be more
>> available)"
>
>
>  What does "there may be more available" mean?

I've updated the wording to "plugins which have unpackaged
dependencies are not shown" .

>
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
>> +       bool "alsa (mandatory for audio playback)"
>> +       select BR2_PACKAGE_ALSA_LIB
>> +       select BR2_PACKAGE_ALSA_LIB_MIXER
>> +       select BR2_PACKAGE_ALSA_LIB_PCM
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
>> +       bool "ogg (*.ogg audio/video)"
>> +       select BR2_PACKAGE_LIBOGG
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
>> +       bool "pango font renderer"
>> +       depends on BR2_INSTALL_LIBSTDCPP
>> +       select BR2_PACKAGE_PANGO
>> +
>> +comment "pango plugin requires a toolchain with C++ support"
>> +       depends on !BR2_INSTALL_LIBSTDCPP
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
>> +       bool "theora (*.ogg video)"
>> +       select BR2_PACKAGE_LIBTHEORA
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR
>> +       bool "tremor"
>> +       select BR2_PACKAGE_TREMOR
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS
>> +       bool "vorbis (*.ogg audio)"
>> +       select BR2_PACKAGE_LIBVORBIS
>> +
>> +endif
>> +
>> diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
>> b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
>> new file mode 100644
>> index 0000000..63c4955
>> --- /dev/null
>> +++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
>> @@ -0,0 +1,204 @@
>>
>> +################################################################################
>> +#
>> +# gst1-plugins-base
>> +#
>>
>> +################################################################################
>> +
>> +GST1_PLUGINS_BASE_VERSION = 1.1.1
>
>
>  I could be wrong, but didn't gstreamer switch to simultaneous releases, so
> we could use $(GSTREAMER1_VERSION) here instead?
>
>
>> +GST1_PLUGINS_BASE_SOURCE =
>> gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
>> +GST1_PLUGINS_BASE_SITE =
>> http://gstreamer.freedesktop.org/src/gst-plugins-base
>> +GST1_PLUGINS_BASE_INSTALL_STAGING = YES
>> +GST1_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
>
>
>  COPYING contains the GPL which isn't actually used by any source file (only
> some old tests). So it can be left out.
>
>
>> +GST1_PLUGINS_BASE_LICENSE = LGPLv2+ LGPLv2.1+
>> +
>> +# freetype is only used by examples, but if it is not found
>> +# and the host has a freetype-config script, then the host
>> +# include dirs are added to the search path causing trouble
>> +GST1_PLUGINS_BASE_CONF_ENV =
>> +       FT2_CONFIG=/bin/false \
>> +       ac_cv_header_stdint_t="stdint.h"
>
>
>  Why is this necessary?

Not sure, this was in the gst-plugins-base and was simply copied to
gst1-plugins-base.

The following two commits created these lines.
http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=8232850c51e07b99ba84769b492faa147290fdc7
http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=32d319e6f7242553c821c7a1eadfabd2719f5992

>
>> +
>> +GST1_PLUGINS_BASE_CONF_OPT = \
>> +       --disable-examples \
>> +       --disable-oggtest \
>> +       --disable-vorbistest \
>> +       --disable-freetypetest \
>> +       --disable-valgrind \
>> +       --disable-debug
>> +
>> +# Options which require currently unpackaged libraries
>> +GST1_PLUGINS_BASE_CONF_OPT += \
>> +       --disable-cdparanoia \
>> +       --disable-libvisual \
>> +       --disable-iso-codes
>> +
>> +GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
>> +
>> +ifeq ($(BR2_PACKAGE_XORG7),y)
>> +GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
>> +GST1_PLUGINS_BASE_CONF_OPT += \
>> +       --enable-x \
>> +       --enable-xshm \
>> +       --enable-xvideo
>> +else
>> +GST1_PLUGINS_BASE_CONF_OPT += \
>> +       --disable-x \
>> +       --disable-xshm \
>> +       --disable-xvideo
>> +endif
>
>
>  I would actually make configure options for ximagesink and xvimagesink
> (--enable-x and --enable-xvideo).

As X already consumes a large amount of
>
>> +
>> +ifeq ($(BR2_PACKAGE_ORC),y)
>> +GST1_PLUGINS_BASE_DEPENDENCIES += orc
>> +GST1_PLUGINS_BASE_CONF_OPT += --enable-orc
>> +endif
>> +
>
>
>  It would be nice if the plugins below could be kept alphabetic.

How about if I keep them in the order of ./configure --help?  That way
its easy to spot when new ones are added and old ones removed.

Thanks,
Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
