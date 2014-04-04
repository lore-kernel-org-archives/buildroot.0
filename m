From: Marcin Bis <marcin@bis.org.pl>
Date: Fri, 4 Apr 2014 11:03:38 +0200
Subject: [Buildroot] [PATCH v5] bluez5_utils: new package
In-Reply-To: <20140403220029.450f9b51@skate>
References: <532F69C8.5060202@trzebnica.net>
 <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
 <20140403220029.450f9b51@skate>
Message-ID: <CAOPBCFW+QGWA2jK1d4k=9j9X+C4jP0NsQCfuSmw48j2Kj=o0jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Thu, Apr 3, 2014 at 10:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marcin Bis,

>> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
>> new file mode 100644
>> index 0000000..809dd8a
>> --- /dev/null
>> +++ b/package/bluez5_utils/Config.in
>> @@ -0,0 +1,54 @@
>> +config BR2_PACKAGE_BLUEZ5_UTILS
>> +     bool "bluez-utils 5.x"
>> +     depends on !BR2_avr32
>> +     depends on BR2_USE_WCHAR # libglib2
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>> +     depends on BR2_USE_MMU # dbus
>> +     depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
>> +     select BR2_PACKAGE_DBUS
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     select BR2_PACKAGE_LIBICAL
>> +     select BR2_PACKAGE_READLINE
>> +     help
>> +       bluez utils version 5.x
>> +
>> +       With this release BlueZ only supports the new Bluetooth Management
>> +       kernel interface (introduced in Linux 3.4).
>
> Does it need kernel headers >= 3.4 ?

I am checking this.
It seems that it needs kernel >= 3.4 for BLE.
In older kernels BLE wont work, but older Bluetooth spec. should.

>> +# install gatttool (For some reason upstream choose not to do it by default)
>> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
>> +define BLUEZ5_UTILS_INSTALL_GATTTOOL
>> +     $(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin
>
> The destination path should be a full path, i.e:
>
>         $(TARGET_DIR)/usr/bin/gatttool
OK

>> +# use udev if available
>> +ifeq ($(BR2_PACKAGE_UDEV),y)
>
> You should instead rely on BR2_PACKAGE_HAS_UDEV, so that it works with
> both eudev, or the udev built into systemd.
OK

I will fix it over the weekend.

--
 Marcin Bis
