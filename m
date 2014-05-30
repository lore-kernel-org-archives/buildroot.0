From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Fri, 30 May 2014 22:32:49 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>	<CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>	<5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
Message-ID: <5388EAF1.50801@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30.05.2014 21:57, Spenser Gilliland wrote:
> Peter,
>
> On May 30, 2014 10:55 AM, "Peter K?mmel" <syntheticpp at gmx.net <mailto:syntheticpp@gmx.net>> wrote:
>  >
>  > On 30.05.2014 17:31, Spenser Gilliland wrote:
>  >>
>  >> Peter,
>  >>
>  >> On May 30, 2014 10:00 AM, "Peter K?mmel" <syntheticpp at gmx.net <mailto:syntheticpp@gmx.net>
> <mailto:syntheticpp at gmx.net <mailto:syntheticpp@gmx.net>>> wrote:
>  >>  >
>  >>  > Signed-off-by: Peter K?mmel <syntheticpp at gmx.net <mailto:syntheticpp@gmx.net> <mailto:syntheticpp@gmx.net
> <mailto:syntheticpp@gmx.net>>>
>  >>
>  >>  > ---
>  >>  >  package/ti-gfx/glesv2.pc | 2 +-
>  >>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>  >>  >
>  >>  > diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
>  >>  > index 4c70aec..c3846d0 100644
>  >>  > --- a/package/ti-gfx/glesv2.pc
>  >>  > +++ b/package/ti-gfx/glesv2.pc
>  >>  > @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
>  >>  >  Version: 1.9.2188537
>  >>  >  Requires:
>  >>  >  Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
>  >>  > -Cflags: -I${includedir}/GLES2
>  >>  > +Cflags: -I${includedir}/GLES2 -I${includedir}
>  >>  > --
>  >>  > 1.9.1
>  >>  >
>  >>  >
>  >>
>  >> Does this fix a package for you?   The includedir var should be /usr/include which is a default include path.
>  >
>  >
>  > Yes, Qt5's cmake files assume /usr/include not /usr/include/GLES2.
>  >
>  > I added -I${includedir} instead of removing only "GLES2" because then nothing will break,
>  > and the other .pc file also sets both dirs.
>  > But it seems common practice is to not add the uppercase dir names in the pkg-congig file.
>
> This patch won't break anything.  But it would be nice if you could go back and reverify this just to be sure.

Maybe you got me wrong, I think this is the correct patch:

-Cflags: -I${includedir}/GLES2
+Cflags: -I${includedir}

but it could break existing code, so I ADDED -I${includedir}, even when it is a bit redundant. This
way it looks like egl.pc:

$cat buildroot/package/ti-gfx/egl.pc
prefix=/usr/
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: egl
Description: TI Graphics SDK implementation of EGL
Version: 1.9.2188537
Requires:
Libs: -L${libdir} -lEGL -lGLESv2 -lIMGegl
Cflags: -I${includedir}/EGL/ -I${includedir}

BTW, freescale-imx/gpu-viv-bin-mx6q/glesv2.pc only adds -I${includedir}
and sunxi-mali/glesv2.pc also misses -I${includedir}, should we fix this?


>
> My reasoning is that,  /usr/include is a default include dir which all compilers should use automatically.   There
> should not be a need to manually specify it.
>
> However,  that's not to say that cmake doesn't disable the default include dir some how. If that's the case,  it may be
> better to try to fix cmake or the qt5 packages.

The cmake script looks at configure for the header "GLES2/gl2.h" only in the the paths reported by --cflags-only-I
therefore -I${includedir}/GLES2 does not work.

>
> However, If you don't have time to investigate the items above and this patch fixes the problem then I see no problem in
> applying it. So, it has my ack.

Thanks,

Peter


>
> Acked by: Spenser Gilliland <spenser at gillilanding.com <mailto:spenser@gillilanding.com>>
>
> Thanks,
> Spenser
>
>  >
>  > Peter
>  >
>  >>
>  >> Thanks,
>  >> Spenser _______________________________________________
>  >>  > buildroot mailing list
>  >>  > buildroot at busybox.net <mailto:buildroot@busybox.net> <mailto:buildroot at busybox.net <mailto:buildroot@busybox.net>>
>  >>  > http://lists.busybox.net/mailman/listinfo/buildroot
>  >>
>  >
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net <mailto:buildroot@busybox.net>
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
