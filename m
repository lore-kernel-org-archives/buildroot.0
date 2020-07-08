From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jul 2020 18:42:57 +0200
Subject: [Buildroot] [PATCH] package/swig: enable support for Node.js >=
 12.x
In-Reply-To: <CAGm1_ktTn=yw4U2M7cfHw4qsQVkiODiTHYxtH5=x73gTMrgCCQ@mail.gmail.com>
References: <20200707051023.19992-1-yegorslists@googlemail.com>
 <20200707202644.GU2273@scaer>
 <CAGm1_ktTn=yw4U2M7cfHw4qsQVkiODiTHYxtH5=x73gTMrgCCQ@mail.gmail.com>
Message-ID: <20200708164257.GA2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-07-08 16:34 +0200, Yegor Yefremov spake thusly:
> On Tue, Jul 7, 2020 at 10:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Yegor, All,
> >
> > On 2020-07-07 07:10 +0200, yegorslists at googlemail.com spake thusly:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > Recent Node.js versions have removed some depreciated API calls,
> > > that swig still relies on. Patches taken from this PR [1] fix
> > > this issue.
> > >
> > > [1] https://github.com/swig/swig/pull/1746
> > >
> > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > ---
> > >  ...-to-support-both-Handle-and-Local-ty.patch |  53 ++
> > >  ...ith-Local-depending-on-Node.js-versi.patch | 649 ++++++++++++++++++
> > >  .../0003-Add-support-for-Node.js-v12.patch    | 207 ++++++
> > >  3 files changed, 909 insertions(+)
> > >  create mode 100644 package/swig/0001-Introduce-macros-to-support-both-Handle-and-Local-ty.patch
> > >  create mode 100644 package/swig/0002-Replace-Handle-with-Local-depending-on-Node.js-versi.patch
> > >  create mode 100644 package/swig/0003-Add-support-for-Node.js-v12.patch
> >
> > So, few things:
> >
> >  1. I don't see how swig can use or detect nodejs, as you are not adding
> >     a build dependency to host-nodejs;
> 
> SWIG will be invoked in the build process of an application that uses
> it. So the application's build script is responsible for finding
> Nodejs, python etc. There are some packages in BR that use it.

Ah, I see. Thanks for the explanations.

> For
> example libftdi1 (there is even a run-time test for this use case)

Not really, becasue libtfdi1 does never depend on nodejs (or host-nodejs
for that matters), and the runtime test is only teting the python
bindings.

> >  2. this is a feature patch IMHO, and upstream has not even applied it
> >     yet;
> 
> This is a long and a sad story.

Yes, I've seen the sad state of those PRs of yours, that's not too
good... :-(

> We also have such a package as mraa. Though its *.mk doesn't use it
> yet, it uses SWIG to create Python and Node.js bindings. If this would
> be the case and BR updates Node.js to 12 then we would have real build
> errors. In this case it is no longer a feature patch :-)

Buildroot already uses nodejs 12, specifically 12.18.0.

> >  3. swig is a host-only package; why would we want it to have proper
> >     nodejs support in Buildroot?
> See above.

But so far, no package makes use of it, so that' still not necessary.

If you were to also provide a patcvh to change (say) libftdi1 to also
build its mode bindings as a second patch in the series, then the
purpose would be more obvious.

Still, given the size of the patch, and the fact that upstream is still
meh-meh about it, I'd prefer we do a reall backport, that is once
upstream has merged it in their master.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
