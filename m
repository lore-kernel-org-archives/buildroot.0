From: David Picard <davepiq@yahoo.fr>
Date: Mon, 25 Jan 2016 15:40:52 +0100
Subject: [Buildroot] [PATCH 2/2] Qwt package : added dependency to Qt5
 besides Qt.
In-Reply-To: <56A5E74A.4050002@yahoo.fr>
References: <1453484674-8951-1-git-send-email-davepiq@yahoo.fr>
 <1453484674-8951-2-git-send-email-davepiq@yahoo.fr>
 <20160122181941.GB3774@free.fr> <56A4244D.3090504@mind.be>
 <56A5E74A.4050002@yahoo.fr>
Message-ID: <56A633F4.7080201@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, is that what you mean by "automatic dependency" ?

qwt.mk
------

ifeq ($(BR2_PACKAGE_QT),y)
QWT_DEPENDENCIES += qt libgles libegl
endif
ifeq ($(BR2_PACKAGE_QT5BASE),y)
QWT_DEPENDENCIES += qt5base libgles
QT5_MAKE = $(HOST_DIR)/usr/bin/qmake -spec 
$(HOST_DIR)/mkspecs/devices/linux-buildroot-g++
endif


Config.in
---------

config BR2_PACKAGE_QWT_OPENGL
         bool "OpenGL support"
         depends on BR2_PACKAGE_HAS_LIBGLES
         depends on BR2_PACKAGE_HAS_LIBEGL



Le 25/01/2016 10:13, David Picard a ?crit :
> Hi,
>
> I could implement Yann's suggestions. The Config.in is more symetric,
> and I dropped the comment about SVG (no more recursive deps).
>
> In the OpenGL section, I can understand :
> depends on BR2_PACKAGE_QT_OPENGL_ES || BR2_PACKAGE_QT5BASE_OPENGL_LIB
>
> But I am afraid that I won't be able to make the automatic dependency in
> the .mk file, as Arnout suggests, because I have no idea of how to do
> it. Would you have an example in mind that I could have a look at ? Or
> will it do it as is ?
>
> When I am done, should I submit the patch as a new patch ? Or do you
> have a different procedure for revised patches ?
>
> Thanks,
> David.
>
>
>
> Le 24/01/2016 02:09, Arnout Vandecappelle a ?crit :
>> On 22-01-16 19:19, Yann E. MORIN wrote:
>>> David, All,
>>>
>>> On 2016-01-22 18:44 +0100, David Picard spake thusly:
>> [snip]
>>>> @@ -21,10 +23,14 @@ config BR2_PACKAGE_QWT_OPENGL
>>>>       bool "OpenGL support"
>>>>       depends on BR2_PACKAGE_HAS_LIBGLES
>>>>       depends on BR2_PACKAGE_HAS_LIBEGL
>>>> -    select BR2_PACKAGE_QT_OPENGL_ES
>>>> +    select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
>>>> +    select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE
>>>
>>> BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL, so
>>> it should have been selected too.
>>>
>>> However, I'm a bit worried about the complexity here, and I'd rather
>>> that we depend on such support rather than select it. So I'd prefer to
>>> see:
>>>
>>>      depends on BR2_PACKAGE_QT_OPENGL_ES ||
>>> BR2_PACKAGE_QT5BASE_OPENGL_LIB
>>
>>   In that case, it can probably be removed completely and turned into an
>> automatic dependency (i.e. just in the .mk file).
>>
>>   I also wouldn't bother with legacy handling when this symbol is
>> removed. The
>> legacy .config file will already contain BR2_PACKAGE_QT_OPENGL_ES, so
>> once the
>> handling is automatic, you just have to run 'make oldconfig' and it
>> will Just
>> Work (TM).
>>
>>
>>   Regards,
>>   Arnout
>>
>> [snip]
>>
>>
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
