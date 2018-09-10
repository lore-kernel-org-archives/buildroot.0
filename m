From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 10 Sep 2018 21:03:18 +0100
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180910194359.GH2674@scaer>
References: <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
 <20180909142019.GK2841@scaer>
 <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
 <20180909185518.GA2409@scaer>
 <CA+_SqVa2EiU2OXNoc0O=o7GwB0wW15jMjmnY60LL6bKV2PSeRQ@mail.gmail.com>
 <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
 <20180910150009.GA2674@scaer>
 <CA+TH9Vm1m+xUC3NydquYNw67SCFLNYvi_rqufxVw3BTtmOS=xQ@mail.gmail.com>
 <20180910180705.GF2674@scaer>
 <CA+_SqVbbcHuiktHFVZ2Uj0HvcdRfgcN=nft1Qy_JS2CO+BD7Wg@mail.gmail.com>
 <20180910194359.GH2674@scaer>
Message-ID: <CA+_SqVZc_n9N4=eQYT_c2Pio9F30Xw+gGguizq9RKkW3qmgBSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
On Mon, Sep 10, 2018 at 8:44 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Angelo, All,
>
> On 2018-09-10 20:17 +0100, Angelo Compagnucci spake thusly:
> > On Mon, Sep 10, 2018 at 7:07 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > > +WATCHTOWER_TAINTS = YES
> > > If you are going so far as to explicitly write this line, just hide the
> > > package behing BR2_REPRODUCIBLE instead, yes.
> > Ok, I'm sold.
>
> OK, thanks.
>
> Should someone mark this series as rejected in patchwork, then?
>
> > > > +cd $(WATCHTOWER_SRC_PATH) && GOPATH="$(@D)/$(WATCHTOWER_WORKSPACE)" $(HOST_DIR)/usr/bin/glide install
> > > What would prevent having a script like we have in utils/scancpan or
> > > utils/scanpypi to do the same processing for Go packages? Or npm
> > > modules?
> >
> > This is not possible imho, at least fo golang packages. Golang
> > packages is basically git repositories, we could end up packaging a
> > good part of github!
> >
> > > Yes, some people are afraid we get thousands of them. But we don't know
> > > how far we'll go. Today, we're pretty happy adding random python modules.
> > > Why would it be different for the other "package managers"?
> >
> > Well, the main difference is that python packages is self contained,
>
> Hmm. Not so much: python packages do have dependencies onto other python
> packages.
>
> > npm packages for example not, they can depend on other modules in a
> > very intricate way.
> > You should write something that recursively walks all the dependency
> > tree and outputs a package for everything. Probably we should only
> > embrace the shift paradigm of having packages that downloads their own
> > dependencies.
>
> Now we're going somewhere, I believe.
>
> Would you expect that we could write something like (roughly):
>
>     $ cat package/foo/Config.in
>     config BR2_PACKAGE_FOO
>         bool "foo"
>         depends on !BR2_REPRODUCIBLE
>         select SOME_PACKAGE
>
>     $ cat package/foo/foo.mk
>     FOO_VERSION = 1.2.3
>     FOO_DEPENDENCIES = some dependencies on other BR packages
>     $(eval $(npm-package))
>
> and that the npm-package infra would do the call and install whatever
> foo requires? Optionally, if the dependencies are already installed
> (e.g. because of a FOO_DEPENDENCIES or another previous npm-package
> already installed), then some dependencies may or may not be downloaded
> by npm.

I'm not into this honestly. What I want to achieve is that a package
can call a npm install or a glide install on whatever dependencies
file the source code distributes. Without the need to open that file,
understanding the dependency chain and reflect that in buildroot.

I think that the original developer knows better the dependencies of
his software and we should trust the building infrastructure he
choose, even more if what he choose is the best practice for that
programming language.

Exactly As I did for the example I posted before.

> That would be fine by me.
>
> There is one gotcha though: this won't work for purely off-line builds.
> This can be a big limitation in some setups, where access to an external
> network is not always guaranteed, so we should carefully say so in the
> manual.

Not true. A package can call the package manager in it's post download
hook, so a make source should do an offline build without troubles.

> > There is also another reason why python packages are added frequently:
> > we have no way to call a host-pip to resolve dependencies. I'm sure
> > that there would be way less python packages if we had a host-pip
> > package.
>
> Well, nothing prevents one from proposing a pip-package infra, like the
> npm-package I hinted at above. ;-) I may even offer some review of those
> infras.

Yes, if we can agree on a way to add package managers to buildroot!

> Not that I would be interested in using those infras, mind you... ;-]

Great!
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
