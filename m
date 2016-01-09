From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sat, 9 Jan 2016 13:56:06 +0100
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
In-Reply-To: <569051BF.70209@mind.be>
References: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
 <568EB85E.3090501@zacarias.com.ar>
 <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
 <568ECC28.50704@zacarias.com.ar> <569051BF.70209@mind.be>
Message-ID: <CA+sos78-UX4YD5WeO3qr4ahn+5iN33hX2pr2koiT9JtekdA8uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 9, 2016 at 1:18 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07-01-16 21:35, Gustavo Zacarias wrote:
>> On 07/01/16 17:30, Beno?t Th?baudeau wrote:
>>
>>> I had started to look into this a few months ago, and setting
>>> --with-libbind=PATH to use the bind provided by Buildroot seemed to be
>>> a better option (in order to avoid possibly installing two instances
>>> of bind on the target, either standalone or inside the dhcp binaries
>>> if statically linked, and both bind versions were compatible at that
>>> time), though I have not yet tested it.
>>
>> Hi Beno?t.
>> Let me save you some time, it doesn't work as expected.
>> I've tried pointing that into the bind build directory (because it needs some
>> specific *.a files that i think aren't installed, besides another problem) but
>> no luck, since it stills expects that to live in it's own build directory, try
>> in dhcp's source dir:
>>
>> find . -name Makefile.am -exec grep --with-filename ../bind/lib {} \;
>>
>> ...and you'll see the drastic results.
>>
>> Even so with that fixed the bind package will need to get tweaked as well, since
>> if you build shared-only you won't get those intermediate libraries built, and
>> hence dhcp will fail as well.
>>
>> All in all, it seems pretty broken.
>
>  Given this brokenness, and that there are better alternatives, perhaps we
> should kill the dhcp package? Or is it useful as a server? In the latter case,
> we should add a warning to the ifupdown help text.
>
>  BTW, I guess busybox ifupdown does work?

A few months ago, 4.1-ESV-R12 had an EoL date set to Dec. 2015 on
https://www.isc.org/downloads/, but now it is TBA. It probably means
that they did not have a chance to finalize the deprecation of 4.1 in
Dec. 2015, and that they are rescheduling it, but that it will come
soon. Also, several distributions like Ubuntu have already switched to
4.3.x, and this version seems to fix the ifupdown 0.8.2 issue
according to what has been previously said in this thread. Regarding
the build, Gustavo has said above that it is broken with a bind
external to the dhcp package, but it should hopefully work fine with
the built-in bind.

All in all, we should probably bump the version to 4.3.3 rather than
killing this package.

Best regards,
Beno?t
