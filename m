From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 5 Sep 2018 14:06:40 +0200
Subject: [Buildroot] [PATCH v2] qt5location: fix build failure due to
 missing qt5base gui dependency
In-Reply-To: <20180905135307.051cd136@windsurf>
References: <20180905090307.89484-1-giulio.benetti@micronovasrl.com>
 <20180905135307.051cd136@windsurf>
Message-ID: <3dc3c769-4128-d00e-7833-31d73bf5d514@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 05/09/2018 13:53, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed,  5 Sep 2018 11:03:07 +0200, Giulio Benetti wrote:
>> qt5location fails to build due to missing Qt5 Gui module.
>> In configure.json features.opengl is referred, but it is available only
>> if qt5base gui submodule is built.
>>
>> Add BR2_PACKAGE_QT5BASE_GUI to qt5location Config.in to assure gui
>> submodule is built before qt5location.
>>
>> Fixes:
>> http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/
>> http://autobuild.buildroot.org/results/223/223ec6565beba1ca73d4ff488296feec53656b40/
>> http://autobuild.buildroot.org/results/84f/84fe1c84e3537167ee3791e83c9fe2cc2805ccb5/
>> http://autobuild.buildroot.org/results/9c9/9c96d2106222e623a379f9995bd059725eb27769/
>> http://autobuild.buildroot.org/results/fa0/fa01513d28d896ca8819966c5b1ed5c35283e92f/
>> http://autobuild.buildroot.org/results/5d7/5d7333470c31b83c697218382dc77f74af86c666/
>> http://autobuild.buildroot.org/results/db7/db7b4c61bb41d32e0f7960c194588cd1559ff3f7/
>> http://autobuild.buildroot.org/results/2b7/2b71f186b8d67c4805393c9c016d641893d46220/
>> http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>> Changes V1->V2:
>> * add missing Fixes: list in commit log
>>
>>   package/qt5/qt5location/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
>> index e1778182a0..7c39979eff 100644
>> --- a/package/qt5/qt5location/Config.in
>> +++ b/package/qt5/qt5location/Config.in
>> @@ -1,6 +1,7 @@
>>   config BR2_PACKAGE_QT5LOCATION
>>   	bool "qt5location"
>>   	select BR2_PACKAGE_QT5BASE
>> +	select BR2_PACKAGE_QT5BASE_GUI
> 
> To me, it looks weird that the location services need the GUI support.
> Isn't it just the qt5location examples that need GUI support, or
> something like that ?

The problem is that its configure.json depends on it
https://github.com/qt/qtlocation/blob/5.11/src/location/configure.json#L3
to check feature.opengl
https://github.com/qt/qtlocation/blob/5.11/src/location/configure.json#L44

Also Qt Location is for creating mapping solutions:
http://doc.qt.io/qt-5/qtlocation-index.html
check i.e. examples:
http://doc.qt.io/qt-5/qtlocation-examples.html

So in the end, it seems it makes sense.
In the beginning I thought it was a submodule to only get location 
parameters only.

> 
> Also, having BR2_PACKAGE_QT5BASE_GUI does not guarantee that OpenGL
> support is available, so I'm not sure this is going to fix the error in
> all cases.

I'm executing test-pkg -a right now, I'm on 3/47 passed, need some hour.

Giulio
