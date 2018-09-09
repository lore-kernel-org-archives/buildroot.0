From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 9 Sep 2018 14:29:55 +0100
Subject: [Buildroot] [PATCH v5 3/3] package/nodejs: taint the build on
 external modules
In-Reply-To: <20180909130148.GH2841@scaer>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <1536186133-9933-4-git-send-email-angelo.compagnucci@gmail.com>
 <20180909074908.GD2841@scaer>
 <CA+_SqVaUZuk-gvvEFbFDQ8Hmj228nYwgaQC8hxbKfwNZw75thg@mail.gmail.com>
 <20180909130148.GH2841@scaer>
Message-ID: <CA+_SqVZCA2uwexELMcjOybu-WP7Kp6614MkGQFtA7iOqFkEvjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
On Sun, Sep 9, 2018 at 2:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Angelo, All,
>
> On 2018-09-09 13:17 +0100, Angelo Compagnucci spake thusly:
> > On Sun, Sep 9, 2018 at 8:49 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2018-09-06 00:22 +0200, Angelo Compagnucci spake thusly:
> > > > This patch enables the tainting of the build when an
> > > > external module is added.
> > > >
> > > > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > > > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > > > ---
> > > >  package/nodejs/nodejs.mk | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > > > index e2c94ba..322a1ec 100644
> > > > --- a/package/nodejs/nodejs.mk
> > > > +++ b/package/nodejs/nodejs.mk
> > > > @@ -160,6 +160,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
> > > >  # We can only call NPM if there's something to install.
> > > >  #
> > > >  ifneq ($(NODEJS_MODULES_LIST),)
> > > > +NODEJS_TAINTS = YES
> > >
> > > That is not even true.
> > >
> > > If I have a Buildroot .config that contains:
> > >
> > >     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="http://myserver/node-mods/VERSION/foo"
> > >
> > > Then this is 100% reproducible, because *I* manage and guarantee that it
> > > is, as this is *my* repository.
> > >
> > > I could even have:
> > >
> > >     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="$(BR2_EXTERANL_MY_TREE_PATH)/mods/foo"
> > >
> > > which is also reproducible, by way of being in my git-versioned br2-external
> > > tree.
> > >
> > > And if you were to have:
> > >
> > >     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="foo at 1.2.3"
> > >
> > > then it would also be preproducible, because the version is specified.
> > >
> > > So, no, we can't set the tainted flag as soon as an external set of npm
> > > modules are used; this would be plain wrong for people that already do
> > > the "right thing".
> >
> > Unfortunately, that's not true. Yo have to trust the entire dependency
> > chain to make an assumptin like that,
>
> True, but there *are* cases where this is trusted, e.g. when said chain
> is listed in the modules list, and that each dependency is specified by
> version, and/or that the modules are identified by an exact URL pointing
> to an internal, stable, reproducible repository.
>
> I only provided a few trivial examples to explain where the assumption
> you made about taint is wrong.
>
> What I mean is that there cases where using additional nodejs modules
> will taint the build (as per your tainting definition), but there are
> also cases where said modules will not taint the build (again, by your
> definition of taint).
>
> To get to the bottom of it: we have no way to know whether a set of
> additional nodejs modules will taint or not the build. As such, marking
> the build as tainted as soon as such modules are used is not correct.
>
> So, if I were to use a list of modules for which I know that they are
> reproducible, why would you want to mark my build as tainted when it is
> not? Your patch would always mark my builds as tainted, and an actual
> taint would be undetectable.

If you are an experienced developer and are adding a package X to
buildroot maintaining the reproducibility, you can package your set of
manageable dependencies and get rid of the problem, you can even call
the package manager from the inside of your .mk and do the job.

The use case here is for all the other people that wants to use
something big and cannot trust all of their dependencies. Try to have
a look at any modern php applications based on composer, it's really
not easy to find our rosebud.

So, in the end, I think that we cannot trust a package manager in any
way. If we absolutely regret adding package managers we could end the
discussion here. Else, if we provide package managers, we cannot trust
em when used.

> > but in my experience there is
> > always some dependency in the chain that points to master.
> > A couple of years ago a simple npm package almost broke the internet,
> > I rember my company had tought time tring to find a workaround for
> > that single package[1].
>
> Yeah, I know about the leftpad fiasco. It really made me laugh out loud
> for a good while! And I'm still amused that people are stil keen on
> using this, well... how could I put it and stay politically correct?
> There is only a 4-letter word that comes to mind... ;-]

Mee too and luckly I was not a software developer there :) .

> > So I honestly think we cannot trust a chain of tens or hundreds of
> > dependencies that points to random git repositories around the
> > internet.
>
> No we can't. But what your patch does is also wrong for people who
> actually *know* what they are doing, see above.
>
> Regards,
> Yann E. MORIN.
>
> > [1] http://mentalfloss.com/article/77951/how-11-lost-lines-code-almost-broke-internet
> >
> > >
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > >  define NODEJS_INSTALL_MODULES
> > > >       # If you're having trouble with module installation, adding -d to the
> > > >       # npm install call below and setting npm_config_rollback=false can both
> > > > --
> > > > 2.7.4
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
