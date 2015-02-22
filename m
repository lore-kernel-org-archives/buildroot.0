From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 22 Feb 2015 21:57:36 +0100
Subject: [Buildroot] [PATCH v7] wine: New package
In-Reply-To: <20150222204207.GG4016@free.fr>
References: <54E63769.1050208@dawncrow.de> <20150222204207.GG4016@free.fr>
Message-ID: <54EA42C0.9010608@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 22.02.2015 um 21:42 schrieb Yann E. MORIN:
> Andr?, All,
> 
> On 2015-02-19 20:20 +0100, Andr? Hentschel spake thusly:
>> Adds new package: wine
> [--SNIP--]
>> diff --git a/package/wine/Config.in b/package/wine/Config.in
>> new file mode 100644
>> index 0000000..9ac0a83
>> --- /dev/null
>> +++ b/package/wine/Config.in
>> @@ -0,0 +1,24 @@
>> +config BR2_PACKAGE_WINE
>> +	bool "wine"
>> +	depends on BR2_INET_IPV6
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> 
> Glibc implies IPv6 and threads, so depending on glibc is enough.

fixed locally, will be in v8, waiting for more comments first

> [--SNIP--]
>> diff --git a/package/wine/wine.hash b/package/wine/wine.hash
>> new file mode 100644
>> index 0000000..2c1ab61
>> --- /dev/null
>> +++ b/package/wine/wine.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed
>> +sha256 f0ab9eede5a0ccacbf6e50682649f9377b9199e49cf55641f1787cf72405acbe wine-1.6.2.tar.bz2
> 
> Weird... I had a local copy of wine-1.6.2 and it had a different sha256:
>     0f46dd29b278a3352206b49680f0ac3bfa107e65cb40cb4af51c137f0ebeb271
> 
> So Buildroot re-downloaded it, and now tthe sha256 you provides is OK.
> 
> Also, SF provides a sha1:
>     574b9ccedbf213622b7ee55f715764673fc27692

fixed locally, will be in v8, waiting for more comments first

>> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
>> new file mode 100644
>> index 0000000..0f72be5
>> --- /dev/null
>> +++ b/package/wine/wine.mk
>> @@ -0,0 +1,293 @@
>> +################################################################################
>> +#
>> +# wine
>> +#
>> +################################################################################
>> +
>> +WINE_VERSION = 1.6.2
>> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
>> +WINE_SITE = http://downloads.sourceforge.net/project/wine/Source/
>> +WINE_LICENSE = LGPLv2.1+
>> +WINE_LICENSE_FILES = COPYING.LIB LICENSE
>> +WINE_DEPENDENCIES = host-bison host-flex host-wine
>> +
>> +# Wine needs its own directory structure and tools for cross compiling
>> +WINE_CONF_OPTS = \
>> +	--with-wine-tools=../host-wine-$(WINE_VERSION) \
>> +	--disable-tests \
>> +	--disable-win64 \
>> +	--without-opengl
>> +
>> +# Wine uses a wrapper around gcc, and uses the value of --host to
>> +# construct the filename of the gcc to call.
>> +# But for external toolchains, we may have a discrepancy between the
>> +# tuple, GNU_TARGET_NAME, that we construct from our internal
>> +# variables, and the gcc prefix for the external toolchain.
>> +# So, we have to iverride whatever the gcc wrapper believes what the
>> +# reall gcc is named, and force the tuple of the external toolchain,
>> +# not the one we compute in GNU_TARGET_NAME.
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
>> +	WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
> 
> We usually do not indent the variable assignements in conditional
> blocks.

I've seen it that way (same goes for the dependencies checking) and i think it's much nicer that way...
Is this minor enough to keep it that way?

> I'm doing a few test builds, and will respin an amended version of this
> patch.

no need for a respin, your comments will simply end up in v8

> Thanks very much for the hard initial work! :-)

np :)
