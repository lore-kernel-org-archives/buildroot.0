From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Jun 2013 07:57:56 +0200
Subject: [Buildroot] [PATCH v10 08/13] gst1-plugins-base: add gstreamer1
 base plugins
In-Reply-To: <CAEBucnB6iVqt4A6muV9ouwpqk4Npmd7Uu7SkNDrr3myGk_9Mnw@mail.gmail.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-9-git-send-email-spenser@gillilanding.com>
 <51B81371.3050109@mind.be>
 <CAEBucnB6iVqt4A6muV9ouwpqk4Npmd7Uu7SkNDrr3myGk_9Mnw@mail.gmail.com>
Message-ID: <51B95F64.1050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/13 21:19, Spenser Gilliland wrote:
> On Wed, Jun 12, 2013 at 1:21 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 08/06/13 01:18, Spenser Gilliland wrote:
[snip]
>>   There's also a gdp and a gst_v4l plugin for which no config option exists.
>
> I cannot find either of these options in the ./configure --help output
> are you sure they are available?

  Sorry my bad - I was looking at my local git clone, and it still had a 
configure from 0.10 days (forgot to run autoregen).

>
>>
>>
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE
>>> +       bool "subparse"
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP
>>> +       bool "tcp"
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
>>> +       bool "typefind"
>>> +       default y
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
>>> +       bool "videoconvert"
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
>>> +       bool "videotestsrc"
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
>>> +       bool "videorate"
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
>>> +       bool "videoscale (mandatory for video playback)"
>>> +       default y
>>> +
>>> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
>>> +       bool "volume (mandatory for audio playback)"
>>> +       default y
>>> +
>>> +comment "plugins with external dependencies (there may be more
>>> available)"
>>
>>
>>   What does "there may be more available" mean?
>
> I've updated the wording to "plugins which have unpackaged
> dependencies are not shown" .

  I think that will make the line too long so you'd have to split it. But 
actually, for other packages we never say things like that.

[snip]
>>> +# freetype is only used by examples, but if it is not found
>>> +# and the host has a freetype-config script, then the host
>>> +# include dirs are added to the search path causing trouble
>>> +GST1_PLUGINS_BASE_CONF_ENV =
>>> +       FT2_CONFIG=/bin/false \
>>> +       ac_cv_header_stdint_t="stdint.h"
>>
>>
>>   Why is this necessary?
>
> Not sure, this was in the gst-plugins-base and was simply copied to
> gst1-plugins-base.
>
> The following two commits created these lines.
> http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=8232850c51e07b99ba84769b492faa147290fdc7
> http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=32d319e6f7242553c821c7a1eadfabd2719f5992

  I was only referring to the stdint - the other one has a proper comment.

  But since nothing seems to have changed in the stdint.h detection code 
since 0.10.25, I guess it's best to keep it.

>
>>
>>> +
>>> +GST1_PLUGINS_BASE_CONF_OPT = \
>>> +       --disable-examples \
>>> +       --disable-oggtest \
>>> +       --disable-vorbistest \
>>> +       --disable-freetypetest \
>>> +       --disable-valgrind \
>>> +       --disable-debug
>>> +
>>> +# Options which require currently unpackaged libraries
>>> +GST1_PLUGINS_BASE_CONF_OPT += \
>>> +       --disable-cdparanoia \
>>> +       --disable-libvisual \
>>> +       --disable-iso-codes
>>> +
>>> +GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
>>> +
>>> +ifeq ($(BR2_PACKAGE_XORG7),y)
>>> +GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
>>> +GST1_PLUGINS_BASE_CONF_OPT += \
>>> +       --enable-x \
>>> +       --enable-xshm \
>>> +       --enable-xvideo
>>> +else
>>> +GST1_PLUGINS_BASE_CONF_OPT += \
>>> +       --disable-x \
>>> +       --disable-xshm \
>>> +       --disable-xvideo
>>> +endif
>>
>>
>>   I would actually make configure options for ximagesink and xvimagesink
>> (--enable-x and --enable-xvideo).
>
> As X already consumes a large amount of

  I can complete that sentence :-)

  Fair enough.

>>
>>> +
>>> +ifeq ($(BR2_PACKAGE_ORC),y)
>>> +GST1_PLUGINS_BASE_DEPENDENCIES += orc
>>> +GST1_PLUGINS_BASE_CONF_OPT += --enable-orc
>>> +endif
>>> +
>>
>>
>>   It would be nice if the plugins below could be kept alphabetic.
>
> How about if I keep them in the order of ./configure --help?  That way
> its easy to spot when new ones are added and old ones removed.

  Yes, good idea.

  Regards,
  Arnout

>
> Thanks,
> Spenser
>
>
> --
> Spenser Gilliland
> Computer Engineer
> Doctoral Candidate
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
