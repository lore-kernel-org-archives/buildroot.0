From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 9 Sep 2018 13:17:38 +0100
Subject: [Buildroot] [PATCH v5 3/3] package/nodejs: taint the build on
 external modules
In-Reply-To: <20180909074908.GD2841@scaer>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <1536186133-9933-4-git-send-email-angelo.compagnucci@gmail.com>
 <20180909074908.GD2841@scaer>
Message-ID: <CA+_SqVaUZuk-gvvEFbFDQ8Hmj228nYwgaQC8hxbKfwNZw75thg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
On Sun, Sep 9, 2018 at 8:49 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Angelo, All,
>
> On 2018-09-06 00:22 +0200, Angelo Compagnucci spake thusly:
> > This patch enables the tainting of the build when an
> > external module is added.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > ---
> >  package/nodejs/nodejs.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index e2c94ba..322a1ec 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -160,6 +160,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
> >  # We can only call NPM if there's something to install.
> >  #
> >  ifneq ($(NODEJS_MODULES_LIST),)
> > +NODEJS_TAINTS = YES
>
> That is not even true.
>
> If I have a Buildroot .config that contains:
>
>     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="http://myserver/node-mods/VERSION/foo"
>
> Then this is 100% reproducible, because *I* manage and guarantee that it
> is, as this is *my* repository.
>
> I could even have:
>
>     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="$(BR2_EXTERANL_MY_TREE_PATH)/mods/foo"
>
> which is also reproducible, by way of being in my git-versioned br2-external
> tree.
>
> And if you were to have:
>
>     BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="foo at 1.2.3"
>
> then it would also be preproducible, because the version is specified.
>
> So, no, we can't set the tainted flag as soon as an external set of npm
> modules are used; this would be plain wrong for people that already do
> the "right thing".

Unfortunately, that's not true. Yo have to trust the entire dependency
chain to make an assumptin like that, but in my experience there is
always some dependency in the chain that points to master.
A couple of years ago a simple npm package almost broke the internet,
I rember my company had tought time tring to find a workaround for
that single package[1].

So I honestly think we cannot trust a chain of tens or hundreds of
dependencies that points to random git repositories around the
internet.

[1] http://mentalfloss.com/article/77951/how-11-lost-lines-code-almost-broke-internet

>
> Regards,
> Yann E. MORIN.
>
> >  define NODEJS_INSTALL_MODULES
> >       # If you're having trouble with module installation, adding -d to the
> >       # npm install call below and setting npm_config_rollback=false can both
> > --
> > 2.7.4
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
