From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 Nov 2017 23:45:44 +0100
Subject: [Buildroot] [PATCH v2 2/2] add qmake.conf eglfs_mali option
In-Reply-To: <a6e97c11-b4fa-06f4-6eb4-9cb472f1b02a@mind.be>
References: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1510165263-7599-2-git-send-email-giulio.benetti@micronovasrl.com>
 <a6e97c11-b4fa-06f4-6eb4-9cb472f1b02a@mind.be>
Message-ID: <391ee102-b950-ac6d-c609-abde35d3bb04@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 08/11/2017 23:39, Arnout Vandecappelle ha scritto:
> 
> 
> On 08-11-17 19:21, Giulio Benetti wrote:
>> Package qt5base didn't treat eglfs_mali.
>> Add support for eglfs_mali according to package selection
>>
>> Changes v1->v2:
>> * Add eglfs_mali support
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index d58a58a..23f5138 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -240,18 +240,27 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>>   
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>>   
>> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
>> -# use vivante backend
>> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
>> +# use eglfs vivante backend
>>   define QT5BASE_CONFIGURE_QMAKE_CONFIG
>>   	sed 's/@EGLFS_DEVICE@/eglfs_viv/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>>   		$(QT5BASE_PKGDIR)/qmake.conf
>>   endef
>> +else ifeq ($(filter y,$(BR2_PACKAGE_SUNXI_MALI) $(BR2_PACKAGE_SUNXI_MALI_MAINLINE)),y)
> 
>   Since the sunxi-mali-mainline package has not been accepted yet, this is not
> correct (yet). To solve that, the easiest way is to include all three in a
> single series.

You're right,
so I will add BR2_PACKAGE_SUNXI_MALI_MAINLINE later.

> 
>> +# use eglfs mali backend
>> +define QT5BASE_CONFIGURE_QMAKE_CONFIG
>> +	sed 's/@EGLFS_DEVICE@/eglfs_mali/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>> +		$(QT5BASE_PKGDIR)/qmake.conf
>> +endef
> 
>   This is getting complicated, especially since there will probably be more
> backends that need this... How about:
> 
> ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
> QT5BASE_EGLFS_DEVICE = eglfs_viv
> else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
> QT5BASE_EGLFS_DEVICE = eglfs_mali
> endif
> endif
> 
> ifeq ($(QT5BASE_EGLFS_DEVICE),)
> 	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
> 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> else
>   	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g'
> $(QT5BASE_PKGDIR)/qmake.conf.in > \
> 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> endif
> 

Good idea, I will modify that way and submit [PATCH v3]

> 
>   Regards,
>   Arnout
> 
>>   else
>> +# don't use any eglfs backend
>>   define QT5BASE_CONFIGURE_QMAKE_CONFIG
>>   	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>>   		$(QT5BASE_PKGDIR)/qmake.conf
>>   endef
>>   endif
>> +endif
>>   
>>   ifneq ($(QT5BASE_CONFIG_FILE),)
>>   define QT5BASE_CONFIGURE_CONFIG_FILE
>>
> 

Best regards!

-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
