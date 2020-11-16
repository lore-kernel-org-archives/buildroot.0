From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2020 19:07:45 +0100
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <878sb1qle4.fsf@tarshish>
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 <87a6vh5l6m.fsf@dell.be.48ers.dk> <878sb1qle4.fsf@tarshish>
Message-ID: <20201116180745.GK771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Peter, All,

On 2020-11-16 19:09 +0200, Baruch Siach spake thusly:
> On Mon, Nov 16 2020, Peter Korsgaard wrote:
> >>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> >
> >  > Build fails when no yacc alternative is installed.
> >  > Fixes:
> >  > http://autobuild.buildroot.net/results/1ba8e339cbb5646663d0bf4e158d89e54433b242/
> >  > http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110/
> >
> >  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >  > ---
> >  >  package/openntpd/openntpd.mk | 1 +
> >  >  1 file changed, 1 insertion(+)
> >
> >  > diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
> >  > index f2eaee7efd46..9076f3ddda4e 100644
> >  > --- a/package/openntpd/openntpd.mk
> >  > +++ b/package/openntpd/openntpd.mk
> >  > @@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
> >  >  OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
> >  >  OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
> >  >  OPENNTPD_LICENSE_FILES = COPYING
> >  > +OPENNTPD_DEPENDENCIES = host-bison
> >
> > Can we not use $(BR2_BISON_HOST_DEPENDENCY) instead?
> 
> We surly can. But for some reason no other package under package/ uses
> BR2_BISON_HOST_DEPENDENCY. Plain host-bison is used there instead. Only
> Barebox, U-Boot and the kernel use it. Why is that?
> 
> Commit b01100cc901a83 ("linux: kconfig may need host-{flex, bison} to
> build the configurators") mentions kconfig. Is that related?
> 
> I guess that BR2_BISON_HOST_DEPENDENCY is more susceptible to
> incompatibility due to different host installed bison versions (and same
> for flex).

The rule is that we can depend on $(BR2_BISON_HOST_DEPENDENCY) to build host
tools, but we really want to depend on host-bison when we generate code
that is built for the target.

Indeed, different versions of bison will generate different C code, and
thus the resulting binary will change. This is not very reproducible.
(Yes, I've already experienced that, and finding the root cause of the
delta cost me about two weeks full-time...)

AFAICS, the openntd code will be running on the target, so we do want
the host-bison dependency.

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
