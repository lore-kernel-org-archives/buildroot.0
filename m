From: Robert Urban <urban@unix-beratung.de>
Date: Mon, 17 May 2010 16:22:54 +0200
Subject: [Buildroot] libintl.h: need a hint or two
In-Reply-To: <4BF11874.5080405@unix-beratung.de>
References: <4BF06BBD.4020908@unix-beratung.de> <20100517085520.586c2c8d@surf>
	<4BF11874.5080405@unix-beratung.de>
Message-ID: <4BF1513E.5040200@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll answer my own question...


adding

	FLEX_DEPENDENCIES:=gettext libintl

to .../package/flex/flex.mk  seems to have fixed my problem.

cheers,

Rob Urban

On 05/17/2010 12:20 PM, Robert Urban wrote:
> Hi Thomas,
> 
> On 05/17/2010 08:55 AM, Thomas Petazzoni wrote:
>> On Mon, 17 May 2010 00:03:41 +0200
>> Robert Urban <urban@unix-beratung.de> wrote:
>>
>>> I'm trying to build a router/firewall system.  Thus I've chosen the ipsec-tools
>>> and radvd packages.
>>>
>>> These in turn have a dependency on flex.  The flex compile is failing with the
>>> following error, when compiling "dfa.c":
>>>
>>> In file included from flexdef.h:102,
>>>                  from ccl.c:34:
>>> gettext.h:26:22: error: libintl.h: No such file or directory
>>>
>>> And it's right, there is no "libintl.h" under .../staging/usr/include/...
>>>
>>> Please correct me if I'm wrong, but it seems I can only get libintl.h by turning
>>> on first UCLIBC_MJN3_ONLY and then UCLIBC_HAS_GETTEXT_AWARENESS, but if
>>> UCLIBC_MJN3_ONLY is enabled, I get slews of other errors...
>>>
>>> I guess I'm doing something wrong.  Can someone help?
>>
>> Do you have the full build log available somewhere and the .config file
>> you are using ?
>>
>> In general, when using a uClibc toolchain, gettext/libintl must be
>> compiled separatly from the C library by using the BR2_PACKAGE_GETTEXT
>> package of Buildroot. So, either flex should depend on it, or it's
>> because the configure cache has been loaded with incorrect
>> informations. Only the full build log can tell.
> 
> as you can see, gettext and libintl are auto-selected by my other choices:
> 
> (config-file):
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_LIBINTL=y
> 
> The build log can be found at:
> http://www.spielwiese.de/rob/Buildroot/build.log.gz
> 
> and the config at:
> http://www.spielwiese.de/rob/Buildroot/config
> 
> After my last mail I thought I might have some problem with left-over files, so
> I did a "make distclean" and did another build, but the result is the same.
> 
> I git cloned the buildroot environment on the 13th of May, and haven't updated
> it since.
> 
> I would be grateful if you could have a look.
> 
> cheers,
> 
> Rob Urban
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
