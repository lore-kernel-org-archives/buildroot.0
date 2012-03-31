From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 31 Mar 2012 15:24:44 +0200
Subject: [Buildroot] [PATCH v2 3/3] Add ofono package.
In-Reply-To: <201203282348.05392.arnout@mind.be>
References: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
 <1332792756-3381-4-git-send-email-marek.belisko@open-nandra.com>
 <201203282348.05392.arnout@mind.be>
Message-ID: <CAAfyv36nikUMhVHAvLdr_MZfTNis1D9wuyPfLvmd=kyPOgmvKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 28, 2012 at 11:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 26 March 2012 22:12:36 Marek Belisko wrote:
> [snip]
>> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
>> new file mode 100644
>> index 0000000..b10e42d
>> --- /dev/null
>> +++ b/package/ofono/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_OFONO
>> + ? ? bool "ofono"
>> + ? ? select BR2_PACKAGE_LIBCAP_NG
>> + ? ? select BR2_PACKAGE_DBUS
>> + ? ? select BR2_PACKAGE_LIBGLIB2
>> + ? ? select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
>
> ?Missing
> ? ? ? ?depends on BR2_USE_WCHAR # gettext/libglib2
>
> ?which also means you need a comment in case we don't have WCHAR.
>
>> + ? ? helpimplies
>> + ? ? ? oFono.org is a place to bring developers together around designing an
>> + ? ? ? infrastructure for building mobile telephony (GSM/UMTS) applications.
>
> ?This doesn't really explain what the package does. ?Also, a link to a
> website is convenient.
>
>> +
>> +if BR2_PACKAGE_OFONO
>> +
>> +config BR2_PACKAGE_OFONO_BLUETOOTH
>> + ? ? ? ?bool "ofono with bluetooth support"
>> + ? ? select BR2_PACKAGE_BLUEZ_UTILS
>> + ? ? ? ?help
>> + ? ? ? Enable bluetooh support.
>> +endif
>
> ?There's some funky whitespace here. ?Also a type: bluetooh -> bluetooth
>
>> +
>> +
>
> ?No empty lines at the end of the file please.
>
>> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
>> new file mode 100644
>> index 0000000..e408a61
>> --- /dev/null
>> +++ b/package/ofono/ofono.mk
>> @@ -0,0 +1,25 @@
>> +#############################################################
>> +#
>> +# ofono
>> +#
>> +#############################################################
>> +OFONO_VERSION = 1.5
>> +OFONO_SITE = git://git.kernel.org/pub/scm/network/ofono/ofono.git
>
> ?Why not use the tar from $(BR2_KERNEL_MIRROR)/linux/network/ofono ?
Ok will do.
>
>> +
>> +OFONO_DEPENDENCIES = host-pkg-config libglib2 dbus libcap-ng mobile-broadband-provider-info
>> +
>> +OFONO_CONF_OPT = --disable-test --disable-bluetooth
>
> ?The --disable-bluetooth should be in the else of the OFONO_BLUETOOTH
> option.
>
>> +
>> +OFONO_AUTORECONF = YES
When switch to tar version without this line it can' t configure because
./configure doesn't exist (just bootstrap)
>
> ?Not needed if you use the tar.
>
>> +
>> +ifneq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
>> + ? ? OFONO_CONF_OPT += --disable-udev
>> +endif
>
> ?It's better to use --enable-udev explicitly in the positive case, and
> you probably need to add udev to DEPENDENCIES anyway.
ofono have by default udev enabled. For systems where udev isn't available
could be also used (just need to created /dev entry for modem by hand).
What about something like that:
+ifeq ($(BR2_PACKAGE_UDEV),y)
+	OFONO_CONF_OPT += --enable-udev
+	OFONO_DEPENDENCIES += udev
+else
+	OFONO_CONF_OPT += --disable-udev
+endif

For target with udev it will be used otherwise not.
>
> ?Also it's more logical to check for BR2_PACKAGE_UDEV.
>
>
> ?Regards,
> ?Arnout
>
>> +
>> +ifeq ($(BR2_PACKAGE_OFONO_BLUETOOTH),y)
>> + ? ? OFONO_CONF_OPT += --enable-bluetooth
>> + ? ? OFONO_DEPENDENCIES += bluez_utils
>> +endif
>> +
>> +$(eval $(call AUTOTARGETS))
>> +
>>
>
> --
> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
