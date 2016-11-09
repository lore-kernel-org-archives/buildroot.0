From: Andreas Naumann <dev@andin.de>
Date: Wed, 9 Nov 2016 19:53:39 +0100
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.8.0-beta
In-Reply-To: <ddc8a62d-18c3-2475-f711-7a7feb64a730@mind.be>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
 <ddc8a62d-18c3-2475-f711-7a7feb64a730@mind.be>
Message-ID: <219fd92c-ebc2-1782-8ea5-237fd1873868@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 08.11.2016 um 23:50 schrieb Arnout Vandecappelle:
>
>
> On 08-11-16 11:30, Andreas Naumann wrote:
>> Removed all hashes (until final release).
>
>  Review would have been easier if you did that in a separate patch.

ok
>
>>
>> - qt5base: renamed library to EglFSDeviceIntegration ([1])
>> - qt5base: remove ras-pi patch
>
>  You should mention in the commit message why: (applied upstream).

Well in fact, I dont know why. I've tried a reworked patch and ommiting 
it. Both compiled just fine (with eglfs), so I went with the simpler 
solution :-).
An assumption would be the change in library handling in configure 
(qtbase c0cc5052097c723d0331a7619d686af9eb93d33c). Maybe Julien, who 
originally submitted the patch, can shed some light on this.


>
>> - qt5base: remove obsolete config-option -large ([2])
>
>  -largefile, not -large. Also mention explicitly what happened: largefile is not
> always enabled.

ok (largefile is now always on and no longer configurable)
>
>> - qt5base: make the directfb platform plugin compile ([3])
>> - qt53d/quickcontrols2/serialbus: move out of tech-preview
>
>  I didn't see this in your patch?

just moved the position in Config.in

>
>> - qt5enginio: remove discontinued module
>
>  This should have been done in a separate commit.
>

ok

>>
>> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
>> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
>> [3] Without this patch, qmake is looking for directfb_egl feature which usually is not
>>     provided (only by some raspi mkspec afaics).
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>
> [snip]
>> diff --git a/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
>> new file mode 100644
>> index 0000000..96cc3b0
>> --- /dev/null
>> +++ b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
>> @@ -0,0 +1,22 @@
>
>  Missing patch description + SoB. Also make it a git-formatted patch.
>
>  For this patch, it is absolutely necessary to get upstream feedback because it
> looks very iffy to me.

iffy indeed. After a second look, maybe the new feature system doesnt 
know directfb_egl at all. Will report upstream.

>
>> +diff --git a/src/plugins/platforms/directfb/directfb.pro b/src/plugins/platforms/directfb/directfb.pro
>> +index 406b89e..a83b09f 100644
>> +--- a/src/plugins/platforms/directfb/directfb.pro
>> ++++ b/src/plugins/platforms/directfb/directfb.pro
>> +@@ -3,7 +3,7 @@ TARGET = qdirectfb:q
>> + QT += \
>> +     core-private gui-private \
>> +     eventdispatcher_support-private service_support-private \
>> +-    fontdatabase_support-private egl_support-private
>> ++    fontdatabase_support-private
>> +
>> + QMAKE_USE += directfb
>> +
>> +@@ -27,7 +27,7 @@ HEADERS = qdirectfbintegration.h \
>> +     qdirectfbeglhooks.h
>> +
>> + # ### port the GL context
>> +-qtConfig(directfb_egl) {
>> ++contains(QT_CONFIG, directfb_egl) {
>
>  Aren't these two equivalent? If this is being built for anything other than
> linux-mipsel-broadcom-97425-g++, there is really something weird going on...
>
>  Anyway, to make the patch correct, you should add QT += egl_support-private here.
>
>  Regards,
>  Arnout
>
>> +     HEADERS += qdirectfb_egl.h
>> +     SOURCES += qdirectfb_egl.cpp
>> +     DEFINES += DIRECTFB_GL_EGL
>
>
>
