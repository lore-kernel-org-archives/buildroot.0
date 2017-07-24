From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 24 Jul 2017 12:51:32 -0700
Subject: [Buildroot] [PATCH v2] package/qt5location: handle plugins
 being conditionally built
In-Reply-To: <20170722212436.08e54709@gmx.net>
References: <1500669842-22691-1-git-send-email-joshua.henderson@microchip.com>
 <20170722212436.08e54709@gmx.net>
Message-ID: <3b66de0d-2111-9b8a-dac1-3e3f5c328e01@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 07/22/2017 12:24 PM, Peter Seiderer wrote:
> Hello Joshua,
> 
> On Fri, 21 Jul 2017 13:44:02 -0700, Joshua Henderson <joshua.henderson@microchip.com> wrote:
> 
>> This fixes a build issue where the qt5location plugins are not built, but are
>> attempted to be installed.
>>
>> The qt5location plugins have dependencies that are automatically and incorrectly
>> resolved causing plugins to conditionaly be built based on whether quick is
>> available. This change adds a patch that makes the plugins directory properly
>> depending on the positioning module irrelevent of quick.
>>
>> Fixes:
>>
>>     http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5/build-end.log
>>
>> Cc: Julien Corjon <corjon.j@ecagroup.com>
>> Cc: Peter Seiderer <ps.report@gmx.net>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>>
>> --
>>
>> Changes for v2:
>> - Instead of skipping missing files, fix the root cause of improper dependency
>>   on quick when building the position plugin.
>> ---
>>  ...001-Fix-plugins-build-dependency-tracking.patch | 40 ++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch
>>
>> diff --git a/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch
>> new file mode 100644
>> index 0000000..6be54a7
>> --- /dev/null
>> +++ b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch
>> @@ -0,0 +1,40 @@
>> +From 415558af5b7f8b8681726a171c75a4cc9d46ed81 Mon Sep 17 00:00:00 2001
>> +From: Joshua Henderson <joshua.henderson@microchip.com>
>> +Date: Fri, 21 Jul 2017 13:05:03 -0700
>> +Subject: [PATCH] Fix plugins build dependency tracking
>> +
>> +This fixes an issue introduced by c54ee74acdb9757989004005baf79e99be4c9417
>> +where plugins only depends on positioning if quick is available. The
>> +plugins/position SUBDIR will build without the dependency on quick, so move
>> +the dependency back outside.
>> +
>> +Upstream-Status: https://bugreports.qt.io/browse/QTBUG-62098
>> +Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> +---
>> + src/src.pro | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/src/src.pro b/src/src.pro
>> +index d0a1ee4..a0e6adb 100644
>> +--- a/src/src.pro
>> ++++ b/src/src.pro
>> +@@ -7,8 +7,6 @@ SUBDIRS += positioning
>> + positioning.depends = 3rdparty/clip2tri
>> + 
>> + qtHaveModule(quick) {
>> +-    plugins.depends += positioning
>> +-
>> +     SUBDIRS += location
>> +     location.depends += positioning 3rdparty/clip2tri
>> + 
>> +@@ -19,6 +17,7 @@ qtHaveModule(quick) {
>> + }
>> + 
>> + SUBDIRS += plugins
>> ++qtHaveModule(positioning): plugins.depends += positioning
> 
> Tested your patch, did not work, still:
> 
>   cp: cannot stat ?.../build_aarch64_qt5location_001/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/qt/plugins/position?: No such file or directory
> 
> Would have expected (but did not (yet) check if it will work):
> 
> + plugins.depends += positioning
> 
> without the 'qtHaveModule(positioning)' dependency as it is the problem that this
> module is not available at the time the file src.pro is parsed to create the Makefile
> file...
> 
> Note: for testing your have to do a complete build (make clean && make) or some other
> step to cleanup the qt installation (on a second run the module positioning is already
> available)

I think you may be onto something with an erroneous unclean build sneaking in there while
testing this.  I did test without the qtHaveModule(positioning) and it does seem to work
correctly.  I did a v3 of this patch and included your upstream patch instead (which
looks to be applied now) to get buildroot working for 5.9.1 as necessary.

Josh
