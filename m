From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Apr 2016 01:24:19 +0200
Subject: [Buildroot] [PATCH v6] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <CAGkQfmN+a=ZOxM94uOdK_EK-LM1B0W9Crji8oA4Fjq2mEZUPEg@mail.gmail.com>
References: <1461146052-13261-1-git-send-email-romain.izard.pro@gmail.com>
 <20160421224719.GA3426@free.fr>
 <CAGkQfmN+a=ZOxM94uOdK_EK-LM1B0W9Crji8oA4Fjq2mEZUPEg@mail.gmail.com>
Message-ID: <571AB2A3.7010607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/16 15:51, Romain Izard wrote:
> Yann, all,
>
> 2016-04-22 0:47 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
>>
>> Ok, so... Well... Err...
>>
>> Could you respin v4 of the patch, the one that used something like:
>>
>>      make oldnoconfig || (yes "" |make oldconfig)
>>
>> please? ;-)
>>
>> OK, what's wrong with my proposal? It works in an unconfigured tree.
>> But as soon as the tree is configured, it breaks, notably with older
>> kernels, like 3.0.
>>
>>      $ cd linux-3.0
>>      $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
>>      [nothing]
>>      $ touch .config
>>      $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
>>      olddefconfig: scripts_basic outputmakefile FORCE
>>
>> But 3.0 does not have olddefconfig. It's jsut the %config generic rule
>> kicking in. So we'd believe there would be support for olddefconfig
>> (or oldnoconfig) when there isn't.
>>
>> So, I have to apologise for the delusion. Your v4 is the best we can
>> do.
>
> After some more testing, I believe it should work. I've tested the
> following command on the latest commit for all stable branches since
> 2.6.11, and I can reliably detect which targets are supported. Moreover,
> I have the same output whether I touched .config or not.
>
> make -pn O=dir config 2>/dev/null | grep -oE '^old(no|def)config:'

  This indeed seems to work reliably.

  Yann discovered that when you run exactly the same command twice you get 
different results [1]. But that's because he uses .DEFAULT as the target instead 
of config. The problem in that case is that oldno/defconfig don't appear in the 
top-level Makefile, so they won't be printed. Only the first time it is printed, 
because of include/config/auto.conf: this is include'd in the Makefile so it 
will be regenerated (because of the include/config/%.conf: $(KCONFIG_CONFIG) 
include/config/auto.conf.cmd dependency), which calls the sub-make in 
scripts/kconfig, which does have the olddefconfig target so it is printed. The 
second time, auto.conf is newer than .config so it is not regenerated, so the 
olddefconfig target is not printed.

  Using config as the target elegantly solves that because it forces calling the 
submake in scripts/kconfig.

  So yes, you v6 would work I think.

  However, I think we (= Yann and I) mentioned at some point that we preferred 
everything in one command, using grep instead of filter. Or was there a 
counter-argument against that?


>
> I believe the problem with your tests is that you try to use both '-q'
> and '-n', while GNU Make's manual states (Chapter 9.3, Instead of
> executing recipes) that:
>
> "It is an error to use more than one of these three flags [-t -q -n] in
> the same invocation of 'make'."

  I think the issue is that -q doesn't cause calling sub-make's, ever. That's 
because it's not needed: if a sub-make is going to be called, something is going 
to be run so it can return 1 immediately without actually calling the sub-make. 
So with -q it is in fact guaranteed never to print an olddefconfig.


  Regards,
  Arnout


[1] http://code.bulix.org/qwcju4-97419?raw

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
