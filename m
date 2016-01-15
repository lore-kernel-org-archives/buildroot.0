From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 15 Jan 2016 15:08:14 +0100
Subject: [Buildroot] [PATCH] util-linux: enable Python bindings for
	libmount
In-Reply-To: <20160115150016.0ac51eb3@free-electrons.com>
References: <1452853497-29131-1-git-send-email-yegorslists@googlemail.com>
 <20160115150016.0ac51eb3@free-electrons.com>
Message-ID: <CAGm1_kutjvUjXrP0A8U-j1giVSnw5kj8vYpjRZEygmuH8f=xQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 15, 2016 at 3:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yegor,
>
> On Fri, 15 Jan 2016 11:24:57 +0100, yegorslists at googlemail.com wrote:
>
>> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
>> index 58ace1d..a80e287 100644
>> --- a/package/util-linux/util-linux.mk
>> +++ b/package/util-linux/util-linux.mk
>> @@ -23,8 +23,7 @@ UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
>>       $(if $(BR2_TOOLCHAIN_USES_UCLIBC),ac_cv_header_sys_timex_h=no)
>>  UTIL_LINUX_CONF_OPTS += \
>>       --disable-rpath \
>> -     --disable-makeinstall-chown \
>> -     --without-python
>> +     --disable-makeinstall-chown
>>
>>  # system depends on util-linux so we enable systemd support
>>  # (which needs systemd to be installed)
>> @@ -136,6 +135,19 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
>>  UTIL_LINUX_CONF_OPTS += --disable-all-programs
>>  endif
>>
>> +# Install libmount Python bindings
>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
>> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
>> +UTIL_LINUX_CONF_OPTS += \
>> +     --enable-pylibmount \
>> +     --with-python
>> +else
>> +UTIL_LINUX_CONF_OPTS += \
>> +     --disable-pylibmount \
>> +     --without-python
>> +endif
>> +endif
>
> With this change, we are no longer passing --without-python when
> BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is disabled. I think it would be good
> to continue passing --without-python. Also, shouldn't python be built
> before util-linux for this to work ?

Good point.

> Would something like this make sense maybe:
>
> ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> UTIL_LINUX_CONF_OPTS += --with-python
> UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> UTIL_LINUX_CONF_OPTS += --enable-pylibmount
> else
> UTIL_LINUX_CONF_OPTS += --disable-pylibmount
> endif
> else
> UTIL_LINUX_CONF_OPTS += --without-python
> endif

Will send v2.

Yegor
