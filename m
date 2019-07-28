From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Jul 2019 23:20:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: switch from gnutls to
 openssl
In-Reply-To: <20190728093235.GA21875@scaer>
References: <20190705165040.26254-1-fontaine.fabrice@gmail.com>
 <20190727224246.75bd967e@windsurf> <20190728093235.GA21875@scaer>
Message-ID: <CAPi7W81ak-Tm4d2rz2wJo=YKGEk3HZ-timyOLd2=nRRXG+xj-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le dim. 28 juil. 2019 ? 11:32, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Thomas, Fabrice, J?r?me, All,
>
> On 2019-07-27 22:42 +0200, Thomas Petazzoni spake thusly:
> > On Fri,  5 Jul 2019 18:50:40 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/c0a9565ae65336d55cdedc67adff221a7fa1a2c8
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >
> > Thanks, but this is not entirely convincing, for two reasons:
> >
> >  - The actual build failure is due to libgnutls.so using __atomic
> >    built-ins, without being linked to libatomic.so. This is a problem
> >    that can affect any other package that uses libgnutls.so (and a
> >    question is why we're not seeing more failures like this, from other
> >    packages that use libgnutls).
> >
> >  - Switching to openssl is certainly OK, but the lxc configure.ac logic
> >    does just OPENSSL_LIBS='-lssl -lcrypto', which is pretty much
> >    guaranteed to fail in static linking scenarios, as it doesn't
> >    account for second-order dependencies of openssl (the classic -lz
> >    missing).
> >
> > Could you have a look at the libgnutls.so/libatomic.so issue, and
gnutls issue was fixed by https://patchwork.ozlabs.org/patch/1132098
which was sent a few days after the lxc's patch so this patch is not
really needed anymore. I'll set it as non applicable.
> > double check if lxc/openssl builds fine in a static linking
> > configuration ? For the latter, it is possible that lxc already depends
> > on libz for another reason, in which case the problem will not be
> > visible.
For the record, lxc already depends on dynamic library since 2015 and
https://git.buildroot.net/buildroot/commit/package/lxc?id=29a6df448dd6b4e70594254803412350111be091
>
> Although I agree with Thomas' review, we'll nonetheless have to
> understand and/or fix the -lz issue when we next bump lxz, as that new
> version *will* have switched to using openssl instead of gnutls anyway.
lxc released 3.2.1, I'll send a new patch for this bump.
>
> So I would say that, barring a good explanations about the atomic issue,
> this backport from upstream is good-enough (with -lz fixed/explained).
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
