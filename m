From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:46:22 +0200
Subject: [Buildroot] compiler plugins & compiling the kernel
In-Reply-To: <CAK7rcp9ZEKb7dYNv23E7NF52+u0vL67f3q1XozKK3jRy2dq=pA@mail.gmail.com>
References: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
 <20160820200119.4ec5848b@free-electrons.com>
 <CAK7rcp9SVrJ4HA3wH6U9P-Tv8EzJdBKUtZa=EVwihZTR5TCdtQ@mail.gmail.com>
 <CAK7rcp9ZEKb7dYNv23E7NF52+u0vL67f3q1XozKK3jRy2dq=pA@mail.gmail.com>
Message-ID: <84805825-f7d4-cfef-d83a-071a5a761ced@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-08-16 05:43, Kenneth Adam Miller wrote:
> On Sat, Aug 20, 2016 at 6:39 PM, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
>> On Sat, Aug 20, 2016 at 2:01 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Hello,
>>>
>>> On Sat, 20 Aug 2016 13:10:07 -0400, Kenneth Adam Miller wrote:
[snip]
>>>> In addition, for some pax related options, it requires gcc plugins for
>>>> the version being used. That means that I would have to have plugin
>>>> support for my host, correct?
>>>
>>> No, you would need support for plugins in the cross-compiler.
>>>
>>
>> We have been building gr-security modded kernels for some time on a
>> different machine with gcc 4.8, but I'm having this confusion; does
>> the buildroot internal compiler support that? Because I'm getting an
>> error in buildroot indicating that compiler plugins must be supported,
>> and I'm using the buildroot internal compiler with version 5.x, it
>> confused me a little bit.
>>
> 
> I found the exact output that brought about the build error.
> 
>>>> linux-headers 3.14.51 Configuring...
> ...
> make[2]: Entering directory ... build/linux-headers-3.14.51
> Makefile:652 *** Your gcc installation does not support plugins. If
> the necessary headers for plugin support are missing, they should be
> installed. On Debian, apt-get install gcc-<ver>-plugin-dev. If you
> choose to ignore this error and...

 Ah, this is annoying...

 When installing linux-headers, we don't pass the cross-compilation arguments,
because the cross-compiler doesn't exist yet at that point. So the installation
will use the host compiler instead for that check. Which is of course wrong.

 Well, actually it's a bug in gr-security, because this check shouldn't be done
for install_headers (gcc isn't even called).

> 
>>>> I don't believe that there is a way to
>>>> enable plugin support for the buildroot toolchain or for crosstool. At
>>>> least, when I looked and searched I didn't see any option that
>>>> mentioned that. I just want to make sure that I have it correct in
>>>> that my host compiler is being used to build the kernel.
>>>
>>> You're not correct. Support for plugins should be added to the
>>> cross-compiler if you need plugin support to build your kernel.
>>>
>>
>> That doesn't appear to be an option in buildroot.

 Well, we pass --enable-plugins when BR2_GCC_ENABLE_LTO is set. We don't pass
--disable-plugins so it really depends on the gcc defaults. But then, we don't
install the plugin development headers to HOST_DIR, so it will probably be
difficult to actually compile a plugin.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
