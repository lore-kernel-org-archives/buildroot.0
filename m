From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 17 Mar 2021 21:30:17 +0100
Subject: [Buildroot] [PATCH v3] package/log4qt: new package
In-Reply-To: <20210316230623.2f346620@windsurf.home>
References: <20210217194959.1708700-1-b.bilas@grinn-global.com>
 <20210316230623.2f346620@windsurf.home>
Message-ID: <45ab441e-b0fe-102d-1fc0-f7cbd7b3e566@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 16.03.2021 23:06, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 17 Feb 2021 20:49:59 +0100
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> Log4Qt is a C++ port of the Apache Software Foundation
>> Log4j package using the Qt Framework.
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> Thanks for this contribution! I have applied, with a number of changes.
> See below.
>
>> Changes v1 -> v2:
>>   - bump version to 1.5.1
>>   - use qmake pkg infra
>>   - propagate dependencies from qt5 package
> Actually, this was not needed. Propagating "depends on" is needed if
> you "select" something. But if you "depends on" that something, then
> it's not needed.
Oh, good to know - I'll keep it in my mind for the future :)
>> diff --git a/package/log4qt/Config.in b/package/log4qt/Config.in
>> new file mode 100644
>> index 0000000000..1b716bbc51
>> --- /dev/null
>> +++ b/package/log4qt/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_LOG4QT
>> +	bool "log4qt"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_PACKAGE_QT5
>> +	depends on BR2_USE_WCHAR
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # c++11 qt5base
>> +	depends on !BR2_STATIC_LIBS
> So I simplified all of this to just:
>
> 	depends on BR2_PACKAGE_QT5
>
>> +comment "Log4Qt needs qt5, a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
>> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
>> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_QT5
> And simplified that as well.
>
>> +LOG4QT_VERSION = 1.5.1
>> +LOG4QT_SITE = $(call github,MEONMedical,Log4Qt,v$(LOG4QT_VERSION))
>> +LOG4QT_DEPENDENCIES += qt5base
>> +LOG4QT_LICENSE = Apache-2.0
>> +LOG4QT_LICENSE_FILES = LICENSE
>> +LOG4QT_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT),y)
>> +LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
>> +else ifeq ($(BR2_PACKAGE_SQLITE)$(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),yy)
>> +LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
>> +LOG4QT_DEPENDENCIES += sqlite
> This dance was not needed. If BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y then
> you know that Qt5 has been built with SQLite support.
>
> So, I simplified this to:
>
> ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT)$(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),y)
> LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
> else
> LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=OFF
> endif
That looks nicer than my idea.
>
> I'm curious though: is this DB_LOGGING feature only supported with the
> Sqlite DB backend of Qt, or would it also work with other DB backends ?
As far as I know and what I've actually used in my projects is sqlite 
backend only but I'm not up to date with the upstream so I can be 
outdated ;)
>
> Thanks!
>
> Thomas
Best
Bartek
