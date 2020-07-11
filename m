From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 11 Jul 2020 14:25:23 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.6.2
In-Reply-To: <20200711154808.6df46498@windsurf.home>
References: <20200707213252.627579-1-james.hilliard1@gmail.com>
 <20200711154808.6df46498@windsurf.home>
Message-ID: <CADvTj4r8N0UcTgt5vQrOzyQiZF6mhXQouskFd6ESvv+GUgXKFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 11, 2020 at 7:48 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Tue,  7 Jul 2020 15:32:52 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > -PYTHON_AUTOBAHN_VERSION = 20.4.3
> > +PYTHON_AUTOBAHN_VERSION = 20.6.2
> >  PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
> > -PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
> > +PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/43/ba/926d323decdce0341f6f60dce45ea5553b08113dddb9ca482554d3db11eb
> >  PYTHON_AUTOBAHN_LICENSE = MIT
> >  PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
> >  PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
> > +PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
> > +PYTHON_AUTOBAHN_ENV = AUTOBAHN_USE_NVX=1 AUTOBAHN_STRIP_XBR=1
> > +
> > +define PYTHON_AUTOBAHN_STRIP_XBR_CONTRACTS
> > +     rm -rf $(@D)/autobahn/xbr/contracts
> > +endef
> > +
> > +PYTHON_AUTOBAHN_POST_EXTRACT_HOOKS = PYTHON_AUTOBAHN_STRIP_XBR_CONTRACTS
>
> But isn't AUTOBAHN_STRIP_XBR=1 already taking care of this ? I see:
>
> if 'AUTOBAHN_STRIP_XBR' in os.environ:
>     # force regeneration of egg-info manifest for stripped install
>     shutil.rmtree('autobahn.egg-info', ignore_errors=True)
> else:
>     extras_require_all += extras_require_xbr
>     packages += ['autobahn.xbr', 'autobahn.asyncio.xbr', 'autobahn.twisted.xbr']
>     package_data['xbr'] = ['./xbr/contracts/*.json']
>     entry_points['console_scripts'] += ["xbrnetwork = autobahn.xbr._cli:_main"]
>
> I.e, the xbr/contracts/*.json files are only added to package_data when
> AUTOBAHN_STRIP_XBR is *not* defined.
Nope, because there's a bug, I have an in progress upstream fix but it
changes a few other things as well.
https://github.com/crossbario/autobahn-python/pull/1400
>
> Also, in general, we do this kind of removal in a post-install target
> hook. If there's a reason to do that in a post-extract hook, a comment
> to explain why would be good.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
