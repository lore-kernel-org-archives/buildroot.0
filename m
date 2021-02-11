From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 11 Feb 2021 08:51:58 +0100
Subject: [Buildroot] [PATCH 2/3] package/perl-gd: needs
 perl-extutils-pkgconfig
In-Reply-To: <CAPi7W82JBBH6bRjH2L2-RvM-1V0kXGVZm8BFsijgT7aUOZ+gVA@mail.gmail.com>
References: <20210124112214.480254-1-fontaine.fabrice@gmail.com>
 <20210124112214.480254-2-fontaine.fabrice@gmail.com>
 <20210125214840.78cd755e@windsurf.home>
 <CAPi7W82JBBH6bRjH2L2-RvM-1V0kXGVZm8BFsijgT7aUOZ+gVA@mail.gmail.com>
Message-ID: <CAB0FRss0kKddd-UySe7eC_wWOsk-ubO5tNrhb+sVSVJDOwXvSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 25 janv. 2021 ? 22:05, Fabrice Fontaine <fontaine.fabrice@gmail.com>
a ?crit :

> Hello,
>
> Le lun. 25 janv. 2021 ? 21:48, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > Hello,
> >
> > +Fran?ois in Cc.
> >
> > On Sun, 24 Jan 2021 12:22:13 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > +- at INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
> > > ++#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
> >
> > I'm certainly not very good with Perl, but doesn't the "unless @INC"
> > means "if INC is not already specified" ?
> I'm also not good with Perl but it seems to me that unless means
> "unless @INC is empty (i.e. not already specified or empty)"
> >
> > > + @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib
> -L/usr/lib) unless @LIBPATH;
> >
> > And isn't that a problem, too ? These library paths are pretty horrible
> > for cross-compilation.
> LIBPATH will be overriden with the -L value added by our pkg-config
> wrapper thanks to this piece of code:
>
> @LIBS = split /\s+/,$libs;
> if ($libdir) {
>   if ($config) {
>     @LIBPATH = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
>     ($lib_gd_path = $libdir) =~ s!/[^/]+$!!;
>   } else {
>     $lib_gd_path = $libdir;
>   }
>   push @LIBPATH,"-L$libdir";
> }
>
> The issue is that INC will be empty because it is extracted from cflags:
> @INC = map {s/^-I// && "-I$_"} split /\s+/,$cflags;
>
> But a review from a Perl would be nice as this solution is indeed a bit
> ugly.
>

the patch against Makefile.PL is fine.

Fran?ois


> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
>
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210211/326392bd/attachment.html>
