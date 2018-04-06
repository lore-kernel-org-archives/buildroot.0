From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 6 Apr 2018 21:54:45 +0200
Subject: [Buildroot] [PATCH v3 1/2] qt5base: correct eglfs support in
 qmake.conf.in
In-Reply-To: <3b81b4f4-e003-7c28-9e20-c3fa0a490379@mind.be>
References: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
 <3b81b4f4-e003-7c28-9e20-c3fa0a490379@mind.be>
Message-ID: <0d5204fc-7cae-ea1f-616a-0668f9202d22@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 04/04/2018 23:45, Arnout Vandecappelle ha scritto:
>   Hi Giulio,
> 
> On 13-11-17 19:41, Giulio Benetti wrote:
>> qt5base: correct eglfs support in qmake.conf.in
>>
>> Setting EGLFS_DEVICE_INTEGRATION at the end of qmake.conf like is done by commit
>> 0c219ddb8a doesn't work correctly: it has to be set before the
>> include(../common/linux_device_post.conf)
>>
>> Instead of appending to the file, change it into a qmake.conf.in template file
>> that contains an EGLFS_DEVICE_INTEGRATION assignment and update it with sed.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>> Changes v1 -> v2:
>> * write directly to package target qmake.conf
>> * simplified eglfs backend choice
>>   package/qt5/qt5base/{qmake.conf => qmake.conf.in} |  2 ++
>>   package/qt5/qt5base/qt5base.mk                    | 22 +++++++++++++++++-----
>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>   rename package/qt5/qt5base/{qmake.conf => qmake.conf.in} (95%)
>>
>> diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf.in
>> similarity index 95%
>> rename from package/qt5/qt5base/qmake.conf
>> rename to package/qt5/qt5base/qmake.conf.in
>> index 8b6debe..fb698b9 100644
>> --- a/package/qt5/qt5base/qmake.conf
>> +++ b/package/qt5/qt5base/qmake.conf.in
>> @@ -24,5 +24,7 @@ QMAKE_CFLAGS_ISYSTEM   =
>>   # Architecturespecific configuration
>>   include(arch.conf)
>>   
>> +EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@
> 
>   I've changed this into a single
> 
> @EGFLS_DEVICE@
> 
>> +
>>   include(../common/linux_device_post.conf)
>>   load(qt_config)
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index b3f9c79..ef99131 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -240,10 +240,23 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>>   
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>>   
>> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
>> -# use vivante backend
>> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
>> +QT5BASE_EGLFS_DEVICE = eglfs_viv
> 
> ... and added the "EGLFS_DEVICE_INTEGRATION = " part here. That way, we don't
> need a separate sed expression for the case when no device integration is set,
> and the whole QT5BASE_CONFIGURE_QMAKE_CONFIG can be put directly into
> QT5BASE_CONFIGURE_CMDS.

Yes, it is cleaner this way, thanks!

> 
>> +else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
>> +QT5BASE_EGLFS_DEVICE = eglfs_mali
> 
>   This one should move to the patch adding support for sunxi-mali.
> 
>   I've committed to master with those changes, thanks.
> 
>   Could you retest with current master? That way, you can also test the
> sunxi-mali support in Qt 5.10.

Sure I will. I'll be on holydays until 11 april,
I've already built everything here.
Asap I give it a try and let you know.

Regards,
Giulio

> 
>   Regards,
>   Arnout
> 
>> +endif
>> +endif
>> +
>> +ifeq ($(QT5BASE_EGLFS_DEVICE),)
>>   define QT5BASE_CONFIGURE_QMAKE_CONFIG
>> -	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
>> +	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
>> +endef
>> +else
>> +define QT5BASE_CONFIGURE_QMAKE_CONFIG
>> +	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
>> +		$(QT5BASE_PKGDIR)/qmake.conf.in > \
>>   		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
>>   endef
>>   endif
>> @@ -263,8 +276,7 @@ endef
>>   endif
>>   
>>   define QT5BASE_CONFIGURE_CMDS
>> -	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
>> -		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
>> +	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
>>   	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
>>   	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
>>   		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>>
> 


-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
