From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 11 Jun 2018 09:48:13 -0500
Subject: [Buildroot] [PATCH v2 1/1] modem-manager: update to version
 1.8.0
In-Reply-To: <20180611144023.njijwgl2kpqukuq4@tarshish>
References: <1528722302-43382-1-git-send-email-jared.bents@rockwellcollins.com>
 <20180611144023.njijwgl2kpqukuq4@tarshish>
Message-ID: <CAM=7fbd8MB1SntXgeV4mX_nXebSCK_k6aTSR=VQkhW--ZQyD7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 11, 2018 at 9:40 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Jared,
>
> On Mon, Jun 11, 2018 at 08:05:02AM -0500, Jared Bents wrote:
>> Update to modem manager 1.8.0 which does not require udev.
>> Added option to build without udev but if udev exists in
>> the build, it build with libgudev.
>>
>> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
>>
>> --
>> [v1->v2]:
>> - Removed defaulted user option to select with udev and now
>>   automatically selects building with libgudev based on the
>>     presence of udev.
>> ---
>>  package/modem-manager/Config.in          | 11 ++++-------
>>  package/modem-manager/modem-manager.hash |  2 +-
>>  package/modem-manager/modem-manager.mk   | 11 +++++++++--
>>  3 files changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
>> index 215449a..c470160 100644
>> --- a/package/modem-manager/Config.in
>> +++ b/package/modem-manager/Config.in
>> @@ -1,12 +1,11 @@
>>  config BR2_PACKAGE_MODEM_MANAGER
>>       bool "modemmanager"
>> -     depends on BR2_PACKAGE_HAS_UDEV
>> -     depends on BR2_USE_WCHAR # libglib2
>> +     depends on BR2_USE_WCHAR # libglib2 and gnutls
>>       depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>>       depends on BR2_USE_MMU # dbus
>>       select BR2_PACKAGE_DBUS # runtime dependency
>>       select BR2_PACKAGE_LIBGLIB2
>> -     select BR2_PACKAGE_LIBGUDEV
>> +     select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
>>       help
>>         ModemManager is a DBus-activated daemon which controls mobile
>>         broadband (2G/3G/4G) devices and connections.
>> @@ -26,9 +25,7 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>>       select BR2_PACKAGE_LIBQMI
>>       help
>>         This option enables support for QMI protocol
>> -endif
>
> Is this 'endif' removal intended?
>
> baruch
>

No that was not. I should have double checked the changes in the
patch.  Will make a v3.

Jared
>>
>> -comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads"
>> -     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>> -             !BR2_PACKAGE_HAS_UDEV
>> +comment "modemmanager needs a toolchain w/ wchar, threads"
>> +     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>>       depends on BR2_USE_MMU
>> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
>> index 8531330..77a8c2d 100644
>> --- a/package/modem-manager/modem-manager.hash
>> +++ b/package/modem-manager/modem-manager.hash
>> @@ -1,4 +1,4 @@
>>  # Locally computed
>> -sha256  eefb7615c2c7ebc994abfc2782bfa9e798643a633362b40db96f7f61706a6283  ModemManager-1.6.12.tar.xz
>> +sha256  18abe34421aa3b52ff47d4ba93aa282f8f8944717dd644a5c0c81eeeac9c7eb1  ModemManager-1.8.0.tar.xz
>>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
>> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
>> index fe4a7a9..e2f89d9 100644
>> --- a/package/modem-manager/modem-manager.mk
>> +++ b/package/modem-manager/modem-manager.mk
>> @@ -4,12 +4,12 @@
>>  #
>>  ################################################################################
>>
>> -MODEM_MANAGER_VERSION = 1.6.12
>> +MODEM_MANAGER_VERSION = 1.8.0
>>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
>> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
>> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
>>  MODEM_MANAGER_INSTALL_STAGING = YES
>>  MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
>>
>> @@ -20,6 +20,13 @@ else
>>  MODEM_MANAGER_CONF_OPTS += --without-qmi
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
>> +MODEM_MANAGER_DEPENDENCIES += libgudev
>> +MODEM_MANAGER_CONF_OPTS += --with-udev
>> +else
>> +MODEM_MANAGER_CONF_OPTS += --without-udev
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
>>  MODEM_MANAGER_DEPENDENCIES += libmbim
>>  MODEM_MANAGER_CONF_OPTS += --with-mbim
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
