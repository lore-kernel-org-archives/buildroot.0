From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 04 Jun 2015 16:31:20 -0400
Subject: [Buildroot] [PATCH 2/3] lutok: new package
In-Reply-To: <556F7CFD.20301@mind.be>
References: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1433357276-7083-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <556F7CFD.20301@mind.be>
Message-ID: <5570B598.2010007@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 06/03/2015 06:17 PM, Arnout Vandecappelle wrote:
> On 06/03/15 20:47, Sebastien Bourdelin wrote:
>> Lutok is a lightweight C++ API library for Lua.
>>
>> https://github.com/jmmv/lutok
>>
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
>> ---
>>  package/Config.in       |  1 +
>>  package/lutok/Config.in | 11 +++++++++++
>>  package/lutok/lutok.mk  | 19 +++++++++++++++++++
>>  3 files changed, 31 insertions(+)
>>  create mode 100644 package/lutok/Config.in
>>  create mode 100644 package/lutok/lutok.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 78ed223..628f36c 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -457,6 +457,7 @@ endif
>>  	source "package/lua/Config.in"
>>  	source "package/luainterpreter/Config.in"
>>  	source "package/luajit/Config.in"
>> +	source "package/lutok/Config.in"
>>  if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
>>  # lua modules are dynamically loaded, so not available on static builds
>>  menu "Lua libraries/modules"
>> diff --git a/package/lutok/Config.in b/package/lutok/Config.in
>> new file mode 100644
>> index 0000000..b94c093
>> --- /dev/null
>> +++ b/package/lutok/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_LUTOK
>> +	bool "lutok"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>  Did you check if it works with luajit as well?
I just try now, and it does not, thanks!

>  Have you checked if it works with STATIC?
Yes

>> +	help
>> +	  Lutok is a lightweight C++ API library for Lua.
>> +
>> +	  https://github.com/jmmv/lutok
>> +
>> +comment "lutok needs a toolchain w/ C++"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>  This should also depend on BR2_PACKAGE_HAS_LUAINTERPRETER
Ok i was thinking you only want toolchain dependencies here.
Is it ok to write something like that:

comment "lutok needs a Lua 5.1 interpreter or above"
    depends on BR2_INSTALL_LIBSTDCPP && \
        (!BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_PACKAGE_LUAJIT)

>> diff --git a/package/lutok/lutok.mk b/package/lutok/lutok.mk
>> new file mode 100644
>> index 0000000..25f4070
>> --- /dev/null
>> +++ b/package/lutok/lutok.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# lutok
>> +#
>> +################################################################################
>> +
>> +LUTOK_VERSION = 740c34180384520086302f5e107ae0ae37a7e617
>  This is the uploaded 0.4 release, so you can use
>
> https://github.com/jmmv/lutok/releases/download/lutok-0.4/lutok-0.4.tar.gz
>
> instead, avoiding AUTORECONF, and making it possible to add a hash file.
Great thanks!

>> +LUTOK_SITE = git://github.com/jmmv/lutok
>> +LUTOK_AUTORECONF = YES
>> +LUTOK_INSTALL_STAGING = YES
>> +LUTOK_DEPENDENCIES = host-pkgconf lua
>  It seems to have an optional dependency on atf as well, so you need something like
>
> ifeq ($(BR2_PACKAGE_ATF),y)
> LUTOK_DEPENDENCIES += atf
> LUTOK_CONF_OPTS += --with-atf
> else
> LUTOK_CONF_OPTS += --without-atf
> endif
Ok.

>  Also it tries to use doxygen if available, we don't care about documentation so add
> LUTOK_CONF_OPTS = --without-doxygen
>
Ok.

>> +LUTOK_LICENSE = BSD
>  BSD-3c
Ok.

>> +LUTOK_LICENSE_FILES = COPYING
>> +
>> +ifneq ($(BR2_STATIC_LIBS),y)
>> +LUTOK_MAKE_OPTS = LIBS=-ldl
>  Is this really needed? The configure script should detect that automatically...
Doesn't seem to work without.

>  Regards,
>  Arnout
>
>> +endif
>> +
>> +$(eval $(autotools-package))
>>

Regards,
Sebastien.
