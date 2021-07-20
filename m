From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jul 2021 12:39:34 +0200
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
In-Reply-To: <CAAP7ucLkz=OSXLN+UhpDPEcyNDfnX_deodsQK87iMi9_LiEnyA@mail.gmail.com>
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
 <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
 <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
 <CAGm1_kvyEXaH8ZpZZdq5fWJw2ZDrtXS7ZxE4sDRO_uYQ1aKfvQ@mail.gmail.com>
 <CAAP7uc+0Q9w7UJxRQJLtX7t+7cPh+zHF2dqRGWLOqzT6j8Sf8g@mail.gmail.com>
 <CAGm1_kuTdXuZs=ajf2YGu=pUu+caErdMtMbZ8s2D=Ac_oe=WDw@mail.gmail.com>
 <CAAP7ucLkz=OSXLN+UhpDPEcyNDfnX_deodsQK87iMi9_LiEnyA@mail.gmail.com>
Message-ID: <CAGm1_ksDv2Kuk_s4+NP3Uc8VxBTLcnpDckLyBz6y_hoAWpasAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 20, 2021 at 11:22 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> On Tue, Jul 20, 2021 at 11:15 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > On Tue, Jul 20, 2021 at 11:07 AM Aleksander Morgado
> > <aleksander@aleksander.es> wrote:
> > >
> > > > >> I still experience this error [1]. Any ideas?
> > > > >>
> > > > >> I have also applied libgudev patches as their build was failing.
> > > > >>
> > > > >> [1] http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518/build-end.log
> > > > >>
> > > > >
> > > > > My eyes are failing, I'm not sure which is the issue that triggers the build error. Is it the -Winline issues? The build should go on in that case, as we don't have -Werror. Not really sure.
> > > >
> > > > If I rerun "make", it ends as follows:
> > > >
> > > > /usr/bin/make  all-recursive
> > > > Making all in .
> > > > Making all in build-aux
> > > > Making all in templates
> > > > make[5]: Nothing to be done for 'all'.
> > > > Making all in mbim-codegen
> > > > make[5]: Nothing to be done for 'all'.
> > > > Making all in .
> > > > make[5]: Nothing to be done for 'all-am'.
> > > > Making all in data
> > > > Making all in .
> > > > make[5]: Nothing to be done for 'all-am'.
> > > > Making all in pkg-config
> > > > make[5]: Nothing to be done for 'all'.
> > > > Making all in src
> > > > Making all in common
> > > > Making all in .
> > > > make[6]: Nothing to be done for 'all-am'.
> > > > Making all in test
> > > > make[6]: Nothing to be done for 'all'.
> > > > Making all in libmbim-glib
> > > > Making all in generated
> > > > /usr/bin/make  all-am
> > > > make[7]: Nothing to be done for 'all-am'.
> > > > Making all in .
> > > > make[6]: *** No rule to make target 'Mbim-1.0.typelib', needed by
> > > > 'all-am'.  Stop.
> > > > Makefile:802: recipe for target 'all-recursive' failed
> > > > make[5]: *** [all-recursive] Error 1
> > > > Makefile:399: recipe for target 'all-recursive' failed
> > > > make[4]: *** [all-recursive] Error 1
> > > > Makefile:456: recipe for target 'all-recursive' failed
> > > > make[3]: *** [all-recursive] Error 1
> > > > Makefile:388: recipe for target 'all' failed
> > > > make[2]: *** [all] Error 2
> > > >
> > > > The problem seems to be: No rule to make target 'Mbim-1.0.typelib',
> > > > needed by 'all-am'.
> > > >
> > >
> > > That looks like a problem in the gobject-introspection setup in that
> > > build. The configure check detects the introspection support:
> > > ....
> > > checking for gobject-introspection... yes
> > > ....
> > > But then it fails to create the typelib.
> > >
> > > Is there any way to manually play with that build?
> >
> > I can try to create a minimal config that reproduces this issue.
> >
> > Or what tests would you want me to do with my ARM build?
>
> We should inspect the generated Makefile, and see whether it contains
> the gobject introspection bits or not. The Makefile.am in libmbim-glib
> defines the .gir and .typelib targets, but then we include
> $(INTROSPECTION_MAKEFILE). In my local PC build, I can see the
> following in the generated Makefile:
> INTROSPECTION_MAKEFILE =
> /usr/share/gobject-introspection-1.0/Makefile.introspection
>
> What does the Makefile say in this build, and if there's a path given,
> does it contain the correct path to the Makefile.introspection file?

INTROSPECTION_MAKEFILE =
/usr/share/gobject-introspection-1.0/Makefile.introspection

hm.. it doesn't show the BR's location but the location of my host.
This doesn't look right.

INTROSPECTION_LIBS shows BR location, but INTROSPECTION_GIRDIR = /share/gir-1.0
