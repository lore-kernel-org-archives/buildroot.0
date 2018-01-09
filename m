From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 9 Jan 2018 15:56:17 -0700
Subject: [Buildroot] [PATCH] qt5wayland: compositor depends on
 BR2_PACKAGE_QT5BASE_OPENGL
In-Reply-To: <20180109203051.GD3834@scaer>
References: <1515457090-29564-1-git-send-email-joshua.henderson@microchip.com>
 <20180109203051.GD3834@scaer>
Message-ID: <f61d8fdc-5da8-b6f7-55e7-b05a29b165d5@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On 01/09/2018 01:30 PM, Yann E. MORIN wrote:
> Joshua, All,
> 
> On 2018-01-08 17:18 -0700, Joshua Henderson spake thusly:
>> When building Qt 5.6.3, the qt5wayland compositor depends on Qt OpenGL support.
> 
> Certainly not. It can also work on EGL/GLES setups as well.
> 
> AFAIK, it can also work with various non-GL wayland backends, like a
> rpi-specific one...
> 
> I'm not sure what the correct solution is, though, but certainly not a
> dependency on GL.

I agree.  This should not be the logical case.  In the meantime, this patch
mitigates the build error with respect to Qt 5.6.3 (>= Qt 5.8 does not have this issue)
until qt5wayland 5.6.3 can be properly fixed, as necessary.

To be clear, this issue is not related to Qt wayland client support.  Also, this issue
is not just opengl support and also includes Qt opengl support (BR2_PACKAGE_QT5BASE_OPENGL)
that is required for the qt5wayland 5.6.3 _compositor_ (a separate buildroot config
option) and not all of qt5wayland.

qt5wayland 5.6.3 (i.e. QtWaylandClient) compiles without Qt opengl, but not the
compositor (still marked as experimental?).

The compositor would not compile without opengl in 5.6.3 and an issue was 
eventually reported at 5.8 alpha:

    https://bugreports.qt.io/browse/QTBUG-54322

and has been fixed since then circa Qt 5.8:

    https://codereview.qt-project.org/#/c/163838/

This made it onto the 5.8/5.9/5.10 branches as

    commit b6dff11dc9781b677c02c8308a44e85f2d919fa0
    Author: Johan Klokkhammer Helsing <johan.helsing@qt.io>
    Date:   Fri Jun 24 12:45:48 2016 +0200

but not 5.6/5.7 branches.  A cursory look shows most of this patch involves disabling
components of the compositor if opengl is not available 
(glx/xcomposite/qwindow-compositor/minimal-cpp), and more involves #ifdef'ing out
code when there is no opengl.

This patch does not backport easily to qt5wayland 5.6.3, but I'll take a stab at
re-implementing the same idea in 5.6.3 upstream if this seems valuable (seeing that
it's always been broken).

Josh

> 
> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>>       http://autobuild.buildroot.net/results/289d9b73d99e29d61c2df9ce228fed3968d89f5c
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> ---
>>  package/qt5/qt5wayland/Config.in | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
>> index 0182d3c..e201830 100644
>> --- a/package/qt5/qt5wayland/Config.in
>> +++ b/package/qt5/qt5wayland/Config.in
>> @@ -18,8 +18,12 @@ config BR2_PACKAGE_QT5WAYLAND
>>  
>>  if BR2_PACKAGE_QT5WAYLAND
>>  
>> +comment "qt5wayland compositor needs Qt OpenGL support"
>> +	depends on !BR2_PACKAGE_QT5BASE_OPENGL && !BR2_PACKAGE_QT5_VERSION_LATEST
>> +
>>  config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
>>  	bool "Enable compositor (experimental)"
>> +	depends on BR2_PACKAGE_QT5BASE_OPENGL || BR2_PACKAGE_QT5_VERSION_LATEST
>>  	help
>>  	  The compositor API is still experimental, and not built by
>>  	  default.
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
