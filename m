From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 10:56:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/perl-net-ssleay: fix
 buildsystem for cross-compilation
In-Reply-To: <CAB0FRsvzdiwzfNQ+Hxs7+iAESN-BfhDbCcTVvoZ8ahg9P0me_w@mail.gmail.com>
References: <1405206164-10189-1-git-send-email-yann.morin.1998@free.fr>
 <1405206164-10189-2-git-send-email-yann.morin.1998@free.fr>
 <CAB0FRsvzdiwzfNQ+Hxs7+iAESN-BfhDbCcTVvoZ8ahg9P0me_w@mail.gmail.com>
Message-ID: <20140713085621.GB3588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-13 09:07 +0200, Fran?ois Perrad spake thusly:
> see http://patchwork.ozlabs.org/patch/367112/ (which is a part of your patch)

Hehe! Same patch, again! :-)

But it misses the fact that perl-net-ssleay will try to _run_ the
openssl binary it found, which can not work in cross-compilation.

I'll get your patch and complement with the missing changes.

> and http://patchwork.ozlabs.org/patch/366934/

But that one is not correct, as Peter and Thomas explained: it does not
account for static builds, whereas mine should work also for static.

I'll do a static build to check, and will respin a consolidated series
later.

Regards,
Yann E. MORIN.

> 2014-07-13 1:02 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > The buildsystem for perl-net-ssleay is totally brain-damaged: it tries
> > to execute the openssl program. It uses that to check the openssl
> > version, detect the prefix to openssl, and set the include and library
> > search paths.
> >
> > Of course, it does not handle the destdir idiom, so it ends up finding
> > the host system's openssl (not even ours!), so it sets search paths to
> > /usr/inlcude and /usr/lib and /lib.
> >
> > Well, guess what? It does not work.
> >
> > Fix that by:
> >   - passing the prefix to openssl in the environment, so it does not go
> >     hunting for the host-system openssl;
> >   - not checking the version string, since we can't run, and Buildroot
> >     has the correct version anyway;
> >   - not setting any -I or -L paths since our compiler/linker already
> >     know where to look for for includes and libs.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Francois Perrad <fperrad@gmail.com>
> > ---
> >  .../perl-net-ssleay-001-fix-build-system.patch     | 25 ++++++++++++++++++++++
> >  package/perl-net-ssleay/perl-net-ssleay.mk         |  4 ++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 package/perl-net-ssleay/perl-net-ssleay-001-fix-build-system.patch
> >
> > diff --git a/package/perl-net-ssleay/perl-net-ssleay-001-fix-build-system.patch b/package/perl-net-ssleay/perl-net-ssleay-001-fix-build-system.patch
> > new file mode 100644
> > index 0000000..a5ee961
> > --- /dev/null
> > +++ b/package/perl-net-ssleay/perl-net-ssleay-001-fix-build-system.patch
> > @@ -0,0 +1,25 @@
> > +diff -durN perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm
> > +--- perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm 2014-04-01 08:08:37.000000000 +0200
> > ++++ perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm      2014-07-13 00:38:46.281380282 +0200
> > +@@ -37,14 +37,18 @@
> > +         exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
> > +     }
> > +
> > +-    $self->check_openssl_version($prefix, $exec);
> > ++# Does not work for cross-compilation.
> > ++# In Buildroot, we do have a supported version.
> > ++#    $self->check_openssl_version($prefix, $exec);
> > +     my $opts = $self->ssleay_get_build_opts($prefix, $exec);
> > +
> > +     $self->makemaker_args(
> > +         CCCDLFLAGS => $opts->{cccdlflags},
> > +         OPTIMIZE => $opts->{optimize},
> > +-        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
> > +-        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
> > ++# Buildroot already has the correct include and library search paths.
> > ++#        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
> > ++#        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
> > ++        LIBS => join(' ', (map {"-l$_"} @{$opts->{lib_links}})),
> > +     );
> > +
> > +     if ( $self->prompt(
> > diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
> > index 413fdf0..4a362fb 100644
> > --- a/package/perl-net-ssleay/perl-net-ssleay.mk
> > +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
> > @@ -11,4 +11,8 @@ PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
> >  PERL_NET_SSLEAY_LICENSE = OpenSSL
> >  PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
> >
> > +# Try as hard as possible to remedy to the brain-damage their build-system
> > +# suffers from: don't search for openssl, they pick the host-system one.
> > +PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
> > +
> >  $(eval $(perl-package))
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
