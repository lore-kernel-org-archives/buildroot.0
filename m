From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 19 Sep 2020 23:05:00 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5location: needs
 qt5declarative quick package
In-Reply-To: <6c7c6fdf-a5a8-e1cf-ad28-9b7d7ba34b7b@grinn-global.com>
References: <20200919194857.491282-1-b.bilas@grinn-global.com>
 <20200919220820.2d5d47ab@windsurf>
 <6c7c6fdf-a5a8-e1cf-ad28-9b7d7ba34b7b@grinn-global.com>
Message-ID: <3e8a0246-3edb-578d-9d31-21a2f66f493b@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

On 19.09.2020 22:34, Bartosz Bilas wrote:
> Hi Thomas,
>
> On 19.09.2020 22:08, Thomas Petazzoni wrote:
>> On Sat, 19 Sep 2020 21:48:57 +0200
>> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>>
>>> Simply add the dependency of qt5declarative quick module that
>>> forces Qt OpenGL support which is needed for qt5location component [1].
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
>>> http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/
>>>
>>> and many many more...
>>>
>>> [1] 
>>> https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105
>>>
>>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>>> ---
>>> ? package/qt5/qt5location/Config.in????? | 4 ++++
>>> ? package/qt5/qt5location/qt5location.mk | 5 +----
>>> ? 2 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/package/qt5/qt5location/Config.in 
>>> b/package/qt5/qt5location/Config.in
>>> index c68deb1006..207ad5a37a 100644
>>> --- a/package/qt5/qt5location/Config.in
>>> +++ b/package/qt5/qt5location/Config.in
>>> @@ -1,5 +1,6 @@
>>> ? config BR2_PACKAGE_QT5LOCATION
>>> ????? bool "qt5location"
>>> +??? depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
>> This looks a bit weird, because src/src.pro looks like this:
>>
>> SUBDIRS += positioning
>> positioning.depends = clip2tri
>>
>> qtHaveModule(quick) {
>> ???? SUBDIRS += positioningquick location
>> ???? positioningquick.depends += positioning
>> ???? location.depends += positioningquick clip2tri
>>
>> ???? plugins.depends += location
>>
>> ???? SUBDIRS += imports
>> ???? imports.depends += positioningquick positioning location
>> }
>>
>> So, the "location" subdirectory should not be built of the quick module
>> is not there.
> Yes, it's weird - it seems that this condition is always true even 
> though quick module isn't compiled therefore I sent a quick workaround 
> to fix build errors until I find a proper solution ;)

After a quick investigation it seems that we should drop 
BR2_PACKAGE_QT5DECLARATIVE_QUICK option and select 
BR2_PACKAGE_QT5BASE_OPENGL option if BR2_PACKAGE_QT5_GL_AVAILABLE 
directly when BR2_PACKAGE_QT5DECLARATIVE package is selected because 
qt5declarative module includes quick subdirectory when gui module is 
available:

qtHaveModule(gui):qtConfig(qml-animation) {
 ??? SUBDIRS += quick

 ?? ...snip...
}

and then we should add dependency of the qt5declarative package in 
qt5location to solve the issue above.

qt5declarative package contains most of quick components enabled by 
default even though quick module wasn't selected, see:

Qt QML:
 ? QML network support .................... yes
 ? QML debugging and profiling support .... yes
 ? QML just-in-time compiler .............. yes
 ? QML sequence object .................... yes
 ? QML XML http request ................... yes
 ? QML Locale ............................. yes
Qt QML Models:
 ? QML list model ......................... yes
 ? QML delegate model ..................... yes
Qt Quick:
 ? Direct3D 12 ............................ no
 ? AnimatedImage item ..................... yes
 ? Canvas item ............................ yes
 ? Support for Qt Quick Designer .......... yes
 ? Flipable item .......................... yes
 ? GridView item .......................... yes
 ? ListView item .......................... yes
 ? TableView item ......................... yes
 ? Path support ........................... yes
 ? PathView item .......................... yes
 ? Positioner items ....................... yes
 ? Repeater item .......................... yes
 ? ShaderEffect item ...................... yes
 ? Sprite item ............................ yes

>>
>> Could you try to see what's going on ?
> Yes, I'm doing that now :)
>>
>> Thanks!
>>
>> Thomas
> Best
> Bartek
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Best
Bartek
