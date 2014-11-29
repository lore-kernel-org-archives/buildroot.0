From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Sat, 29 Nov 2014 10:50:59 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix configure/build
In-Reply-To: <8761dzkqbe.fsf@dell.be.48ers.dk>
References: <1417195423-17839-1-git-send-email-francois.perrad@gadz.org>
 <8761dzkqbe.fsf@dell.be.48ers.dk>
Message-ID: <CAGhdn56p-WpX1w6A5hxos+DjSdaHVzZGHUsi0342xnBBXZDSKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-11-28 21:44 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > see
> http://autobuild.buildroot.net/results/e74/e74efded899744d757cb798c44f096b54898f95a/
>  > this new patch prevents the use of a host gdlib-config
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > ---
>  >  package/perl-gd/perl-gd-04-no-autoconfig.patch | 19 +++++++++++++++++++
>  >  1 file changed, 19 insertions(+)
>  >  create mode 100644 package/perl-gd/perl-gd-04-no-autoconfig.patch
>
>  > diff --git a/package/perl-gd/perl-gd-04-no-autoconfig.patch
> b/package/perl-gd/perl-gd-04-no-autoconfig.patch
>  > new file mode 100644
>  > index 0000000..c067d41
>  > --- /dev/null
>  > +++ b/package/perl-gd/perl-gd-04-no-autoconfig.patch
>  > @@ -0,0 +1,19 @@
>  > +prevents the use of gdlib-config in a cross-compilation environment
>  > +
>  > +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > +
>  > +Index: b/Makefile.PL
>  > +===================================================================
>  > +--- a/Makefile.PL
>  > ++++ b/Makefile.PL
>  > +@@ -272,6 +272,7 @@
>  > + exit 0;
>  > +
>  > + sub try_to_autoconfigure {
>  > ++  return; # hack for BR
>
> But does that do the right thing?
>
>
with this patch, gdlib-config is never called, the configure step uses only
values from PERL_GD_CONF_OPTS.

Fran?ois


> This is what our gdlib-config returns when E.G. building with png and
> jpeg support:
>
> ./staging/usr/bin/gdlib-config --all
>    ~/source/buildroot/outputgd
> GD library  2.1.0
> includedir:
> /home/peko/source/buildroot/outputgd/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
> cflags:
>  -I/home/peko/source/buildroot/outputgd/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
> ldflags:     -pthread
> libs:       -ljpeg -lz -lm
> -L/home/peko/source/buildroot/outputgd/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> -lpng16
> libdir:
>  /home/peko/source/buildroot/outputgd/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> features:   GD_JPEG GD_PNG GD_GIF GD_GIFANIM GD_OPENPOLYGON
>
> As far as I can see it doesn't end up linking with those libraries /
> using -pthread. Does it work for you? (it might, when using shared
> linking).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/7248051e/attachment.html>
