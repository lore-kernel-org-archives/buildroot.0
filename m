From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Apr 2020 13:31:31 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.4.3
In-Reply-To: <20200425153040.297e371c@windsurf.home>
References: <20200424224752.63673-1-james.hilliard1@gmail.com>
 <20200425153040.297e371c@windsurf.home>
Message-ID: <CADvTj4ptKKjxeu6YHNGC+ANffqnOzgswFjAD54H15BTsghx5MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 25, 2020 at 7:30 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 24 Apr 2020 16:47:52 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Autobahn recently added a feature called xbr which we don't support,
> > let's remove this before building autobahn.
>
> Why don't we support it? Can it be made optional in a way that is
> acceptable upstream?
This feature is very dependency heavy to begin with(we don't have
buildroot packages for most) and not relevant to most autobahn use
cases.
I just got something merged upstream which should simplify stripping
xbr however.
>
> > +define PYTHON_AUTOBAHN_REMOVE_XBR
> > +     rm -rf $(@D)/autobahn/xbr
> > +     rm -f $(@D)/autobahn/asyncio/xbr.py
> > +     rm -f $(@D)/autobahn/twisted/xbr.py
> > +     sed -i -e "/'autobahn\.xbr',/d" $(@D)/setup.py
> > +     sed -i -e "/'xbr': \['\.\/xbr\/contracts\/\*\.json'\],/d" $(@D)/setup.py
> > +     sed -i -e '/"xbrnetwork = autobahn\.xbr\._cli:_main",/d' $(@D)/setup.py
> > +     sed -i -e '/xbr/d' $(@D)/MANIFEST.in
> > +endef
>
> Urgh, we want a patch, not tweaks like that. I guess perhaps the patch
> doesn't need to remove the actual source files, just remove the
> handling in setup.py.
I'll respin this once upstream has a new release with the ENV variable I
added that strips xbr during installation, not stripping xbr results in a fairly
large target size increase, nearly 10MB from the looks of it.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
