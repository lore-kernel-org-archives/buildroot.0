From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Nov 2015 22:43:10 +0100
Subject: [Buildroot] [PATCH 1/1] libgdiplus: new package
In-Reply-To: <CANu7NGt4W43MVg7Hnob4dO4QY0dB_6+Aw9ejq5=hjvs=e6utkw@mail.gmail.com>
References: <1448048842-25060-1-git-send-email-sergio.prado@e-labworks.com>
 <5652291B.2040408@mind.be>
 <CANu7NGt4W43MVg7Hnob4dO4QY0dB_6+Aw9ejq5=hjvs=e6utkw@mail.gmail.com>
Message-ID: <5653886E.2000800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-11-15 13:36, Sergio Prado wrote:
> Hi Arnout,
> 
> 2015-11-22 18:44 GMT-02:00 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>>:
[snip]
>     > diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
>     > new file mode 100644
>     > index 000000000000..173d9af0d48a
>     > --- /dev/null
>     > +++ b/package/libgdiplus/Config.in
>     > @@ -0,0 +1,14 @@
>     > +config BR2_PACKAGE_LIBGDIPLUS
>     > +     bool "libgdiplus"
>     > +     select BR2_PACKAGE_XLIB_LIBXFT
>     > +     select BR2_PACKAGE_LIBGLIB2
> 
>      You need to add that package's dependencies to this package, so:
> 
>             depends on BR2_USE_WCHAR # libglib2 -> gettext
>             depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> 
>             depends on BR2_USE_MMU # libglib2
> 
> Libgdiplus depends on BR2_PACKAGE_XORG7, that already depends on BR2_USE_WCHAR
> and BR2_TOOLCHAIN_HAS_THREADS. That means that, because of the xorg dependency,
> it is not possible to select libgdiplus with a toolchain that has no wchar or
> threads support. Should I still depend on wchar and threads?

 You can choose :-). The advantage of still specifying is that if the Xorg
dependency is ever removed (e.g. when it also works for wayland), the
dependencies coming from libglib2 are still there. But indeed, it's not really
necessary.

 It would be good to mention that in a comment though, so that people like me
don't get confused :-).

 The MMU is still needed, right?

>  
> 
> 
>     > +     select BR2_PACKAGE_CAIRO
> 
>      Same here:
> 
>             depends on BR2_ARCH_HAS_ATOMICS # cairo
> 
> OK.
> 
> 
>     > +     select BR2_PACKAGE_LIBPNG
>     > +     depends on BR2_PACKAGE_XORG7
>     > +     help
>     > +       An Open Source implementation of the GDI+ API.
>     > +
>     > +       https://github.com/mono/libgdiplus
>     > +
>     > +comment "libgdiplus depends on X.org"
>     > +     depends on !BR2_PACKAGE_XORG7
> 
>      We don't add comments for X.org dependencies. But you should add a comment for
>     wchar and threads:
> 
>     comment "libgdiplus needs a toolchain w/ wchar, threads"
> 
> OK.

 This will not be needed then, it would anyway never be visible.

[snip]
>     > +LIBGDIPLUS_LICENSE_FILES = LICENSE
> 
>      Unfortunately, COPYING doesn't contain the license text, so this should be
> 
>     LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
> 
> OK. Is there any reason to select specifically the src/carbon-private.h header
> file, instead of many others that also have copyright messages?

 It's the smallest file that has a copyright header.

[snip]
>     > +ifeq ($(BR2_PACKAGE_PANGO),y)
>     > +LIBGDIPLUS_CONF_OPTS += --with-pango
>     > +LIBGDIPLUS_DEPENDENCIES += pango
> 
>      We prefer to add an explicit --without-pango.
> 
> That was my previous implementation, but there is a bug in the configure script
> that *enables* pango support when I pass --without-pango. Looks like it is
> checking only for the string "pango" in the configure parameter to enable it.
> Should I create a patch to fix this bug or just use --with-pango as it is,
> adding a comment to explain why we are not using --without-pango?

 Adding a comment would be good, yes.

>  
> 
> 
>     > +endif
>     > +
>     > +ifeq ($(BR2_PACKAGE_LIBEXIF),y)
>     > +LIBGDIPLUS_CONF_OPTS += --with-libexif
>     > +LIBGDIPLUS_DEPENDENCIES += libexif
>     > +else
>     > +LIBGDIPLUS_CONF_OPTS += --without-libexif
>     > +endif
>     > +
>     > +ifeq ($(BR2_PACKAGE_JPEG),y)
>     > +LIBGDIPLUS_CONF_OPTS += --with-libjpeg
>     > +LIBGDIPLUS_DEPENDENCIES += jpeg
>     > +else
>     > +LIBGDIPLUS_CONF_OPTS += --without-libjpeg
>     > +endif
>     > +
>     > +ifeq ($(BR2_PACKAGE_TIFF),y)
>     > +LIBGDIPLUS_CONF_OPTS += --with-libtiff
>     > +LIBGDIPLUS_DEPENDENCIES += tiff
>     > +else
>     > +LIBGDIPLUS_CONF_OPTS += --without-libtiff
>     > +endif
> 
>      There are also optional dependencies on fontconfig, freetype.
> 
> I'm not sure if it is optional. The project documentation says it is a
> requirement (https://github.com/mono/libgdiplus/blob/master/README). I've tried
> to build without them but the configure script does not handle these options:

 Sorry, fontconfig and freetype are of course already selected by xlib_libXft.
So never mind this.


 Regards,
 Arnout

> 
> configure: WARNING: unrecognized options: --disable-gtk-doc,
> --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation,
> --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --without-fontconfig,
> --without-freetype, --without-freetype2
> 
> What do you think?
> 
> 
> 
>      Regards,
>      Arnout
> 
> Thanks!
>  
> 
> 
>     > +
>     > +$(eval $(autotools-package))
>     >
> 
> 
>     --
>     Arnout Vandecappelle                          arnout at mind be
>     Senior Embedded Software Architect            +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind                                http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
