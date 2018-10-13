From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2018 17:32:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: new
 package
In-Reply-To: <CA+Vb7hoNNWVaOMvjXtUnkVOZGENuZsjCHWQOz8Ck_gY9fC-jkg@mail.gmail.com>
References: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
 <20181011211929.22af5bfc@windsurf>
 <CA+Vb7hrYyCfVAq=nk8a9GfGW10Fatw3WXZ5=wsJuVqba6MPnYg@mail.gmail.com>
 <CA+Vb7hoNNWVaOMvjXtUnkVOZGENuZsjCHWQOz8Ck_gY9fC-jkg@mail.gmail.com>
Message-ID: <2ebe70b1-8f10-a629-d407-56eb37c2f07c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/18 10:25, Philipp Richter wrote:
> CC to buildroot mailing list which somehow didn't go through.
> 
> On Fri, 12 Oct 2018 at 10:20, Philipp Richter
> <richterphilipp.pops@gmail.com> wrote:
>>
>> On Thu, 11 Oct 2018 at 21:19, Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
[snip]
>>> On Tue, 11 Sep 2018 10:50:23 +0200, Philipp Richter wrote:
[snip]
>>>> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_POOL_ALLOCATORS
>>>> +     bool "Pool allocators"
>>>> +     default y
>>>> +     help
>>>> +       Enable pool allocators for send buffers using boost::pool<>.
>>>> +
>>>> +       Default: yes
>>>
>>> And this ?
>>>
>>
>> I guess we can use package default of them being on ?

 Yes, sounds good.

>>>> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS
>>>> +     bool "Invariant checks"
>>>> +     default y
>>>> +     depends on BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
>>>> +     help
>>>> +       Enable invariant checks.
>>>> +
>>>> +       Default: yes
>>>
>>> This clearly seems like a developer-oriented option, I don't think we
>>> should support it in Buildroot.
>>>
>>
>> That's is true, here's the thing though : if debug is enabled they
>> will be switched on automatically and make the library much slower.
>> They can be forced off to have the library with debugging information
>> without expensive checks.
>> I guess we can go with the default behaviour, the other side of the
>> coin is that he/she might be left scratching their head about the
>> slowness.

 Better just pass --disable-invariant-checks unconditionally. And add the above
explanation in the commit log.

[snip]
>>>> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEPRECATED_FUNCTIONS
>>>> +     bool "Deprecated functions"
>>>> +     default y
>>>> +     help
>>>> +       Enable deprecated functions in the API.
>>>> +
>>>> +       Default: yes
>>>
>>> Ditto, why would we want this option ?
>>>
>>> In general, it feels like you have taken every --enable/--disable of
>>> the configure script, and added a Buildroot Config.in option for each
>>> of them. I don't think we necessarily want to support each and every
>>> configuration option of the upstream package.
>>>
>>
>> Yes, that makes sense. Like the internal symbols option it was also
>> with the idea of "Maybe an application depends on those symbols?"
>> But then the developer would override the makefile themselves anyway I guess.

 It's a bit unlikely that an application that is not in Buildroot yet would
depend on those deprecated symbols.

[snip]
>> Right, thank you for all these hints and comments. I'll rework this,
>> leave more to the package's defaults.

 For the defaults, we generally prefer to add explicit disable options. It
depends a bit though. Like e.g. the deprecated functions is something that we
might just leave at the package default (i.e. no explicit option). But something
like --disable-tests we generally do explicitly. There is no really strict rule
(AFAIK).

 Regards,
 Arnout

>>
>> Best Regards,
>> Philipp Richter
>>
>>>
>>> Best regards,
>>>
>>> Thomas
>>> --
>>> Thomas Petazzoni, CTO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
