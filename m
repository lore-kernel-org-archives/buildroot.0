From: Andreas Naumann <dev@andin.de>
Date: Wed, 24 Jul 2019 10:09:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-20
In-Reply-To: <20190723213646.326c6fd9@gmx.net>
References: <20190721060040.4E27586230@whitealder.osuosl.org>
 <20190721210110.0b3620b0@gmx.net>
 <9f2cfe09-b9af-285f-b192-f7b2bc975d68@andin.de>
 <20190722202140.207e29c3@gmx.net>
 <9d0c9348-7ca4-bca5-3c89-17c1b1358069@andin.de>
 <20190723213646.326c6fd9@gmx.net>
Message-ID: <ab6a2c32-38bb-6773-fea8-36e5931dcdc9@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am 23.07.19 um 21:36 schrieb Peter Seiderer:
> Hello Andreas,
> 

snip

>>
>> Somebody reported a similar issue (and workaround) in the QT bugracker:
>> https://bugreports.qt.io/browse/QTBUG-76625
>> Theres also a fix for it, however it has no effect on the appearance of
>> so-file. As I understand it they rather fix the path to it.
>>
>> The real reason behind our problem seems to be:
>>
>> commit 5b3dfa470ed7ea40103daa785286ab71fb7aa230
>> Author: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
>> Date:   Wed Dec 19 12:46:52 2018 +0100
>>
>>       qmake: link qt libraries by full path
>>
>>       this avoids the scenario where the linker would pick up the wrong qt
>>       libraries for LIBS_PRIVATE because LIBS added the "wrong" path first.
>>       this is also consistent with configure-supplied dependencies as of
>>       recently.
>>
>>       as a side effect, this also removes pretenses of lsb linker
>> handling, as
>>       it makes no sense after the change and is certainly obsolete anyway.
>>
>>       Fixes: QTBUG-50921
>>
>> I made a comment in 76625. If I understand the issue correctly, then
>> qmake needs to add '-l' in front of the absolute so-files. We in turn
>> would need to not remove the build-dir when occuring in an so-file, but
>> replace it with the staging dir. Otherwise we might hit the same issue
>> that 5b3dfa4 was trying to fix, right?
> 
> Thanks for investigation and the hints...., with the following patch
> 
> --- qt5base-5.12.4/mkspecs/features/qt.prf-001	2019-07-23 20:57:39.668312458 +0200
> +++ qt5base-5.12.4/mkspecs/features/qt.prf	2019-07-23 20:58:44.289581880 +0200
> @@ -217,7 +217,7 @@
>                       lib = $$MODULE_LIBS/$$QMAKE_PREFIX_STATICLIB$${lib}.$$QMAKE_EXTENSION_STATICLIB
>                       PRE_TARGETDEPS += $$lib
>                   } else {
> -                    lib = $$MODULE_LIBS/$$QMAKE_PREFIX_SHLIB$${lib}.$$QMAKE_EXTENSION_SHLIB
> +                    lib = -L$$MODULE_LIBS -l$${lib}
>                   }
>                   LIBS$$var_sfx += $$lib
>               }
> 
> 
> I get the following entry in build/qt5base-5.12.4/lib/libQt5Widgets.la:
> 
> 	dependency_libs='-L/home/seiderer/Work/Buildroot/build_sparc_qt_libv4l_001/build/qt5base-5.12.4/lib -lQt5Gui -lQt5Core -latomic -lrt -ldl -lpthread -lrt -lpthread -ldl '
> 
> And in host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la:
> 
> 	dependency_libs=' -lQt5Gui -lQt5Core -latomic -lrt -ldl -lpthread -lrt -lpthread -ldl '
> 
> And the build of libv4l/utils/qv4l2 succeeds...

I think this is a good solution for now. However, I'll watch the Qt-Bug 
for news on this.

regards,
Andreas

> 
> Regards,
> Peter
> 
>>
>> regards,
>> Andreas
>>
>>>
>>> Regards,
>>> Peter
>>>
>>>>
>>>>
>>>> regards,
>>>> Andreas
>>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Peter
>>>>>
>>>>> [1] https://git.buildroot.net/buildroot/commit/?id=428e5276e4df0b4bbd75df38565298ad53ea4f8b
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot at busybox.net
>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>
>>>
> 
