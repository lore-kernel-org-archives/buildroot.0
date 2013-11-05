From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Nov 2013 19:46:32 +0100
Subject: [Buildroot] [PATCH] Config.in files: add missing dependencies
 to toolchain option comments
In-Reply-To: <CAAXf6LVBhazVTKdHzTOkMGHUpznACrA8qudWJc6th8p9q9ZtHA@mail.gmail.com>
References: <8d0042dacf31b1e0dfa1.1383551780@argentina>
 <52781123.9020601@mind.be>
 <CAAXf6LVBhazVTKdHzTOkMGHUpznACrA8qudWJc6th8p9q9ZtHA@mail.gmail.com>
Message-ID: <52793D08.1030107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/13 09:45, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> Thanks for your review.
>
> On Mon, Nov 4, 2013 at 10:26 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 04/11/13 08:56, Thomas De Schampheleire wrote:
>>>
>>> When a package A depends on B and toolchain option C, then the comment
>>> that
>>> is given when C is not fulfilled should also depend on B. For example:
>>>
>>> config BR2_PACKAGE_A
>>>          depends on BR2_PACKAGE_B
>>>          depends on BR2_LARGEFILE
>>>          depends on BR2_WCHAR
>>>
>>> comment "A needs a toolchain w/ largefile, wchar"
>>>          depends on !BR2_LARGEFILE || !BR2_WCHAR
>>>
>>> This comment should actually be:
>>>
>>> comment "A needs a toolchain w/ largefile, wchar"
>>>          depends on BR2_PACKAGE_B
>>>          depends on !BR2_LARGEFILE || !BR2_WCHAR
>>
>>
>>   Actually, _most_ of the fixes you make here are for architecture options,
>> not package dependencies. Not that that matters much... except that I don't
>> really agree with making this change for package dependencies.
>>
>>   For package dependencies, I much prefer to if...endif construct because
>> this draws the attention to the fact that the whole Config.in is disabled
>> when the dependent package isn't selected. But I guess it's mostly a matter
>> of taste anyway.
>
> If the dependency is on the package that the comment is for, then I
> agree that if-endif is nicer. I will fix those cases. For other
> dependencies, for example the xorg or libgtk2 ones, it's not possible
> to do it this way.
>
>> Hm, maybe even moving all the arch and package dependencies
>> to a global if...endif would be a good idea.
>
> Not sure what you mean. Do you mean the trick ThomasP recently pulled
> on the webkit package?
> config BR2_PACKAGE_FOO_SUPPORTED
>          bool
>          depends on !avr32
>          depends on BR2_PACKAGE_XORG7
>
> and then have the comment ?nd the real config depend on this option?

  No, I mean to put it at the beginning and the end of the entire 
Config.in file. E.g. for dbus-python:

if BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON

config BR2_PACKAGE_DBUS_PYTHON
         bool "dbus-python"
         depends on BR2_USE_WCHAR # glib2
         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
         select BR2_PACKAGE_DBUS_GLIB
         help
           Python bindings for D-Bus

           http://dbus.freedesktop.org/doc/dbus-python/

comment "dbus-python needs a toolchain w/ wchar, threads"
         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

endif


  For packages, I like the way it draws attention to the fact that this 
is a package that augments something else. But a second advantage that it 
avoids the need to repeat the condition in the comment, so if this 
pattern is followed in general (also in cases when there is no comment), 
that will guarantee that the comment has proper dependencies. On the 
other hand, for things like MMU it maybe looks a little ugly.

>
>>
>>
>>   Even though I have a bunch of comments, the patch is good as it is (and
>> also a bit fragile because of the large number of changes),
>
> Would you prefer me to split it up in some way?
> I could split it per package, but do realize it will be a very large
> number of patches (currently 162 files have changed). Alternatively I
> can arbitrarily split it, for example in groups of 20 by alphabet?

  Splitting up doesn't help. With fragile, I mean: because it makes 
changes all over the place, there is a risk that there will be conflicts 
with other patches or that other patches introduce new violations of the 
pattern. So I don't mean that it is risky as of now, but it is risky if 
it is takes a long time before it's committed.


[snip]
>>> diff --git a/package/gstreamer/gst-ffmpeg/Config.in
>>> b/package/gstreamer/gst-ffmpeg/Config.in
>>> --- a/package/gstreamer/gst-ffmpeg/Config.in
>>> +++ b/package/gstreamer/gst-ffmpeg/Config.in
>>> @@ -14,4 +14,5 @@ config BR2_PACKAGE_GST_FFMPEG
>>>            http://gstreamer.freedesktop.org/
>>>
>>>    comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
>>> +       depends on BR2_PACKAGE_GSTREAMER
>>>          depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
>>
>>
>>   There are a few more in the gstreamer/ directory that could be rewritten.
>> But here as well, I would prefer an if...endif in gstreamer/Config.in.
>
> You mean something like:
>
> ------
> source "package/gstreamer/gstreamer/Config.in"
>
> if BR2_PACKAGE_GSTREAMER
> source "package/gstreamer/gst-plugins-base/Config.in"
> source "package/gstreamer/gst-plugins-good/Config.in"
> source "package/gstreamer/gst-plugins-bad/Config.in"
> source "package/gstreamer/gst-plugins-ugly/Config.in"
> source "package/gstreamer/gst-ffmpeg/Config.in"
> source "package/gstreamer/gst-dsp/Config.in"
> source "package/gstreamer/gst-fsl-plugins/Config.in"
> source "package/gstreamer/gst-omapfb/Config.in"
> source "package/gstreamer/gst-plugin-x170/Config.in"
> endif
>
> and then remove all the other 'depends on BR2_PACKAGE_GSTREAMER' from
> the sourced Configs?

  Exactly.

>
> While I think it is a good idea, I think it's outside of the scope of
> this patch.

  Indeed - one of the reasons that I acked it :-)


  Regards,
  Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
