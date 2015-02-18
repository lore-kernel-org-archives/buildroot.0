From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Wed, 18 Feb 2015 22:34:41 +0100
Subject: [Buildroot] [PATCH try 5] wine: New package
In-Reply-To: <20150129225237.GB4213@free.fr>
References: <54C2C70E.3020700@dawncrow.de> <20150129214622.GA4213@free.fr>
 <20150129225237.GB4213@free.fr>
Message-ID: <54E50571.5060003@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm about to send v6, some comments on the feedback of try 5:

Am 29.01.2015 um 22:46 schrieb Yann E. MORIN:> Andre, All,
> 
> On 2015-01-23 23:11 +0100, Andr? Hentschel spake thusly:

>> +	# Wine has much CPU specific code and mostly makes sense on x86
>> +	depends on BR2_i386
> 
> Well, x86_64 is not the same as i386 in Buildroot. So this makes Wine
> really available only on i386 (the 32-bit variant).
> 
> Is that what you really wanted to do?
> 
> Otherwise, maybe change to:
>     depends on BR2_i386 || BR2_x86_64

Yes, as you recognized later, Wine only makes sense on x86_64  when built as 64-bit AND 32-bit, not as 64-bit only.

>> +	help
>> +	  Wine is a compatibility layer capable of running
>> +	  Windows applications on Linux. Instead of simulating internal
>> +	  Windows logic like a virtual machine or emulator,
>> +	  Wine translates Windows API calls into POSIX calls on-the-fly,
>> +	  eliminating the performance and memory penalties of other methods.
> 
> Formatting is a bit off. Try to get lines all about the same width.

done

>> +WINE_LICENSE = LGPLv2.1+
>> +WINE_LICENSE_FILES = COPYING.LIB
> 
> Adding the file LICENSE would be good, too. LICENSE.OLD is not
> necessary, though.
> 
>> +WINE_INSTALL_TARGET = YES
> 
> Unneeded, that's the default.

done

>> +# Wine needs its own directory structure and tools for cross compiling
>> +WINE_CONF_OPTS = \
>> +	--with-wine-tools=../host-wine-$(WINE_VERSION) \
>> +	--disable-tests \
>> +	--disable-win64 \
> 
> So, I've had a look at what --{en,dis}able-win64 means. From what I
> understand, if you --enable-win64, you get a 64-bit-only build,
> incapable of running win32 binaries. Conversely, if you --disable-win64,
> you get a 32-bit-only build, incapable of running win64 binaries.
> 
> Right?
> 
> That's a bit unfortunate, since on a 64-bit target, it might well be
> legit for a user to want to run win32 *and* win64 binaries. But it is
> not possible to ahve Wine build both at the same time. Pity... :-(

that's what i mean, maybe we find a solution in the future, but not now

>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),)
> 
> We prefer positive logic:
>     ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)

done

> This allows us to keep our stndard --host value, and just overrides the
> -b option passed to the gcc wrapper.
> 
> Care to test that on your side, please?

i tested it and it works like a charm, thanks for this great idea



Am 29.01.2015 um 23:52 schrieb Yann E. MORIN:
> Andr?, All,
> 
> On 2015-01-29 22:46 +0100, Yann E. MORIN spake thusly:
>> On 2015-01-23 23:11 +0100, Andr? Hentschel spake thusly:
>>> Adds new package: wine
>>>
>>>   Wine is a compatibility layer capable of running Windows applications on Linux.
>>>
>>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
> I also managed to greatly improve the build time, by selectively bulding
> only the host tools:
> 
>     # Wine only needs the host tools to be built, so cut-down the
>     # build time by building just what we need.
>     define HOST_WINE_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) tools tools/widl tools/winebuild \
>                 tools/winedump tools/winegcc tools/wmc tools/wrc
>     endef
> 
>     # Wine only needs its host variant to be built, not that it is
>     # installed, as it uses the tools from the build directory. But
>     # we have no way in Buildroot to state that a host package should
>     # not be installed. So, just provide an noop install command.
>     define HOST_WINE_INSTALL_CMDS
>         :
>     endef
> 
> There is no reason to build the full host variant, when we are only
> interested in the tools. And among those I select above, some might even
> not be needed; I'll leave that to you to decide if we can trim that list
> even further down. ;-)

done, i just changed formatting and removed winebuild

> And off am I, FOSDEM week-end incoming! :-)
> 

Hope you had a lot of fun! :)
