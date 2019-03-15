From: Mark Thompson <mark.thompson@starleaf.com>
Date: Fri, 15 Mar 2019 18:07:46 +0000
Subject: [Buildroot] [PATCH v2] qt5virtualkeyboard: Install new library
In-Reply-To: <20190314223020.5cfc5a0c@windsurf>
References: <0bc4e8bf-5b7a-69e2-4443-6936700a132f@starleaf.com>
 <20190308180750.GW2721@scaer>
 <4c8cb1db-58a9-5df0-25cd-538e76e8a7a7@starleaf.com>
 <20190314223020.5cfc5a0c@windsurf>
Message-ID: <0950288b-1bd3-de75-9385-8b4af64b1ddf@starleaf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/03/2019 21:30, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 8 Mar 2019 18:33:39 +0000
> Mark Thompson <mark.thompson@starleaf.com> wrote:
> 
>> Between Qt 5.11 and 5.12 the virtual keyboard package gained a new top-level
>> library, libQt5VirtualKeyboard.so, which is then used by all of the plugins
>> it installs.  This change makes Buildroot aware of the new library so that
>> we install it to the target filesystem.
>>
>> Signed-off-by: Mark Thompson <mark.thompson@starleaf.com>
> 
> Thanks, I've applied, with some change (see below).
> 
>> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
>> index 8ce3169774..ebe0f1e009 100644
>> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
>> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
>> @@ -81,6 +81,11 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
>>  	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
>>  endef
>>  else
>> +ifeq ($(BR2_STATIC_LIBS),)
>> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
>> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
>> +endef
>> +endif
> 
> Instead of "hijacking" the condition used for the
> QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML definition, I've created a
> separate condition:
> 
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST):$(BR2_STATIC_LIBS),y:)
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
> +       cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
> +endef
> +endif
> 
> Could you double check that the latest master works for you ?

Yep, that works for me.

Thank you!

- Mark
