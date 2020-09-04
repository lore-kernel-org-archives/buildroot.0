From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 22:36:13 +0200
Subject: [Buildroot] [PATCH 1/3] package/libcamera: Prevent builds on
 m68k
In-Reply-To: <20200904203358.GL14354@scaer>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
 <20200904203358.GL14354@scaer>
Message-ID: <20200904203613.GM14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kieran, All,

On 2020-09-04 22:33 +0200, Yann E. MORIN spake thusly:
> On 2020-09-04 10:51 +0100, Kieran Bingham spake thusly:
> > The ControlValue structure is currently defined with a 16-bit hole
> > (causing unaligned access to the numElements_ field, though that's a
> > separate topic).
> > 
> > This structure has a static assertion to ensure that its size does not
> > change without due care, as it forms part of our ABI and is used in
> > Serialisation between the pipeline handlers and IPA componenents.
> > 
> > The m68k architecture is the only target which fails this assertion,
> > which is likely because it can pack the structure more efficiently,
> > producing a different binary size.
> > 
> > This is likely an area we will tackle before stabilising our ABI, but
> > until then, disable m68k builds as libcamera is not expected to be
> > supported on this target.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Applied to master, after doing the slight adjustments suggested by
> Thomas:
> 
>   - introduce BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>   - propagate that to the comment
>   - add autobuilder reference

Ah, I forgot to note:
  - move the arch dependency to the top (indeed we like to have those
    dependencies first:
        https://buildroot.org/downloads/manual/manual.html#_config_files

Cheers!

Regards,
Yann E. MORIN.

> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/libcamera/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> > index 960d78b82e95..1ea747d1c57e 100644
> > --- a/package/libcamera/Config.in
> > +++ b/package/libcamera/Config.in
> > @@ -5,6 +5,8 @@ menuconfig BR2_PACKAGE_LIBCAMERA
> >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
> >  	depends on !BR2_STATIC_LIBS # gnutls
> >  	depends on BR2_USE_WCHAR # gnutls
> > +	# Invalid packing size of ControlValue struct on m68k
> > +	depends on !BR2_m68k
> >  	select BR2_PACKAGE_GNUTLS
> >  	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> >  	help
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
