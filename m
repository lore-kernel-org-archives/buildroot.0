From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 27 Oct 2013 20:31:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] ModemManager: add new package
In-Reply-To: <20131027184227.71ab4f03@skate>
References: <1382696898-1901-1-git-send-email-yegorslists@googlemail.com>
 <1382696898-1901-2-git-send-email-yegorslists@googlemail.com>
 <20131027184227.71ab4f03@skate>
Message-ID: <CAGm1_ktAOgzoOowAzSKC78yCRAf9ONcUcYHV6nDsA5AL_V7hCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 27, 2013 at 6:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 25 Oct 2013 12:28:18 +0200, yegorslists at googlemail.com wrote:
>> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
>> new file mode 100644
>> index 0000000..202d846
>> --- /dev/null
>> +++ b/package/modem-manager/Config.in
>> @@ -0,0 +1,33 @@
>> +config BR2_PACKAGE_MODEM_MANAGER
>> +     bool "ModemManager"
>
> I think we want all the package names to be lower case.

Should NetworkManager be also renamed in networkmanager?

>> +     depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>> +     select BR2_PACKAGE_DBUS
>> +     depends on BR2_INET_IPV6
>> +     depends on BR2_LARGEFILE # acl
>> +     depends on BR2_USE_WCHAR # libglib2 and gnutls
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>> +     depends on BR2_USE_MMU # dbus
>> +     select BR2_PACKAGE_DBUS_GLIB
>> +     select BR2_PACKAGE_UDEV
>> +     select BR2_PACKAGE_UDEV_ALL_EXTRAS
>> +     select BR2_PACKAGE_PCRE
>> +     select BR2_PACKAGE_PCRE_UTF
>> +     help
>> +       ModemManager is a DBus-activated daemon which controls mobile
>> +       broadband (2G/3G/4G) devices and connections.
>> +
>> +       http://www.freedesktop.org/wiki/Software/ModemManager/
>> +
>> +if BR2_PACKAGE_MODEM_MANAGER
>> +
>> +config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>> +     bool "QMI support"
>> +     select BR2_PACKAGE_LIBQMI
>> +     help
>> +       This option enables support for QMI protocol
>> +endif
>> +
>> +comment "ModemkManager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support"
>
> typo on ModemManager (which should be lower case as well here).

ACK

>> +     depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
>> +             !BR2_TOOLCHAIN_HAS_THREADS
>
> Shouldn't we have a comment about the udev dependency?

ACK

>> +MODEM_MANAGER_VERSION = 1.0.0
>> +MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>> +MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
>> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
>
> You don't depend on pcre?

ACK

> Also, as you mentioned in a reply, please add the licensing
> information. Note that it seems to be GPLv2+ and not GPLv2.
>
>> +MODEM_MANAGER_CONF_OPT = \
>> +             --without-mbim
>
> One too many tabs in this indentation.

ACK

>> +ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
>> +     MODEM_MANAGER_DEPENDENCIES += libqmi
>
>         MODEM_MANAGER_CONF_OPT += --with-qmi

ACK

>> +else
>> +     MODEM_MANAGER_CONF_OPT += --without-qmi
>> +endif

Thanks for review.

Yegor
