From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 11 Sep 2018 08:20:55 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180910202624.GJ2674@scaer>
References: <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
 <20180909185518.GA2409@scaer>
 <CA+_SqVa2EiU2OXNoc0O=o7GwB0wW15jMjmnY60LL6bKV2PSeRQ@mail.gmail.com>
 <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
 <20180910150009.GA2674@scaer>
 <CA+TH9Vm1m+xUC3NydquYNw67SCFLNYvi_rqufxVw3BTtmOS=xQ@mail.gmail.com>
 <20180910180705.GF2674@scaer>
 <CA+_SqVbbcHuiktHFVZ2Uj0HvcdRfgcN=nft1Qy_JS2CO+BD7Wg@mail.gmail.com>
 <20180910194359.GH2674@scaer>
 <CA+_SqVZc_n9N4=eQYT_c2Pio9F30Xw+gGguizq9RKkW3qmgBSw@mail.gmail.com>
 <20180910202624.GJ2674@scaer>
Message-ID: <CA+_SqVYtptKCW2rgLui_OAx4Wf4RhBwV6tEzGALHvoR1h6HjFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
On Mon, Sep 10, 2018 at 10:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Angelo, All,
>
> On 2018-09-10 21:03 +0100, Angelo Compagnucci spake thusly:
> > On Mon, Sep 10, 2018 at 8:44 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >     $ cat package/foo/Config.in
> > >     config BR2_PACKAGE_FOO
> > >         bool "foo"
> > >         depends on !BR2_REPRODUCIBLE
> > >         select SOME_PACKAGE
> > >
> > >     $ cat package/foo/foo.mk
> > >     FOO_VERSION = 1.2.3
> > >     FOO_DEPENDENCIES = some dependencies on other BR packages
> > >     $(eval $(npm-package))
> > >
> > > and that the npm-package infra would do the call and install whatever
> > > foo requires? Optionally, if the dependencies are already installed
> > > (e.g. because of a FOO_DEPENDENCIES or another previous npm-package
> > > already installed), then some dependencies may or may not be downloaded
> > > by npm.
> >
> > I'm not into this honestly. What I want to achieve is that a package
> > can call a npm install or a glide install on whatever dependencies
> > file the source code distributes. Without the need to open that file,
> > understanding the dependency chain and reflect that in buildroot.
> >
> > I think that the original developer knows better the dependencies of
> > his software and we should trust the building infrastructure he
> > choose, even more if what he choose is the best practice for that
> > programming language.
> >
> > Exactly As I did for the example I posted before.
>
> And this is exactly what the npm-package (or glide-package, or whatever)
> would end up doing: expand to FOO_BUILD_CMDS, FOO_INSTALL_CMDS et al.
> that do the job, instead of repeating it in every package, like the
> autotools-package infra allows to not repeat the .configure; make; make
> install dance in all the autotools-based package.
>
> For example, your watchtower would be writen as:
>
>     WATCHTOWER_VERSION = v0.3.0
>     WATCHTOWER_LICENSE = Apache-2.0
>     WATCHTOWER_LICENSE_FILES = LICENSE.md
>     $(eval $(glide-package))
>
> And then the glide-pacakge infra would be defined sdmething like:
>
>     define glide-pacakge-inner
>
>     $(2)_DEPENDENCIES += host-glide
>
>     define $(2)_GLIDE
>         cd $$($(2)_SRC_PATH); GOPATH=$$($(@)_GOPATH) $$(HOST_DIR)/usr/bin/glide install
>     endef
>     $(2)_POST_CONFIIGURE_HOOKS += $(2)_GLIDE
>
>     $(call golang-package,$(1),$(2),$(3),$(4))
>
>     endef
>
> Or something similar, like we do for the rebar-package infra, for
> example, which piggy-backs onto either the generic-package or the
> autotools-package infra as needed.

I don't say it could not be done, and indeed it's a pretty clever
solution. But for golang there are at least a couples of different
packages managers I'm aware of, so it could end up having too many
infras.

>
> > > That would be fine by me.
> > >
> > > There is one gotcha though: this won't work for purely off-line builds.
> > > This can be a big limitation in some setups, where access to an external
> > > network is not always guaranteed, so we should carefully say so in the
> > > manual.
> >
> > Not true. A package can call the package manager in it's post download
> > hook, so a make source should do an offline build without troubles.
>
> But then said package manager would do only the download in the download
> step?
>
> I.e. I want to be able to do on 'somemachine' which has acces to both
> the internal and external networks:
>
>     $ export BR2_DL_DIR=/some/location
>     $ make meh_defconfig
>     $ make source
>     $ scp -r /some/location someone at someserver:/somewhere
>
> And on 'someserver' which does not have access to the network at all (by
> a firewall that blocks out-going connections):
>
>     $ export BR2_DL_DIR=/somewhere
>     $ make meh_defconfig
>     $ make
>
> This is what I call an off-line build.

It could be tricky but yes, every package manager has a caching
mechanism, so with a bit of hackery we can end up having the download
step downloading also the dependencies and then you can cut your
connection.

>
> > Yes, if we can agree on a way to add package managers to buildroot!
>
> I don't see any technical limitation to that, given the example you
> provided.

The real thing here is, we have a policy right now stating that
package managers are not admitted. I asked this explicitly to Peter
and Thomas at the Buidroot developers meeting.
We have to find the bast way to have them included imho.

>
> Of course, I guess it is just a trivial example, and that real life is
> little bit more tricky as usual, but there is nothing (besides my own
> stubbornness, that is) standing in the road, is there?

Not true, most of the web software I worked with needs only an npm
install or glide install and nothing more.

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
