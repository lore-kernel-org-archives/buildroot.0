From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 23:49:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
In-Reply-To: <6630fdd7-e057-3ef9-af57-4368ffec2fd0@mind.be>
References: <1471171604-16162-1-git-send-email-yann.morin.1998@free.fr>
 <6630fdd7-e057-3ef9-af57-4368ffec2fd0@mind.be>
Message-ID: <20160814214936.GF30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-14 22:26 +0200, Arnout Vandecappelle spake thusly:
> On 14-08-16 12:46, Yann E. MORIN wrote:
> > libbsd installs .pc files that contain -isystem /usr/include/bsd, but
>  Actually, only libbsd-overlay.pc does that.

Right.

> > -isystem is not munged by pkg-config, so we end up using /usr/include/bsd
>  I'm not sure what pkg-config does, I can only say that it's not munged by pkgconf.

Well, that's what I said, no?

> > which are not suitable for the target. And breaks big time (see
> > failures, below).
> > 
> > But using libbsd is completely optional. In fact, our lldpd.mk did not
> > even express the dependency on libbsd, so we may well have had builds
> > without libbsd.
> > 
> > The functionality brought in by using libbsd is very minor, so we just
>  It would be nice to mention _what_ functionality it brings.

It's described in the patch.

> > make lldpd not use libbsd at all. There is no --disable-libbsd or such,
> > so we just patch it out of configure.ac.
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
> >     http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
> >     http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
> >     [...]
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> 
>  Note that this fix leaves any other users of libbsd out to dry.

And we have no issue with those...

> However, we
> only have netcat-openbsd and libedit at the moment that declare a dependency on
> libbsd, and these don't use libbsd-overlay, so it seems to be OK.

Yes.

However, I have no idea how to fix libbsd-overlay... -isystem is weird,
because it changes the ordering of include paths that gcc searches for.
We've had issue with it recently, so I don't really know what to do.

Better handle the issues when they arise. If we ever add another package
that uses libbsd-overlay, _then_ we can think of a proper fix.

But for now, the release is approaching fast enough that I think it is
better to just fix that one issue, espeocially since we don't lose much.

> > ---
> >  .../0002-configure-do-not-check-for-libbsd.patch   | 62 ++++++++++++++++++++++
> >  package/lldpd/lldpd.mk                             |  2 +-
> >  2 files changed, 63 insertions(+), 1 deletion(-)
> >  create mode 100644 package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> > 
> > diff --git a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> > new file mode 100644
> > index 0000000..b89b442
> > --- /dev/null
> > +++ b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> > @@ -0,0 +1,62 @@
> > +From 0801a066cd4a24a858ddfa7c62c7802e0f5533a8 Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Sun, 14 Aug 2016 12:15:17 +0200
> > +Subject: [PATCH] configure: do not check for libbsd
> > +
> > +libbsd causes build issues because it .pc file is borked: it contains
>  libbsd -> libbsd-overlay

Yes, I was speaking about the package, not the .pc file. But I can
change...

[--SNIP--]
> > diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> > index 924f2db..008d4bf 100644
> > --- a/package/lldpd/lldpd.mk
> > +++ b/package/lldpd/lldpd.mk
> > @@ -9,7 +9,7 @@ LLDPD_SITE = http://media.luffy.cx/files/lldpd
> >  LLDPD_DEPENDENCIES = host-pkgconf libevent
> >  LLDPD_LICENSE = ISC
> >  LLDPD_LICENSE_FILES = README.md
> > -# 0001-build-make-generation-of-atom-glue-compatible-with-o.patch
> > +# Touching configure.ac and Makefile.am in our patches:
> 
>  I actually find it quite convenient if the comment states which patch(es) touch
> the autotools files, but ATM we don't do that very often, so OK.

Yes, can do.

>  Only spelling mistakes so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
