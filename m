From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 22 Jan 2015 23:13:30 +0100
Subject: [Buildroot] [PATCH try 4] wine: New package
In-Reply-To: <20150121233549.GN4375@free.fr>
References: <54BED214.6080601@dawncrow.de> <20150121233549.GN4375@free.fr>
Message-ID: <54C1760A.5010802@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.01.2015 um 00:35 schrieb Yann E. MORIN:
> Andr?, All,
> 
> On 2015-01-20 23:09 +0100, Andr? Hentschel spake thusly:
>> Adds new package: wine
> 
> Sorry for jumoing late in the wagon, but here are some minor comments...

Hi Yann,

Thx for the review!

>> +comment "wine needs a (e)glibc toolchain w/ IPv6, threads"
>> +	depends on BR2_i386 || BR2_x86_64
>> +	depends on BR2_TOOLCHAIN_BUILDROOT
> 
> Did you forget to remove that dependency for the comment?

yes, thx

>> +# Wine needs the host tupel of the external toolchain for cross compiling
>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),)
>> +	WINE_CONF_OPTS += --host=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
>> +endif
> 
> I know this has already been discussed at length on the list, but it
> really warrants a bit more explanations here.

sure, done

>> +ifeq ($(BR2_PACKAGE_CUPS),y)
>> +	WINE_CONF_OPTS += --with-cups
>> +	WINE_DEPENDENCIES += cups
>> +else
>> +	WINE_CONF_OPTS += --without-cups
>> +endif
> 
> I do appreciate that you did all that work to enable/disable optional
> features. That's a great work! :-)
> 
> However, for very complex packages, my opinion is that it is much
> simpler to review and test (and write!) a new complex package with
> everything disabled. It makes for smaller patches to review, and faster
> builds to test. Then, new features can be added one by one in subsequent
> patches, once the core has been upstreamed.
> 
> Note that I do not ask you to remove that, jsut keep it. Just suggesting
> that in case you're fool^Wbold enough to try packaging some other big
> stuff  in the future! Hehe! ;-)

:D
honestly i'd have a project in mind...

> [--SNIP--]
>> +HOST_WINE_CONF_OPTS += \
>> +	--disable-tests \
>> +	--disable-win16 \
> [--SNIP--]
>> +	--without-xxf86vm \
>> +	--without-zlib
> 
> Like you disabled everthing here.

added a comment for this now, too. as it has its reason.


>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
> 
> I haven't much more to say, I'll try to have some time this WE to have a
> further look.

cool, i'll send try 5 as soon as i tested it
