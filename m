From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 27 Feb 2014 07:11:21 +0100
Subject: [Buildroot] ipv6 and eglibc
In-Reply-To: <20140218094655.27e2a040@skate>
References: <53031C60.6020803@gmail.com> <20140218094655.27e2a040@skate>
Message-ID: <530ED709.2090409@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas,
here my current package files of postres:

Config.in
config BR2_PACKAGE_POSTGRES
     bool "postgres"
     depends on BR2_INET_IPV6
     help
      Postgres SQL server

comment "postgres requires a toolchain with IPV6 support enabled"
     depends on !BR2_INET_IPV6

postgres.mk
POSTGRES_VERSION=9.3.2
POSTGRES_SOURCE=postgresql-$(POSTGRES_VERSION).tar.gz
POSTGRES_SITE=http://ftp.postgresql.org/pub/source/v$(POSTGRES_VERSION)/($POSTGRES_SOURCE)
POSTGRES_CONF_OPT=--with-system-tzdata=/usr/share/zoneinfo
POSTGRES_DEPENDENCIES=readline zlib

$(eval $(autotool-package))


I added the source item in the main Config.in and I selected the 
"postgres" package in the nconfig menu.
However, I can't see any reference to it neither in the Makefile nor in 
the build directory (of course after a make clean all cycle).

I read the guide at the autotools-based packages but it seems it doesn't 
try at all to download and compile it. What should I check to be sure 
buildroot understand it has to?

By the way my .config file contains the following:

BR2_PACKAGE_POSTGRES=y


Thanks!
Marco




Il 18/02/2014 09:46, Thomas Petazzoni ha scritto:
> Dear Marco Trapanese,
>
> On Tue, 18 Feb 2014 09:40:00 +0100, Marco Trapanese wrote:
>
>> I'm trying to add the postgres package, starting with this hints:
>>
>> http://www.slideshare.net/jerome42/create-lightweight-docker-containers-with-buildroot
>>
>> I'm using the eglibc in order to enable the eglsf support for Qt5.
>> Postgresql requires the BR2_TOOLCHAIN_BUILDROOT_INET_IPV6.
>>
>> Searching for this keyword I see this:
>>
>> Symbol: BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 [=n] ?
>> Type : boolean
>> Prompt: Enable IPv6 support
>> Location:
>> -> Toolchain
>> Defined at package/uclibc/Config.in:70
>> Depends on: BR2_TOOLCHAIN_BUILDROOT [=y] &&
>> BR2_TOOLCHAIN_BUILDROOT_UCLIBC [=n]
>> Selects: BR2_INET_IPV6 [=y] ?
>>
>> I guess because I'm using eglibc instead of uclibc.
> This is because what J?r?me (who happens to be my cousin) did was
> not completely correct (and I've Cc'ed J?r?me so he gets this
> feedback!).
>
> Having a dependency on BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 in a package
> is incorrect, as it only works with the internal toolchain backend,
> when building uClibc toolchains.
>
> Instead, he should have read the great Buildroot documentation at
> http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options :-)
>
> So, Marco, just modify the line:
>
> 	depends on BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
>
> by:
>
> 	depends on BR2_INET_IPV6
>
> Also, please submit patches to add Postgresql support. Instead of
> having people following the not-completely correct tutorial of J?r?me,
> we would have Postgresql support in Buildroot itself.
>
> Thanks!
>
> Thomas
