From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Nov 2013 09:45:45 +0100
Subject: [Buildroot] [PATCH] Config.in files: add missing dependencies
 to toolchain option comments
In-Reply-To: <52781123.9020601@mind.be>
References: <8d0042dacf31b1e0dfa1.1383551780@argentina>
 <52781123.9020601@mind.be>
Message-ID: <CAAXf6LVBhazVTKdHzTOkMGHUpznACrA8qudWJc6th8p9q9ZtHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your review.

On Mon, Nov 4, 2013 at 10:26 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/11/13 08:56, Thomas De Schampheleire wrote:
>>
>> When a package A depends on B and toolchain option C, then the comment
>> that
>> is given when C is not fulfilled should also depend on B. For example:
>>
>> config BR2_PACKAGE_A
>>         depends on BR2_PACKAGE_B
>>         depends on BR2_LARGEFILE
>>         depends on BR2_WCHAR
>>
>> comment "A needs a toolchain w/ largefile, wchar"
>>         depends on !BR2_LARGEFILE || !BR2_WCHAR
>>
>> This comment should actually be:
>>
>> comment "A needs a toolchain w/ largefile, wchar"
>>         depends on BR2_PACKAGE_B
>>         depends on !BR2_LARGEFILE || !BR2_WCHAR
>
>
>  Actually, _most_ of the fixes you make here are for architecture options,
> not package dependencies. Not that that matters much... except that I don't
> really agree with making this change for package dependencies.
>
>  For package dependencies, I much prefer to if...endif construct because
> this draws the attention to the fact that the whole Config.in is disabled
> when the dependent package isn't selected. But I guess it's mostly a matter
> of taste anyway.

If the dependency is on the package that the comment is for, then I
agree that if-endif is nicer. I will fix those cases. For other
dependencies, for example the xorg or libgtk2 ones, it's not possible
to do it this way.

> Hm, maybe even moving all the arch and package dependencies
> to a global if...endif would be a good idea.

Not sure what you mean. Do you mean the trick ThomasP recently pulled
on the webkit package?
config BR2_PACKAGE_FOO_SUPPORTED
        bool
        depends on !avr32
        depends on BR2_PACKAGE_XORG7

and then have the comment ?nd the real config depend on this option?

>
>
>  Even though I have a bunch of comments, the patch is good as it is (and
> also a bit fragile because of the large number of changes),

Would you prefer me to split it up in some way?
I could split it per package, but do realize it will be a very large
number of patches (currently 162 files have changed). Alternatively I
can arbitrarily split it, for example in groups of 20 by alphabet?

> so:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (untested)
>
>
[..]
>
>> diff --git a/package/alsamixergui/Config.in
>> b/package/alsamixergui/Config.in
>> --- a/package/alsamixergui/Config.in
>> +++ b/package/alsamixergui/Config.in
>> @@ -14,4 +14,5 @@ config BR2_PACKAGE_ALSAMIXERGUI
>>           http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
>>
>>   comment "alsamixergui needs a toolchain w/ C++, threads"
>> -       depends on (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS)
>> && BR2_PACKAGE_XORG7
>> +       depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
>> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>
>
>  I think there should be a 'depends on BR2_PACKAGE_XORG7' around all of the
> X libraries and applications. On the other hand, there are a few that don't
> actually depend on X (liberation fonts, xkeyboard-config), and there may be
> more in the future that can run on either X or wayland...

Yes, this area needs some attention. It's on my list, but I'll need
some help of others as I'm not familiar with X packages.

>
> [snip]
>
>> diff --git a/package/flex/Config.in b/package/flex/Config.in
>> --- a/package/flex/Config.in
>> +++ b/package/flex/Config.in
>> @@ -19,4 +19,5 @@ config BR2_PACKAGE_FLEX_BINARY
>>           Install the flex binary tool in the target filesystem.
>>
>>   comment "flex binary needs a toolchain w/ wchar"
>> +       depends on BR2_USE_MMU && BR2_PACKAGE_FLEX
>
>
>  This one should _definitely_ use an if...endif construct.

Agreed.

> [snip]
>
>> diff --git a/package/gstreamer/gst-ffmpeg/Config.in
>> b/package/gstreamer/gst-ffmpeg/Config.in
>> --- a/package/gstreamer/gst-ffmpeg/Config.in
>> +++ b/package/gstreamer/gst-ffmpeg/Config.in
>> @@ -14,4 +14,5 @@ config BR2_PACKAGE_GST_FFMPEG
>>           http://gstreamer.freedesktop.org/
>>
>>   comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
>> +       depends on BR2_PACKAGE_GSTREAMER
>>         depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
>
>
>  There are a few more in the gstreamer/ directory that could be rewritten.
> But here as well, I would prefer an if...endif in gstreamer/Config.in.

You mean something like:

------
source "package/gstreamer/gstreamer/Config.in"

if BR2_PACKAGE_GSTREAMER
source "package/gstreamer/gst-plugins-base/Config.in"
source "package/gstreamer/gst-plugins-good/Config.in"
source "package/gstreamer/gst-plugins-bad/Config.in"
source "package/gstreamer/gst-plugins-ugly/Config.in"
source "package/gstreamer/gst-ffmpeg/Config.in"
source "package/gstreamer/gst-dsp/Config.in"
source "package/gstreamer/gst-fsl-plugins/Config.in"
source "package/gstreamer/gst-omapfb/Config.in"
source "package/gstreamer/gst-plugin-x170/Config.in"
endif

and then remove all the other 'depends on BR2_PACKAGE_GSTREAMER' from
the sourced Configs?

While I think it is a good idea, I think it's outside of the scope of
this patch.

>
> [snip]
>
>> diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
>> --- a/package/zmqpp/Config.in
>> +++ b/package/zmqpp/Config.in
>> @@ -16,6 +16,7 @@ config BR2_PACKAGE_ZMQPP
>>           http://github.com/benjamg/zmqpp
>>
>>   comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar,
>> threads"
>> +       depends on !BR2_avr32
>>         depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
>> BR2_LARGEFILE \
>>                 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
>>
>> @@ -30,4 +31,5 @@ config BR2_PACKAGE_ZMQPP_CLIENT
>>           used to listen or send to zeromq sockets.
>>
>>   comment "zmqpp client needs a toolchain w/ threads"
>> -       depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
>> +       depends on BR2_PACKAGE_ZMQPP
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
>
>  This one should also use an if...endif.

Agreed.

Best regards,
Thomas
