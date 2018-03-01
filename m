From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Thu, 1 Mar 2018 13:26:44 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5scxml: install missing QML
 module
In-Reply-To: <20180301115003.6cc39376@gmx.net>
References: <20180301074610.18946-1-b.bilas@grinn-global.com>
 <20180301115003.6cc39376@gmx.net>
Message-ID: <537151c4-3d13-6afa-8bed-e75647bf08de@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 01.03.2018 11:50, Peter Seiderer wrote:
> Hello Bartosz,
>
> first thanks for the suggested patch.
>   
> On Thu,  1 Mar 2018 08:46:10 +0100, Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> This patch add support for scxml module in QML projects.
>> When would you like to use state machines in qml files,
>> you get an error like this:
>>
>> qrc:/MainUI.qml:2 module "QtScxml" is not installed
>>
> Patch subject: 'qt5scxml: install missing QML module' and
>
>    Fixes:
>
>      qrc:/MainUI.qml:2 module "QtScxml" is not installed
>
> would be enough (I think the patched lines are self-explanatory)...
>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   package/qt5/qt5scxml/qt5scxml.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
>> index 2d197a2bca..3f0f1a9054 100644
>> --- a/package/qt5/qt5scxml/qt5scxml.mk
>> +++ b/package/qt5/qt5scxml/qt5scxml.mk
>> @@ -35,6 +35,12 @@ define QT5SCXML_INSTALL_TARGET_LIBS
>>   endef
>>   endif
>>   
>> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
>> +define QT5SCXML_INSTALL_TARGET_QMLS
>> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtScxml/ $(TARGET_DIR)/usr/qml/
>> +endef
>> +endif
>> +
> The dependency on BR2_PACKAGE_QT5DECLARATIVE_QUICK is not needed, the QtScxml
> module is build/installed even without enabled BR2_PACKAGE_QT5DECLARATIVE_QUICK...
I was thinking about it but without qt quick this module is unnecessary 
so I'm not sure that we should copy this to the image.

Best regards,
Bartosz Bi?as
>
> With this changes you can add my
>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>
> Regards,
> Peter
>
>
>>   ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>>   define QT5SCXML_INSTALL_TARGET_EXAMPLES
>>   	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/scxml $(TARGET_DIR)/usr/lib/qt/examples/
>> @@ -43,6 +49,7 @@ endif
>>   
>>   define QT5SCXML_INSTALL_TARGET_CMDS
>>   	$(QT5SCXML_INSTALL_TARGET_LIBS)
>> +	$(QT5SCXML_INSTALL_TARGET_QMLS)
>>   	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
>>   endef
>>   

-- 

	


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180301/34a91dad/attachment.html>
