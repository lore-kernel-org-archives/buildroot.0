From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 5 Dec 2018 17:17:12 +0100
Subject: [Buildroot] [PATCH] docs/manual: Document
 ERLANG_FOOBAR_KEEP_DEPENDENCIES in rebar infra
In-Reply-To: <20181203221418.5363aca7@windsurf.home>
References: <20181126110807.31431-2-johan.oudinet@gmail.com>
 <20181203111947.32627-1-johan.oudinet@gmail.com>
 <20181203221418.5363aca7@windsurf.home>
Message-ID: <CAJtjsKZY4sVapS=PPPNmD09Zs_ciiU1uoRYsZ2KYBFrPKcoK+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 3, 2018 at 10:14 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Mon,  3 Dec 2018 12:19:47 +0100, Johan Oudinet wrote:
>
> > +* +ERLANG_FOOBAR_KEEP_DEPENDENCIES+, to keep the dependencies
> > +  described in the rebar.config file. By default, the _rebar_
> > +  infrastructure removes such dependencies as a post-patch hook to
>
>         as a post-patch hook -> *in* a post-patch hook
>
> > +  ensure rebar does not download or compile them. Only set this
> > +  variable to a non-empty value if the _rebar_ infrastructure must not
> > +  modify the rebar.config file included in the package.
>
> Now that you write down the semantic of the variable, I don't like it
> anymore: setting to a non-empty value is clearly not what Buildroot
> normally does for boolean variables. We use a YES/NO value.
>
> So instead of this, could we change pkg-rebar.mk to do this:
>
> $(2)_KEEP_DEPENDENCIES ?= NO
>
> ifeq ($($(2)_KEEP_DEPENDENCIES),NO)
> $(2)_POST_PATCH_HOOKS += remove-rebar-config-dependencies
> endif
>
> And then the document should say that the accepted values are "YES" and
> "NO" and that the infrastructure defaults to "NO".
>
> Could you have a look at doing this ?

Done. I've also fixed a bug in remove-rebar-config-dependencies that
took me days to figure out :-(

-- 
Johan
