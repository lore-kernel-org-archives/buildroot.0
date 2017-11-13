From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Nov 2017 17:02:35 +0100
Subject: [Buildroot] [NEXT 02/17] libpjsip: add enable sound option
In-Reply-To: <CAFSsvmp+J4RKmsaAx2nTk9fETFpdJmnF_9S-5PtQordKgOD5zQ@mail.gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
 <20171110202109.25215-2-aduskett@gmail.com>
 <d90117ce-7868-a9d3-c5d8-45e0cd1977a5@mind.be>
 <CAFSsvmp+J4RKmsaAx2nTk9fETFpdJmnF_9S-5PtQordKgOD5zQ@mail.gmail.com>
Message-ID: <1d98e224-5986-e1a5-5df1-a629676e8218@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-11-17 15:36, Adam Duskett wrote:
> Hello
> 
> On Sat, Nov 11, 2017 at 4:29 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Adam,
>>
>> On 10-11-17 21:20, Adam Duskett wrote:
>>> This is the first patch in a series that will enable several features
>>> for libpjsip.  This patch does the following:
>>>
>>> - make libpjsip a menuconfig option
>>
>>  You could have done that in a separate patch, to make it easier to apply only
>> part of the series.

 On second thought, that doesn't make sense since it would be an empty menu.

>>
>>> - add a option for "Enable sound"
>>>
>>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>>> ---
>>>  package/libpjsip/Config.in   | 11 ++++++++++-
>>>  package/libpjsip/libpjsip.mk |  5 ++++-
>>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
>>> index 727d2ec3d0..a39d053e03 100644
>>> --- a/package/libpjsip/Config.in
>>> +++ b/package/libpjsip/Config.in
>>> @@ -1,4 +1,4 @@
>>> -config BR2_PACKAGE_LIBPJSIP
>>> +menuconfig BR2_PACKAGE_LIBPJSIP
>>>       bool "libpjsip"
>>>       depends on BR2_INSTALL_LIBSTDCPP
>>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>>> @@ -10,5 +10,14 @@ config BR2_PACKAGE_LIBPJSIP
>>>
>>>         http://www.pjsip.org
>>>
>>> +if BR2_PACKAGE_LIBPJSIP
>>> +
>>> +config BR2_PACKAGE_LIBPJSIP_SOUND
>>> +     bool "Enable sound"
>>> +     help
>>> +       Use sound instead of a null device.
>>
>>  Is it useful to make this optional? Does it have a significant impact on size?
>>
>>  Same goes for all the other options you add, e.g. v4l2 support: except if the
>> v4l2 support adds significantly to the size of libpjsip, you can just enable it
>> when BR2_PACKAGE_LIBV4L is selected.
>>
>>  That said, you may have good reasons to choose this route. It helps to explain
>> that in the commit log.
> Yeah, forgot to send a cover letter, sorry about that!
> 
> I could have! However; Yann and I had a discussion right after I
> submitted the patch,
> and I bring this argument:
> 
> As a person who is actively developing a project on libpjsip, I have a
> few arguments
> as to why I wanted to go this route:
> 
> 1) Unlike smaller packages, libpjsip is pretty big, with a ton of
> options, so having a bunch
> of dependencies enabled if the user just so happens to have other
> options enabled would
> be a bit awkward instead of going for just a small option that selects
> the dependency for you.

 This argument would be true for most packages so I don't think it's valid. And
by making it explicit options, you get the reverse effect: Buildroot users are
used to selecting some libraries and then expect all other packages that can use
those libraries to actually use them. Of course, that's a much smaller impact
(usually when you enable a package you'll immediately see which suboptions you
want to enable as well).


> 2) Fine grain control is easier for the codecs as I don't want to
> enable all the codecs and support
> them.  With the product I am developing, I really don't want L16/iLBC
> enabled, mainly because
> no customer I know of want, have requested, or use them, and having
> them enabled by default would
> be a hassle (although I could just create a patch for my build as well. :] )

 On IRC you gave an even better reason: if you want to do runtime enumeration of
supported codecs (which you actually do want to do), more codecs means more
runtime and also more application development time. So that's a very good reason
to make it optional. Make sure you add that to the commit message.


>>  Finally, specifically about sound: does this option make sense if no sound
>> backend is selected?
>>
> Well, it compiles.  The reason I did this, was because I can allow
> this option to de-select "--disable-sound"
> then the next options are for oss/alsa/portaudio.  I am sure there are
> better ways, but I am not super great
> at .mk files.

 Discussed on IRC, it's not simple :-)

> 
>>> +
>>> +endif # BR2_PACKAGE_LIBPJSIP
>>> +
>>>  comment "libpjsip needs a toolchain w/ C++, threads"
>>>       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>>> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
>>> index c772d4117a..a9d4ed4ed0 100644
>>> --- a/package/libpjsip/libpjsip.mk
>>> +++ b/package/libpjsip/libpjsip.mk
>>> @@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
>>>       CFLAGS="$(LIBPJSIP_CFLAGS)"
>>>
>>>  LIBPJSIP_CONF_OPTS = \
>>> -     --disable-sound \
>>>       --disable-gsm-codec \
>>>       --disable-speex-codec \
>>>       --disable-speex-aec \
>>> @@ -68,4 +67,8 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
>>>  LIBPJSIP_DEPENDENCIES += util-linux
>>>  endif
>>>
>>> +ifneq ($(BR2_PACKAGE_LIBPJSIP_SOUND),y)
>>
>>  We prefer to use ifeq ($(BR2_PACKAGE_LIBPJSIP_SOUND),)
>>
>>  However, why not do --enable-sound? You mention something for the codecs, does
>> that also apply here?
>>
> Yes, no --enable-sound, only --disable-sound.

 Discussed on IRC: most --enable options actually disable it. Needs a comment in
the .mk file to explain that.


 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
