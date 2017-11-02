From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 2 Nov 2017 11:32:49 -0700
Subject: [Buildroot] [PATCH 1/1] qt5: remove Qt Quick dependency on
 opengl
In-Reply-To: <20171102171831.GC3238@scaer>
References: <1509639751-16841-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20171102171831.GC3238@scaer>
Message-ID: <bfb99fd2-5855-fd21-0ee1-00b28a7113d7@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, S?bastien, Joshua, Peter, All,

On 11/02/2017 10:18 AM, Yann E. MORIN wrote:
> S?bastien, Joshua, Peter, All,
> 
> On 2017-11-02 17:22 +0100, S?bastien Szymanski spake thusly:
>> From: Joshua Henderson <joshua.henderson@microchip.com>
>>
>> From: Joshua Henderson <joshua.henderson@microchip.com>
>>
>> Qt Quick should no longer depend on opengl, and instead fallback to the limited
>> functionality software renderer as a replacement [1] when not available. This
>> also pulls a qt5declarative patch into 5.9.2 to fix examples compiling without
>> opengl.
>>
>> [1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/
>>
>> Cc: Peter Seiderer <ps.report@gmx.net>
>> Cc: Julien Corjon <corjon.j@ecagroup.com>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> [S?bastien: remove dependency on qt5virtualkeyboard]
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>>  ...uickviewcomparison-and-quickwidget-needs-.patch | 57 ++++++++++++++++++++++
>>  package/qt5/qt5declarative/Config.in               |  6 +--
>>  package/qt5/qt5multimedia/qt5multimedia.mk         |  3 +-
>>  package/qt5/qt5quickcontrols/Config.in             |  4 +-
>>  package/qt5/qt5quickcontrols2/Config.in            |  4 +-
>>  package/qt5/qt5virtualkeyboard/Config.in           |  4 +-
>>  6 files changed, 68 insertions(+), 10 deletions(-)
>>  create mode 100644 package/qt5/qt5declarative/5.9.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
>>
>> diff --git a/package/qt5/qt5declarative/5.9.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/5.9.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
>> new file mode 100644
>> index 0000000..9c247d3
>> --- /dev/null
>> +++ b/package/qt5/qt5declarative/5.9.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
>> @@ -0,0 +1,57 @@
>> +From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
>> +From: Peter Seiderer <ps.report@gmx.net>
>> +Date: Tue, 16 May 2017 19:47:19 +0200
>> +Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs OpenGL
>> + support
>> +
>> +Fixes:
> [--SNIP--]
>> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>> +---
>> + examples/quick/quick.pro | 5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
>> +index 445dfb0fa..26ca0138e 100644
>> +--- a/examples/quick/quick.pro
>> ++++ b/examples/quick/quick.pro
>> +@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
>> + # Widget dependent examples
>> + qtHaveModule(widgets) {
>> +     SUBDIRS += embeddedinwidgets
>> +-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
>> ++    # OpenGL Support Required
>> ++    qtConfig(opengl(es1|es2)?) {
>> ++        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> 
> Upstream has a different patch, as commit fa52bb665d6b. Can you use that
> instead of your own?
> 

Looks like it.  I'll re-spin using that patch from the 5.10 branch.  I originally
copied this from the existing 5.6.3 patch, so I'll see if the same patch fits
there as well.

S?bastien, thanks for adding that qt5virtualkeyboard can also support no opengl.
Looks good.

Josh
