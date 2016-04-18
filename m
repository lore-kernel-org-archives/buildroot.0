From: Julien CORJON <corjon.j@ecagroup.com>
Date: Mon, 18 Apr 2016 11:21:19 +0000
Subject: [Buildroot] [PATCH v2] qt5quickcontrols2: new package
In-Reply-To: <570AB8F9.5060408@mind.be>
References: <1460151190-21021-1-git-send-email-ps.report@gmx.net>
 <570AB8F9.5060408@mind.be>
Message-ID: <5714C32E.4080907@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

Le 10/04/2016 22:35, Arnout Vandecappelle a ?crit :
> On 04/08/16 23:33, Peter Seiderer wrote:
>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>   However...
>
>> ---
>> Changes v1 -> v2:
>>    - move menu entry to 'technology preview' section
>>    - add QT5_GL_AVAILABLE/QT5_JSCORE_AVAILABLE dependency comment
>>    - install the right qt5quickcontrols2 files to target
>>      (all suggested by Julien Corjon)

... snip ...

>> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>> +QT5QUICKCONTROLS2_LICENSE = GPLv3 or LGPLv3, GFDLv1.3 (docs)
>
>   The source files specify GPLv2+ or LGPLv3

QtQuickControls2 is a tech-preview package and follow the upcoming Qt 
license convention[1]. That's why this module only have GPLv3 or LGPLv3 
license possibility (but i did not go with fossology to check).

Regards,

Julien

[1] http://blog.qt.io/blog/2016/03/16/qt-5-6-released/

>
>
>   Regards,
>   Arnout
>
>
>> +QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3
>> LICENSE.FDL
>> +else
>> +QT5QUICKCONTROLS2_LICENSE = Commercial license
>> +QT5QUICKCONTROLS2_REDISTRIBUTE = NO
>> +endif
>> +
>> +define QT5QUICKCONTROLS2_CONFIGURE_CMDS
>> +    (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>> +endef
>> +
>> +define QT5QUICKCONTROLS2_BUILD_CMDS
>> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>> +
>> +define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
>> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>> +endef
>> +
>> +define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
>> +    cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.*
>> $(TARGET_DIR)/usr/lib
>> +    cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls
>> $(TARGET_DIR)/usr/qml/Qt/labs
>> +    cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar
>> $(TARGET_DIR)/usr/qml/Qt/labs
>> +    cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates
>> $(TARGET_DIR)/usr/qml/Qt/labs
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
>
