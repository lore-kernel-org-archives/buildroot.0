From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 10:36:04 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190307083655.w63mskl2fynzujoc@c-ml-p3510.redembedded.pl>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be> <20190305213858.GQ2721@scaer>
 <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
 <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be>
 <20190307083655.w63mskl2fynzujoc@c-ml-p3510.redembedded.pl>
Message-ID: <52694c26-a423-a4ec-bd01-f2d5a8433683@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/03/2019 09:36, michal.lyszczek at bofc.pl wrote:
> On 2019-03-06 10:58:09, Arnout Vandecappelle wrote:
>>
>>
>> On 06/03/2019 00:20, michal.lyszczek at bofc.pl wrote:
>>> Yann, Arnout
>>>
>>> First, thank you for your extensive review. Now to the point.
>>>
>>> On 2019-03-05 22:38:58, Yann E. MORIN wrote:
>>>> Micha?, Arnout,
>>>>
>>>> On 2019-03-04 19:59 +0100, Arnout Vandecappelle spake thusly:
>> [snip]
>>>>> On 28/02/2019 20:44, Micha? ?yszczek wrote:
[snip]
>>  So we found a way to get rid of the agetty dependency. Still, better do that in
>> a follow-up patch and keep the initial patch as simple as possible.
>>
>>  For sure, it should not be the openrc package itself that selects it, because
>> it is only needed if you actually want to use openrc to start a getty. So it
>> belongs to a skeleton package instead.
> 
> agetty is really not a dependency for openrc, it's just opnerc have chosen
> agetty as default tty opener just like busybox have chosen getty. Now that you
> told me to use skeleton - I really think best way is to get rid of agetty
> altogether and just use getty instead - spawned with custom getty service that
> will be put in skeleton.

 Yes obviously.

 I don't write my replies top-to-bottom, I do it topic by topic so sometimes
things get a little inconsistent.

 Still, I think you should split any such thing off in separate patches:

1. openrc package, clean and simple, no init scripts.
2. openrc as an init system (assuming no inittab is needed with openrc-init)
3. pkg-generic support for _INSTALL_INIT_OPENRC.
4. skeleton-init-openrc, empty.
5. skeleton-init-openrc getty support
6. skeleton-init-openrc legacy init script support
7. ...

[snip]
> I've looked into it more closely and openrc defines libname as "LIBNAME?="
> so it's really easy to override during compilation, and I can use already
> existing solution for determing lib version that is in system.mk
> 
> ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
>     OPENRC_MAKE_OPTS += LIBNAME=lib64
> else
>     OPENRC_MAKE_OPTS += LIBNAME=lib
> endif
> 
> That should do the trick without any patches I reckon.

 Good catch. Remember that we don't indent inside `make` conditions though.

 By the way, since lib64 is a symlink to lib, isn't an unconditional LIBNAME=lib
sufficient?


 Regards,
 Arnout
