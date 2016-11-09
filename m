From: Andreas Naumann <dev@andin.de>
Date: Wed, 9 Nov 2016 19:52:02 +0100
Subject: [Buildroot] [PATCH 5/5] quickcontrols1/2: enable for software
 renderer
In-Reply-To: <72206896-e394-0eae-9e26-61b9b5abb34a@mind.be>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-6-git-send-email-anaumann@ultratronik.de>
 <72206896-e394-0eae-9e26-61b9b5abb34a@mind.be>
Message-ID: <43cc3e21-ef4b-0b54-66e5-0229e3143fd2@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 08.11.2016 um 23:56 schrieb Arnout Vandecappelle:
>
>
> On 08-11-16 11:30, Andreas Naumann wrote:
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> ---
>>  package/qt5/qt5quickcontrols/Config.in             | 3 +--
>>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk   | 5 ++++-
>>  package/qt5/qt5quickcontrols2/Config.in            | 3 +--
>>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 8 +++++---
>>  4 files changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
>> index 0fe8465..d013491 100644
>> --- a/package/qt5/qt5quickcontrols/Config.in
>> +++ b/package/qt5/qt5quickcontrols/Config.in
>> @@ -2,7 +2,6 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>>  	bool "qt5quickcontrols"
>>  	select BR2_PACKAGE_QT5DECLARATIVE
>>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
>> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
>>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>>  	help
>>  	  Qt is a cross-platform application and UI framework for
>> @@ -12,6 +11,6 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>>
>>  	  http://qt.io
>>
>> -comment "qt5quickcontrols needs an OpenGL-capable backend"
>> +comment "Some qt5quickcontrol elements needs an OpenGL-capable backend"
>
>  Hm, a bit vague. I think the comment can be removed.

ok

>
>>  	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
>>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
>> index b33ff15..c2946bc 100644
>> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
>> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
>> @@ -31,7 +31,10 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
>>  endef
>>
>>  define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
>> -	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
>
>  Why?

QuickControls provides different subfolders than QuickControls2 under 
/usr/qml/QtQuick. Explicitely listing them avoids sometimes undesirable 
stuff getting installed when repeatedly building.
Ok, this may better go in another patch.

>
>
>  Regards,
>  Arnout
>
>>  endef
>>
>>  $(eval $(generic-package))
>> diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
>> index 1e57674..e7271f2 100644
>> --- a/package/qt5/qt5quickcontrols2/Config.in
>> +++ b/package/qt5/qt5quickcontrols2/Config.in
>> @@ -2,7 +2,6 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
>>  	bool "qt5quickcontrols2"
>>  	select BR2_PACKAGE_QT5DECLARATIVE
>>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
>> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
>>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
>>  	help
>>  	  Qt is a cross-platform application and UI framework for
>> @@ -12,6 +11,6 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
>>
>>  	  http://qt.io
>>
>> -comment "qt5quickcontrols2 needs an OpenGL-capable backend"
>> +comment "Some qt5quickcontrols2 elements need an OpenGL-capable backend"
>>  	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
>>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
>> index a5ad3f6..1a2949c 100644
>> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
>> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
>> @@ -31,10 +31,12 @@ define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
>>  endef
>>
>>  define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
>> -	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
>> -	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
>> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
>> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
>>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
>> -	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
>>  endef
>>
>>  $(eval $(generic-package))
>>
>
