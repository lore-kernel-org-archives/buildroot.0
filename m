From: Andreas Naumann <dev@andin.de>
Date: Mon, 16 Mar 2020 22:53:27 +0100
Subject: [Buildroot] [PATCH v6 15/28] package/qt-webkit-kiosk: Convert
 to qmake infra
In-Reply-To: <20200311230457.59c63d93@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-16-anaumann@ultratronik.de>
 <20200311230457.59c63d93@windsurf>
Message-ID: <dc7f6744-f8a3-fb07-ec26-b24556d8257a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11.03.20 23:04, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Mon, 17 Feb 2020 22:23:37 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> Convert but keep the slightly complicated custom install step for now.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> ---
>>   package/qt-webkit-kiosk/qt-webkit-kiosk.mk | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> I've applied, but I have some comments below.
> 
>>
>> diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
>> index a714fca9c9..22cbf3cb87 100644
>> --- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
>> +++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
>> @@ -11,13 +11,8 @@ QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
>>   QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
>>   QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
>>   
>> -define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
>> -	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
>> -endef
>> -
>> -define QT_WEBKIT_KIOSK_BUILD_CMDS
>> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> -endef
>> +QT_WEBKIT_KIOSK_INSTALL_STAGING = NO
> 
> This is not needed, as this is the default, and check-package complains
> about this.
> 

Ok.

>> +QT_WEBKIT_KIOSK_CONF_OPTS = PREFIX=/usr
> 
> Do you know why specifically for this package we need to pass
> PREFIX=/usr, and not for any other qmake-based package ?

Well, it's the same for quazip and other application projects I've seen: 
They dont use the default install paths of the corresponding qmake 
(QT_INSTALL_PREFIX|DATA|DOCS|LIBS|BINS|...), but define their own. This 
is fair enough but usually results in ignoring the knowledge about 
sysroot/staging destination which qmake does have. This information then 
has to be put into the INSTALL_ROOT variable in case of cross-compile.

> 
>>   define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
>>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
>> @@ -29,4 +24,4 @@ define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
>>   		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
>>   endef
> 
> Any reason for these custom installation commands, rather than using
> the package-provided installation logic ?

Uh, I dont remember. Probably the default didnt work or me being lazy to 
not having to test even more.

regards,
Andreas

> 
> Thanks!
> 
> Thomas
> 
