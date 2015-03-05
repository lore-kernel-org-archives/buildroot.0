From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 5 Mar 2015 23:22:12 +0100
Subject: [Buildroot] [PATCH v1] libsvg: fix undefined symbol
 png_set_gray_1_2_4_to_8
In-Reply-To: <20150305230536.0e144343@free-electrons.com>
References: <1425589265-16605-1-git-send-email-ps.report@gmx.net>,
 <20150305230536.0e144343@free-electrons.com>
Message-ID: <trinity-89b445ea-ff6c-4e8e-aadb-fc49bf2f6976-1425594132031@3capp-gmx-bs59>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Donnerstag, 05. M?rz 2015 um 23:05 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v1] libsvg: fix undefined symbol png_set_gray_1_2_4_to_8
>
> Dear Peter Seiderer,
> 
> On Thu,  5 Mar 2015 22:01:05 +0100, Peter Seiderer wrote:
> > Fixes the following runtime error e.g. from df_texture:
> > 
> > (!) Direct/Interface: Unable to dlopen `/usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_svg.so'!
> >     --> /usr/lib/libsvg.so.1: undefined symbol: png_set_gray_1_2_4_to_8
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...-undefined-symbol-png_set_gray_1_2_4_to_8.patch | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
> 
> Thanks, I've applied your patch. However:
> 
>  1/ libsvg is still severely broken. It uses symbols from libpng and
>     libjpeg, but it doesn't link against those libraries. The output of
>     'readelf -d' on libsvg says:
> 
>  0x00000001 (NEEDED)                     Shared library: [libxml2.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
>  0x0000000e (SONAME)                     Library soname: [libsvg.so.1]
> 
>     This means that if you try to compile an application with just
>     '-lsvg', it doesn't build because the shared library doesn't
>     express its dependency on other libraries. This is wrong.
> 
>     The configure.in script also doesn't check for the presence of
>     libjpeg and libpng. Bad.
> 

Not good...

>  2/ Isn't libsvg abandoned? Latest release in 2005. Same for
>     libsvg-cairo. DirectFB is apparently the only remaining user of
>     this library. Is the latest version of DirectFB still using
>     libsvg-cairo ?
> 

Yes, no changes regarding to this in DirectFB-1.7.7...

Regards,
Peter

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
