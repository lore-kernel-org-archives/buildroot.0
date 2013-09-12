From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 11 Sep 2013 22:21:14 -0500
Subject: [Buildroot] [PATCH v2 7/7] mesa3d-demos: new package
In-Reply-To: <523006A0.40907@mind.be>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-8-git-send-email-spenser@gillilanding.com>
 <523006A0.40907@mind.be>
Message-ID: <CAEBucnBMMx=O9cAuXhXc+LV=27ZXB1KBG9zcSp-K8GB0Dburtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Sep 11, 2013 at 12:58 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/09/13 06:25, Spenser Gilliland wrote:
>>
>>
>> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>> ---
>>   package/Config.in                                  |   1 +
>>   package/mesa3d-demos/Config.in                     |   8 +
>>   .../mesa3d-demos/mesa3d-demos-optional-gl.patch    | 348
>> +++++++++++++++++++++
>>   package/mesa3d-demos/mesa3d-demos.mk               |  63 ++++
>>   4 files changed, 420 insertions(+)
>>   create mode 100644 package/mesa3d-demos/Config.in
>>   create mode 100644 package/mesa3d-demos/mesa3d-demos-optional-gl.patch
>>   create mode 100644 package/mesa3d-demos/mesa3d-demos.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 27bd70a..e8ceb5a 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -39,6 +39,7 @@ source "package/lttng-modules/Config.in"
>>   source "package/lttng-tools/Config.in"
>>   source "package/ltrace/Config.in"
>>   source "package/memstat/Config.in"
>> +source "package/mesa3d-demos/Config.in"
>
>
>  I don't think that the Debug tools menu is the right place for this - at
> least, we have nothing similar there at the moment. How about putting it in
> the Graphical libraries and applications menu?

Will fix.

>
>>   source "package/netperf/Config.in"
>>   source "package/oprofile/Config.in"
>>   source "package/pax-utils/Config.in"
>> diff --git a/package/mesa3d-demos/Config.in
>> b/package/mesa3d-demos/Config.in
>> new file mode 100644
>> index 0000000..24c29e0
>> --- /dev/null
>> +++ b/package/mesa3d-demos/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_MESA3D_DEMOS
>> +       bool "mesa3d-demos"
>> +       depends on BR2_PACKAGE_HAS_OPENGL || BR2_PACKAGE_HAS_OPENGL_ES \
>> +               || BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENVG
>> +       help
>> +         OpenGL demos from the Mesa 3D project.
>> +
>> +         http://mesa3d.org
>> diff --git a/package/mesa3d-demos/mesa3d-demos-optional-gl.patch
>> b/package/mesa3d-demos/mesa3d-demos-optional-gl.patch
>> new file mode 100644
>> index 0000000..9345d29
>> --- /dev/null
>> +++ b/package/mesa3d-demos/mesa3d-demos-optional-gl.patch
>> @@ -0,0 +1,348 @@
>> +This patch makes the egl stuff work with other opengles providers and
>> makes
>> +it possible to build the demos without opengl (only opengles.)
>
>
>  Can you upstream this? Probably needs to be split into two patches in that
> case.

Will do.

>
>> +
>> +Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>> +---
>> +Index: mesa3d-demos-8.1.0/configure.ac
>> +===================================================================
>> +--- mesa3d-demos-8.1.0.orig/configure.ac       2013-02-24
>> 04:49:47.000000000 -0600
>> ++++ mesa3d-demos-8.1.0/configure.ac    2013-09-05 10:01:19.137886856
>> -0500
>> +@@ -51,6 +51,14 @@
>> +   ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.])])
>> + PKG_PROG_PKG_CONFIG()
>> +
>> ++AC_ARG_ENABLE([gl],
>> ++    [AS_HELP_STRING([--enable-gl],
>> ++        [enable GL library @<:@default=no@:>@])],
>> ++    [gl_enabled="$enableval"],
>> ++    [gl_enabled=auto])
>> ++
>> ++if test "x$gl_enabled" != "xno"; then
>> ++
>> + dnl Get the pkg-config definitions for libGL.  We include a fallback
>> + dnl path for GL implementation that don't provide a .pc file
>> + PKG_CHECK_MODULES(GL, [gl], [], [
>> +@@ -103,6 +111,8 @@
>> + DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
>> + DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
>> +
>> ++fi
>> ++
>> + AC_ARG_ENABLE([egl],
>> +     [AS_HELP_STRING([--enable-egl],
>> +         [enable EGL library @<:@default=no@:>@])],
>> +@@ -202,7 +212,6 @@
>> +         [enable support for wayland @<:@default=no@:>@])],
>> +     [wayland_enabled="$enableval"],
>> +     [wayland_enabled=no])
>> +-
>
>
>  Why remove this line?

Will fix.

>
>  Regards,
>  Arnout
>
>
>> + if test "x$wayland_enabled" != "xno"; then
>> +     PKG_CHECK_MODULES(WAYLAND, [wayland-client wayland-egl],
>> [wayland_enabled=yes], [wayland_enabled=no])
>> + fi
>> +@@ -287,7 +296,7 @@
>
> [snip]
>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Thanks,
Spenser


-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
